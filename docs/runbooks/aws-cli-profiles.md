# Runbook: AWS CLI SSO profiles

## Purpose

Describe the safe use of local AWS CLI SSO profiles for the currently deployed landing-zone accounts.

## Scope

Applies to local operator configuration only. It does not prescribe configuration values, create profiles, store credentials, or automate access.

## Current status

CLI use must rely on IAM Identity Center sessions for the documented accounts. Terraform state remains local and no remote backend is configured.

## Architecture

An operator authenticates with IAM Identity Center, then uses a local profile associated with an assigned account session. The primary region is `ap-south-1`.

## Engineering notes

Profile names and SSO start URLs are local environment details and must not be committed. Use a distinct, clearly named profile per account and confirm account context before commands. Do not place static keys in tracked files.

## Procedure

1. Obtain the approved SSO settings through the authorized internal channel.
2. Configure a local CLI SSO profile for an assigned account using organization-approved tooling.
3. Authenticate through the profile using the Identity Center sign-in flow.
4. Verify the active account and the `ap-south-1` regional context before read or change operations.

## Validation

Use approved identity inspection appropriate to the local CLI environment to confirm the session maps to the intended account. Do not record returned identifiers or session values in the repository.

## Known limitations

No standard profile naming convention, SSO start URL, account ID, or CLI automation is documented. No CI/CD identity model exists.

## References

- [IAM Identity Center architecture](../../architecture/identity-center.md)
- [AWS region strategy](../standards/aws-region-strategy.md)
- [Terraform state strategy](../standards/terraform-state-strategy.md)

## Last reviewed

2026-07-27
