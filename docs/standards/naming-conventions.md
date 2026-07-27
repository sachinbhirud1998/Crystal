# Naming conventions

## Purpose

Establish predictable names that make repository content and future platform entities discoverable and safe to manage.

## Scope

Applies to tracked files, directories, documentation records, and future authorized managed entities.

## Background

Consistent names reduce ambiguity in reviews, automation, operations, and cost analysis.

## Standards and best practices

Use names that are readable, stable, and meaningful without hidden context.

- Use lowercase kebab-case for directories, Markdown files, and human-facing identifiers.
- Use clear singular or plural nouns consistently with the surrounding directory.
- Prefix ADRs with a zero-padded sequence number: `ADR-0001-short-title.md`.
- Use environment identifiers `shared-services`, `development`, and `production` exactly as defined by the repository.
- Future cloud and infrastructure names must include project, environment, component, and uniqueness only where required by the target system.
- Avoid ambiguous abbreviations, dates in durable names, and personal names.

## Examples

Use `risk-register-template.md`, `ADR-0001-service-boundary.md`, and `development` rather than inconsistent variants such as `dev` or `Development`.

## Related repository sections

See [tagging-strategy.md](tagging-strategy.md), `architecture/decisions/`, and [repository-standards.md](repository-standards.md).

## Review ownership

Platform Engineering reviews this standard when a new naming domain is introduced.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
