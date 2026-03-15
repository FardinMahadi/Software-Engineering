---
type: skill
status: active
skill: learning-operations
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - obsidian
  - progress
  - ai-guidance
---

← [Back to skills index](../README.md)

# Learning operations

_Build a repeatable system for learning, tracking progress, and guiding AI help so your study workflow stays structured instead of reactive._

## Welcome

**What is this course?** Learning operations is the discipline of running your study process like an engineered system. You define what matters, track what changed, review what is blocked, and make the next action obvious.

**Who is this for?** Developers who already have a roadmap but want stronger execution, review, and AI-guided study habits.

**What will you learn?**

- How to structure an Obsidian-first learning vault that stays usable over time
- How to track skills, blockers, reviews, and next actions without duplicating notes
- How to turn roadmap topics into a real execution rhythm
- How to tell an AI IDE what to update, what to preserve, and what to suggest next
- How to review the system and improve it instead of endlessly rebuilding it

**How long?** About 3-4 hours across 5 steps.

## Obsidian requirement

All markdown created for this skill is intended to be opened in Obsidian and must follow Obsidian best practices.

- Use YAML frontmatter for metadata.
- Use wikilinks for internal navigation.
- Use properties and tags consistently.
- Use Tasks-plugin-compatible checkboxes for action items.
- Link important notes back to a map-of-content note.

## What you will produce

| Output file                        | What it is                                                      |
| ---------------------------------- | --------------------------------------------------------------- |
| `learning/obsidian-workflow.md`    | Your operating rules for notes, links, metadata, and navigation |
| `learning/progress-model.md`       | Status model, metadata model, and update rules                  |
| `learning/review-rhythm.md`        | Daily and weekly review cadence                                 |
| `learning/ai-guidance.md`          | A plain-language version of how the AI should help you learn    |
| `learning/system-retrospective.md` | Review of what works, what breaks, and what to improve          |

## Steps

| Step | Topic                | File                                                         |
| ---- | -------------------- | ------------------------------------------------------------ |
| 1    | Obsidian workflow    | [step-1-obsidian-workflow.md](./step-1-obsidian-workflow.md) |
| 2    | Progress model       | [step-2-progress-model.md](./step-2-progress-model.md)       |
| 3    | Review rhythm        | [step-3-review-rhythm.md](./step-3-review-rhythm.md)         |
| 4    | AI guidance contract | [step-4-ai-guidance.md](./step-4-ai-guidance.md)             |
| 5    | System retrospective | [step-5-retrospective.md](./step-5-retrospective.md)         |

## How to work through this

1. Read the step file fully before editing anything.
2. Create or update the output note in `learning/`.
3. Reflect operational changes in [[progress/README|Learning Progress Dashboard]] when the workflow changes.
4. Work in a branch: `git checkout -b feature/learning-ops-step-N`.
5. Commit with a conventional message such as `docs(learning-ops): define progress model`.

## Finish

After this skill:

- Update [[progress/current-focus|Current Focus]] with your active study rhythm.
- Keep [[progress/skill-tracker|Skill Tracker]] current after each completed skill step.
- Refine `learning/ai-guidance.md` only when the workflow changes for a clear reason.
