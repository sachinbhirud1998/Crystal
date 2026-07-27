# Project Crystal

Project Crystal is a production-inspired platform engineering capstone for designing a governed AWS platform with Terraform, Kubernetes, and GitOps. It is intentionally structured as an enterprise repository: decisions, standards, ownership, and operational knowledge are established before infrastructure is introduced.

## Project overview

The target platform will support shared services plus isolated development and production environments while remaining consciously sized for a learning budget. Milestone 0 established the repository contract; Milestone 1 established the AWS Organizations and IAM Identity Center landing zone. Infrastructure beyond that landing zone has not been deployed.

## Objectives

- Establish a maintainable foundation for platform delivery.
- Make engineering decisions, standards, and ownership discoverable.
- Create consistent homes for Terraform, Kubernetes, Helm, applications, monitoring, and operations work.
- Support deliberate, reviewable progression through future milestones.

## Architecture summary

The frozen target architecture contains a Shared Services area and mirrored Development and Production environments. Planned shared capabilities include identity, image storage, secret and parameter management, encryption, object storage, platform access, and notification services. Environment areas will contain networking, ingress, Kubernetes, data, cache, and observability capabilities.

CloudWatch, AWS Config, Security Hub, Route 53, ACM, and AWS WAF are intentionally excluded from this project scope.

## Technology stack

- AWS for the target cloud platform
- Terraform for infrastructure-as-code
- Amazon EKS and Kubernetes for workload orchestration
- Helm for application packaging
- Argo CD for GitOps delivery
- Prometheus and Grafana for observability

## Repository structure

| Path | Purpose |
| --- | --- |
| `architecture/` | Architecture narrative, decisions, and diagrams. |
| `docs/` | Standards, milestone records, runbooks, and support knowledge. |
| `terraform/` | Future Terraform composition and reusable modules; currently documentation only. |
| `kubernetes/`, `helm/`, `applications/`, `monitoring/` | Future delivery domains with explicit repository boundaries. |
| `scripts/` | Future approved developer and operational automation. |
| `.github/` | Contribution governance, issue intake, and pull-request guidance. |

## Roadmap and milestones

| Milestone | Status | Scope |
| --- | --- | --- |
| 0 | Complete | Repository foundation, standards, and templates. |
| 1 | Complete | AWS Organizations, landing zone, IAM Identity Center, accounts, permission sets, and SSO access. |
| 2 | Planned | Foundational platform implementation. |
| 3 | Planned | Environment and workload enablement. |
| 4 | Planned | Operational readiness and capstone validation. |

Detailed milestone records belong in `docs/milestones/`.

## Learning goals

Project Crystal emphasizes platform design as an engineering discipline: modularity, clear boundaries, versioned decisions, secure collaboration, operational documentation, and cost-aware delivery.

## Engineering principles

- Optimize for maintainability, readability, documentation, modularity, and consistency.
- Prefer small, reviewable changes with clear ownership.
- Document decisions before implementation when they affect architecture or operating practice.
- Treat environment separation and production safety as first-class concerns.
- Keep generated or deployable infrastructure out of Milestone 0.

## Project status

Milestones 0 and 1 form the active baseline. The current implementation contains AWS Organizations, the Infrastructure, NonProduction, and Production organizational units, Management, Shared Services, Development, and Production accounts, IAM Identity Center SSO access, primary region `ap-south-1`, and Terraform local state. No networking, Kubernetes, data, management-platform, observability, CI/CD, or automation infrastructure has been deployed.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md), the standards in `docs/standards/`, and the pull request template before proposing a change. Use the issue templates to establish intent before substantial work.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
