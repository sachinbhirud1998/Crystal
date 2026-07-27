# Contributing to Project Crystal

Project Crystal values deliberate, reviewable platform engineering. Contributions must preserve repository standards and remain within the approved milestone scope.

## Before you begin

1. Review the current milestone and relevant standards.
2. Open or identify an issue for material changes.
3. Read applicable architecture decisions and directory README files.
4. Keep unrelated changes out of the branch.

## Contribution workflow

1. Create a short-lived branch using the branching standard.
2. Make a focused change with clear documentation.
3. Validate links, formatting, and applicable tooling locally.
4. Use Conventional Commits for commit messages.
5. Open a pull request using the repository template.
6. Address review feedback before merge.

## Scope discipline

Milestone 0 accepts repository-foundation work only. Do not add infrastructure definitions, cloud resources, Kubernetes manifests, Helm charts, workflows, scripts, or secrets unless a later milestone explicitly authorizes them.

## Documentation expectations

Changes affecting a decision, process, ownership boundary, or developer experience must update relevant documentation in the same pull request. Use the templates in `docs/` for new runbooks, troubleshooting records, milestone notes, and lessons learned.

## Reporting security issues

Do not report vulnerabilities through public issues. Follow [SECURITY.md](SECURITY.md).
