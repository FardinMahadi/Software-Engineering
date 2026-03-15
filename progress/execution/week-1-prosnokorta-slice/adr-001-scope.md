---
type: adr
status: accepted
area: architecture
created: 2026-03-15
updated: 2026-03-15
tags:
  - adr
  - scope
  - week-1
---

# ADR-001: Scope one vertical slice for 6-week acceleration

## Status

Accepted

## Context

The full product scope is too large for rapid skill compounding. Progress quality drops when multiple domains are attempted in parallel without finishing a complete system.

## Decision

Use one end-to-end subsystem as the skill gym: quiz assignment and submission API flow.

## Consequences

Positive:

1. Faster feedback loops via smaller PRs.
2. Easier to enforce architecture, testing, and security discipline.
3. Clear portfolio artifact showing end-to-end engineering.

Tradeoffs:

1. Other product areas paused temporarily.
2. Requires strict out-of-scope discipline each week.
