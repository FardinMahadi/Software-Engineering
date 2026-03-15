---
type: focus
status: active
area: execution
stage:
  - stage-2
  - stage-3
  - stage-4
created: 2026-03-15
updated: 2026-03-15
next_review: 2026-03-22
tags:
  - learning
  - focus
  - weekly
---

# Current Focus

Parent: [[progress/README|Learning Progress Dashboard]]

## Active themes

- Architecture decisions before implementation.
- Git discipline for every AI or manual work session.
- Security review as a required gate, not a cleanup step.

## This week

- [ ] Execute [[progress/execution/week-1-prosnokorta-slice/README|Week 1 Prosnokorta Execution Pack]].
- [ ] Open PR: `docs/week1-requirements-data-model-openapi` in the app repo.
- [ ] Open PR: `docs/week1-adrs-and-checklists` in the app repo.
- [ ] Add CI workflow from `ci-workflow-skeleton.yml` and run first green pipeline.
- [ ] Capture blockers and decisions in [[progress/weekly-review|Weekly Review]].

## Current blockers

- Application source repo files are not in this workspace, so execution artifacts must be applied there.
- Testing/security baselines are still at beginner level and need strict PR boundaries.

## Next actions

1. Apply `openapi.yaml` and docs artifacts in Prosnokorta backend repository.
2. Implement first two endpoints (`POST /quizzes`, `GET /quizzes`) with tests.
3. Update [[progress/skill-tracker|Skill Tracker]] after first Week 1 PR merge.

## Notes for AI guidance

- Read this note before suggesting what to study next.
- Prefer 1 to 3 concrete next actions, not broad topic lists.
- When a task is completed, update this note and [[progress/skill-tracker|Skill Tracker]].
