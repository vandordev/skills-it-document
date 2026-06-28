# IT Document Phase 1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the first packaging version of `it-document` with one canonical core, six thin adapters, and simple sync and validation automation.

**Architecture:** Keep the canonical workflow under `core/`, generate or refresh platform outputs under `adapters/`, and enforce consistency with shell-based sync, validation, and parity checks. Keep phase 1 dependency-free by using flat metadata, copied shared references, and test scripts written in shell.

**Tech Stack:** Markdown, YAML, Bash, core Unix tools (`awk`, `grep`, `sed`, `sha256sum`, `cmp`, `diff`)

---

## File Structure

- `core/SKILL.md`: canonical workflow behavior for the skill
- `core/metadata.yaml`: flat metadata used by sync and validation
- `core/references/`: shared PRD and BRD guidance copied into each adapter
- `adapters/codex/SKILL.md`: generated Codex skill file
- `adapters/codex/agents/openai.yaml`: generated Codex UI metadata
- `adapters/claude/CLAUDE.md`: generated Claude adapter
- `adapters/copilot/copilot-instructions.md`: generated Copilot adapter
- `adapters/gemini/GEMINI.md`: generated Gemini adapter
- `adapters/opencode/AGENTS.md`: generated OpenCode adapter
- `adapters/cursor/AGENTS.md`: generated Cursor adapter
- `scripts/sync.sh`: renders adapters from the core
- `scripts/validate.sh`: validates required files, metadata, and unresolved placeholders
- `scripts/check-parity.sh`: checks adapter parity against core hashes and shared references
- `tests/test_core_assets.sh`: checks the canonical assets exist and contain expected markers
- `tests/test_sync.sh`: verifies sync creates all adapter outputs and copied references
- `tests/test_validate.sh`: verifies validation passes on good state and fails on a poisoned state
- `tests/test_parity.sh`: verifies parity passes on clean state and fails after divergence
- `docs/compatibility-contract.md`: cross-platform behavior contract
- `docs/install-codex.md`: Codex install instructions
- `docs/install-claude.md`: Claude install instructions
- `docs/install-copilot.md`: Copilot install instructions
- `docs/install-gemini.md`: Gemini install instructions
- `docs/install-opencode.md`: OpenCode install instructions
- `docs/install-cursor.md`: Cursor install instructions

### Task 1: Establish Canonical Core Content

**Files:**
- Create: `core/SKILL.md`
- Create: `core/metadata.yaml`
- Create: `core/references/prd.md`
- Create: `core/references/brd.md`
- Create: `tests/test_core_assets.sh`

- [x] **Step 1: Write the failing core-assets test**

```bash
#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/core/SKILL.md"
test -f "$ROOT/core/metadata.yaml"
test -f "$ROOT/core/references/prd.md"
test -f "$ROOT/core/references/brd.md"

grep -q '^name: it-document$' "$ROOT/core/metadata.yaml"
grep -q '^display_name: IT Document$' "$ROOT/core/metadata.yaml"
grep -q '^description: Draft and maintain structured product and business documents\\.$' "$ROOT/core/metadata.yaml"
grep -q '^default_prompt: Use \\$it-document to draft, revise, or review structured product and business documents such as PRD and BRD\\.$' "$ROOT/core/metadata.yaml"
grep -q '^supported_modes: draft,revise,review$' "$ROOT/core/metadata.yaml"

grep -q '^## When to Use$' "$ROOT/core/SKILL.md"
grep -q '^## Working Rules$' "$ROOT/core/SKILL.md"
grep -q '^## Document Selection$' "$ROOT/core/SKILL.md"
grep -q '^## Extensibility$' "$ROOT/core/SKILL.md"
```

- [x] **Step 2: Run the test to verify it fails**

Run: `bash tests/test_core_assets.sh`
Expected: failure on the first missing file check because `core/` has not been created yet.

- [x] **Step 3: Write the minimal canonical implementation**

Create the directories:

```bash
mkdir -p core/references tests
```

Create `core/metadata.yaml` with flat, dependency-free fields:

```yaml
name: it-document
display_name: IT Document
description: Draft and maintain structured product and business documents.
default_prompt: Use $it-document to draft, revise, or review structured product and business documents such as PRD and BRD.
supported_modes: draft,revise,review
trigger_phrases: prd,brd,product-doc,business-doc,requirement-doc,document-spec
targets: codex,claude,copilot,gemini,opencode,cursor
```

Seed `core/SKILL.md` with the canonical document workflow.

Create `core/references/prd.md` and `core/references/brd.md` with the corresponding document guidance.

- [x] **Step 4: Run the test to verify it passes**

Run: `bash tests/test_core_assets.sh`
Expected: no output and exit code `0`.

### Task 2: Implement Adapter Sync

**Files:**
- Create: `scripts/sync.sh`
- Create: `tests/test_sync.sh`
- Create: `adapters/codex/SKILL.md`
- Create: `adapters/codex/agents/openai.yaml`
- Create: `adapters/codex/references/prd.md`
- Create: `adapters/codex/references/brd.md`
- Create: `adapters/claude/CLAUDE.md`
- Create: `adapters/claude/references/prd.md`
- Create: `adapters/claude/references/brd.md`
- Create: `adapters/copilot/copilot-instructions.md`
- Create: `adapters/copilot/references/prd.md`
- Create: `adapters/copilot/references/brd.md`
- Create: `adapters/gemini/GEMINI.md`
- Create: `adapters/gemini/references/prd.md`
- Create: `adapters/gemini/references/brd.md`
- Create: `adapters/opencode/AGENTS.md`
- Create: `adapters/opencode/references/prd.md`
- Create: `adapters/opencode/references/brd.md`
- Create: `adapters/cursor/AGENTS.md`
- Create: `adapters/cursor/references/prd.md`
- Create: `adapters/cursor/references/brd.md`

- [x] **Step 1: Write the failing sync test**

Verify sync creates all adapter outputs, sets the new naming, and copies the PRD/BRD references.

- [x] **Step 2: Run the test to verify it fails**

Run: `bash tests/test_sync.sh`
Expected: failure because the sync script does not exist yet.

- [x] **Step 3: Write the minimal sync implementation**

Render adapters from `core/` and copy `prd.md` / `brd.md` into each adapter's `references/` directory.

- [x] **Step 4: Run the test to verify it passes**

Run: `bash tests/test_sync.sh`
Expected: adapter outputs and shared references are created successfully.

### Task 3: Validation and Parity

**Files:**
- Create: `scripts/validate.sh`
- Create: `scripts/check-parity.sh`
- Create: `tests/test_validate.sh`
- Create: `tests/test_parity.sh`

- [x] **Step 1: Write the validation and parity tests**

Validation should fail on unresolved markers. Parity should fail if an adapter drifts from core.

- [x] **Step 2: Run the tests and confirm they fail initially**

Run the tests before implementation to establish the red state.

- [x] **Step 3: Implement the checks**

Validate required files, metadata keys, and unresolved placeholders. Compare adapter outputs against the canonical core and shared references.

- [x] **Step 4: Run the tests to confirm green**

All checks should pass cleanly.

### Task 4: Documentation and Install Guides

**Files:**
- Create or update: `README.md`
- Create or update: `docs/compatibility-contract.md`
- Create or update: `docs/install-codex.md`
- Create or update: `docs/install-claude.md`
- Create or update: `docs/install-copilot.md`
- Create or update: `docs/install-gemini.md`
- Create or update: `docs/install-opencode.md`
- Create or update: `docs/install-cursor.md`

Keep all public docs aligned with `it-document` naming and the new PRD/BRD references.
