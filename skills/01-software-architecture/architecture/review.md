---
title: Architecture Review - Quiz Management System
type: architecture-artifact
skill: software-architecture
step: 5
status: draft
updated: 2026-04-02
tags:
	- architecture
	- review
	- risk
---

# Architecture Review - Quiz Management System

## Context

This artifact critiques the architecture before implementation at scale.

## Decisions

## Failure analysis

### Single points of failure

<!-- Database down, API crash, Redis down, provider outage -->

### Cascading failures

<!-- 100 simultaneous submissions scenario -->

## Security gap analysis

### Broken authentication

<!-- Findings and specific fixes -->

### Broken access control

<!-- Findings and specific fixes -->

### Input validation gaps

<!-- Findings and specific fixes -->

### Rate limiting

<!-- Current state and what needs adding -->

### Data exposure

<!-- What leaks and what must be stripped -->

## Scalability ceiling

<!-- Current bottleneck, DB scaling path, horizontal API scaling blockers -->

## Trade-offs

<!-- Example: speed of delivery vs stronger hardening before launch -->

## Risks

<!-- Prioritized list: high, medium, low with mitigation owner -->

## Open questions

<!-- Unknowns that could change architecture choices -->

## Retrospective

### Hardest decision

<!-- -->

### What I would do differently

<!-- -->

### Assumption I am unsure about

<!-- -->

### What I would warn an AI agent about

<!-- -->

## Evidence

- Step source: [curriculum/01-software-architecture/step-5-review.md](../../../curriculum/01-software-architecture/step-5-review.md)
- Upstream: [skills/01-software-architecture/architecture/system-design.md](./system-design.md)
- Related: [skills/01-software-architecture/architecture/api-spec.md](./api-spec.md)
