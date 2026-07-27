# ADR-001: Multi-account AWS Organization strategy

- **Status:** Accepted
- **Date:** 2026-07-27

## Context

Project Crystal has completed its AWS Organizations landing zone. The Organization uses the `ALL` feature set and contains a Management account named `puru`, plus Shared Services, Development, and Production accounts. The current organizational-unit structure is Infrastructure, NonProduction, and Production.

## Problem Statement

The platform requires meaningful separation between organization administration, shared capabilities, non-production work, and production workloads. A single AWS account would combine these concerns into one access, billing, and operational boundary.

## Decision

Use a four-account AWS Organization consisting of Management, Shared Services, Development, and Production accounts. Maintain the existing organizational-unit structure as the current governance boundary.

## Rationale

Separate accounts establish independent boundaries before infrastructure is introduced. This aligns platform ownership and environment intent with AWS-native account isolation while preserving a clear organization-management account.

## Alternatives Considered

| Alternative | Decision |
| --- | --- |
| Single AWS account | Rejected because it combines management, shared, development, and production concerns in one boundary. |
| Two-account model | Rejected because it provides less separation between development and production responsibilities. |
| Four-account Organization | Accepted because it matches the current landing-zone inventory and intended operating boundaries. |

## Advantages

- Separates Management, Shared Services, Development, and Production concerns.
- Supports distinct access and governance boundaries.
- Establishes a durable structure before workload infrastructure exists.

## Disadvantages

- Requires operators to select and verify the correct account context.
- Adds administrative coordination compared with a single-account model.
- Does not itself provide networking, security services, or workload capabilities.

## Trade-offs

The additional operational overhead of multiple accounts is accepted in exchange for clearer isolation and future platform governance. Account separation is established now; resource placement and additional controls remain future decisions.

## Operational Impact

Platform administrators use IAM Identity Center to access the required assigned account. Account names must not be treated as evidence that corresponding services or workloads are deployed.

## Security Considerations

Accounts are separate access boundaries. This decision reduces reliance on a single broad account context but does not replace least-privilege design, policy governance, or future security controls.

## Cost Considerations

The decision introduces no documented workload or service cost. Future cost allocation can use account boundaries, subject to a separate approved cost-management approach.

## Future Considerations

Future milestones may define account-level resource placement, governance controls, or account membership in organizational units. Those decisions must not be inferred from this ADR and require separate review.

## Related Documents

- [Account structure](../account-structure.md)
- [Organization structure](../organization-structure.md)
- [AWS account strategy](../../docs/standards/aws-account-strategy.md)

## References

- [Milestone 1: AWS Organizations and Landing Zone](../../docs/milestones/MILESTONE-1.md)
- [AWS account inventory](../../docs/reference/aws-account-inventory.md)
