# AWS region strategy

## Purpose

Record the current regional operating posture for Project Crystal.

## Scope

Applies to the completed landing zone and future documentation until superseded by an approved architecture decision. It does not configure regional services.

## Current status

The primary region is `ap-south-1`. No secondary region is configured or documented.

## Architecture

All current region-aware operational context is anchored to `ap-south-1`. The AWS Organization and IAM Identity Center documentation does not establish a secondary or disaster-recovery region.

## Engineering notes

- Use `ap-south-1` as the documented default region when an operator must select a region.
- Do not imply multi-region deployment, replication, failover, or recovery capabilities.
- Future regional expansion requires architecture, cost, security, and operational review.

## Validation

Confirm `ap-south-1` is the primary regional context and that no secondary region is recorded in the current inventory.

## Known limitations

No multi-region strategy, regional failover, data replication, or resilience design exists.

## References

- [Current environment](../reference/current-environment.md)
- [AWS CLI profiles](../runbooks/aws-cli-profiles.md)
- [Future roadmap](../../architecture/future-roadmap.md)

## Last reviewed

2026-07-27
