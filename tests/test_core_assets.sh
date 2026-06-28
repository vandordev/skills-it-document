#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/core/SKILL.md"
test -f "$ROOT/core/metadata.yaml"
test -f "$ROOT/core/references/prd.md"
test -f "$ROOT/core/references/brd.md"

grep -q '^name: it-document$' "$ROOT/core/metadata.yaml"
grep -q '^display_name: IT Document$' "$ROOT/core/metadata.yaml"
grep -q '^description: Draft and maintain structured product and business documents\.$' "$ROOT/core/metadata.yaml"
grep -q '^default_prompt: Use \$it-document to draft, revise, or review structured product and business documents such as PRD and BRD\.$' "$ROOT/core/metadata.yaml"
grep -q '^supported_modes: draft,revise,review$' "$ROOT/core/metadata.yaml"

grep -q '^## When to Use$' "$ROOT/core/SKILL.md"
grep -q '^## Working Rules$' "$ROOT/core/SKILL.md"
grep -q '^## Document Selection$' "$ROOT/core/SKILL.md"
grep -q '^## Extensibility$' "$ROOT/core/SKILL.md"
grep -q 'If the requested document family does not exist yet, outline it first and ask before inventing a shape.' "$ROOT/core/SKILL.md"
grep -q 'Add a new file under `core/references/<doc-type>.md` when the repo needs a new document family.' "$ROOT/core/SKILL.md"
