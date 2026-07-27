# Terraform style guide

## Purpose

Define maintainable authoring expectations for Terraform once implementation is authorized.

## Scope

Applies to future Terraform configuration only. Milestone 0 intentionally contains no Terraform files, providers, backends, variables, or outputs.

## Background

Terraform composition will become a durable platform interface; style consistency reduces review and operational risk.

## Standards and best practices

This guide governs future Terraform work; Milestone 0 contains no Terraform configuration.

- Format all Terraform with the standard formatter before review.
- Organize code by a clear domain boundary, not by provider object type alone.
- Keep root compositions small; place reusable, cohesive behavior in documented modules.
- Use explicit inputs and outputs with descriptions; do not rely on implicit cross-directory coupling.
- Pin and document tool and provider compatibility only when implementation is authorized.
- Never place credentials, secrets, or environment-specific sensitive values in tracked files.
- Accompany material infrastructure changes with documentation, validation evidence, and an ADR when warranted.

## Example

A future reusable module should document its focused responsibility, inputs, outputs, ownership, and validation evidence instead of relying on undocumented cross-directory assumptions.

## Related repository sections

See `terraform/README.md`, `architecture/decisions/`, [documentation-standards.md](documentation-standards.md), and `docs/operations/validation-checklist.md`.

## Review ownership

Platform Engineering owns this guide with architecture and security review for material changes.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
