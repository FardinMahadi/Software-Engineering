# What this file is

This skill is for upgrading the quality of all other skills in this project.

Use it to:

- identify weak spots in your current learning outputs
- improve depth, clarity, and practical relevance
- turn notes into repeatable best practices
- define measurable improvement goals for the next cycle

---

## Upgrade workflow (5 steps)

### Step 1: Audit current skill quality

Review outputs from skills 01 to 07 and score each area from 1 to 5:

- Concept clarity: can you explain the topic simply?
- Practical implementation: did you build or apply something real?
- Review quality: did you capture trade-offs and mistakes?
- Reusability: can future-you reuse these notes directly?
- Evidence: do you have examples, commits, tests, or diagrams?

Create: `upgrade/step-1-audit.md`

---

### Step 2: Define upgrade targets

From the audit, choose 3 to 5 high-impact upgrades.

For each target, write:

- current state
- desired state
- why it matters
- clear acceptance criteria

Example:

- Current: API design notes describe endpoints but no error model.
- Target: Add a consistent error contract and example responses.
- Acceptance: `api-spec.md` includes error schema + 3 real examples.

Create: `upgrade/step-2-targets.md`

---

### Step 3: Apply improvements skill by skill

Implement the upgrades in small batches.

Suggested sequence:

1. Architecture and Testing
2. Security and Docker
3. Git workflows and Agentic Engineering
4. Learning Operations and cross-skill consistency

For each batch:

1. Create a branch (example: `feature/skill-upgrade-architecture-testing`)
2. Update files with concrete improvements
3. Add examples, templates, and checklists where missing
4. Commit with a conventional commit message
5. Open a PR and self-review against acceptance criteria

Create: `upgrade/step-3-implementation-log.md`

---

### Step 4: Add best-practice templates

Extract repeatable patterns from your upgraded work and store them as templates.

Recommended templates:

- architecture review template
- threat-model checklist
- test plan template
- PR self-review checklist
- learning retrospective template

Create: `upgrade/step-4-templates.md`

---

### Step 5: Measure impact and plan next cycle

After one full upgrade cycle, evaluate results with before/after evidence.

Track:

- quality score changes per skill
- reduction in repeated mistakes
- faster implementation or review time
- confidence level by topic

Then define the next cycle:

- what to keep
- what to improve further
- what to stop doing

Create: `upgrade/step-5-retrospective.md`

---

## Suggested folder structure

```
08-skills-upgrade/
├── README.md.md
└── upgrade/
	├── step-1-audit.md
	├── step-2-targets.md
	├── step-3-implementation-log.md
	├── step-4-templates.md
	└── step-5-retrospective.md
```

---

## Definition of done

This skill is complete for a cycle when:

- audit scores exist for all active skills
- at least 3 high-impact upgrades are implemented
- templates are created from successful patterns
- retrospective includes measurable outcomes
- next-cycle priorities are clearly documented