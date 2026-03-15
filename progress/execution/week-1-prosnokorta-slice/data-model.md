---
type: data-model
status: active
area: architecture
created: 2026-03-15
updated: 2026-03-15
tags:
  - data-model
  - prosnokorta
  - week-1
---

# Data Model - Week 1 Draft

Parent: [[progress/execution/week-1-prosnokorta-slice/README|Week 1 Execution Pack]]

## Entities

### User

- id (uuid)
- name (string)
- email (string, unique)
- role (enum: admin, teacher, student)
- createdAt (datetime)

### Quiz

- id (uuid)
- teacherId (uuid -> User.id)
- title (string)
- description (string, optional)
- questions (json)
- dueAt (datetime)
- createdAt (datetime)

### Assignment

- id (uuid)
- quizId (uuid -> Quiz.id)
- studentId (uuid -> User.id)
- assignedAt (datetime)
- status (enum: assigned, submitted, reviewed)

### Submission

- id (uuid)
- assignmentId (uuid -> Assignment.id)
- answers (json)
- submittedAt (datetime)
- score (number, nullable)

## Relationships

1. One teacher has many quizzes.
2. One quiz has many assignments.
3. One student has many assignments.
4. One assignment has zero or one submission.

## Index suggestions

1. Quiz: index on teacherId, dueAt.
2. Assignment: composite index on quizId + studentId.
3. Assignment: index on studentId + status.
4. Submission: unique index on assignmentId.

## Data integrity rules

1. Only teacher owner can assign own quiz.
2. Student can submit only if assignment exists and is assigned.
3. One assignment allows one final submission for Week 1.
