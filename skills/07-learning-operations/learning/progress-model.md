---
type: skill-output
status: active
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

---

## 1. Status model

Every note with a `status` field uses exactly one of these values:

| Status        | Meaning                                                  |
| ------------- | -------------------------------------------------------- |
| `not-started` | Queued but no work done yet                              |
| `in-progress` | Actively being worked on                                 |
| `blocked`     | Cannot move forward — waiting on something external     |
| `done`        | Finished with evidence recorded                         |

Rules:
- A note moves to `done` only when there is concrete evidence (see §5).
- A note in `blocked` must include a `blocker:` field or a short note explaining what is stopping it.
- There should be at most **one** `in-progress` skill at a time in `skill-tracker.md`.

---

## 2. Required frontmatter fields

All operational notes (anything in `progress/`, `skills/`, or `learning/`) must include these fields:

```yaml
type:        # note role — tracker | skill-output | skill-step | roadmap | review
status:      # not-started | in-progress | blocked | done
created:     # YYYY-MM-DD
updated:     # YYYY-MM-DD — update this whenever the content changes
tags:        # at least one meaningful tag
```

Additional fields to include where relevant:

```yaml
skill:       # which skill folder this belongs to (e.g. learning-operations)
step:        # step number within a skill (1–5)
next_review: # YYYY-MM-DD — when to revisit
priority:    # high | medium | low
blocker:     # short description if status is blocked
```

Minimal rule: if you won't maintain a field, leave it out. The five required fields above are non-negotiable.

---

## 3. Rules for updating `current-focus.md`

Update [[progress/current-focus|Current Focus]] when **any of these happen**:

1. You start a new skill or switch primary focus to a different skill.
2. A blocker makes the current focus unmovable.
3. A skill step is completed and the next step is unclear.
4. A weekly review concludes with a focus change.

Do **not** update it for every small task — only when the priority genuinely shifts.

---

## 4. Rules for updating `skill-tracker.md`

Update [[progress/skill-tracker|Skill Tracker]] when **any of these happen**:

1. A skill step is fully completed (move progress % up, update `Last touched`).
2. A skill's status changes (e.g. `not-started` → `in-progress`).
3. A blocker is identified or resolved.
4. During the weekly review — sync all rows to reflect actual state.

The tracker is the single source of truth for skill progress. Status columns in other files (e.g. `skills/README.md`) should not duplicate it — link to the tracker instead.

---

## 5. Evidence of progress

Progress on a step or skill is only real when one of these exists:

| Evidence type               | Example                                              |
| --------------------------- | ---------------------------------------------------- |
| Completed deliverable       | A filled-out `learning/*.md` note with real content  |
| Finished skill step         | Step `status` changed to `done` with notes filled in |
| Committed code or file      | A git commit with a meaningful diff                  |
| Reviewed diff or PR         | An opened or merged pull request                     |
| Recorded decision           | An ADR or architectural note written in the vault    |
| Applied concept in a project| A project file updated using the studied concept     |

"I read about it" is not evidence. The knowledge must be applied or recorded somewhere concrete.
