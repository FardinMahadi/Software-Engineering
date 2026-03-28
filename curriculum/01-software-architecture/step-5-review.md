---
type: skill-step
status: done
skill: software-architecture
step: 5
created: 2026-03-15
updated: 2026-03-16
tags:
  - architecture
  - review
---
[← Step 4](./step-4-system-design.md) · **Step 5** · [Back to README →](./README.md)

# Step 5 — Architecture review & self-critique

> The best architects challenge their own designs before anyone else does.

---

## Why this step exists

You've built a complete architecture on paper. Now you stress-test it. Real systems fail in specific, predictable ways — single points of failure, security gaps, scalability ceilings, wrong assumptions about usage patterns. Finding these before you build is cheap. Finding them in production is expensive.

This is also the step where you develop the habit of **critiquing AI-generated code and designs**. The questions in this step are exactly the questions you should ask every time an agent produces an architecture or a significant chunk of code.

---

## Part A — Failure analysis

Read your system design from Step 4. Then answer each question with a specific, honest answer — not "it might have issues" but "if the API server crashes, students in the middle of a quiz will lose their unsaved answers and see a 502 error."

### Single points of failure

A single point of failure (SPOF) is any component whose failure takes down the entire system.

1. **Database goes down.**
   - What can users still do? What becomes impossible?
   - What error do they see?
   - How long until service is restored with your current deployment plan?

2. **API server process crashes.**
   - Is there automatic restart? (PM2, Docker restart policy, platform health checks?)
   - How many requests fail between crash and restart?
   - What happens to any in-progress requests at the moment of crash?

3. **Redis goes down.**
   - What feature breaks immediately?
   - Is this recoverable without a full service restart?
   - Are logged-in users forced to log out?

4. **Hosting provider (Vercel/Railway/etc.) has an outage.**
   - Is there a fallback? Should there be at this scale?

### Cascading failures

5. **100 students all submit their quizzes at exactly the same time** (the quiz timer expires for a whole class simultaneously).
   - What happens to your API server? Your database?
   - Does your schema handle this correctly without double-counting scores?
   - Where is the bottleneck?

---

## Part B — Security gap analysis

Re-read your API spec from Step 3 and your data model from Step 2. Find the security holes.

Work through each of these attack scenarios:

**1. Broken authentication**

- What happens if an attacker sends a request with a manually crafted JWT (signed with a random secret)?
- Are you using `jwt.verify()` everywhere or did any endpoint accidentally use `jwt.decode()`?
- What happens when an access token expires — does the UI handle it gracefully or does the user get stuck?

**2. Broken access control**

- Can student A access student B's submission by changing the ID in the URL?
  ```
  GET /api/v1/submissions/[student-B-submission-id]
  ```
  Does your API check ownership before returning data?
- Can a student call `POST /api/v1/quizzes` to create a quiz?
- Can a teacher view submissions for another teacher's quiz?

**3. Input validation**

- What happens if a student submits answers for questions that don't belong to the quiz they were assigned?
- What happens if the request body for `POST /api/v1/submissions` contains 1000 answers for a 10-question quiz?
- What happens if `title` in `POST /api/v1/quizzes` is 10,000 characters long?

**4. Rate limiting**

- Can an attacker call `POST /auth/login` 10,000 times to brute-force a password?
- Is rate limiting applied per IP, per user, or both?

**5. Data exposure**

- Does `GET /api/v1/quizzes/:id` return the correct answers along with the questions? Should it?
- Does any response include fields that clients don't need (password hashes, internal IDs, etc.)?

For each gap you find, write:

- What the vulnerability is
- How an attacker would exploit it
- The specific fix (not "add validation" but "validate that submission.questionId exists in quiz.questions before saving")

---

## Part C — Scalability ceiling

Answer these questions honestly based on your current architecture:

1. **What is the maximum number of concurrent quiz submissions your API can handle** before response times degrade significantly?
   - What is the bottleneck — CPU on the API server, database connections, I/O?

2. **Your PostgreSQL instance is on a single server.** At what point does this become a problem?
   - How many rows in `submissions` before queries slow down?
   - What would you add first — read replicas, connection pooling, query optimization, caching?

3. **Your API server is a single process.** What's the path to horizontal scaling?
   - What in your current architecture prevents you from running 3 API server instances behind a load balancer right now?
   - (Hint: session storage, local file writes, in-memory state)

4. **Quiz results queries.** A teacher wants to see the average score per question across 10,000 submissions. How does your current schema handle this? Is it fast?

---

## Part D — Honest retrospective

Answer these in your own words. This is the part that actually makes you a better engineer — being honest about what you got wrong and why.

**What was the hardest decision in this architecture and why?**

Not "it was challenging" — specifically: what made it hard? Was it a genuine tradeoff where both options had merit? Was it unfamiliarity with the technology? Was it unclear requirements?

**What would you do differently with twice as much time?**

Be specific. "I would add proper caching" is not an answer. "I would implement Redis caching on `GET /quizzes/:id` with a 60-second TTL, invalidated on quiz update, because that endpoint is called by every student on quiz start and the data rarely changes" is an answer.

**What assumption did you make early that you're now not sure about?**

Every architecture has assumptions baked in. Name one. What would you need to know to validate it?

**What would you warn an AI coding agent about before implementing this architecture?**

If you were about to hand this spec to Claude Sonnet and say "implement this," what would you tell it explicitly to watch out for? What mistakes would it be likely to make without that warning?

---

## Output scaffold

```markdown
# Architecture review — Quiz Management System

## Failure analysis

### Single points of failure

<!-- Database down, API crash, Redis down, provider outage -->

### Cascading failures

<!-- 100 simultaneous submissions scenario -->

## Security gap analysis

### Broken authentication

<!-- Findings + specific fixes -->

### Broken access control

<!-- Findings + specific fixes -->

### Input validation gaps

<!-- Findings + specific fixes -->

### Rate limiting

<!-- Current state + what needs adding -->

### Data exposure

<!-- What leaks + what to strip from responses -->

## Scalability ceiling

<!-- Current bottleneck, DB scaling path, horizontal API scaling blockers -->

## Retrospective

### Hardest decision

<!-- -->

### What I'd do differently

<!-- -->

### Assumption I'm unsure about

<!-- -->

### What I'd warn an AI agent about

<!-- -->
```

---

## Branch + PR + merge

```bash
git checkout -b step-5-review
# fill in architecture/review.md
git add architecture/review.md
git commit -m "docs(architecture): add architecture self-review and critique"
git push origin step-5-review
# open PR: "Step 5: Architecture review" → main

# After merging step-5, merge all previous steps into main if not already done
# Then check that architecture/ contains all 5 files
ls architecture/
# requirements.md  data-model.md  api-spec.md  system-design.md  review.md
```

---

## You're done with this skill

You designed a system from scratch — requirements → data model → API → deployment → critique. That is real software engineering, not framework usage.

**Apply it immediately:** Pick Prosnokorta or LGM. Write a real `ARCHITECTURE.md` at the root of that project using everything you produced in this skill. You already have the structure — adapt it to the actual project.

- Next skill: [06 — Testing Fundamentals](../06-testing-fundamentals/README.md)
- Back to index: [Skills →](../skills/README.md)

---

[← Step 4](./step-4-system-design.md) · **Step 5** · [Back to README →](./README.md)