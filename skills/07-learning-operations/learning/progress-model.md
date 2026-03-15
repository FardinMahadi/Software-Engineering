---
type: skill-output
status: draft
skill: learning-operations
step: 2
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - progress
  - metadata
---

# Progress Model

Parent: [[progress/README|Learning Progress Dashboard]]

## Status model

- `not-started`
- `in-progress`
- `blocked`
- `done`

## Core fields

- `type`
- `status`
- `skill`
- `stage`
- `created`
- `updated`
- `next_review`
- `tags`

## Update triggers

1. Update [[progress/current-focus|Current Focus]] when priorities or blockers change.
2. Update [[progress/skill-tracker|Skill Tracker]] when a skill step is finished.
3. Update [[progress/learning-backlog|Learning Backlog]] when something becomes real future work.

## Evidence of progress

- A completed note or deliverable
- A finished skill step
- A commit, PR, or reviewed diff
- A clear decision recorded in the vault
