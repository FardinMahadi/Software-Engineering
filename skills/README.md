# Skills

Interactive learning exercises modeled after [GitHub Skills](https://skills.github.com) — each one is a hands-on course with step-by-step activities, real code to write, and things to commit and PR.

← [Back to repo root](../README.md)

---

## Folder structure

```
skills/
├── README.md                          ← you are here — index + navigation
│
├── 01-software-architecture/
│   ├── README.md                      ← 5-step course (requirements → schema → API → system design → review)
│   └── architecture/                  ← your work goes here as you complete each step
│       ├── requirements.md
│       ├── data-model.md
│       ├── api-spec.md
│       ├── system-design.md
│       └── review.md
│
├── 02-git-github/
│   ├── README.md                      ← 5-step course (branching → commits → merge/rebase → PRs → recovery)
│   └── docs/                          ← your notes and guides created during the skill
│       ├── branching-strategy.md
│       ├── commit-guide.md
│       ├── merge-strategies.md
│       └── git-recovery.md
│
├── 03-security-privacy/
│   ├── README.md                      ← 5-step course (OWASP → auth → RBAC → validation → data protection)
│   └── security/                      ← audit checklists, implementations, and notes
│       ├── owasp-checklist.md
│       ├── auth-audit.md
│       ├── auth-best-practices.md
│       ├── rbac-design.md
│       ├── rbac-middleware.js
│       ├── validation-rules.md
│       ├── quiz-schema.ts
│       ├── injection-examples.md
│       ├── data-protection.md
│       └── agent-review-checklist.md
│
├── 04-docker-containerization/
│   ├── README.md                      ← 5-step course (images → Dockerfile → Compose → multi-stage → agent sandbox)
│   └── docker/                        ← Dockerfiles, Compose configs, and notes
│       ├── concepts.md
│       ├── node-api/
│       │   └── Dockerfile
│       ├── nextjs/
│       │   └── Dockerfile
│       ├── docker-compose.yml
│       ├── dockerfile-notes.md
│       ├── compose-notes.md
│       ├── multistage-notes.md
│       └── agent-sandbox/
│           ├── docker-compose.yml
│           ├── AGENT-WORKFLOW.md
│           └── WHY-CONTAINERS.md
│
├── 05-agentic-engineering/
│   ├── README.md                      ← 5-step course (project setup → prompts → multi-agent → review → recovery)
│   └── agentic/                       ← templates, logs, checklists
│       ├── prompt-templates.md
│       ├── multi-agent-log.md
│       ├── review-framework.md
│       └── recovery-playbook.md
│
└── 06-testing-fundamentals/
    ├── README.md                      ← 5-step course (pyramid → unit → integration → E2E → AI test review)
    └── testing/                       ← all test files and notes
        ├── testing-pyramid.md
        ├── unit/
        │   ├── score.ts
        │   ├── score.test.ts
        │   └── NOTES.md
        ├── integration/
        │   ├── quiz.test.ts
        │   └── NOTES.md
        ├── e2e/
        │   ├── student-quiz.spec.ts
        │   └── NOTES.md
        └── ai-test-review.md
```

### Naming conventions

- Skill folders are prefixed with a two-digit number (`01-`, `02-`) so they sort in learning order in any file explorer.
- Each skill has a dedicated work subfolder (`architecture/`, `docker/`, `testing/`, etc.) — keep your completed activities there, separate from the course `README.md`.
- Notes files use kebab-case. Implementation files follow the language convention (`.ts`, `.js`, `.yml`).

---

## How to use these

Each skill lives in its own folder with a `README.md` that walks you through 5 steps. For each step:

1. Read the activity
2. Create the work subfolder if it doesn't exist yet
3. Do the work in a new branch (`feature/skill-01-step-1`)
4. Commit your work with a conventional commit message
5. Open a pull request and review your own diff before merging

There are no auto-graders. You review your own work. The point is to build the habit of thinking through problems, writing real code, and documenting your decisions.

---

## The skills

| #   | Skill                                                               | Focus                                                                      | Time    | Status         |
| --- | ------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------- | -------------- |
| 01  | [Software Architecture](./01-software-architecture/README.md)       | Requirements → data model → API design → system diagram → self-review      | 4–6 hrs | ⬜ Not started |
| 02  | [Git & GitHub Workflows](./02-git-github/README.md)                 | Branching strategy, conventional commits, rebase, PRs, recovery            | 3–4 hrs | ⬜ Not started |
| 03  | [Security & Privacy](./03-security-privacy/README.md)               | OWASP Top 10, auth, RBAC, input validation, data protection                | 4–5 hrs | ⬜ Not started |
| 04  | [Docker & Containerization](./04-docker-containerization/README.md) | Dockerfile, Compose, multi-stage builds, agent sandboxing                  | 4–5 hrs | ⬜ Not started |
| 05  | [Agentic Engineering](./05-agentic-engineering/README.md)           | Agent-ready projects, prompt templates, multi-agent workflows, code review | 5–6 hrs | ⬜ Not started |
| 06  | [Testing Fundamentals](./06-testing-fundamentals/README.md)         | Unit tests, API integration tests, Playwright E2E, AI test review          | 4–5 hrs | ⬜ Not started |

Update the status column as you progress: ⬜ Not started → 🟡 In progress → ✅ Done

---

## Recommended order

```
01 Architecture → 06 Testing → 02 Git → 03 Security → 04 Docker → 05 Agentic Engineering
```

Architecture and Testing first because everything else builds on understanding what you're building and how to verify it works. Security before Docker because Docker is partly a security tool. Agentic Engineering last because it requires all the others.

**Total: ~24–31 hours** — about 6 weeks at a few hours per weekday, or 3–4 focused weekends.
