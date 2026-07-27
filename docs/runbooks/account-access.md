# Runbook: Account access verification

## Purpose

Verify that an authorized platform administrator is accessing the intended Project Crystal AWS account through the documented SSO path.

## Scope

Applies to Management (`puru`), Shared Services, Development, and Production. It does not authorize access changes or document account identifiers.

## Current status

The `PlatformAdmins` group has `AdministratorAccess` assignments in all four documented accounts.

## Architecture

Access flows from IAM Identity Center to `PlatformAdmins`, then through `AdministratorAccess` to a selected assigned account.

## Engineering notes

Treat each account as a separate security boundary. Confirm account context before viewing or changing any settings. Use only approved SSO sessions; do not share credentials or export session material.

## Procedure

1. Sign in using the [AWS SSO login runbook](aws-sso-login.md).
2. Select the intended account from the available account list.
3. Confirm the account name in the AWS console session context.
4. Confirm `AdministratorAccess` is the selected documented permission set.
5. Stop and escalate if the expected account or permission set is unavailable or inconsistent.

## Validation

The session must show the intended account name and approved permission set before any operational action proceeds.

## Known limitations

Account IDs, OU membership, individual identities, and other access groups are not recorded in this repository.

## References

- [AWS account inventory](../reference/aws-account-inventory.md)
- [Identity Center architecture](../../architecture/identity-center.md)
- [AWS SSO login](aws-sso-login.md)

## Last reviewed

2026-07-27
