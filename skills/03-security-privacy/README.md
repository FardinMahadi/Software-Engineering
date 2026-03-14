← [Back to skills index](../README.md)

# Security & privacy fundamentals

_Learn to identify and fix the security vulnerabilities that AI coding agents consistently miss — authentication, authorization, input validation, and data protection._

## Welcome

**What is this course?** Security is the #1 blind spot of AI coding agents. This course teaches you to audit AI-generated code for the vulnerabilities it silently introduces — and how to build security in from the start.

**Who is this for?** Full-stack developers building web apps who want to ship code that doesn't get their users (or themselves) compromised.

**What will you learn?**

- The OWASP Top 10 — the most common web vulnerabilities
- How to implement authentication and authorization correctly
- How to validate and sanitize user input
- How to protect user data at rest and in transit
- How to audit AI-generated code for security issues

**How long?** About 4–5 hours across 5 steps.

> **Remember:** To correct an AI, you must know what is right. This course gives you that knowledge.

---

## Step 1: The OWASP Top 10

_Know your enemy._

The [OWASP Top 10](https://owasp.org/www-project-top-ten/) is the industry-standard list of the most critical web application security risks. Every developer must know these.

### 📋 Activity: OWASP audit checklist

1. Read the OWASP Top 10 (owasp.org/www-project-top-ten). Focus on these 5 for now:
   - A01: Broken Access Control
   - A02: Cryptographic Failures
   - A03: Injection (SQL, NoSQL, command)
   - A07: Identification and Authentication Failures
   - A09: Security Logging and Monitoring Failures

2. In `security/owasp-checklist.md`, create a checklist for each of these 5 risks:
   - What is it? (1 sentence)
   - How does it happen? (1 concrete example)
   - How do you prevent it? (2–3 specific actions)
   - Would an AI coding agent catch this? (Yes / Sometimes / No — with reasoning)

3. Pick one of your existing projects and perform a quick scan. In `security/owasp-audit-[project-name].md`, note any potential risks you found (or "no issues found" if clean).

Commit to `feature/security-owasp` and open a PR.

---

## Step 2: Authentication done right

_Most auth bugs come from doing it yourself incorrectly._

### 📋 Activity: Audit an auth implementation

Below is an intentionally flawed authentication implementation. Find every security problem.

```javascript
// routes/auth.js — FIND THE BUGS
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  const user = await db.query(`
    SELECT * FROM users WHERE email = '${email}' AND password = '${password}'
  `);

  if (user.rows.length > 0) {
    const token = jwt.sign(
      { userId: user.rows[0].id, role: user.rows[0].role },
      "secret123",
      { expiresIn: "365d" },
    );
    res.json({ token });
  } else {
    res.status(401).json({ error: "Wrong email or password" });
  }
});

app.get("/admin", (req, res) => {
  const token = req.headers.authorization;
  const decoded = jwt.decode(token); // not jwt.verify!
  if (decoded.role === "admin") {
    res.json({ data: "admin secrets" });
  }
});
```

In `security/auth-audit.md`, document every vulnerability you find (there are at least 6) and the correct fix for each.

Then in `security/auth-best-practices.md`, write the rules you'll follow for every auth implementation going forward:

- Password storage (never plaintext, always bcrypt/argon2)
- JWT: `verify` vs `decode`, secret management, expiry
- SQL injection prevention (parameterized queries)
- Rate limiting on login endpoints
- What info to reveal on failed login (timing attacks, enumeration)
- Refresh token strategy

---

## Step 3: Authorization — who can do what

_Authentication proves who you are. Authorization controls what you can do._

Broken Access Control is the #1 OWASP risk. It means a user can do things they shouldn't be allowed to do.

### 📋 Activity: Implement RBAC

1. Design a role-based access control (RBAC) system for a quiz app with these roles:
   - `admin` — full access to everything
   - `teacher` — can create/edit/delete their own quizzes, view all results
   - `student` — can only take assigned quizzes, view own results

2. In `security/rbac-design.md`, map out a permission matrix:

   | Action           | Admin | Teacher | Student            |
   | ---------------- | ----- | ------- | ------------------ |
   | Create quiz      | ✅    | ✅      | ❌                 |
   | Edit any quiz    | ✅    | ❌      | ❌                 |
   | Edit own quiz    | ✅    | ✅      | ❌                 |
   | View all results | ✅    | ✅      | ❌                 |
   | Submit quiz      | ✅    | ✅      | ✅ (assigned only) |

3. Write a middleware function in `security/rbac-middleware.js` that enforces these permissions:

   ```javascript
   // Your implementation here
   const requireRole = (allowedRoles) => (req, res, next) => {
     // Check JWT, extract role, compare to allowedRoles
     // Return 401 if no token, 403 if wrong role
   };

   // Usage:
   app.delete("/quizzes/:id", requireRole(["admin", "teacher"]), deleteQuiz);
   ```

4. Add a critical test: what happens if a student crafts a request with `role: 'admin'` in the body? Make sure your middleware ignores the request body for role — it must only trust the verified JWT.

---

## Step 4: Input validation and injection prevention

_Never trust user input. Ever._

### 📋 Activity: Validate everything

1. In `security/validation-rules.md`, write validation rules for these common inputs:
   - Email address
   - Password (minimum requirements)
   - Quiz title
   - Question text
   - Numeric score (min/max bounds)
   - File upload (type, size)

2. Install and use a validation library (e.g., `zod` for TypeScript or `joi` for JavaScript). Write a schema that validates a "create quiz" request body:

   ```typescript
   // security/quiz-schema.ts
   import { z } from "zod";

   export const CreateQuizSchema = z.object({
     // Your schema here
   });
   ```

3. Find and fix these injection scenarios in `security/injection-examples.md`:

   **NoSQL injection (MongoDB):**

   ```javascript
   // Vulnerable
   User.findOne({ email: req.body.email });
   // What happens if req.body.email = { $gt: '' } ?
   // Fix it.
   ```

   **Command injection:**

   ```javascript
   // Vulnerable
   exec(`convert ${req.body.filename} output.pdf`);
   // What happens if filename = '; rm -rf / ;' ?
   // Fix it.
   ```

---

## Step 5: Protect data at rest and in transit

_If your database is exposed, your users' data must still be safe._

### 📋 Activity: Data protection audit

In `security/data-protection.md`, answer and implement:

1. **In transit:**
   - Are all API calls over HTTPS? How do you enforce this?
   - Are you setting security headers? (Use [helmetjs](https://helmetjs.github.io/) for Express)
   - Are you using `SameSite` and `HttpOnly` cookie flags?

2. **Sensitive data handling:**
   - List every piece of sensitive data in one of your projects (passwords, tokens, personal info)
   - For each: where is it stored, how is it protected, who can access it?

3. **Environment variables:**
   - Create a `.env.example` file for one of your projects listing every required env var (with fake values)
   - Add `.env` to `.gitignore` if not already done
   - Document what happens if each env var is missing (crash early with a clear error, don't fail silently)

4. **AI agent security checklist:**
   Create `security/agent-review-checklist.md` — a checklist you will run on every AI agent PR before merging:

   ```markdown
   ## AI Agent Security Review

   - [ ] No hardcoded secrets, API keys, or passwords
   - [ ] All user inputs are validated before use
   - [ ] Database queries use parameterized inputs (no string interpolation)
   - [ ] Authorization checks on every protected route
   - [ ] Sensitive data not logged to console
   - [ ] File operations don't use user-supplied paths directly
   - [ ] Error messages don't leak internal details to users
   - [ ] Dependencies added are from trusted sources
   ```

---

## Finish

You've completed **Security & Privacy Fundamentals**. You can now:

- ✅ Identify the OWASP Top 10 vulnerabilities in real code
- ✅ Implement authentication correctly (hashing, JWT verify, rate limiting)
- ✅ Design and enforce role-based access control
- ✅ Validate and sanitize all user input
- ✅ Protect data in transit and at rest
- ✅ Audit AI-generated code before it ships

### What's next?

- **Apply it:** Run your `agent-review-checklist.md` on Prosnokorta's existing API endpoints.
- **Go deeper:** [PortSwigger Web Security Academy](https://portswigger.net/web-security) — free, hands-on labs for every vulnerability type.
- **Next skill:** [Docker & Containerization →](../04-docker-containerization/README.md)
- **Back to index:** [Skills →](../README.md)

<footer>

---

Get help: [Post in the repository discussions](../../discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2026 &bull; [MIT License](https://gh.io/mit)

</footer>
