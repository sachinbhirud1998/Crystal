# Security review

## Purpose

Capture security review scope, findings, residual risk, and approvals for a proposed platform change.

## Scope

Use for material design or delivery work. This template supports, but does not replace, organizational security policy or incident reporting procedures.

## Background

Security review should identify trust boundaries, data handling, access implications, and recovery considerations before implementation is accepted.

## Review record

| Field | Record |
| --- | --- |
| Change or milestone | [Reference] |
| Reviewer | [Name or team] |
| Review date | YYYY-MM-DD |
| Data classification | [Classification] |
| Decision | Approved / Approved with conditions / Rework required |

## Review checklist

- [ ] Trust boundaries and access paths are documented.
- [ ] Least-privilege and ownership implications are assessed.
- [ ] Secret handling and sensitive-data exposure are assessed.
- [ ] Logging, audit, and incident-response needs are assessed within project scope.
- [ ] Dependency and supply-chain risks are assessed.
- [ ] Findings have owners, due dates, and tracked disposition.

## Findings and exceptions

| Finding or exception | Severity | Owner | Disposition | Expiry date |
| --- | --- | --- | --- | --- |
| [Item] | [Severity] | [Owner] | [Action] | YYYY-MM-DD |

## Standards and best practices

Do not place secrets or sensitive assessment details in this file. Link to restricted records where necessary and record only the safe summary here.

## Related repository sections

See `SECURITY.md`, `architecture/`, `docs/standards/`, and `docs/milestones/`.

## Review ownership

Security reviewer: [Name or team]  
Accountable delivery owner: [Name or team]

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| YYYY-MM-DD | [Name] | Initial record |
