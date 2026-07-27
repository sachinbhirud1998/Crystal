# Terraform

This directory reserves the boundary for future infrastructure-as-code. It deliberately contains no Terraform configuration in Milestone 0.

| Directory | Intended responsibility |
| --- | --- |
| `bootstrap/` | Initial platform prerequisites, when authorized. |
| `global/` | Cross-environment composition, when authorized. |
| `modules/` | Reusable, documented Terraform modules. |
| `shared-services/` | Shared Services composition. |
| `development/` | Development environment composition. |
| `production/` | Production environment composition. |

Future work must follow [the Terraform style guide](../docs/standards/terraform-style-guide.md) and approved ADRs.
