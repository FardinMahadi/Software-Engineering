---
type: skill-step
status: done
skill: learning-operations
step: 1
created: 2026-03-15
updated: 2026-03-15
tags:
  - learning
  - obsidian
  - workflow
---

# Step 1: Obsidian workflow

### Activity: Define the vault rules

Create `learning/obsidian-workflow.md` and document the operating rules for this repository's learning notes.

Your note must state clearly that all markdown is meant to be opened in Obsidian and should follow these rules:

1. Every operational note uses YAML frontmatter.
2. Internal note references use wikilinks.
3. Tags and properties are deliberate, not decorative.
4. Action items use Tasks-plugin-compatible syntax.
5. Every note in the learning system links back to a map-of-content note.

Also define:

- Which folders hold overview docs versus operational notes
- Which note is the source of truth for current state
- Which note acts as the entry point for navigation

Use `progress/README.md` as the reference MOC for the current implementation.

## Acceptance criteria

- [x] The note explicitly states markdown is Obsidian-first.
- [x] All 5 operational rules are documented.
- [x] Folder roles (overview vs operational) are clearly defined.
- [x] Source-of-truth note is identified.
- [x] Entry-point note for navigation is identified.
