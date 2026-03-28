← [Back to skills index](../README.md)

# Git & GitHub workflows

_Master branching strategies, rebase, pull requests, and how professional teams use Git — including tracking AI agent changes safely._

## Welcome

**What is this course?** Git is more than `git add . && git commit && git push`. This course covers how real engineering teams use Git — and how to use it as a safety net when AI coding agents are writing your code.

**Who is this for?** Developers who know basic Git but want to work like a professional team and safely manage AI-generated code changes.

**What will you learn?**

- Branch strategies used in professional teams
- The difference between merge, rebase, and squash — and when to use each
- How to write meaningful commit messages
- How to structure and review pull requests
- How to use Git to track, audit, and revert AI agent changes

**How long?** About 3–4 hours across 5 steps.

---

## Step 1: Branching strategy

_Not all branches are created equal._

Professional teams follow a branching convention so everyone knows where code lives and what state it's in.

### 📋 Activity: Set up your branch structure

1. In a new or existing repository, create the following branch structure:

   ```
   main          ← production-ready code only
   develop       ← integration branch for features
   feature/      ← individual features (e.g. feature/user-auth)
   fix/          ← bug fixes (e.g. fix/login-redirect)
   agent/        ← AI agent sessions (e.g. agent/add-test-suite)
   ```

2. In `docs/branching-strategy.md`, document your branching rules:
   - What goes on `main`?
   - What goes on `develop`?
   - When do you create a `feature/` branch?
   - **Why is the `agent/` prefix important?** (Hint: think about reverting AI agent changes)

3. Create a branch called `feature/branching-docs`, add your file, commit, and open a PR to `develop`.

<details>
<summary>💡 Why a separate `agent/` prefix?</summary>

When an AI coding agent makes changes, you want those changes isolated in their own branch. If the agent breaks something, you can simply close the branch and lose nothing. Never let an agent commit directly to `main` or `develop`.

</details>

---

## Step 2: Commits that tell a story

_A good commit history is documentation._

### 📋 Activity: Conventional commits

1. Learn the [Conventional Commits](https://www.conventionalcommits.org/) specification:

   ```
   <type>(<scope>): <description>

   feat(auth): add JWT refresh token endpoint
   fix(quiz): prevent duplicate submissions
   docs(readme): update setup instructions
   test(api): add unit tests for score calculation
   refactor(db): normalize question schema
   chore(deps): upgrade mongoose to 8.x
   ```

2. In `docs/commit-guide.md`, write a short guide explaining:
   - The 6 commit types above and when to use each
   - Why commit messages matter (hint: `git log`, blame, reverting)
   - One rule for AI agent commits: always prefix with `chore(agent):` or use the `agent/` branch convention

3. Go back through your recent commits in any project. Find 3 commit messages that could be improved. Rewrite them in `docs/commit-guide.md` under a section called "Before & After".

4. Commit your guide with a proper conventional commit message. Then open a PR.

---

## Step 3: Merge vs rebase vs squash

_Three ways to integrate branches — each with different tradeoffs._

### 📋 Activity: See the difference

Set up a simple scenario:

1. From `develop`, create `feature/rebase-demo`
2. Add 3 small commits (doesn't matter what — just text file changes)
3. Meanwhile, add 1 commit directly to `develop` (simulating a teammate's work)

Now practice all three integration strategies:

**A) Merge (preserves full history):**

```bash
git checkout develop
git merge feature/rebase-demo
# Result: a merge commit appears, full branch history visible
```

**B) Rebase (replays your commits on top of develop):**

```bash
git checkout feature/rebase-demo
git rebase develop
# Result: your commits appear as if written after the teammate's commit
```

**C) Squash merge (one clean commit):**

```bash
git checkout develop
git merge --squash feature/rebase-demo
git commit -m "feat(demo): add rebase demo files"
# Result: all 3 commits collapse into 1
```

In `docs/merge-strategies.md`, explain:

- What does `git log --oneline --graph` look like after each approach?
- When would you use each strategy?
- **Recommendation for AI agent branches:** which strategy and why?

---

## Step 4: Pull requests that get merged

_A PR is a conversation, not just code._

### 📋 Activity: Write a great PR

Create a `.github/pull_request_template.md` file in your repository:

```markdown
## What does this PR do?

<!-- One sentence description -->

## Why?

<!-- Link to issue or explain the motivation -->

## How was this tested?

- [ ] Unit tests added/updated
- [ ] Manually tested locally
- [ ] Edge cases considered

## Screenshots (if UI change)

## Checklist

- [ ] Code follows project conventions
- [ ] No console.log left in code
- [ ] No secrets or API keys committed
- [ ] Security implications considered
```

Then add a second template specifically for AI agent PRs at `.github/agent_pr_template.md`:

```markdown
## AI Agent Session Summary

**Agent used:** <!-- Cursor / GitHub Copilot / Claude / etc. -->
**Prompt given:** <!-- What you asked the agent to build -->

## What the agent did

<!-- Brief description of changes made -->

## What I reviewed

- [ ] Read every file changed
- [ ] Checked for hardcoded secrets or API keys
- [ ] Verified authentication/authorization logic
- [ ] Checked input validation
- [ ] Ran tests locally

## What I had to fix manually

<!-- Any mistakes the agent made that you corrected -->

## Risks

<!-- Any areas you're uncertain about -->
```

Commit both templates and open a PR using your new PR template.

---

## Step 5: Undo, revert, and recover

_Knowing how to undo things is what separates confident Git users from nervous ones._

### 📋 Activity: Practice recovery

In a safe test branch `git checkout -b git-recovery-practice`, practice each of these:

1. **Undo last commit (keep changes):**

   ```bash
   git reset --soft HEAD~1
   ```

2. **Undo last commit (discard changes):**

   ```bash
   git reset --hard HEAD~1
   ```

3. **Revert a commit (safe for shared branches — creates a new undo commit):**

   ```bash
   git revert <commit-hash>
   ```

4. **Restore a single file to last committed state:**

   ```bash
   git checkout HEAD -- path/to/file.js
   ```

5. **Find a lost commit:**
   ```bash
   git reflog
   # Then: git checkout <hash>
   ```

In `docs/git-recovery.md`, document each command with:

- When to use it
- Whether it's safe on a shared/remote branch
- The AI agent scenario where you'd use it (e.g., "agent deleted a file by mistake → use `git revert`")

Commit, open a final PR, merge everything to `develop`, then `develop` to `main`.

---

## Finish

You've completed **Git & GitHub Workflows**. You now know how to:

- ✅ Design a branching strategy for a real team (including AI agents)
- ✅ Write conventional commit messages
- ✅ Choose between merge, rebase, and squash
- ✅ Structure pull requests that communicate clearly
- ✅ Confidently undo, revert, and recover from mistakes

### What's next?

- **Apply it:** Set up this branching strategy in your Prosnokorta repo right now.
- **Next skill:** [Security & Privacy Fundamentals →](../03-security-privacy/README.md)
- **Back to index:** [Curriculum Index →](../../curriculum/README.md)

<footer>

---

Get help: [Post in the repository discussions](../../discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2026 &bull; [MIT License](https://gh.io/mit)

</footer>
