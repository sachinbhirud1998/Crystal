# ADR-004: Terraform local-state strategy

- **Status:** Accepted
- **Date:** 2026-07-27

## Context

Project Crystal currently uses Terraform local state only. No remote backend is configured. Remote state is intentionally deferred until Milestone 10, the Production Hardening milestone. The project is complete through Milestone 1 and no infrastructure beyond the landing zone is deployed.

## Problem Statement

The project needs a state-management approach appropriate to early, constrained milestones without prematurely introducing remote state infrastructure, access models, cost, and recovery responsibilities.

## Decision

Use Terraform local state during early milestones. Defer remote state design and implementation until Milestone 10: Production Hardening.

## Rationale

Local state matches the current limited implementation scope and avoids introducing a remote backend before its security, access, durability, locking, cost, and operational requirements can be designed as part of a production-hardening milestone.

## Alternatives Considered

| Alternative | Decision |
| --- | --- |
| Configure remote state immediately | Deferred because it would introduce additional platform design and operational requirements before they are in scope. |
| Do not use Terraform state | Rejected because Terraform requires state management for managed infrastructure. |
| Use local state temporarily | Accepted for early milestones, with remote state deferred to Milestone 10. |

## Advantages

- Keeps early milestone scope aligned with the current landing-zone maturity.
- Avoids prematurely selecting remote storage, locking, access, and recovery mechanisms.
- Defers related cost and security design until production hardening is authorized.

## Disadvantages

- Local state has no documented shared access, remote durability, locking, or recovery capability.
- State remains dependent on the operator environment.
- The approach is unsuitable as a final production-hardening posture.

## Trade-offs

The project accepts the limitations of local state during early milestones to prevent remote backend complexity from moving ahead of the approved roadmap. This is an intentional temporary strategy, not a production-state design.

## Operational Impact

Operators must protect local state, keep it out of version control, and avoid assuming collaborative locking or remote recovery. Terraform state remains local until the approved future milestone changes this decision.

## Security Considerations

Local state can contain sensitive operational metadata and must be handled accordingly. No remote-state encryption, access control, audit, or recovery design is represented as configured.

## Cost Considerations

Local state avoids introducing remote backend service cost during early milestones. Future remote-state cost must be reviewed when Production Hardening is in scope.

## Future Considerations

At Milestone 10, evaluate remote state as part of Production Hardening, including access control, durability, locking, recovery, security review, cost review, and migration from local state. This ADR does not preselect a remote backend technology.

## Related Documents

- [Terraform state strategy](../../docs/standards/terraform-state-strategy.md)
- [Terraform style guide](../../docs/standards/terraform-style-guide.md)
- [Risk register template](../../docs/operations/risk-register-template.md)

## References

- [Current environment](../../docs/reference/current-environment.md)
- [Milestone 1: AWS Organizations and Landing Zone](../../docs/milestones/MILESTONE-1.md)
