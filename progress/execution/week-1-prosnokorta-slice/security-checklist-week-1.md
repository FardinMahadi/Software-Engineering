---
type: security-checklist
status: active
area: security
created: 2026-03-15
updated: 2026-03-15
tags:
  - security
  - week-1
  - checklist
---

# Security Checklist - Week 1

Parent: [[progress/execution/week-1-prosnokorta-slice/README|Week 1 Execution Pack]]

## Authentication and authorization

- [ ] Protected endpoints require authentication.
- [ ] Role model is explicit (`admin`, `teacher`, `student`).
- [ ] Teacher-only endpoints reject student role.
- [ ] Unauthorized and forbidden responses are tested.

## Validation and input safety

- [ ] All write endpoints have request schema validation.
- [ ] Validation errors return consistent response shape.
- [ ] Unknown fields are rejected or stripped intentionally.

## Logging and observability

- [ ] Every request has a request id.
- [ ] Security-relevant actions are logged (quiz create, assignment, submission).
- [ ] Logs avoid raw secrets and sensitive payload dumps.

## Secrets and config

- [ ] No secrets committed to repository.
- [ ] `.env.example` documents required variables only.
- [ ] Environment-specific config is clearly separated.

## Week 1 completion gate

Week 1 is not complete unless at least one auth test, one RBAC test, and one validation test are green in CI.
