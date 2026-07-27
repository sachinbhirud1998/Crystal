# Repository standards

## Purpose

Maintain a repository that is navigable, reviewable, secure, and ready for deliberate platform delivery.

## Scope

Applies to every tracked repository change and directory. These standards govern structure, not infrastructure implementation.

## Background

Repository boundaries are part of the platform contract. Clear boundaries make ownership and future automation safer.

## Standards and best practices

- Each directory must contain a `README.md` or `.gitkeep`; empty directories are not permitted.
- Keep deployable artifacts within their designated domains once authorized by a milestone.
- Do not introduce generated files, local state, editor settings, or secrets into version control.
- Use Markdown for human-facing documentation and follow `.editorconfig`.
- Keep pull requests focused, traceable to an issue or decision where appropriate, and easy to revert.
- Do not add excluded cloud services to design or implementation scope without a superseding ADR.
- Milestone 0 contains foundation content only; no infrastructure implementation is allowed.

## Example

Place future reusable infrastructure abstractions under `terraform/modules/` only when implementation is authorized; do not place them beside operational documentation.

## Related repository sections

See `README.md`, [directory-ownership.md](directory-ownership.md), `.editorconfig`, `.gitignore`, and [git-workflow.md](git-workflow.md).

## Review ownership

Platform Engineering owns repository standards. All contributors are responsible for following them.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
