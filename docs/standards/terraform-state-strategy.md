# Terraform state strategy

## Purpose

Document the current Terraform state posture and the boundary for future state-management decisions.

## Scope

Applies to Project Crystal Terraform state. It does not introduce a backend, providers, Terraform resources, or remote-state design.

## Current status

Terraform state is **local only**. A remote backend is intentionally deferred. No deployed infrastructure beyond the landing zone is documented.

## Architecture

Current state is maintained locally by the operator environment. No remote backend, shared state store, locking mechanism, or cross-environment state relationship is documented.

## Engineering notes

- Local state must not be committed to version control.
- Operators must protect local state as potentially sensitive operational data.
- A future remote-state decision requires explicit design, security, cost, recovery, and access review before implementation.

## Validation

Verify that tracked repository content does not contain Terraform state files and that no remote backend is represented as configured.

## Known limitations

Local state does not provide documented shared access, remote durability, locking, or recovery capabilities. These limitations are accepted while remote backend work remains deferred.

## References

- [Terraform style guide](terraform-style-guide.md)
- [Landing zone architecture](../../architecture/landing-zone.md)
- [Risk register template](../operations/risk-register-template.md)

## Last reviewed

2026-07-27
