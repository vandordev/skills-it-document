---
name: it-document
description: Use when drafting, revising, or reviewing structured product and business documents such as PRD and BRD.
---

# IT Document

Use this skill to turn product notes, business context, research, and stakeholder input into clean, decision-ready documents.

## When to Use

- Draft a PRD, BRD, or a related product/business document
- Revise a document after scope, market, or business changes
- Review whether a document is complete, consistent, and grounded in source notes
- Create a new document family that should follow the same repository style

Do not use this for code, API flow testing, or free-form note taking unless the goal is a structured document artifact.

## Working Rules

1. Identify the document type, audience, and decision horizon.
2. Inspect the repo shape before choosing the storage layout.
3. Read the matching reference in `core/references/` before drafting.
4. Pull source facts first. Keep assumptions, risks, and open questions explicit.
5. Write in the user’s preferred language. Default to Indonesian if nothing else is stated.
6. Keep the document concise, concrete, and easy to scan.
7. If the requested document family does not exist yet, outline it first and ask before inventing a shape.

## Document Selection

- PRD: product intent, users, problem, scope, requirements, acceptance criteria, launch success.
- BRD: business case, market, positioning, monetization, metrics, risks, and constraints.

## Storage Convention

Use `docs/vandor/` as the document root.

### Single coding project

- Store the living PRD at `docs/vandor/PRD.md`
- Store the living BRD at `docs/vandor/BRD.md`
- Store versioned PRD snapshots at `docs/vandor/prd/<date-time>.md`
- Store versioned BRD snapshots at `docs/vandor/brd/<date-time>.md`

### Multi-project non-coding repository

- Treat each project as its own folder under `docs/vandor/`
- Use `docs/vandor/<project-slug>/PRD.md` and `docs/vandor/<project-slug>/BRD.md` for the living docs
- Store PRD snapshots at `docs/vandor/<project-slug>/prd/<date-time>.md`
- Store BRD snapshots at `docs/vandor/<project-slug>/brd/<date-time>.md`

### Versioning Rules

- Use a filesystem-safe timestamp format such as `YYYY-MM-DDTHH-mm-ssZ`
- Create a new timestamped snapshot whenever the document is materially updated
- Keep the living doc and the latest snapshot aligned
- If the repo shape is ambiguous, ask whether it is a single coding project or a multi-project portfolio before choosing a path

## Output Expectations

- Prefer Markdown.
- Separate facts, assumptions, and open questions.
- Use tables for scope, personas, metrics, or risk when that improves scanability.
- Use numbered user journeys and testable acceptance criteria for PRDs when useful.
- Avoid duplicate sections and long narrative paragraphs that do not change decisions.

## Extensibility

- Add a new file under `core/references/<doc-type>.md` when the repo needs a new document family.
- Keep shared behavior in `SKILL.md` and doc-specific structure in the matching reference file.
