# Milestone 1: AWS Organizations and Landing Zone

## Purpose

Record the completed AWS Organizations and IAM Identity Center landing-zone baseline for Project Crystal.

## Scope

Milestone 1 established the AWS Organization, organizational units, four accounts, IAM Identity Center access, and the primary operating region. It did not deploy workload, network, data, management-platform, observability, or CI/CD infrastructure.

## Current status

**Complete.** The landing zone is deployed and is the current operational baseline.

## Architecture

The organization uses the `ALL` feature set and contains a Management account named `puru`, plus Shared Services, Development, and Production accounts. The organization has Infrastructure, NonProduction, and Production organizational units. IAM Identity Center is the identity source; the `PlatformAdmins` group receives the `AdministratorAccess` permission set in Management, Shared Services, Development, and Production. The primary region is `ap-south-1`; no secondary region is configured.

## Engineering notes

- Terraform state is local only; remote state is intentionally deferred.
- The documented OU inventory does not establish account-to-OU membership where that relationship has not been supplied.
- SSO access is the approved documented access path for the listed accounts.

## Validation

- AWS Organization feature set is `ALL`.
- Account inventory contains Management, Shared Services, Development, and Production.
- IAM Identity Center contains `PlatformAdmins`, `AdministratorAccess`, and the documented account assignments.
- Primary region is `ap-south-1`; no secondary region is documented.

## Known limitations

No VPCs, subnets, route tables, NAT gateways, security groups, EKS, RDS, Redis, ECR, Argo CD, Rancher, Teleport, Prometheus, Grafana, CI/CD, GitHub Actions, or networking resources have been deployed.

## References

- [Landing zone architecture](../../architecture/landing-zone.md)
- [Current environment](../reference/current-environment.md)
- [AWS Organization reference](../reference/aws-organization.md)
- [AWS SSO login runbook](../runbooks/aws-sso-login.md)

## Last reviewed

2026-07-27
