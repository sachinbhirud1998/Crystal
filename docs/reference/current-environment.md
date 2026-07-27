# Current environment

## Purpose

Provide a single current-state reference for the deployed Project Crystal landing zone.

## Scope

Captures completed Organization, account, IAM Identity Center, region, and Terraform state information. It excludes future infrastructure.

## Current status

Milestone 0 and Milestone 1 are complete. Nothing beyond the AWS Organizations and Landing Zone milestone is deployed.

## Architecture

| Domain | Current state |
| --- | --- |
| AWS Organization | Feature set `ALL` |
| Accounts | Management (`puru`), Shared Services, Development, Production |
| Organizational units | Infrastructure, NonProduction, Production |
| IAM Identity Center | Identity source: Identity Center |
| SSO access | `PlatformAdmins` with `AdministratorAccess` in all four accounts |
| Primary region | `ap-south-1` |
| Secondary region | None |
| Terraform state | Local only; remote backend deferred |

## Engineering notes

Use this record as the current-state baseline. Where a detail is not listed, do not infer it as configured or deployed.

## Validation

Validate entries through AWS Organizations and IAM Identity Center administration, and confirm the local-state posture from repository contents and the current delivery record.

## Known limitations

No VPC, subnets, route tables, NAT gateway, security groups, EKS, RDS, Redis, ECR, Argo CD, Rancher, Teleport, Prometheus, Grafana, CI/CD, GitHub Actions, or networking exists.

## References

- [Current architecture state](../../architecture/current-state.md)
- [AWS Organization](aws-organization.md)
- [Terraform state strategy](../standards/terraform-state-strategy.md)

## Last reviewed

2026-07-27
