---
title: API Specification - Quiz Management System
type: architecture-artifact
skill: software-architecture
step: 3
status: draft
updated: 2026-04-02
tags:
	- architecture
	- api
	- rest
---

# API Specification - Quiz Management System

## Context

This artifact defines API contracts before implementation.

## Decisions

## Base URL

`/api/v1`

## Auth model

All protected endpoints require: `Authorization: Bearer <accessToken>`

Token lifespan:

- access token: 15 minutes
- refresh token: 7 days

## Error response format

<!-- Define standard error shape and stable error codes. -->

## Endpoints

<!-- One block per endpoint, grouped by resource. -->

### Auth

### Quizzes

### Questions

### Assignments

### Submissions

## Versioning

<!-- Define breaking vs non-breaking changes and v2 trigger examples. -->

## Auth flow

<!-- Add sequence diagram from login through submission. -->

## Trade-offs

<!-- Example: endpoint granularity vs simplicity, strict validation vs developer speed -->

## Risks

<!-- Example: broken access control, overfetching data, inconsistent error handling -->

## Open questions

<!-- Unknowns in auth policy, submission constraints, and pagination defaults -->

## Evidence

- Step source: [curriculum/01-software-architecture/step-3-api-design.md](../../../curriculum/01-software-architecture/step-3-api-design.md)
- Upstream: [skills/01-software-architecture/architecture/data-model.md](./data-model.md)
- Downstream: [skills/01-software-architecture/architecture/system-design.md](./system-design.md)
