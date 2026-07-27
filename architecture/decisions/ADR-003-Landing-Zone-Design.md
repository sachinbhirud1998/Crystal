# ADR-003: Landing zone before platform infrastructure

- **Status:** Accepted
- **Date:** 2026-07-27

## Context

Project Crystal has completed Milestone 1: AWS Organizations and Landing Zone. The completed baseline includes the AWS Organization, organizational units, four accounts, IAM Identity Center SSO access, and primary region `ap-south-1`. No networking, Kubernetes, databases, applications, management platform, ECR, GitOps, observability, CI/CD, or production-hardening infrastructure exists.

## Problem Statement

The project needs an approved control and access baseline before adding infrastructure that would depend on account boundaries, administrator access, and regional operating context.

## Decision

Establish the landing zone before introducing networking, Kubernetes, databases, applications, or other platform infrastructure. Treat the completed Organization and IAM Identity Center baseline as the prerequisite for later implementation work.

## Rationale

Landing-zone decisions define where future work may occur and who may administer it. Establishing them first prevents later infrastructure from being created without documented account isolation, centralized access, or an explicit primary region.

## Alternatives Considered

| Alternative | Decision |
| --- | --- |
| Deploy application or network infrastructure first | Rejected because it would precede the documented account and access foundation. |
| Create a single initial workload account and reorganize later | Rejected because it creates avoidable migration and governance uncertainty. |
| Establish landing zone first | Accepted because it creates the current organizational and identity baseline before dependent work. |

## Advantages

- Establishes account and access boundaries before infrastructure growth.
- Separates completed current state from future implementation scope.
- Provides a stable reference for future architecture, security, and cost decisions.

## Disadvantages

- Delays infrastructure delivery until foundational work is complete.
- Produces an intentionally limited platform with no workload capabilities at this stage.
- Requires subsequent milestones to define the actual network and service architecture.

## Trade-offs

The project accepts a slower start to resource deployment in exchange for deliberate organization, access, and regional foundations. This ADR does not select or deploy future platform services.

## Operational Impact

Current operations are limited to Organization and IAM Identity Center administration. Operators must use the documented SSO model and primary regional context; there are no workload operations yet.

## Security Considerations

The landing zone creates a documented identity and account baseline, but it does not implement future security services, networking controls, application security, or production hardening.

## Cost Considerations

Deferring service deployment avoids introducing undocumented infrastructure spend before platform boundaries and cost-review practices are established.

## Future Considerations

Networking, security services, management platform, ECR, Kubernetes, GitOps, data layer, observability, and production hardening remain not started. Each must be reviewed and documented in its authorized milestone.

## Related Documents

- [Landing zone architecture](../landing-zone.md)
- [Current architecture state](../current-state.md)
- [Deployment status](../../docs/reference/deployment-status.md)

## References

- [Milestone 1: AWS Organizations and Landing Zone](../../docs/milestones/MILESTONE-1.md)
- [Future roadmap](../future-roadmap.md)
