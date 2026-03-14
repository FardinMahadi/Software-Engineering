[← Step 1](./step-1-requirements.md) · **Step 2** · [Step 3 →](./step-3-api-design.md)

# Step 2 — Data model design

> The data model is the foundation of your system. Get this wrong and everything built on top becomes painful to change.

---

## Why this step exists

Every architectural decision you make later — how you write queries, how you structure your API, how you handle concurrent users — traces back to your data model. Changing a data model after you've built on top of it is expensive. Getting it right up front is the job of an architect.

This step also forces you to make a real decision: SQL or NoSQL. Not based on what you've used before, but based on the actual requirements of this system.

---

## Part A — Choose your database

Read your requirements from Step 1. Then work through this decision framework.

### The SQL vs NoSQL decision

Neither is universally better. The right choice depends on your data's structure and your query patterns.

| Question                                             | Pushes toward SQL                                      | Pushes toward NoSQL                |
| ---------------------------------------------------- | ------------------------------------------------------ | ---------------------------------- |
| Are your entities related to each other?             | Yes, complex joins                                     | No, mostly standalone documents    |
| Do you need transactions across multiple entities?   | Yes (e.g. record submission + update score atomically) | No, each write is independent      |
| Is your schema stable or frequently changing?        | Stable                                                 | Frequently changing                |
| Do you need to run complex aggregations across rows? | Yes                                                    | No, or rarely                      |
| Are you scaling writes horizontally to many servers? | Harder                                                 | Easier                             |
| Do you need strong consistency guarantees?           | Yes (ACID)                                             | Eventual consistency is acceptable |

**For the quiz system specifically, consider:**

- A `Submission` references a `Student`, a `Quiz`, and contains many `Answers` — each `Answer` references a `Question`
- You'll need to calculate scores across submissions for reporting
- A teacher editing a quiz while students are taking it should not corrupt in-progress submissions

Write your decision and justification in `architecture/data-model.md`. One correct answer does not exist — but your reasoning must be specific to the requirements, not generic.

---

## Part B — Entity relationship diagram

Draw a text-based ERD showing every entity, its fields, and how entities relate to each other.

### Required entities

Based on your requirements from Step 1, you should have at minimum:

```
User
Quiz
Question
Option           (the multiple-choice options for a question)
QuizAssignment   (which students are assigned which quiz)
Submission       (a student's attempt at a quiz)
Answer           (a student's answer to a single question)
```

### ERD format

Use this format for each entity and relationship:

```
User
  id            UUID        PK
  name          VARCHAR     NOT NULL
  email         VARCHAR     NOT NULL UNIQUE
  password_hash VARCHAR     NOT NULL
  role          ENUM        [admin, teacher, student]
  created_at    TIMESTAMP   NOT NULL DEFAULT NOW()

Quiz
  id            UUID        PK
  title         VARCHAR     NOT NULL
  description   TEXT
  created_by    UUID        FK → User.id
  created_at    TIMESTAMP   NOT NULL DEFAULT NOW()
  is_published  BOOLEAN     DEFAULT false

[relationship]
User 1 ──── * Quiz       (a teacher creates many quizzes)
Quiz 1 ──── * Question   (a quiz has many questions)
```

Draw the full diagram for all entities. Include:

- Every field with its type and constraints
- Every foreign key and what it references
- Every relationship with cardinality (1:1, 1:many, many:many)

---

## Part C — Indexing strategy

Indexes speed up reads but slow down writes. You index fields you query frequently.

Think through the queries your system will run most often:

- "Find all quizzes created by teacher X" — which field?
- "Find all submissions for quiz Y" — which field?
- "Find a user by their email address" — which field?
- "Find all quiz assignments for student Z" — which field?
- "Find all answers for submission ID N" — which field?

For each index you add, answer:

1. Which field(s) are indexed?
2. What query does this index support?
3. Is this a unique index, and why?

---

## Part D — Handle the hard cases

Go back to the edge cases from Step 1 and think through how your data model handles them.

**Case: A teacher deletes a quiz that has submissions**

Options:

- Prevent deletion if submissions exist (hard delete blocked)
- Soft delete — mark `is_deleted = true`, keep data
- Cascade delete — delete quiz and all related data
- Archive — move to a separate `archived_quizzes` table

Which did you choose and why? What does that mean for your schema?

**Case: A student submits a quiz twice**

Your data model must make this impossible or detectable. How?

**Case: A question is edited after students have already answered it**

If the correct answer changes, do historical submissions auto-update? Should they? How does your schema handle this?

---

## Output scaffold

```markdown
# Data model — Quiz Management System

## Database choice

<!-- SQL or NoSQL? Your specific justification based on the requirements. -->

## Entity relationship diagram

<!-- Full ERD with all fields, types, constraints, and relationships -->

## Indexing strategy

| Index | Table | Field(s) | Query supported | Unique? |
| ----- | ----- | -------- | --------------- | ------- |
|       |       |          |                 |         |

## Edge case handling

### Teacher deletes a quiz with existing submissions

<!-- What does your schema do? -->

### Student submits a quiz twice

<!-- How does your schema prevent or detect this? -->

### Question edited after submissions exist

<!-- How does your schema handle historical answers? -->

## Schema migration notes

<!-- If this were a live system, what migrations would you write to create this schema? -->
```

---

## Branch + PR

```bash
git checkout -b step-2-data-model
# fill in architecture/data-model.md
git add architecture/data-model.md
git commit -m "docs(architecture): add data model and ERD"
git push origin step-2-data-model
# open PR: "Step 2: Data model design" → main
```

---

[← Step 1](./step-1-requirements.md) · **Step 2** · [Step 3 →](./step-3-api-design.md)
