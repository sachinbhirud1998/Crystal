# Git workflow

## Purpose

Define the controlled path from a proposed change to a reviewed, traceable merge in Project Crystal.

## Scope

Applies to all repository changes, including documentation. It complements the branching and commit conventions; it does not define CI/CD or release automation.

## Background

Platform repositories accumulate risk when changes lack intent, review context, or a clear rollback path. A lightweight workflow preserves both delivery speed and institutional memory.

## Standard workflow

1. Identify the active milestone and create or link a relevant issue for material work.
2. Review relevant standards, architecture documentation, and existing ADRs.
3. Create a short-lived branch from current `main` using the branching standard.
4. Make a focused change and update supporting documentation in the same branch.
5. Validate formatting, links, and scope-appropriate acceptance criteria.
6. Commit using Conventional Commits and open a pull request.
7. Obtain required owner review, resolve feedback, and record any follow-up work.
8. Merge through the approved repository process; delete the branch after merge.

## Best practices

- Keep pull requests small enough to review confidently.
- Separate unrelated changes and avoid drive-by formatting.
- Link decisions, risks, and validation evidence rather than duplicating them.
- Do not bypass protected-branch controls or commit secrets.

## Example

`docs/operational-governance` is an appropriate branch name for a focused documentation addition. Its pull request should link the related milestone or issue and identify the documents reviewed.

## Related repository sections

See [git-branching-strategy.md](git-branching-strategy.md), [commit-message-convention.md](commit-message-convention.md), `CONTRIBUTING.md`, and `.github/PULL_REQUEST_TEMPLATE.md`.

## Review ownership

Platform Engineering owns this workflow. Review at least once per milestone.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Initial version |
