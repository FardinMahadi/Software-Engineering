---
type: skill-step
status: done
skill: software-architecture
step: 3
created: 2026-03-15
updated: 2026-03-16
tags:
  - architecture
  - api-design
---
[← Step 2](./step-2-data-model.md) · **Step 3** · [Step 4 →](./step-4-system-design.md)

# Step 3 — API specification

> An API is a promise. Good API design makes your system easier to build, test, and extend — and gives AI agents a clear contract to implement against.

---

## Why this step exists

Before writing a single route handler, you define the contract. Every endpoint — its method, URL, auth requirements, request body, and every possible response — is specified before implementation begins.

This is how professional teams work. It's also how you should work with AI agents: give the agent a fully specified API and it can implement it. Give it a vague instruction and you'll spend more time reviewing and fixing than it would have taken to spec it yourself.

---

## REST fundamentals you must know cold

### HTTP methods

| Method   | Purpose                     | Idempotent? | Body? |
| -------- | --------------------------- | ----------- | ----- |
| `GET`    | Read a resource or list     | Yes         | No    |
| `POST`   | Create a new resource       | No          | Yes   |
| `PUT`    | Replace a resource entirely | Yes         | Yes   |
| `PATCH`  | Update a resource partially | No          | Yes   |
| `DELETE` | Remove a resource           | Yes         | No    |

### Status codes that matter

| Code | Meaning               | When to use                                                  |
| ---- | --------------------- | ------------------------------------------------------------ |
| 200  | OK                    | Successful GET, PATCH, DELETE                                |
| 201  | Created               | Successful POST that creates a resource                      |
| 204  | No Content            | Successful DELETE with no body                               |
| 400  | Bad Request           | Invalid input, failed validation                             |
| 401  | Unauthorized          | No token, expired token                                      |
| 403  | Forbidden             | Valid token, wrong role                                      |
| 404  | Not Found             | Resource doesn't exist                                       |
| 409  | Conflict              | Duplicate (e.g. user already submitted this quiz)            |
| 422  | Unprocessable Entity  | Valid format, invalid data (e.g. end date before start date) |
| 500  | Internal Server Error | Unexpected server failure                                    |

### URL design rules

```
# Collections
GET    /api/v1/quizzes           ← list all quizzes (with filters)
POST   /api/v1/quizzes           ← create a quiz

# Single resource
GET    /api/v1/quizzes/:id       ← get one quiz
PATCH  /api/v1/quizzes/:id       ← update a quiz
DELETE /api/v1/quizzes/:id       ← delete a quiz

# Nested resources (when the child only makes sense inside the parent)
GET    /api/v1/quizzes/:id/questions          ← all questions for a quiz
POST   /api/v1/quizzes/:id/questions          ← add a question to a quiz
DELETE /api/v1/quizzes/:id/questions/:qid     ← remove a specific question
```

Never use verbs in URLs. The HTTP method is the verb.

```
❌ POST /api/v1/createQuiz
✅ POST /api/v1/quizzes
```

---

## Part A — Define all endpoints

You need at least 12 endpoints covering every functional requirement from Step 1.

Use this format for each endpoint:

```
---
[METHOD] [PATH]

Description: [one sentence]
Auth:        [None | Bearer token | Bearer token (role: teacher) | Bearer token (role: admin)]
Params:      [URL path params if any]
Query:       [Optional query params for filtering/pagination]

Request body:
{
  field: type  // description
}

Responses:
  [code] — [condition]
  {
    // response body example
  }

  [code] — [condition]
  {
    // response body example
  }

Notes:
- [any important behaviour or edge case to document]
```

### Required endpoint groups

Cover all of these:

**Auth** (2 endpoints minimum)

- Login → returns access token + refresh token
- Refresh token → returns new access token
- Optional: logout, register

**Quizzes** (5 endpoints minimum)

- List quizzes (with filter: teacher sees own quizzes, admin sees all)
- Get one quiz
- Create quiz
- Update quiz
- Delete quiz

**Questions** (3 endpoints minimum)

- Add question to quiz
- Update question
- Remove question from quiz

**Assignments** (2 endpoints minimum)

- Assign quiz to student(s)
- List assignments for a student

**Submissions** (3 endpoints minimum)

- Submit answers to a quiz
- Get a student's own submission result
- Get all submissions for a quiz (teacher only)

---

## Part B — Versioning

You used `/api/v1/` in your URLs. Answer these in `architecture/api-spec.md`:

1. What does `/v1/` protect you from?
2. Give a concrete example of a **breaking change** in this API that would require `/v2/`
3. Give a concrete example of a **non-breaking change** that would NOT require a version bump
4. Where does the version live — in the URL, in a request header, or somewhere else? What are the tradeoffs of each approach?

---

## Part C — Auth flow diagram

Draw a step-by-step flow for how a student authenticates and submits a quiz. Use a plain text sequence:

```
Student                  API                      Database
  |                       |                           |
  |-- POST /auth/login --> |                           |
  |   { email, password } |-- SELECT user by email -> |
  |                       |<- user row --------------- |
  |                       |-- bcrypt.compare() ------> |
  |<- 200 { accessToken,  |                           |
  |         refreshToken } |                          |
  |                       |                           |
  |-- GET /assignments  -->|                           |
  |   Authorization: Bearer [token]                   |
  |                       |-- jwt.verify(token) ----> |
  |                       |-- SELECT assignments ----> |
  |<- 200 { assignments } |                           |
  ...
```

---

## Part D — Error response standard

Every error response in your API must follow the same shape. Define it.

A good error response includes:

- The HTTP status code (from the status line, not the body)
- A machine-readable error code (for the client to handle programmatically)
- A human-readable message (for logging and debugging)
- Optional: a list of validation errors when input is invalid

Example:

```json
{
  "error": {
    "code": "VALIDATION_FAILED",
    "message": "Request body contains invalid fields",
    "details": [
      { "field": "title", "issue": "required, must be a string" },
      { "field": "questions", "issue": "must contain at least 1 question" }
    ]
  }
}
```

Define your error response shape and list the error codes your API will use.

---

## Output scaffold

```markdown
# API specification — Quiz Management System

## Base URL

`/api/v1`

## Auth

All protected endpoints require: `Authorization: Bearer <accessToken>`

Token lifespan: accessToken = 15 minutes, refreshToken = 7 days

## Error response format

<!-- Define your standard error shape here -->

## Endpoints

<!-- One block per endpoint, using the format from this step file -->

### Auth

### Quizzes

### Questions

### Assignments

### Submissions

## Versioning

<!-- Answer the 4 versioning questions from Part B -->

## Auth flow

<!-- Sequence diagram from Part C -->
```

---

## Branch + PR

```bash
git checkout -b step-3-api-design
# fill in architecture/api-spec.md
git add architecture/api-spec.md
git commit -m "docs(architecture): add REST API specification"
git push origin step-3-api-design
# open PR: "Step 3: API design" → main
```

---

[← Step 2](./step-2-data-model.md) · **Step 3** · [Step 4 →](./step-4-system-design.md)