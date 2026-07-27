# Directory ownership expectations

## Purpose

Make stewardship and required review perspective visible for every major repository domain.

## Scope

Applies to repository directories and future contents. It does not grant production access or replace organizational responsibility assignments.

## Background

Clear ownership prevents orphaned documentation and ensures domain knowledge participates in significant changes.

## Standards and best practices

The Platform Engineering team is the default steward of Project Crystal. `CODEOWNERS` provides a review-routing placeholder and must be updated to real GitHub teams or maintainers before enforcement.

| Directory | Primary steward | Expected review focus |
| --- | --- | --- |
| `architecture/` | Platform Engineering | Architectural integrity and ADR alignment. |
| `docs/` | Platform Engineering | Accuracy, audience, and lifecycle. |
| `terraform/` | Platform Engineering | Modularity, safety, and standards compliance. |
| `kubernetes/`, `helm/`, `applications/` | Platform Engineering | Delivery boundaries and operational readiness. |
| `monitoring/` | Platform Engineering | Signal quality and ownership. |
| `scripts/` | Platform Engineering | Safety, idempotence, and documentation. |

Domain specialists should be added as owners when their services enter scope.

## Example

When a future monitoring domain gains a specialist owner, update both this standard and `.github/CODEOWNERS` in the same reviewed change.

## Related repository sections

See `.github/CODEOWNERS`, [repository-standards.md](repository-standards.md), `architecture/`, and `docs/operations/`.

## Review ownership

Platform Engineering maintains this document and validates ownership at each milestone boundary.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
