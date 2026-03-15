---
type: testing-plan
status: active
area: testing
created: 2026-03-15
updated: 2026-03-15
tags:
  - testing
  - strategy
  - week-1
---

# Test Strategy - Week 1

Parent: [[progress/execution/week-1-prosnokorta-slice/README|Week 1 Execution Pack]]

## Pyramid target for this slice

1. Unit tests: validation, score utility, RBAC helper.
2. Integration tests: API endpoint behavior with auth and validation.
3. Minimal E2E: one teacher happy-path flow.

## Exact first tests to write

### Unit

1. Reject quiz payload with missing title.
2. Reject quiz payload with invalid due date.
3. RBAC helper allows teacher for quiz creation.
4. RBAC helper denies student for quiz creation.

### Integration

1. `POST /quizzes` returns 201 for teacher with valid payload.
2. `POST /quizzes` returns 400 for invalid payload.
3. `GET /quizzes` returns 200 with only teacher-owned quizzes.
4. `POST /assignments` returns 403 for student role.
5. `POST /submissions` returns 201 for assigned student.

### Minimal E2E

1. Teacher logs in and creates quiz.
2. Teacher assigns quiz to student.
3. Student submits answers.
4. API returns submission confirmation.

## Done criteria

- Unit and integration tests run in CI.
- At least one failing test was made green by implementation.
- Test names describe behavior, not implementation details.
