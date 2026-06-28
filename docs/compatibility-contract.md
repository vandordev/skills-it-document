# Compatibility Contract

## Supported User Intents

- Draft a PRD
- Draft a BRD
- Research supporting evidence for a PRD or BRD
- Draft ADR, architecture, API docs, runbook, postmortem, README/changelog, or onboarding/SOP documents
- Revise a structured product or business document
- Review a document for completeness, consistency, or missing assumptions
- Add a new document family under `core/references/`

## Behavioral Guarantees

- The skill must treat `core/SKILL.md` as the canonical workflow behavior
- All adapters must preserve the same document-selection rules
- All adapters must support source-backed research before drafting
- All adapters must keep assumptions and open questions explicit
- All adapters must default to Markdown output
- All adapters must ask before inventing a new document shape

## Minimum Output Expectations

- Document type
- Audience or decision context
- Key sections or outline
- Research findings and source URLs when applicable
- Assumptions
- Open questions
