#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/core/SKILL.md"
test -f "$ROOT/core/metadata.yaml"
test -f "$ROOT/core/references/prd.md"
test -f "$ROOT/core/references/brd.md"
test -f "$ROOT/core/references/research.md"

grep -q '^name: it-document$' "$ROOT/core/metadata.yaml"
grep -q '^display_name: IT Document$' "$ROOT/core/metadata.yaml"
grep -q '^description: Draft, research, and maintain structured product and business documents\.$' "$ROOT/core/metadata.yaml"
grep -q '^default_prompt: Use \$it-document to draft, revise, research, or review structured product and business documents such as PRD and BRD\.$' "$ROOT/core/metadata.yaml"
grep -q '^supported_modes: draft,revise,research,review$' "$ROOT/core/metadata.yaml"

grep -q '^## When to Use$' "$ROOT/core/SKILL.md"
grep -q '^## Working Rules$' "$ROOT/core/SKILL.md"
grep -q '^## Document Selection$' "$ROOT/core/SKILL.md"
grep -q '^## Research Guidance$' "$ROOT/core/SKILL.md"
grep -q '^## Extensibility$' "$ROOT/core/SKILL.md"
grep -q 'If the requested document family does not exist yet, outline it first and ask before inventing a shape.' "$ROOT/core/SKILL.md"
grep -q 'Add a new file under `core/references/<doc-type>.md` when the repo needs a new document family.' "$ROOT/core/SKILL.md"
grep -q 'Do not rely on Firecrawl API calls for this skill.' "$ROOT/core/references/research.md"
