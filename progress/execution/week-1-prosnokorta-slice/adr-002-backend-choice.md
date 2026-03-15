---
type: adr
status: accepted
area: backend
created: 2026-03-15
updated: 2026-03-15
tags:
  - adr
  - backend
  - node
---

# ADR-002: Use Node/Express as primary backend practice stack

## Status

Accepted

## Context

Primary goal is full-stack skill acceleration with high iteration speed and strong testing and Git workflow habits.

## Decision

Use Node/Express as the main backend implementation stack for the 6-week subsystem.

## Consequences

Positive:

1. Faster implementation and feedback loop for weekly shipping cadence.
2. Easier integration with existing JavaScript/TypeScript workflow.
3. Simpler setup for CI and Docker during learning phase.

Tradeoffs:

1. Spring Boot depth will be delayed for this specific cycle.
2. Must consciously transfer architecture/security habits across stacks later.
