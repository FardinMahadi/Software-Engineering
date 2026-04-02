---
title: Data Model - Quiz Management System
type: architecture-artifact
skill: software-architecture
step: 2
status: draft
updated: 2026-04-02
tags:
  - architecture
  - data-model
  - erd
---

# Data Model - Quiz Management System

## Context

This artifact defines storage design, schema constraints, and query performance strategy based on the requirements.

## Decisions

### Database choice

<!-- SQL or NoSQL? State decision and justify based on requirements. -->

### Entity relationship diagram

<!-- Include entities, fields, constraints, and relationship cardinality. -->

Required entities:

- User
- Quiz
- Question
- Option
- QuizAssignment
- Submission
- Answer

### Indexing strategy

| Index | Table | Field(s) | Query supported | Unique? |
| ----- | ----- | -------- | --------------- | ------- |
|       |       |          |                 |         |

### Edge case handling

#### Teacher deletes quiz with existing submissions

<!-- Soft delete, block delete, cascade, or archive? -->

#### Student submits the same quiz twice

<!-- Constraint or workflow that prevents duplicates. -->

#### Question edited after submissions exist

<!-- Historical answer integrity strategy. -->

## Trade-offs

<!-- Example: normalization vs read performance, strict FKs vs flexibility -->

## Risks

<!-- Example: high write spikes during class submission deadlines -->

## Open questions

<!-- Unknowns that affect schema choices -->

## Schema migration notes

<!-- List the migration order for creating this schema safely -->

## Evidence

- Step source: [curriculum/01-software-architecture/step-2-data-model.md](../../../curriculum/01-software-architecture/step-2-data-model.md)
- Upstream: [skills/01-software-architecture/architecture/requirements.md](./requirements.md)
- Downstream: [skills/01-software-architecture/architecture/api-spec.md](./api-spec.md)
