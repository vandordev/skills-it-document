# Research Reference

Use this reference when the PRD or BRD needs fresh evidence before drafting.

## Purpose

Research should collect source-backed facts and narrow the decision space before the document is written.

## Recommended Structure

1. Research Question
2. Scope
3. Source Plan
4. Key Findings
5. Evidence Table
6. Contradictions and Gaps
7. Implications for the Document
8. Open Questions

## Research Rules

- Use the agent's built-in web research or browse tool.
- Do not rely on Firecrawl API calls for this skill.
- Prefer primary sources and official pages first.
- Use secondary sources only when they add context or triangulation.
- Keep source URLs visible in the output.
- Mark stale, uncertain, or inferred claims clearly.

## Source Priority

1. Official product pages, docs, help centers, changelogs, pricing pages
2. Standards, policy pages, regulations, filings, and filings-like primary sources
3. Direct company statements, blog posts, release notes, and docs
4. High-quality secondary analysis
5. Low-trust summaries only when nothing better exists

## Evidence Table

Capture each meaningful source with:

- title
- URL
- source type
- date if available
- why it matters
- confidence

## Output Notes

- If evidence is incomplete, say so directly.
- If the user asked for a PRD or BRD, carry the research findings into that document instead of dumping raw notes.
