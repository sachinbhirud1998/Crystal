# Documentation standards

## Purpose

Set the minimum quality bar for durable Project Crystal documentation.

## Scope

Applies to repository Markdown documents, templates, and documentation updates. It does not apply to generated third-party content.

## Background

Documentation is an operational asset: it supports reviews, decisions, handovers, and recovery after context has faded.

## Standards and best practices

Documentation is a product of engineering work, not an afterthought.

- Write for a specific audience and decision or task.
- State ownership and review date for operational or durable documents.
- Use relative links for repository documents and keep links valid.
- Prefer short sections, concrete language, and current examples.
- Record durable architectural choices as ADRs rather than rewriting history in place.
- Do not include credentials, tokens, customer data, or sensitive operational output.
- Update documentation in the same pull request as the behavior or policy it describes.

## Example

A milestone record links its validation evidence and risk register rather than copying their full contents into the milestone narrative.

## Related repository sections

See `docs/DOCUMENTATION-TEMPLATE.md`, `docs/milestones/`, `docs/runbooks/`, and `architecture/decisions/`.

## Review ownership

Platform Engineering owns this standard. Document owners review content according to its declared cadence.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
