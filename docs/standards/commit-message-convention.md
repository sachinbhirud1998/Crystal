# Commit message convention

## Purpose

Create concise, machine- and human-readable commit history that communicates change intent.

## Scope

Applies to all commits merged into Project Crystal. It complements pull-request descriptions; it does not replace them.

## Background

Consistent messages make investigation, release notes, and change review more reliable.

## Standards and best practices

Project Crystal uses Conventional Commits:

```text
type(optional-scope): imperative summary
```

Use `feat`, `fix`, `docs`, `refactor`, `test`, `build`, `chore`, or `ci` as appropriate. Keep the summary concise, lowercase, and free of trailing punctuation. Use a body to explain motivation or compatibility impact. Mark breaking changes with `!` or a `BREAKING CHANGE:` footer.

Examples:

```text
docs(standards): define repository ownership expectations
chore: add editor configuration
```

Use the smallest accurate type, write an imperative summary, and use a body for non-obvious context or impact.

## Related repository sections

See [git-workflow.md](git-workflow.md), [git-branching-strategy.md](git-branching-strategy.md), and `.github/PULL_REQUEST_TEMPLATE.md`.

## Review ownership

Platform Engineering owns this convention.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
