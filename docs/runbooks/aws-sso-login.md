# Runbook: AWS IAM Identity Center login

## Purpose

Provide the approved high-level procedure for obtaining an AWS console session through Project Crystal IAM Identity Center.

## Scope

Applies to authorized members using the documented `PlatformAdmins` group and the `AdministratorAccess` permission set. It does not create users, groups, permission sets, or assignments.

## Current status

IAM Identity Center SSO access is active for Management, Shared Services, Development, and Production.

## Architecture

Authentication is performed by AWS IAM Identity Center, which is its own identity source. `PlatformAdmins` is mapped to `AdministratorAccess` in the four documented accounts.

## Engineering notes

Obtain the approved organization-specific SSO start URL through the team's authorized internal channel; do not store it, credentials, or session material in the repository.

## Procedure

1. Open the approved IAM Identity Center start URL.
2. Authenticate using the organization-approved sign-in process.
3. Select the required assigned account and the `AdministratorAccess` permission set.
4. Open the console session and verify the selected account before making any change.

## Validation

Confirm the account name and permission set displayed in the AWS console. If either differs from the documented assignment, stop and report the discrepancy.

## Known limitations

The repository does not document individual users, MFA configuration, or additional permission sets. No workload infrastructure is available to access.

## References

- [Identity Center architecture](../../architecture/identity-center.md)
- [Account access](account-access.md)
- [Security policy](../../SECURITY.md)

## Last reviewed

2026-07-27
