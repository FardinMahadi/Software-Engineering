---
type: execution-plan
status: active
area: delivery
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - execution
  - prosnokorta
  - week-1
---

# Week 1 Execution Pack - Prosnokorta Skill Gym

Parent: [[progress/README|Learning Progress Dashboard]]

## North star slice

Build one complete vertical slice: quiz assignment and submission API baseline.

## Week 1 outcomes

1. Requirements locked for one small subsystem.
2. Data model drafted for users, quizzes, assignments, submissions.
3. OpenAPI v1 contract drafted.
4. ADR-001 and ADR-002 written.
5. CI skeleton prepared (lint + tests).
6. First test list defined (unit + integration).
7. Week 1 security baseline checklist defined.

## Deliverables in this folder

- [[progress/execution/week-1-prosnokorta-slice/requirements|Requirements]]
- [[progress/execution/week-1-prosnokorta-slice/data-model|Data Model]]
- [[progress/execution/week-1-prosnokorta-slice/adr-001-scope|ADR-001 Scope]]
- [[progress/execution/week-1-prosnokorta-slice/adr-002-backend-choice|ADR-002 Backend Choice]]
- [[progress/execution/week-1-prosnokorta-slice/test-strategy|Test Strategy]]
- [[progress/execution/week-1-prosnokorta-slice/security-checklist-week-1|Security Checklist Week 1]]
- `openapi.yaml`
- `ci-workflow-skeleton.yml`

## Suggested PR boundaries

1. `docs/week1-requirements-data-model-openapi`
2. `docs/week1-adrs-and-checklists`
3. `ci/week1-pipeline-skeleton`
4. `test/week1-first-tests-scaffold`

## Blocker fallback

If blocked, keep only these endpoints for Week 1:

1. `POST /quizzes`
2. `GET /quizzes`
3. `POST /assignments`
4. `POST /submissions`

Then proceed only when tests and CI are green.
