# Validation checklist

## Purpose

Define and record evidence that a change meets its stated objectives without creating unacceptable regressions.

## Scope

Use for milestone and change validation. Adapt test depth to risk, impact, and the maturity of the affected domain.

## Background

Validation must be planned before delivery so acceptance is based on observable evidence rather than subjective completion.

## Checklist

- [ ] Objectives and measurable acceptance criteria are linked.
- [ ] Expected behavior and negative or failure scenarios are identified.
- [ ] Environment, inputs, and prerequisites are recorded.
- [ ] Validation owner and independent reviewer are named where required.
- [ ] Results, timestamps, and durable evidence locations are recorded.
- [ ] Deviations, known limitations, and follow-up actions are documented.
- [ ] Rollback or containment validation is completed when applicable.

## Evidence record

| Validation activity | Expected result | Actual result | Evidence | Owner |
| --- | --- | --- | --- | --- |
| [Activity] | [Result] | [Result] | [Link] | [Owner] |

## Standards and best practices

Prefer repeatable checks, capture only non-sensitive evidence, and distinguish `not run` from `pass` or `fail`.

## Related repository sections

See `docs/milestones/`, `docs/runbooks/`, and `docs/troubleshooting/`.

## Review ownership

Validation owner: [Name or team]  
Review date: YYYY-MM-DD

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| YYYY-MM-DD | [Name] | Initial record |
