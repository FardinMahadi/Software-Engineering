← [Back to skills index](../README.md)

# Agentic engineering

_Learn to orchestrate AI coding agents like a senior engineer — structuring intent, monitoring output, reviewing diffs, and shipping confidently._

## Welcome

**What is this course?** Agentic engineering is the skill of working _with_ AI coding agents at a professional level. It is not vibe coding. It requires architecture knowledge, security awareness, Git discipline, and the ability to direct, monitor, and correct agents at scale.

**Who is this for?** Developers who have completed the Software Architecture, Git, Security, and Docker skills — and are ready to put it all together.

**What will you learn?**

- How to structure a project so AI agents can work effectively in it
- How to write prompts that produce high-quality, reviewable code
- How to use multi-agent workflows (one agent per concern)
- How to review, audit, and merge AI-generated code confidently
- How to recover when an agent does something wrong

**How long?** About 5–6 hours across 5 steps.

> _"To be a good manager, you need to know what it is that you're managing."_ — Tina, How To Learn To Code In 2026

---

## Step 1: Structure your project for agents

_A well-structured project gives agents the context they need to succeed._

AI agents read your codebase to understand what to build. If your project is poorly structured or undocumented, the agent makes assumptions — and assumptions are where bugs come from.

### 📋 Activity: Agent-ready project setup

In a project of your choice, create or improve the following:

1. **`README.md`** — must include:
   - What the project does (1 paragraph)
   - Tech stack with versions
   - How to run locally (step by step)
   - Project structure (directory tree with explanations)
   - Environment variables required (`.env.example`)

2. **`ARCHITECTURE.md`** — must include:
   - System design overview
   - Data flow description
   - Key design decisions and why they were made
   - What is NOT in scope

3. **`CONTRIBUTING.md`** — write this specifically for AI agents:

   ```markdown
   ## For AI Coding Agents

   ### Conventions

   - All API routes follow REST conventions defined in ARCHITECTURE.md
   - TypeScript strict mode is enabled — no `any` types
   - All user inputs must be validated with Zod schemas in `/schemas`
   - Every new route must have a corresponding test in `/tests`

   ### What not to touch

   - `/config/security.ts` — do not modify without human review
   - `.env` files — never create, read, or modify
   - Database migrations — create new files, never edit existing ones

   ### Before committing

   - Run `npm test` — all tests must pass
   - Run `npm run lint` — no lint errors
   - Run `npm run typecheck` — no TypeScript errors
   ```

Commit to `feature/agent-ready-docs` and open a PR.

---

## Step 2: Writing prompts that work

_Vague prompts produce vague code. Specific prompts produce specific code._

### 📋 Activity: Prompt engineering for code

The difference between a vague prompt and a precise one:

**Vague:**

> "Add authentication to the app"

**Precise:**

> "Add JWT authentication to the Express API in `/src/api/`. Use bcrypt for password hashing (rounds: 12). Create these endpoints: POST /auth/register (email, password, name), POST /auth/login (returns accessToken with 15m expiry and refreshToken with 7d expiry). Store refresh tokens in the `refresh_tokens` table (schema in ARCHITECTURE.md). All tokens must use the JWT_SECRET env var — never hardcode. Add the `requireAuth` middleware to `/src/middleware/auth.ts`. Write tests for all auth endpoints in `/tests/auth.test.ts`."

In `agentic/prompt-templates.md`, write reusable prompt templates for:

1. **Feature implementation prompt template:**

   ```
   Build [feature name] in [location in codebase].

   Requirements:
   - [specific requirement 1]
   - [specific requirement 2]

   Constraints:
   - Follow the patterns in [reference file]
   - Use [specific library/approach] — not [alternative]
   - [Security constraint]

   Tests required:
   - [test case 1]
   - [test case 2]

   Do NOT:
   - [thing you don't want the agent to change]
   ```

2. **Bug fix prompt template**

3. **Refactor prompt template**

4. **"Explain before you build" prompt** — ask the agent to describe its plan before writing any code. This is the most important safety technique.

---

## Step 3: Multi-agent workflows

_One agent per concern. Parallel agents for speed. Isolated environments for safety._

### 📋 Activity: Orchestrate three agents

Set up a workflow where three agents work simultaneously on a feature:

**Agent 1 — Implementation:**

> "Build the POST /quizzes endpoint. Spec in ARCHITECTURE.md. Use the patterns in /src/routes/users.ts as reference. Create a new branch `agent/quiz-endpoint`."

**Agent 2 — Tests:**

> "Write integration tests for POST /quizzes (once the endpoint is built). Cover: success case, validation failure, auth failure, duplicate quiz name. Branch: `agent/quiz-tests`."

**Agent 3 — Documentation:**

> "Add the POST /quizzes endpoint to our OpenAPI spec in `/docs/api-spec.yaml`. Follow the existing format. Branch: `agent/quiz-docs`."

In `agentic/multi-agent-log.md`, document this session:

- What prompt did you give each agent?
- What did each agent produce?
- What did you have to correct or reject?
- How did you merge the three branches?
- What would you do differently next time?

This log format becomes your personal learning journal for agentic engineering.

---

## Step 4: Reviewing AI-generated code

_The review is where your engineering knowledge earns its value._

### 📋 Activity: Code review framework

Every AI agent PR must go through a structured review. In `agentic/review-framework.md`, build your personal review checklist by combining what you've learned across all skills:

```markdown
## AI Agent Code Review — Full Checklist

### Architecture ✅

- [ ] Does this follow the patterns established in ARCHITECTURE.md?
- [ ] Is the data model change backward compatible?
- [ ] Does this introduce unnecessary complexity?
- [ ] Does this belong in this service/module, or should it live elsewhere?

### Security ✅ (the most important section)

- [ ] No hardcoded secrets, tokens, or passwords
- [ ] All user inputs validated before use
- [ ] Authorization checks on every protected route
- [ ] No SQL/NoSQL injection vectors (parameterized queries only)
- [ ] Sensitive data not logged to console
- [ ] Error messages don't leak internal details
- [ ] Dependencies added are from trusted sources (check npm audit)

### Code quality ✅

- [ ] No `any` types in TypeScript
- [ ] No `console.log` left in production code
- [ ] Error handling is explicit — no silent failures
- [ ] Functions do one thing (single responsibility)
- [ ] Variable and function names are clear without comments

### Tests ✅

- [ ] Happy path covered
- [ ] Edge cases covered
- [ ] Error cases covered
- [ ] All existing tests still pass

### Git hygiene ✅

- [ ] Commit messages follow conventional commits
- [ ] No unrelated files changed
- [ ] `.env` files not committed
- [ ] No large binary files accidentally included
```

Apply this checklist to the PR from Step 3 and document what you found.

---

## Step 5: Recovery and iteration

_When agents go wrong — and they will — you need a clean recovery process._

### 📋 Activity: Document your recovery playbook

In `agentic/recovery-playbook.md`, write your personal recovery guide for each of these scenarios:

**Scenario 1: Agent committed directly to main**

```bash
# Your recovery steps here
```

**Scenario 2: Agent broke all the tests**

```bash
# Your recovery steps here
```

**Scenario 3: Agent introduced a security vulnerability (you caught it in review)**

```bash
# Your recovery steps here (how do you reject the PR and what do you tell the agent next?)
```

**Scenario 4: Agent deleted or overwrote a file you needed**

```bash
# Your recovery steps here (git reflog, git checkout)
```

**Scenario 5: Agent went off-spec and built something completely wrong**

```bash
# Your recovery steps here
```

For each scenario, also write: "Lesson learned — how do I change my prompt next time to prevent this?"

---

## Finish

You've completed **Agentic Engineering**. You can now:

- ✅ Structure a project so agents have the context they need
- ✅ Write precise, reviewable prompts that minimize agent mistakes
- ✅ Orchestrate multiple agents in parallel with isolated environments
- ✅ Review AI-generated code with a structured security-first checklist
- ✅ Recover confidently when agents make mistakes

### You've completed all the skills

You've now worked through the full 2026 engineering roadmap:

1. ✅ Software Architecture
2. ✅ Git & GitHub Workflows
3. ✅ Security & Privacy
4. ✅ Docker & Containerization
5. ✅ Agentic Engineering
6. ✅ Testing Fundamentals

**Apply everything** on your active projects — Prosnokorta, LGM, your portfolio, and client work. That's the real curriculum.

← [Back to skills index](../README.md)

<footer>

---

Get help: [Post in the repository discussions](../../discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2026 &bull; [MIT License](https://gh.io/mit)

</footer>
