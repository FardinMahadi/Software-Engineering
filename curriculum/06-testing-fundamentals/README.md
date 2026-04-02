← [Back to skills index](../README.md)

# Testing fundamentals

_Learn to write tests that actually catch bugs — unit, integration, and end-to-end — because AI-generated code needs tests more than human-written code does._

## Welcome

**What is this course?** Testing is the most underpracticed skill in self-taught development — and the most critical when AI agents are writing your code. You cannot trust code you haven't tested. This course teaches you to write tests that actually catch real bugs.

**Who is this for?** Full-stack developers who know how to build apps but haven't built a solid testing habit yet.

**What will you learn?**

- The three levels of testing and when to use each
- How to write unit tests with Jest / Vitest
- How to write integration tests for Express API endpoints
- How to write end-to-end tests with Playwright
- How to test AI-generated code effectively

**How long?** About 4–5 hours across 5 steps.

---

## Step 1: The testing pyramid

_Understand what to test, how much, and why._

### 📋 Activity: The three levels

In `testing/testing-pyramid.md`, explain in your own words:

1. **Unit tests** — test a single function or module in isolation
   - Fast, cheap, many of them
   - Example: test that `calculateScore(answers, correct)` returns the right number
   - Tools: Jest, Vitest

2. **Integration tests** — test how components work together (API + database, service + service)
   - Medium speed, medium cost
   - Example: POST /quizzes creates a quiz in the database and returns 201
   - Tools: Supertest + Jest, Vitest

3. **End-to-end tests** — test the full user journey in a real browser
   - Slow, expensive, few of them
   - Example: a student can log in, take a quiz, and see their score
   - Tools: Playwright, Cypress

Draw a pyramid showing the recommended ratio (many unit → fewer integration → very few E2E).

Then answer: **Why does testing matter even more with AI coding agents?**
(Hint: the agent cannot tell you if its own code is correct. Only your tests can.)

---

## Step 2: Unit testing with Vitest

_Test pure functions first — they're the easiest and most valuable._

### 📋 Activity: Write your first unit tests

Install Vitest:

```bash
npm install -D vitest
```

Write tests for these utility functions. Create `testing/unit/score.test.ts`:

```typescript
import { describe, it, expect } from "vitest";
import { calculateScore, isPassingGrade, formatScore } from "./score";

describe("calculateScore", () => {
  it("returns 100 when all answers are correct", () => {
    expect(calculateScore([true, true, true], 3)).toBe(100);
  });

  it("returns 0 when no answers are correct", () => {
    // your test
  });

  it("returns 50 when half the answers are correct", () => {
    // your test
  });

  it("throws when totalQuestions is 0", () => {
    // your test — what should happen when dividing by zero?
  });
});

describe("isPassingGrade", () => {
  // Write at least 3 tests covering: passing, failing, edge cases (exactly 60%)
});

describe("formatScore", () => {
  // Write tests for: whole numbers, decimals, 0, 100
});
```

Now implement the functions in `testing/unit/score.ts` to make all tests pass.

Run: `npx vitest run`

In `testing/unit/NOTES.md`:

- What is `describe`? What is `it`? What is `expect`?
- What does "AAA" mean in testing? (Arrange, Act, Assert)
- What is a "happy path" test vs an "edge case" test?

---

## Step 3: Integration testing an Express API

_Test that your routes, middleware, and database work together._

### 📋 Activity: API integration tests

Install testing dependencies:

```bash
npm install -D supertest @types/supertest
```

Write integration tests for a quiz API. Create `testing/integration/quiz.test.ts`:

```typescript
import request from "supertest";
import { describe, it, expect, beforeAll, afterAll, beforeEach } from "vitest";
import app from "../../src/app";
import { db } from "../../src/db";

describe("POST /api/v1/quizzes", () => {
  let authToken: string;

  beforeAll(async () => {
    // Connect to test database (separate from dev)
    await db.connect(process.env.TEST_DATABASE_URL);
    // Log in and get a token
    const res = await request(app)
      .post("/auth/login")
      .send({ email: "teacher@test.com", password: "testpass" });
    authToken = res.body.token;
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    // Clean up between tests
    await db.collection("quizzes").deleteMany({});
  });

  it("creates a quiz when authenticated as teacher", async () => {
    const res = await request(app)
      .post("/api/v1/quizzes")
      .set("Authorization", `Bearer ${authToken}`)
      .send({ title: "Test Quiz", questions: [] });

    expect(res.status).toBe(201);
    expect(res.body).toHaveProperty("id");
    expect(res.body.title).toBe("Test Quiz");
  });

  it("returns 401 when no token provided", async () => {
    const res = await request(app)
      .post("/api/v1/quizzes")
      .send({ title: "Test Quiz" });

    expect(res.status).toBe(401);
  });

  it("returns 400 when title is missing", async () => {
    // your test
  });

  it("returns 400 when title is too long", async () => {
    // your test
  });

  it("returns 403 when authenticated as student", async () => {
    // your test — students should not be able to create quizzes
  });
});
```

In `testing/integration/NOTES.md`:

- Why use a separate test database? What can go wrong without one?
- What does `beforeAll` / `afterAll` / `beforeEach` do?
- What is `supertest` and what does it replace?
- What four cases should every API endpoint test cover?

---

## Step 4: End-to-end testing with Playwright

_Test what the user actually sees and does._

### 📋 Activity: Write a user journey test

Install Playwright:

```bash
npm install -D @playwright/test
npx playwright install chromium
```

Write an E2E test for the student quiz-taking journey. Create `testing/e2e/student-quiz.spec.ts`:

```typescript
import { test, expect } from "@playwright/test";

test.describe("Student takes a quiz", () => {
  test.beforeEach(async ({ page }) => {
    // Log in as a student
    await page.goto("/login");
    await page.fill('[name="email"]', "student@test.com");
    await page.fill('[name="password"]', "testpass");
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL("/dashboard");
  });

  test("can see assigned quizzes on dashboard", async ({ page }) => {
    await expect(page.getByText("My Quizzes")).toBeVisible();
    await expect(page.getByRole("listitem")).toHaveCount(1);
  });

  test("can start and complete a quiz", async ({ page }) => {
    await page.getByText("Start Quiz").click();
    await expect(page).toHaveURL(/\/quiz\//);

    // Answer all questions
    await page.getByLabel("Answer A").check();
    await page.getByRole("button", { name: "Next" }).click();

    await page.getByLabel("Answer B").check();
    await page.getByRole("button", { name: "Submit Quiz" }).click();

    // Verify results page
    await expect(page.getByText("Your Score")).toBeVisible();
    await expect(page.getByText("%")).toBeVisible();
  });

  test("cannot access another student's results", async ({ page }) => {
    // Test authorization — student should get 403 or redirect
    await page.goto("/results/other-student-id");
    await expect(page).not.toHaveURL("/results/other-student-id");
  });
});
```

Run: `npx playwright test --headed` (to see the browser)

In `testing/e2e/NOTES.md`:

- What can Playwright test that integration tests can't?
- When is it NOT worth writing an E2E test?
- How do you handle flaky E2E tests (tests that sometimes pass, sometimes fail)?

---

## Step 5: Testing AI-generated code

_A checklist for reviewing tests the agent wrote — and tests you need to add._

### 📋 Activity: AI test review protocol

When an AI agent writes code, it often either:

- Writes no tests at all
- Writes tests that only test the happy path
- Writes tests that test the wrong thing (they pass but don't catch bugs)
- Writes tests that always pass regardless of implementation (useless tests)

In `testing/ai-test-review.md`, build your protocol:

1. **Test coverage checklist** — for every function or endpoint the agent builds, verify tests exist for:
 %%    - [ ] Happy path (normal correct input → correct output)
   - [ ] Invalid input (missing fields, wrong types, too long/short)
   - [ ] Auth failure (no token, expired token, wrong role)
   - [ ] Edge cases specific to this feature
   - [ ] Concurrent usage if relevant %% 

2. **Useless test detector** — here is a useless test. Explain why it's useless and rewrite it:

   ```typescript
   it("creates a user", async () => {
     const user = { name: "Test", email: "test@test.com" };
     expect(user.name).toBe("Test");
   });
   ```

3. **Test the tests** — the mutation testing concept. For each test you're suspicious of: temporarily break the implementation (change a `>` to `<`, remove a validation check). If the test still passes — the test is useless.

4. **Prompt for test generation** — write a reusable prompt you can give an AI agent to generate comprehensive tests for any function:

   ```
   Write comprehensive Vitest unit tests for the function [function name] in [file path].

   The tests must cover:
   - [Happy path case]
   - [Edge case 1]
   - [Edge case 2]
   - [Error case]

   For each test:
   - Use the AAA pattern (Arrange, Act, Assert)
   - Test only one thing per test
   - Use descriptive names that explain what is being tested

   Do NOT write tests that just assert the input equals itself.
   ```

---

## Finish

You've completed **Testing Fundamentals**. You can now:

- ✅ Explain the three levels of testing and when to use each
- ✅ Write meaningful unit tests with Vitest
- ✅ Write integration tests for Express API endpoints
- ✅ Write end-to-end tests with Playwright
- ✅ Review and improve AI-generated tests

### What's next?

- **Apply it:** Write at least 10 unit tests for Prosnokorta's score calculation and quiz validation logic this week.
- **Go deeper:** [Testing JavaScript](https://testingjavascript.com/) by Kent C. Dodds — the gold standard resource on JS testing.
- **Next skill:** [Agentic Engineering →](../../curriculum/05-agentic-engineering/README.md)
- **Back to index:** [Skills →](../README.md)

<footer>

---

Get help: [Post in the repository discussions](../../discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2026 &bull; [MIT License](https://gh.io/mit)

</footer>
</footer>
