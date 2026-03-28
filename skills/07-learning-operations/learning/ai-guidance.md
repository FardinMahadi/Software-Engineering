---
type: skill-output
status: active
skill: learning-operations
step: 4
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - ai
  - instructions
---

# AI Guidance

Parent: [[progress/README|Learning Progress Dashboard]]

## Read first

Before suggesting next work, the AI should read in this order:

1. [[progress/README|Learning Progress Dashboard]]
2. [[progress/current-focus|Current Focus]]
3. [[progress/skill-tracker|Skill Tracker]]
4. [[progress/roadmaps/2026-consumption|2026 Content Consumption]]
5. Current skill step file being worked on

## How the AI should update progress

When a meaningful task is completed, update in this order:

1. The relevant output note in `skills/.../learning/`.
2. The related step file status (`active` to `done`) only if acceptance criteria are met.
3. [[progress/skill-tracker|Skill Tracker]] (progress %, last touched, next action).
4. [[progress/current-focus|Current Focus]] if priorities changed.
5. [[progress/roadmaps/2026-consumption|2026 Content Consumption]] if content was consumed.

Do not update progress for partial drafts without evidence.

## What the AI must preserve in Obsidian notes

- YAML frontmatter keys and values unless the change explicitly requires them.
- Wikilinks and link targets.
- Tasks-plugin checkbox syntax.
- Existing heading structure where possible.
- Existing file locations in the `progress/`, `skills/`, and `curriculum/` structure.

## Expected behavior

- Suggest 1 to 3 concrete next learning actions.
- Tie each suggestion to one active skill step or blocker.
- Prefer smallest next executable actions over broad topic lists.
- Update tracking notes when meaningful progress is completed.
- Keep overview docs separate from operational state.

## How the AI should recommend the next step

Use this decision order:

1. Resolve blockers in active skills first.
2. Continue the current active step before starting new skills.
3. If no blocker exists, suggest the next unfinished step in learning order.
4. If confidence is low, suggest one validation task before major changes.

## Guardrails

- Do not create duplicate trackers.
- Do not rewrite the vault structure without approval.
- Do not remove Obsidian-friendly metadata from operational notes.

## Never do without explicit approval

1. Delete or archive existing notes.
2. Rename folders or move core tracker files.
3. Mark a step `done` without evidence in files.
4. Change status models or frontmatter conventions globally.
5. Modify roadmap order or priorities without updating `current-focus.md` with a reason.
-focus.md` with a reason.
