# Operational governance artifacts

## Purpose

This directory contains reusable records and checklists that make operational, security, cost, validation, rollback, risk, and decision review consistent across Project Crystal.

## Scope

Use these templates for planned work and milestone evidence. They do not authorize infrastructure changes or replace an approved change-management process.

## Background

Platform changes are cross-cutting: a technically correct implementation can still introduce operational, security, cost, or recovery risk. Standard review artifacts make those concerns visible before release.

## Standards and best practices

- Complete templates proportionately to change risk and retain evidence through repository links.
- Assign an accountable owner and review date to every record.
- Record exceptions explicitly with an approver and expiry date.
- Never include credentials, tokens, personal data, or sensitive operational output.

## Templates

| Artifact | Use |
| --- | --- |
| [operational-checklist.md](operational-checklist.md) | Confirm operational readiness. |
| [validation-checklist.md](validation-checklist.md) | Plan and record verification evidence. |
| [security-review-template.md](security-review-template.md) | Capture security review and exceptions. |
| [cost-review-template.md](cost-review-template.md) | Record cost assumptions and budget impact. |
| [rollback-template.md](rollback-template.md) | Define recovery decision points and execution steps. |
| [risk-register-template.md](risk-register-template.md) | Track delivery and operational risk. |
| [decision-log-template.md](decision-log-template.md) | Record working decisions that do not require an ADR. |

## Review ownership

Platform Engineering owns these templates. The accountable delivery owner owns completed records, with specialist review where required.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
