---
type: skill-step
status: done
skill: software-architecture
step: 1
created: 2026-03-15
updated: 2026-03-16
tags:
  - architecture
  - requirements
---
← [README](./README.md) · **Step 1** · [Step 2 →](./step-2-data-model.md)

# Step 1 — Requirements analysis

> Before writing a single line of code, you need to understand what you're building.

---

## Why this step exists

Great architects start with questions, not code. Requirements analysis forces you to fully understand the problem before proposing a solution. When you skip this and go straight to implementation, you build the wrong thing — and AI agents amplify this mistake at scale.

When you direct an AI coding agent, your requirements doc _is_ your prompt. Vague requirements produce vague code. Precise requirements produce precise code.

---

## The feature request

Read this carefully. You'll be designing a real system around it.

> **"Build a quiz management system that allows teachers to create quizzes, assign them to students, and track scores over time. Multiple teachers and students will use the system simultaneously."**

This is deliberately brief — just like a real ticket. Your job is to expand it into a full technical spec before anyone writes code.

---

## Activity

Work through the following four sections and fill in `architecture/requirements.md` using the scaffold below.

### Section 1 — Functional requirements

List every action the system must support. Start each line with an actor and a verb.

**Format:**

```
- [Actor] can [action] [object] [condition]
```

**Examples:**

```
- Teacher can create a quiz with a title and at least one question
- Teacher can assign a quiz to one or more students
- Student can view quizzes assigned to them
- Student can submit answers to an assigned quiz (once only)
- Teacher can view all submission scores for a quiz they created
- Student can view their own score after submission
```

Fill in at least 10 functional requirements covering: auth, quiz management, question management, assignment, submission, and results.

---

### Section 2 — Non-functional requirements

These are constraints on _how_ the system behaves — not _what_ it does.

Answer each question:

**Performance**

- What is an acceptable page load time for a student opening a quiz?
- How many concurrent users should the system support without degrading?
- What is the maximum acceptable response time for submitting answers?

**Reliability**

- What happens if a student loses internet mid-submission — are their partial answers saved?
- What happens if the server goes down while a quiz is in progress?

**Security**

- Can a student see another student's answers or score?
- Can a student submit answers to a quiz they were not assigned?
- Can a teacher edit a quiz after students have already submitted?

**Scalability**

- Is the system designed for one school or many schools?
- Will the number of quizzes and submissions grow significantly over time?

**Usability**

- Does this need to work on mobile browsers?
- Are there offline requirements?

---

### Section 3 — Actors and permissions

Define every type of user and what they are allowed to do.

**Format:**

```
## [Role name]
Description: [who they are]
Can:
- [permission 1]
- [permission 2]
Cannot:
- [restriction 1]
```

At minimum define: `Admin`, `Teacher`, `Student`. Consider whether a `Guest` role makes sense.

---

### Section 4 — Data entities

List every object the system needs to store. For each entity, list its fields and note which are required vs optional.

**Format:**

```
## [Entity name]
Fields:
- id (required, UUID)
- [field] ([type], [required/optional])
Relationships:
- belongs to [Entity]
- has many [Entity]
```

At minimum define: `User`, `Quiz`, `Question`, `QuizAssignment`, `Submission`, `Answer`, `Score`.

---

## Edge cases to think about

Capture these explicitly in your requirements doc — they reveal gaps in the design.

- What if a teacher deletes a quiz that already has submissions?
- What if a student tries to submit the same quiz twice?
- What if a question has no correct answer marked?
- What if a student is assigned a quiz but their account is deleted before they take it?
- What if two teachers try to edit the same quiz at the same time?

---

## Output scaffold

Copy this into `architecture/requirements.md` and fill it in:

```markdown
# Requirements — Quiz Management System

## Functional requirements

<!-- List 10+ actions the system must support -->

## Non-functional requirements

### Performance

<!-- Response times, concurrent users -->

### Reliability

<!-- Failure scenarios and expected behaviour -->

### Security

<!-- Access control constraints -->

### Scalability

<!-- Growth assumptions -->

### Usability

<!-- Device / offline constraints -->

## Actors and permissions

<!-- Define Admin, Teacher, Student, and any others -->

## Data entities

<!-- Define User, Quiz, Question, QuizAssignment, Submission, Answer, Score -->

## Edge cases

<!-- What happens in these non-obvious scenarios? -->

## Open questions

<!-- Things you're unsure about that a real stakeholder would need to answer -->
```

---

## Branch + PR

```bash
git checkout -b step-1-requirements
# fill in architecture/requirements.md
git add architecture/requirements.md
git commit -m "docs(architecture): add requirements analysis"
git push origin step-1-requirements
# open PR: "Step 1: Requirements analysis" → main
```

---

← [README](./README.md) · **Step 1** · [Step 2 →](./step-2-data-model.md)
