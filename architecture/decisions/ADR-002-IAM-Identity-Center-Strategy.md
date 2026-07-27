# ADR-002: IAM Identity Center strategy

- **Status:** Accepted
- **Date:** 2026-07-27

## Context

Project Crystal uses AWS IAM Identity Center as its identity source. The `PlatformAdmins` group is assigned the `AdministratorAccess` permission set in the Management, Shared Services, Development, and Production accounts.

## Problem Statement

The platform requires a consistent, centrally managed method for administrators to authenticate across multiple AWS accounts without relying on IAM users or long-lived credentials.

## Decision

Use AWS IAM Identity Center with SSO for documented platform-administrator access. Use the `PlatformAdmins` group and the `AdministratorAccess` permission set for the current four-account landing-zone assignments.

## Rationale

IAM Identity Center provides a centralized group-and-permission-set access model aligned with the multi-account Organization. It avoids documenting or distributing persistent IAM user credentials as the access mechanism.

## Alternatives Considered

| Alternative | Decision |
| --- | --- |
| IAM users and long-lived access keys | Rejected because they increase credential lifecycle and distribution risk. |
| Separate account-specific access patterns | Rejected because they fragment administration across the Organization. |
| IAM Identity Center with SSO | Accepted because it centralizes the current access model across assigned accounts. |

## Advantages

- Provides one documented SSO access path for the current account inventory.
- Uses group membership and permission sets rather than individual, long-lived credentials.
- Makes account assignments visible and reviewable.

## Disadvantages

- Administrators must sign in through IAM Identity Center and select account context.
- The current `AdministratorAccess` assignment is broad and must be revisited as platform responsibilities mature.
- The current inventory does not document additional groups or permission sets.

## Trade-offs

The platform accepts SSO session workflow and account selection overhead to avoid the operational and security burden of IAM users and persistent credentials.

## Operational Impact

Operators must use the documented SSO path, verify selected account and permission set, and avoid storing session material or credentials in the repository.

## Security Considerations

This decision reduces reliance on long-lived credentials but does not constitute a complete identity-governance model. Least privilege, identity lifecycle, MFA configuration, and additional permission-set design remain outside the documented current state.

## Cost Considerations

No additional project infrastructure cost is introduced by this documented access decision. Future identity integrations or governance requirements require separate cost review.

## Future Considerations

Future milestones may introduce additional access groups, permission sets, or delegated administration after architecture and security review. None are approved or implemented by this ADR.

## Related Documents

- [IAM Identity Center architecture](../identity-center.md)
- [AWS SSO login runbook](../../docs/runbooks/aws-sso-login.md)
- [Account access runbook](../../docs/runbooks/account-access.md)

## References

- [Milestone 1: AWS Organizations and Landing Zone](../../docs/milestones/MILESTONE-1.md)
- [Current environment](../../docs/reference/current-environment.md)
