# AI Skill: Software Architecture Fundamentals

## Purpose

This skill trains architecture thinking through a complete design cycle:

1. Requirements analysis
2. Data model design
3. API specification
4. System design and deployment
5. Architecture self-review

## Learning outcomes

By the end of this skill, you should be able to:

- translate a short feature brief into technical requirements
- choose and justify a database model with trade-offs
- design a production-ready REST API contract
- design a deployable system architecture with failure handling
- critique your own design for security and scalability risks

## Inputs before starting

- Read [curriculum/01-software-architecture/README.md](../../curriculum/01-software-architecture/README.md)
- Keep this output folder as working space: [skills/01-software-architecture/architecture](./architecture)
- Use one branch per step: `feature/skill-01-step-N`

## Deliverables

Complete all files in [skills/01-software-architecture/architecture](./architecture):

- [skills/01-software-architecture/architecture/requirements.md](./architecture/requirements.md)
- [skills/01-software-architecture/architecture/data-model.md](./architecture/data-model.md)
- [skills/01-software-architecture/architecture/api-spec.md](./architecture/api-spec.md)
- [skills/01-software-architecture/architecture/system-design.md](./architecture/system-design.md)
- [skills/01-software-architecture/architecture/review.md](./architecture/review.md)

## Step flow

1. Step 1: Requirements

- Build functional and non-functional requirements, actors, entities, edge cases.

2. Step 2: Data model

- Define schema/ERD, constraints, indexes, and hard-case behavior.

3. Step 3: API spec

- Specify endpoint contracts, role rules, error format, versioning plan.

4. Step 4: System design

- Define components, architecture diagram, data flow, deployment choices.

5. Step 5: Review

- Identify failures, security gaps, scalability ceilings, and next fixes.

## Quality rubric (quick score)

Score each output from 1 to 5:

- Clarity: decisions are easy to follow
- Trade-offs: alternatives and why they were rejected
- Risks: realistic failure/security concerns identified
- Evidence: concrete examples, constraints, and acceptance criteria
- Reusability: future projects can reuse this artifact directly

## Validation checklist

- Requirements has 10+ functional requirements and explicit edge cases.
- Data model includes ERD fields, cardinality, and indexing rationale.
- API spec includes role-based access rules and standardized errors.
- System design includes deployment, crash handling, and data flow.
- Review includes specific vulnerabilities, bottlenecks, and fixes.

## Progress update points

Update [progress/skill-tracker.md](../../progress/skill-tracker.md) when each step is completed.

Update [progress/current-focus.md](../../progress/current-focus.md):

- when starting this skill
- when blocked for more than one day
- when finishing Step 5 and choosing next skill

## Definition of done

This skill is done when:

- all 5 architecture files are complete
- every file has decisions, trade-offs, risks, and open questions
- the review file contains concrete remediation actions
- progress tracker and current focus are both updated

## Agent operating notes

When asked for the next step:

- refer to [curriculum/01-software-architecture](../../curriculum/01-software-architecture)
- scaffold only the current step output
- validate completion using the checklist in this file
