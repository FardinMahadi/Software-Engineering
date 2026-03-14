[← Step 3](./step-3-api-design.md) · **Step 4** · [Step 5 →](./step-5-review.md)

# Step 4 — System architecture & deployment

> Put all the pieces together into a complete, deployable architecture. This is the document you hand to an AI agent before a session.

---

## Why this step exists

You've defined requirements, a data model, and an API contract. Now you assemble them into a full picture: what components exist, how they communicate, where they run, and what happens to data at each step. This is the `ARCHITECTURE.md` that every serious project should have.

This document also serves as context for AI coding agents. An agent with a clear architecture doc builds the right thing. An agent without one guesses.

---

## Part A — Component inventory

List every component in your system. Be specific — not "a database" but "PostgreSQL 16, hosted on Railway, accessed only by the API server."

For each component, answer:

- What is it? (technology + version)
- What does it do in this system?
- Who/what communicates with it directly?
- Where does it run?

**Minimum components for the quiz system:**

```
1. Next.js 14 frontend (App Router)
   — serves the UI to browsers
   — communicates with: API server via HTTPS

2. Node.js + Express API server
   — handles all business logic
   — communicates with: PostgreSQL, Redis, Frontend (receives requests)

3. PostgreSQL database
   — stores all persistent data
   — communicates with: API server only

4. Redis
   — stores refresh tokens + session cache
   — communicates with: API server only

5. [Add any others you need: file storage, email service, etc.]
```

---

## Part B — Architecture diagram

Draw the full system as an ASCII diagram. Every component from Part A must appear. Every arrow must be labelled with the protocol (HTTPS, TCP, WebSocket, etc.).

### Format guide

```
[Component A]
      |
      | [protocol]
      ↓
[Component B]
```

### Example starter (fill in and expand)

```
                    ┌─────────────────────────────────────────┐
                    │              Client (Browser)            │
                    └──────────────────┬──────────────────────┘
                                       │ HTTPS
                    ┌──────────────────▼──────────────────────┐
                    │         Next.js 14 (App Router)          │
                    │         Vercel / Railway / EC2           │
                    └──────────────────┬──────────────────────┘
                                       │ HTTPS (REST)
                    ┌──────────────────▼──────────────────────┐
                    │        Node.js + Express API             │
                    │        Port 4000                         │
                    └──────┬────────────────────┬─────────────┘
                           │ TCP                │ TCP
             ┌─────────────▼──────┐    ┌────────▼────────────┐
             │   PostgreSQL 16    │    │      Redis 7         │
             │   Port 5432        │    │      Port 6379       │
             └────────────────────┘    └─────────────────────┘
```

---

## Part C — Data flow walkthrough

Pick one user journey and trace every step through your architecture. Be specific — what component does what at each step.

**Use this journey:** A student opens a quiz, answers all questions, and submits.

Write it as a numbered sequence:

```
1. Student navigates to /quiz/[id] in the browser
   → Next.js renders the page (server component or client component — which and why?)

2. Page load triggers GET /api/v1/quizzes/:id
   → API server receives request
   → jwt.verify() checks the Authorization header
   → What happens if the token is expired?
   → PostgreSQL query: SELECT quiz, questions WHERE quiz.id = :id AND assignment EXISTS for student
   → Response: { quiz, questions } — does this include correct answers? Why or why not?

3. Student answers question 1 of 10
   → Is this saved to the server on each answer or only on final submit?
   → If saved progressively: what endpoint? What schema handles partial submissions?
   → If only on submit: what happens if the student closes the tab mid-quiz?

4. Student clicks Submit
   → POST /api/v1/submissions
   → Request body: what does it contain exactly?
   → API server validates: is the student actually assigned this quiz? Has student already submitted?
   → Score calculation: who calculates the score — client, API, or database?
   → What two things must happen atomically? (Hint: save submission AND record score)
   → Response: { score, correct_count, total_questions }

5. Student sees result
   → What does the UI show?
   → Is this data from the submit response or a separate GET request?
```

Fill in every question mark with your actual design decision.

---

## Part D — Deployment plan

For each component, specify exactly where it runs and why.

| Component        | Hosting option | Why this choice | Monthly cost estimate |
| ---------------- | -------------- | --------------- | --------------------- |
| Next.js frontend |                |                 |                       |
| Node.js API      |                |                 |                       |
| PostgreSQL       |                |                 |                       |
| Redis            |                |                 |                       |

**Consider these options for each:**

- **Vercel** — Next.js frontend, serverless functions, free tier generous
- **Railway** — Postgres + Redis + Node in one platform, good free tier, simple
- **Fly.io** — Docker-based, global edge, good for APIs
- **Render** — similar to Railway, good free tier
- **EC2 / VPS** — full control, more ops overhead, cheapest at scale

Also answer:

- How do environment variables get to each service in production?
- How is the database backed up?
- What happens to the system if the API server process crashes?

---

## Part E — Monolith vs microservices decision

Answer this question for the quiz system at its current stated scale:

> Should this be a monolith (one deployable unit) or split into microservices (auth service, quiz service, submission service, etc.)?

Structure your answer:

**If monolith:**

- Why is this the right choice right now?
- At what point would you reconsider? (What signal would tell you it's time to split?)
- What does your folder structure inside the monolith look like?

**If microservices:**

- What are the boundaries between services and why exactly there?
- How do services communicate — REST, gRPC, message queue?
- How do you handle a transaction that spans two services (e.g. recording a submission AND updating a leaderboard)?
- Are you prepared for the operational complexity this introduces at this scale?

There is a right answer for a system at this stage. Make the case for it.

---

## Output scaffold

```markdown
# System architecture — Quiz Management System

## Components

<!-- Full inventory from Part A -->

## Architecture diagram

<!-- ASCII diagram from Part B -->

## Data flow — student submits a quiz

<!-- Step-by-step sequence from Part C -->

## Deployment plan

<!-- Table + environment variable and backup answers from Part D -->

## Monolith vs microservices

<!-- Your decision and reasoning from Part E -->

## Open architectural decisions

<!-- Anything you deliberately deferred and why -->
```

---

## Branch + PR

```bash
git checkout -b step-4-system-design
# fill in architecture/system-design.md
git add architecture/system-design.md
git commit -m "docs(architecture): add system design and deployment plan"
git push origin step-4-system-design
# open PR: "Step 4: System architecture" → main
```

---

[← Step 3](./step-3-api-design.md) · **Step 4** · [Step 5 →](./step-5-review.md)
