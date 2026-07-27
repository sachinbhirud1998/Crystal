# Architecture

## Purpose

Provide the durable, shared description of Project Crystal's target platform boundaries and the decision record that governs their evolution.

## Scope

This directory contains architecture narrative, decisions, and diagrams. It contains no deployable configuration, implementation plans, or secrets.

## Background

This directory holds the durable description of Project Crystal's target architecture. It is the source of context for design choices; it is not a location for deployable configuration.

- `decisions/` contains Architecture Decision Records (ADRs).
- `diagrams/` contains source-controlled diagrams and their supporting notes.

The frozen architecture defines Shared Services plus mirrored Development and Production areas. Any proposed change to that boundary must be evaluated through an ADR before implementation.

## Standards and best practices

- Keep diagrams and ADR references consistent with the frozen architecture.
- Use ADRs for material architecture decisions; do not alter accepted records in place.
- Link architecture context from milestones, standards, and operational records where relevant.

## Related repository sections

See `architecture/decisions/`, `architecture/diagrams/`, `docs/milestones/`, and `docs/standards/`.

## Review ownership

Platform Engineering owns architecture documentation. Material changes require architecture review.

## Revision history

| Date | Author | Change |
| --- | --- | --- |
| 2026-07-27 | Project Crystal | Documentation governance update |
