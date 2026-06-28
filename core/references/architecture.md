# Architecture Reference

Use this reference when producing a system blueprint or architecture document.

## Purpose

An architecture document explains how the system is shaped, how parts interact, and what constraints matter for implementation.

## Recommended Structure

1. Overview
2. Goals and Non-Goals
3. System Context
4. Components and Boundaries
5. Data Flow
6. Key Decisions
7. Interfaces and Integrations
8. Operational Concerns
9. Risks and Open Questions

## Writing Rules

- Keep the level at blueprint, not implementation detail.
- Show the major components and how they communicate.
- Use diagrams or tables when that improves clarity.
- Call out scale, security, reliability, and deployment constraints if they matter.

## Good Inputs

- existing codebase structure
- current product requirements
- ADRs
- technical constraints
- external dependencies

## Quality Check

- Someone should be able to use the document to start implementation work.
- Architectural boundaries should be explicit enough to prevent accidental coupling.
