← [Back to curriculum index](../../curriculum/README.md)

# 01 — Software architecture fundamentals

> Learn how to design systems, choose the right tech stack, structure data flow, and make architectural decisions that scale — so you can direct AI agents and humans alike.

---

## What this skill covers

Software architecture is the blueprint of your application. It's the high-level set of decisions about what to build, how pieces connect, and where data lives. This is the skill that separates someone who uses frameworks from someone who engineers systems.

**Who this is for:** You know JavaScript/TypeScript, React, and Node.js. You can build things. Now you want to make confident decisions about _how_ to build them.

**Time:** ~4–6 hours across 5 steps.

**What you'll produce:**

| Output file                     | What it is                                                 |
| ------------------------------- | ---------------------------------------------------------- |
| `architecture/requirements.md`  | Functional + non-functional requirements, actors, entities |
| `architecture/data-model.md`    | Database choice, schema, entity diagram, indexing strategy |
| `architecture/api-spec.md`      | Full REST API specification with 8+ endpoints              |
| `architecture/system-design.md` | Architecture diagram, data flow, deployment plan           |
| `architecture/review.md`        | Self-critique: failure points, security gaps, scalability  |

---

## Steps

| Step | Topic                 | File                                                 |
| ---- | --------------------- | ---------------------------------------------------- |
| 1    | Requirements analysis | [step-1-requirements.md](./step-1-requirements.md)   |
| 2    | Data model design     | [step-2-data-model.md](./step-2-data-model.md)       |
| 3    | API specification     | [step-3-api-design.md](./step-3-api-design.md)       |
| 4    | System architecture   | [step-4-system-design.md](./step-4-system-design.md) |
| 5    | Architecture review   | [step-5-review.md](./step-5-review.md)               |

---

## How to work through this

For each step:

1. Read the step file fully before starting
2. Create your output file in `architecture/` using the scaffold provided
3. Work in a branch: `git checkout -b step-N-description`
4. Commit your work with a conventional commit: `docs(architecture): add requirements analysis`
5. Open a PR → review your own diff → merge → move to next step

The quiz management system used as the example throughout is intentionally close to **Prosnokorta** — so your answers here translate directly to a real architecture decision you can apply immediately.

---

## After you finish

- Apply the same process to one of your active projects (Prosnokorta or LGM)
- Write `ARCHITECTURE.md` at the root of that project using what you learned
- Next skill: [06 — Testing Fundamentals](../06-testing-fundamentals/README.md)