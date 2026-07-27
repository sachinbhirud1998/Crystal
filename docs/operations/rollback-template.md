# Rollback plan

## Purpose

Define how a change will be halted, reversed, or contained when validation or operational conditions indicate unacceptable risk.

## Scope

Use for changes that can affect availability, data, security, cost, or supportability. This template does not replace incident procedures.

## Background

Recovery is most reliable when decision triggers, responsibilities, and safe boundaries are agreed before execution.

## Change context

| Field | Record |
| --- | --- |
| Change or milestone | [Reference] |
| Accountable owner | [Name or team] |
| Rollback decision owner | [Name or team] |
| Safe stop point | [State] |
| Related runbook | [Link] |

## Rollback triggers

- [Observable trigger or validation failure]

## Rollback procedure

1. [Containment action]
2. [Reversal action]
3. [Validation action]

## Validation after rollback

| Check | Expected result | Evidence |
| --- | --- | --- |
| [Check] | [Result] | [Link] |

## Communication and escalation

[State audience, channel, timing, and escalation threshold.]

## Standards and best practices

Prefer reversible changes, test the plan proportionately, preserve evidence, and stop if the actual state differs from the plan. Do not include secrets or destructive commands in this template.

## Related repository sections

See `docs/runbooks/`, `docs/troubleshooting/`, `docs/operations/validation-checklist.md`, and `docs/milestones/`.

## Review ownership

Delivery owner: [Name or team]  
Operational reviewer: [Name or team]  
Review date: YYYY-MM-DD

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| YYYY-MM-DD | [Name] | Initial record |
