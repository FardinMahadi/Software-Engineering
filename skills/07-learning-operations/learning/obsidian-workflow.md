---
type: skill-output
status: active
skill: learning-operations
step: 1
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - obsidian
  - workflow
---

# Obsidian Workflow

Parent: [[progress/README|Learning Progress Dashboard]]

## Scope

All markdown in this repository is designed to be opened in Obsidian first.
This note defines the operating rules for notes used in learning operations.

## Rules

1. Operational notes use YAML frontmatter.
2. Internal references use wikilinks.
3. Tags and properties are deliberate and support navigation or review.
4. Action items use Tasks-plugin-compatible syntax (`- [ ] task`).
5. Learning notes link back to a map-of-content note.

## Source of truth and entry point

- Source of truth for operational state: [[progress/README|Learning Progress Dashboard]] and notes under `progress/`.
- Entry note for navigation: [[progress/README|Learning Progress Dashboard]].
- Root `README.md` is context, not daily operational tracking.

## Folder roles

| Folder | Role | What belongs here |
| --- | --- | --- |
| `progress/` | Operational control center | Current focus, skill tracker, backlog, weekly review, consumption log |
| `skills/` | Course content and skill outputs | Step instructions and produced learning notes |
| Repository root | High-level context | Mission, structure, and orientation docs |

## Linking and formatting conventions

- Use wikilinks for internal vault references (example: `[[progress/skill-tracker|Skill Tracker]]`).
- Keep markdown links for external URLs.
- Use kebab-case for file names.
- Keep one top-level `#` heading per note.

## Naming and metadata conventions

- Every operational note must include: `type`, `status`, `created`, `updated`, `tags`.
- Use `skill` and `step` where the note belongs to a specific skill step.
- Update the `updated` date whenever behavior, process, or status changes.

## Entry point

Use [[progress/README|Learning Progress Dashboard]] as the main entry note for learning operations.
