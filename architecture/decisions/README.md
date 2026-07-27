# Architecture decisions

Architecture Decision Records capture consequential, reversible or irreversible choices with their context, alternatives, and implications. Create new records from [ADR-TEMPLATE.md](ADR-TEMPLATE.md), use zero-padded sequence numbers, and do not rewrite accepted history; supersede it with a new ADR.

## Current decisions

| ADR | Status | Decision |
| --- | --- | --- |
| [ADR-001](ADR-001-Multi-Account-Strategy.md) | Accepted | Use a four-account AWS Organization. |
| [ADR-002](ADR-002-IAM-Identity-Center-Strategy.md) | Accepted | Use IAM Identity Center SSO for platform administration. |
| [ADR-003](ADR-003-Landing-Zone-Design.md) | Accepted | Establish the landing zone before platform infrastructure. |
| [ADR-004](ADR-004-Terraform-Local-State-Strategy.md) | Accepted | Use local Terraform state during early milestones; defer remote state to Milestone 10. |
