# AWS account inventory

## Purpose

Provide the controlled current inventory of Project Crystal AWS accounts.

## Scope

Records account names and documented access only. It does not contain account IDs, OU membership, or deployed-resource inventories.

## Current status

**Complete through Milestone 1.** All listed accounts are part of the landing-zone inventory.

## Architecture

| Account | Current documented state | IAM Identity Center assignment |
| --- | --- | --- |
| Management (`puru`) | Landing-zone account; no further infrastructure documented | `PlatformAdmins` / `AdministratorAccess` |
| Shared Services | Landing-zone account; no shared services deployed | `PlatformAdmins` / `AdministratorAccess` |
| Development | Landing-zone account; no workloads deployed | `PlatformAdmins` / `AdministratorAccess` |
| Production | Landing-zone account; no workloads deployed | `PlatformAdmins` / `AdministratorAccess` |

## Engineering notes

Account naming is not evidence of deployed services. Use SSO, verify session context, and avoid storing account IDs or credentials in repository documentation.

## Validation

Validate account presence in AWS Organizations and assignment presence in IAM Identity Center.

## Known limitations

The supplied inventory does not define OU membership, policies, billing roles, or service resources.

## References

- [Account structure](../../architecture/account-structure.md)
- [Account access](../runbooks/account-access.md)
- [AWS account strategy](../standards/aws-account-strategy.md)

## Last reviewed

2026-07-27
