← [Back to skills index](../README.md)

# Docker & containerization

_Package your applications into isolated, reproducible containers — and use Docker to safely sandbox AI coding agent sessions._

## Welcome

**What is this course?** Docker lets you package an application with everything it needs to run — so it works the same on your laptop, your teammate's machine, and in production. It also gives you a powerful safety layer for AI agent sessions.

**Who is this for?** Developers who deploy web apps and want reproducible builds, easier collaboration, and a safe sandbox for AI-assisted development.

**What will you learn?**

- How Docker images and containers work
- How to write a `Dockerfile` for a Node.js and Next.js app
- How to orchestrate multiple services with Docker Compose
- How to use containers as isolated environments for AI agent sessions

**How long?** About 4–5 hours across 5 steps.

**Prerequisites:** Docker Desktop installed ([docs.docker.com/get-docker](https://docs.docker.com/get-docker/))

---

## Step 1: Images and containers

_Understand what Docker actually is before running commands._

### 📋 Activity: Your first container

1. In `docker/concepts.md`, explain in your own words:
   - What is a **Docker image**? (the blueprint)
   - What is a **container**? (a running instance of an image)
   - What is a **Dockerfile**? (the recipe)
   - What is **Docker Hub**? (the registry)
   - Why does "it works on my machine" not apply to containers?

2. Run your first container:

   ```bash
   docker run -it node:20-alpine sh
   # You're now inside a container. Try: node --version, ls, pwd
   # Type exit to leave
   ```

3. List what happened:

   ```bash
   docker ps -a          # see all containers (including stopped)
   docker images         # see downloaded images
   docker rm <id>        # remove the stopped container
   ```

4. In `docker/concepts.md`, add a section "What I observed" describing what happened when you ran those commands.

Commit to `feature/docker-concepts` and open a PR.

---

## Step 2: Dockerfile for a Node.js app

_Build your own image from scratch._

### 📋 Activity: Containerize a Node/Express API

Create a simple Express API (or use an existing one from your projects). Write a `Dockerfile`:

```dockerfile
# docker/node-api/Dockerfile
# Start from the official Node.js image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first (layer caching optimization)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the source code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["node", "server.js"]
```

Build and run it:

```bash
docker build -t my-api:v1 .
docker run -p 3000:3000 my-api:v1
# Test: curl http://localhost:3000
```

In `docker/dockerfile-notes.md`, explain:

- Why do we `COPY package*.json` before `COPY . .`? (layer caching)
- What does `-p 3000:3000` mean? (port mapping: host:container)
- What is `node:20-alpine` and why alpine? (size — check `docker images`)
- What is the difference between `RUN`, `CMD`, and `ENTRYPOINT`?

Add a `.dockerignore` file and explain why `node_modules` and `.env` must be in it.

---

## Step 3: Docker Compose for multi-service apps

_Run your full stack with a single command._

### 📋 Activity: Compose a full stack

Write a `docker-compose.yml` that runs a Next.js frontend, Node.js API, and MongoDB together:

```yaml
# docker/docker-compose.yml
version: "3.9"

services:
  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - NEXT_PUBLIC_API_URL=http://api:4000
    depends_on:
      - api

  api:
    build:
      context: ./api
      dockerfile: Dockerfile
    ports:
      - "4000:4000"
    environment:
      - MONGODB_URI=mongodb://mongo:27017/myapp
      - JWT_SECRET=${JWT_SECRET}
    depends_on:
      - mongo
    volumes:
      - ./api:/app # mount source for development
      - /app/node_modules # anonymous volume for node_modules

  mongo:
    image: mongo:7
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db # persist data between restarts

volumes:
  mongo_data:
```

Run it:

```bash
docker compose up --build      # start everything
docker compose down            # stop everything
docker compose logs -f api     # tail logs for one service
docker compose exec api sh     # shell into running container
```

In `docker/compose-notes.md`, explain:

- What does `depends_on` do and what doesn't it do? (starts order, not health)
- What is the difference between a bind mount (`./api:/app`) and a named volume (`mongo_data`)?
- Why is `JWT_SECRET=${JWT_SECRET}` better than hardcoding the secret?
- How does `http://mongo:27017` work? (Docker's internal DNS)

---

## Step 4: Development vs production containers

_Your dev container and prod container should not be identical._

### 📋 Activity: Multi-stage builds

Write a multi-stage Dockerfile for a Next.js app that produces a lean production image:

```dockerfile
# docker/nextjs/Dockerfile

# Stage 1: Install dependencies
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Stage 2: Build the app
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Stage 3: Production image (lean)
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Only copy what's needed to run
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

EXPOSE 3000
CMD ["node", "server.js"]
```

Build and compare sizes:

```bash
docker build --target deps -t myapp:deps .
docker build --target runner -t myapp:prod .
docker images | grep myapp
```

In `docker/multistage-notes.md`:

- What is the size difference between the deps stage and the runner stage?
- Why would you never include `devDependencies` in a production image?
- What files are NOT copied into the runner stage and why?

---

## Step 5: Containers as AI agent sandboxes

_The key safety technique for agentic engineering._

### 📋 Activity: Agent sandbox setup

This is what makes Docker essential for agentic engineering. When an AI agent runs in a container, its mistakes are isolated.

1. Create `docker/agent-sandbox/docker-compose.yml`:

```yaml
version: "3.9"

services:
  # Isolated environment for a single AI agent session
  agent-workspace:
    image: node:20-alpine
    working_dir: /workspace
    volumes:
      # Mount your project read-only so agent can read but can't escape
      - ./project:/workspace/project:ro
      # Agent's writable output goes here only
      - ./agent-output:/workspace/output
    environment:
      - NODE_ENV=development
    # No ports exposed — agent has no network access by default
    network_mode: none
    command: sh -c "cd /workspace && sh"
```

2. In `docker/agent-sandbox/AGENT-WORKFLOW.md`, write the workflow you will follow for every AI agent session:

```markdown
## AI Agent Session Workflow

### Before the session

- [ ] Create a new branch: `agent/session-description`
- [ ] Start the agent sandbox: `docker compose up -d agent-workspace`
- [ ] Verify the sandbox has no network access if working with sensitive data

### During the session

- [ ] Review every file the agent proposes to change before accepting
- [ ] Check for secrets, hardcoded values, and injection vulnerabilities
- [ ] Run tests inside the container: `docker compose exec agent-workspace npm test`

### After the session

- [ ] Run the security checklist from the Security skill
- [ ] Review the full diff: `git diff develop`
- [ ] If something went wrong: `docker compose down && git checkout develop`
- [ ] If it's good: open a PR using the agent PR template

### Emergency rollback

docker compose down # kill the agent environment
git checkout develop # abandon the branch
git branch -D agent/session # delete the bad branch
```

3. In `docker/agent-sandbox/WHY-CONTAINERS.md`, write a short explanation (in your own words) of why containerizing AI agent sessions matters — connecting it to what you know about how agents can break development environments.

---

## Finish

You've completed **Docker & Containerization**. You can now:

- ✅ Explain images, containers, and Dockerfiles in plain language
- ✅ Write a production-ready Dockerfile for Node.js and Next.js apps
- ✅ Orchestrate a full MERN stack with Docker Compose
- ✅ Build multi-stage images that separate dev from prod
- ✅ Use containers as a safety sandbox for AI agent sessions

### What's next?

- **Apply it:** Dockerize your Prosnokorta multi-service setup (web + API + DB).
- **Go deeper:** [Play with Docker](https://labs.play-with-docker.com/) — free browser-based Docker playground.
- **Next skill:** [Agentic Engineering →](../05-agentic-engineering/README.md)
- **Back to index:** [Skills →](../README.md)

<footer>

---

Get help: [Post in the repository discussions](../../discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2026 &bull; [MIT License](https://gh.io/mit)

</footer>
