# Fardin's 2026 Software Engineering Roadmap

> **Source:** [How To Learn To Code In 2026](https://www.youtube.com/watch?v=oshQg1uSRvg) — Tina (ex-Meta data scientist, 10 years coding)
> **Glasp:** https://glasp.co/reader?url=https://www.youtube.com/watch?v=oshQg1uSRvg

---

## The shift you need to internalize

> _"Today, programming via LLM agents is increasingly becoming a default workflow for professionals — except with more oversight and scrutiny."_
> — Andrej Karpathy, Feb 5 2026

Coding in 2026 is not vibe coding. It's **agentic engineering** — orchestrating AI agents as a senior developer would manage a junior team. That means you architect, you specify, you review, you correct. The agent implements.

**To correct an AI, you must know what is right.** That's why fundamentals still come first.

Your job as an agentic engineer:

- Architect and structure what needs to be built
- Give agents clear context, documentation, and constraints
- Monitor diffs, catch regressions, redirect when wrong
- Audit security and privacy — this is where agents consistently fail

---

## Stage overview

| Stage | Topic                     | Status    | Priority     |
| ----- | ------------------------- | --------- | ------------ |
| 1     | Coding basics             | ✅ Done   | Deepen edges |
| 2     | Software architecture     | 🟣 Active | **Highest**  |
| 3     | Git & version control     | 🟣 Active | **High**     |
| 4     | Security & privacy        | 🟣 Active | **High**     |
| 5     | Docker & containerization | 🟡 Next   | Medium       |
| 6     | Agentic engineering       | 🟡 Next   | Medium       |

---

## ✅ Stage 1 — Coding basics

`already locked in · timestamp 02:28`

You can read, write, and debug code. You understand how data moves through an application. You're not starting from scratch — you're deepening.

| Topic                   | Status        | What to deepen                                 |
| ----------------------- | ------------- | ---------------------------------------------- |
| JavaScript / TypeScript | ✓ Strong      | TS generics, utility types, conditional types  |
| OOP + APIs              | ✓ Strong      | Design patterns: Factory, Observer, Repository |
| Python                  | ✓ Familiar    | Async Python for AI agent work                 |
| C++                     | ✓ Competitive | Codeforces A→C grind, policy-based DS          |

> You need to be able to **read** AI-generated code — otherwise you can't catch its mistakes. `(03:08)`

---

## 🟣 Stage 2 — Software architecture

`active now · timestamp 03:26`

This is the biggest gap between "framework user" and "engineer." You need this to give agents meaningful direction — and to redirect them when they build the wrong thing.

### Tech stack decisions

The questions you need to answer before touching code:

- SQL or NoSQL? When does relational structure matter?
- What database is cheap, safe, and fast for your use case and scale?
- Monolith or microservices? What are the real tradeoffs at this stage?
- What kind of API — REST, GraphQL, tRPC? Why?

### System design

- How data flows through a system end-to-end
- Designing for concurrent users — directly relevant to Prosnokorta quiz sessions
- Scalability patterns: caching strategies, load balancing, CAP theorem basics
- How deployment environment affects architecture decisions

### Testing — non-negotiable with AI agents `(03:47)`

> You can't trust AI-generated code without tests. The agent has no idea if its output is correct — only your tests can catch that.

| Level       | Tool               | What it tests                                 |
| ----------- | ------------------ | --------------------------------------------- |
| Unit        | Jest / Vitest      | Individual functions and modules in isolation |
| Integration | Supertest + Vitest | API endpoints, database interactions          |
| End-to-end  | Playwright         | Full user journeys in a real browser          |

**Start here:** Write tests for Prosnokorta's Spring Boot API quiz logic. Today.

### Deployment fundamentals

- Where does your code live and how does it get there?
- Vercel / Railway for quick deploys → EC2 / VPS for control
- Environment variables, secrets management, build pipelines
- What breaks if the server goes down?

**Resources:** [System Design Primer](https://github.com/donnemartin/system-design-primer) · [roadmap.sh/backend](https://roadmap.sh/backend) · ByteByteGo

---

## 🟣 Stage 3 — Git & version control

`active now · timestamp 04:31`

> Many vibe coders lost entire codebases because they didn't track AI agent changes. `(05:02)`

Git is your safety net. Every AI agent session should live in its own branch. If the agent breaks something, you close the branch. Nothing is lost.

### What to master

- **Branching strategy** — Git Flow vs trunk-based; when to use each
- **Rebase vs merge vs squash** — know the difference and when each belongs
- **Conventional commits** — `feat:`, `fix:`, `chore(agent):` — your history becomes documentation
- **PR discipline** — write PRs as if a senior engineer is reviewing them, even solo
- **Recovery** — `git reflog`, `git revert`, `git reset --soft` — know these cold

### The agent branching rule

```
main ← production only
develop ← integration
feature/* ← your work
agent/* ← every AI session gets its own branch
```

Every agent session = `git checkout -b agent/session-description`. Review the diff before merging. Non-negotiable.

---

## 🟣 Stage 4 — Security & privacy

`active now · timestamp 05:18`

> Security is the #1 blind spot of AI coding agents. You cannot hope the agent handles it. You must be explicit. `(05:44)`

This isn't a huge topic — but it's critical. Learn it once, apply it everywhere.

### Security essentials

- **Authentication** — JWT (use `verify`, never `decode`), bcrypt password hashing, refresh token strategy
- **Authorization** — role-based access control (RBAC); who can do what
- **Input validation** — validate everything before it touches your database or business logic
- **Injection prevention** — parameterized queries only; never string interpolation in queries
- **CSRF + XSS protection** — helmet.js, SameSite cookies, Content-Security-Policy headers
- **Rate limiting** — protect auth endpoints, public APIs
- **Secrets management** — `.env` in `.gitignore`, never hardcode, never commit

### Privacy principles

- Collect only what you need
- Encrypt sensitive data at rest and in transit
- Know where every piece of user data lives

**This applies to your active projects right now:**

| Project              | Data at risk                        | Action needed                       |
| -------------------- | ----------------------------------- | ----------------------------------- |
| Prosnokorta          | Quiz data, student records          | RBAC audit, input validation        |
| AI learning platform | Class 10 student data in DB         | Encryption at rest, access control  |
| Client e-commerce    | Customer purchase data via WhatsApp | Data minimization, HTTPS everywhere |

> Paranoia makes a good engineer. `(05:58)`

**Resources:** [OWASP Top 10](https://owasp.org/www-project-top-ten/) · [web.dev/security](https://web.dev/security) · [PortSwigger Web Security Academy](https://portswigger.net/web-security)

---

## 🟡 Stage 5 — Docker & containerization

`up next · timestamp 06:40`

> If your AI agent runs amok, containerization means it damages only its own isolated environment — not your entire dev setup. `(07:15)`

This is the safety layer for agentic engineering. Each agent session gets its own container. If it goes wrong, you kill the container. Your machine stays clean.

### What to learn

- **Docker basics** — images, containers, Dockerfile, `.dockerignore`, volumes
- **Docker Compose** — orchestrate multi-service apps with a single command
- **Multi-stage builds** — separate dev and prod images; keep production lean
- **Agent sandboxing** — run each agent session in an isolated environment

### Why your stack needs this now

Prosnokorta has three services: web frontend, React Native app, Spring Boot API, and MongoDB. That's a Docker Compose file waiting to be written. Reproducible builds, no "works on my machine," clean agent isolation.

**Resources:** [Docker official docs](https://docs.docker.com) · [Play with Docker](https://labs.play-with-docker.com/) (free browser playground)

---

## 🟡 Stage 6 — Agentic engineering

`up next · timestamp 08:17`

> _"Agentic engineering is also a skill."_ — Tina `(08:40)`

You've built the foundation. Now you learn to orchestrate.

### Core skills

| Skill                     | What it means                                                       |
| ------------------------- | ------------------------------------------------------------------- |
| Project setup for agents  | Clear structure, README, ARCHITECTURE.md, CONTRIBUTING.md for AI    |
| Communicating intent      | Precise prompts with constraints, references, and what NOT to touch |
| Monitoring                | Review every diff, check logs, run tests before merging             |
| Multi-agent orchestration | One agent per concern — feature, tests, docs — run in parallel      |
| Recovery                  | Know how to revert, reset, and redirect when an agent goes off-spec |

### Prompt discipline — the most important skill

The difference between a vague prompt and a precise one:

```
# Vague (agent will make assumptions)
"Add authentication to the app"

# Precise (agent has everything it needs)
"Add JWT auth to the Express API in /src/api/. Use bcrypt (rounds: 12).
Endpoints: POST /auth/register, POST /auth/login (returns accessToken 15m,
refreshToken 7d). Store refresh tokens in refresh_tokens table (schema in
ARCHITECTURE.md). Use JWT_SECRET env var — never hardcode. Add requireAuth
middleware to /src/middleware/auth.ts. Write tests in /tests/auth.test.ts."
```

### Tools

- **Cursor** — AI-first IDE, great for MERN
- **GitHub Copilot** — inline completions in VS Code
- **Warp + Oz** — terminal + cloud multi-agent orchestration (Tina's pick)
- **Claude Sonnet** — best for code explanation and generation `(12:19)`

### You're already ahead

You're actively building: Prosnokorta (multi-service), LGM (AI tool), a Hugging Face chatbot, an AI learning platform. Shift these into agentic workflows — use the agent for implementation, you own the architecture and review.

---

## ⚡ How to learn faster

`timestamp 11:12`

### Use resources better

| Technique                          | How                                                                            |
| ---------------------------------- | ------------------------------------------------------------------------------ |
| **Prime before reading** `(11:45)` | Dump docs/lectures into NotebookLM → ask for summary + guiding questions first |
| **Ask for analogies** `(12:19)`    | "Explain [concept] using a real-world analogy with concrete examples"          |
| **Explain code** `(12:40)`         | Paste any snippet → ask Claude to explain line by line, then structure         |
| **Bypass docs pain** `(14:45)`     | Paste raw docs into AI → ask it to extract exactly what you need for your task |

### Use projects as the real curriculum `(13:21)`

> Projects beat lectures every single time.

- Learning an API? Build something that uses it — don't just read about it
- Learning testing? Write tests for Prosnokorta **right now**, not after you "finish learning"
- Try different tech stacks with AI agents — compare, contrast, decide
- Take open source projects → adapt them → break them → extend them

**Example prompt to bootstrap a learning project:**

```
Build me a music storage app with:
- Django backend
- Next.js frontend
- SQLite database

After building, explain every architectural decision you made and
why you chose this approach over alternatives.
```

---

## ⏱ Timeline reality check

| Scenario                                    | Time                |
| ------------------------------------------- | ------------------- |
| Pre-AI bootcamp (full-time)                 | 10–12 months        |
| With AI + good techniques (Tina's estimate) | ~6 months full-time |
| **Your situation**                          | Significantly less  |

**Why you're faster:**

- Professional frontend engineering experience already — you know how real codebases feel
- Actively shipping products (Prosnokorta, LGM, client e-commerce) — not just doing tutorials
- Already integrating AI (Hugging Face chatbot, AI learning platform) — head start on Stage 6
- Running Omarchy Linux — CLI comfort, no hand-holding needed

---

## 📌 Your action items right now

**This week**

- [ ] Write unit + integration tests for Prosnokorta's Spring Boot quiz API

**This month**

- [ ] Work through [roadmap.sh/system-design](https://roadmap.sh/system-design) — stage by stage
- [ ] Run an OWASP Top 10 audit on Prosnokorta and the AI learning platform
- [ ] Set up the `agent/*` branching convention in all active repos

**Next month**

- [ ] Write a `docker-compose.yml` for Prosnokorta (web + API + MongoDB)
- [ ] Write `ARCHITECTURE.md` for at least one active project

**Ongoing**

- [ ] Codeforces — minimum 1 problem per session, push toward Div 2 C
- [ ] Every new feature on any project = agent session + your review
- [ ] Keep shipping — projects are the real curriculum, not courses
