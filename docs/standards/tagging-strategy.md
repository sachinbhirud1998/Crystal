# Tagging strategy

## Purpose

Define the metadata required to establish ownership, cost attribution, and lifecycle context for future managed resources.

## Scope

Applies only when resource implementation is authorized in a future milestone. It does not create or configure resources.

## Background

Consistent tags support governance and operational accountability across Shared Services, Development, and Production.

## Standards and best practices

When future managed resources are introduced, they must carry consistent metadata for ownership, cost allocation, lifecycle, and operational context.

| Tag | Required value |
| --- | --- |
| `Project` | `crystal` |
| `Environment` | `shared-services`, `development`, or `production` |
| `ManagedBy` | Authoritative management system, such as `terraform` |
| `Owner` | Responsible team or service owner |
| `CostCenter` | Approved cost allocation identifier |
| `DataClassification` | Approved classification value |

Additional tags may be required by an accepted ADR. Tags must not contain secrets or personal data.

## Example

A future Development resource would use `Project=crystal`, `Environment=development`, and an approved owner value; it must not encode credentials or personal identifiers.

## Related repository sections

See [naming-conventions.md](naming-conventions.md), `docs/operations/cost-review-template.md`, and `docs/standards/directory-ownership.md`.

## Review ownership

Platform Engineering owns this strategy with security and cost-review input for material changes.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
