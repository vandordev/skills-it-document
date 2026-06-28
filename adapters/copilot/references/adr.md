# ADR Reference

Use this reference when documenting a significant technical decision.

## Purpose

An ADR records the context, options, decision, and consequences behind a choice that is costly to reverse.

## Recommended Structure

1. Title
2. Status
3. Date
4. Context
5. Decision
6. Alternatives Considered
7. Consequences
8. Follow-Ups

## Writing Rules

- Keep one decision per ADR.
- Write for future engineers who were not present for the discussion.
- State the tradeoffs, not just the winner.
- Record rejected alternatives honestly.
- Use research if the decision depends on external facts, docs, or current platform behavior.

## Good ADR Triggers

- framework or library selection
- data model or schema choice
- authentication approach
- deployment or hosting choice
- API architecture choice
- boundary or ownership decision

## Quality Check

- The decision should be understandable without extra chat context.
- A future reader should know why this path was chosen and what would change the answer.
