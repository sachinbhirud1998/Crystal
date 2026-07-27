# Git branching strategy

## Purpose

Define a branch lifecycle that supports focused review, traceability, and a stable integration branch.

## Scope

Applies to all contributors and repository changes. It does not establish environment branches or deployment behavior.

## Background

Short-lived branches reduce drift and make it easier to identify the intent and ownership of a change.

## Standards and best practices

`main` is the protected integration branch and must remain releasable. Contributors create short-lived branches from current `main` using `type/short-description`, for example `docs/repository-foundation` or `feat/platform-boundary`.

Merge through reviewed pull requests only. Rebase or merge with current `main` before final approval as required by repository policy. Delete branches after merge. Do not use long-lived environment branches; environment intent belongs in reviewed configuration and documented release practice.

## Example

Use `docs/operational-governance` for a documentation change. Do not use personal, date-based, or generic names such as `updates`.

## Related repository sections

See [git-workflow.md](git-workflow.md), [commit-message-convention.md](commit-message-convention.md), and `CONTRIBUTING.md`.

## Review ownership

Platform Engineering owns this strategy and reviews it at milestone boundaries.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
