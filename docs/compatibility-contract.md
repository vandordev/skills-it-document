# Compatibility Contract

## Supported User Intents

- Draft a PRD
- Draft a BRD
- Revise a structured product or business document
- Review a document for completeness, consistency, or missing assumptions
- Add a new document family under `core/references/`

## Behavioral Guarantees

- The skill must treat `core/SKILL.md` as the canonical workflow behavior
- All adapters must preserve the same document-selection rules
- All adapters must keep assumptions and open questions explicit
- All adapters must default to Markdown output
- All adapters must ask before inventing a new document shape

## Minimum Output Expectations

- Document type
- Audience or decision context
- Key sections or outline
- Assumptions
- Open questions
