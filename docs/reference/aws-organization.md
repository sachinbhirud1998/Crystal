# AWS Organization reference

## Purpose

Record the current AWS Organizations configuration known to exist for Project Crystal.

## Scope

Covers the feature set and organizational-unit inventory. It excludes policies, delegated administration, and account membership mapping.

## Current status

**Complete through Milestone 1.** AWS Organizations is configured with feature set `ALL`.

## Architecture

| Attribute | Current value |
| --- | --- |
| Feature set | `ALL` |
| Organizational units | Infrastructure, NonProduction, Production |
| Accounts | Management (`puru`), Shared Services, Development, Production |

## Engineering notes

The presence of organizational units does not establish account placement or any organization policy. Maintain that distinction in future documentation.

## Validation

Validate the feature set and OU names in AWS Organizations. Compare account names against the account-inventory reference.

## Known limitations

No service control policies, OU membership mapping, delegated administrators, or governance controls are documented.

## References

- [Organization structure](../../architecture/organization-structure.md)
- [AWS account inventory](aws-account-inventory.md)
- [Current environment](current-environment.md)

## Last reviewed

2026-07-27
