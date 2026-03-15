---
type: requirements
status: active
area: architecture
created: 2026-03-15
updated: 2026-03-15
tags:
  - requirements
  - prosnokorta
  - week-1
---

# Requirements - Quiz Assignment and Submission Slice

Parent: [[progress/execution/week-1-prosnokorta-slice/README|Week 1 Execution Pack]]

## Problem

Teachers need a reliable way to create quizzes, assign them to students, and receive submissions with clear status tracking.

## Actors

- Admin
- Teacher
- Student

## Functional requirements

1. Teacher can create a quiz with title, questions, and due date.
2. Teacher can list quizzes created by self.
3. Teacher can assign a quiz to one or more students.
4. Student can submit answers for assigned quizzes.
5. Teacher can list submission summaries for own quizzes.

## Non-functional requirements

1. API response time target: p95 under 300 ms on local baseline data.
2. Validation on all write endpoints.
3. Authentication required for all protected endpoints.
4. Role-based access control (teacher and student boundaries).
5. Structured logs with request id.

## Out of scope (Week 1)

1. Rich analytics dashboards.
2. Auto-grading complex question types.
3. Multi-tenant organizations.
4. Notification delivery system.

## Acceptance criteria

- Requirements are specific enough to derive OpenAPI endpoints and test cases.
- Roles and boundaries are explicit.
- Out-of-scope list prevents feature creep.
