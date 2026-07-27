# AWS account strategy

## Purpose

Define how the current Project Crystal account inventory is documented and protected as a platform boundary.

## Scope

Applies to the existing Management, Shared Services, Development, and Production accounts. It does not define future resource placement, account creation, or account-to-OU assignments.

## Current status

The four-account inventory is complete through Milestone 1. No infrastructure beyond the landing zone is documented in any account.

## Architecture

The Management account is named `puru`. Shared Services, Development, and Production are separate accounts. The current inventory does not establish an OU membership relationship for individual accounts.

## Engineering notes

- Treat every account as an independent access and change boundary.
- Use IAM Identity Center assignments rather than undocumented credential-sharing patterns.
- Do not infer that an account name proves any service or workload deployment.

## Validation

Review the AWS Organizations account inventory and the IAM Identity Center assignments against [aws-account-inventory.md](../reference/aws-account-inventory.md).

## Known limitations

Account IDs, billing configuration, policy assignments, delegated administration, and future account strategy are outside the documented current state.

## References

- [Account structure](../../architecture/account-structure.md)
- [Organization structure](../../architecture/organization-structure.md)
- [Account access runbook](../runbooks/account-access.md)

## Last reviewed

2026-07-27
