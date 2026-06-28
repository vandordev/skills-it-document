# IT Document Multi-Agent Design

## Summary

This project packages `it-document` as a portable skill for drafting, revising, and reviewing structured product and business documents across `Codex`, `Claude`, `Copilot`, `Gemini`, `OpenCode`, and `Cursor`.

The design uses a hybrid model:

- one agent-agnostic source of truth for workflow behavior
- thin per-platform adapters
- lightweight sync and validation scripts to keep adapters aligned

## Goals

- Keep document guidance in one place
- Support multiple target agents with minimal duplication
- Make behavior consistent across platforms
- Keep installation and packaging explicit per platform
- Keep future document families cheap to add

## Non-Goals

- Building a fully generic document framework for every possible artifact
- Solving marketplace or public distribution for every platform on day one
- Guaranteeing identical runtime capabilities across agents beyond the compatibility contract

## Core Decision

The repository uses a hybrid architecture:

- `core/` stores the canonical workflow content and shared references
- `adapters/` stores platform-specific rendered or maintained outputs
- `scripts/` keeps adapters synchronized and validated
- `docs/` explains compatibility and installation

## Repository Structure

```text
skills-it-document/
  core/
    SKILL.md
    metadata.yaml
    references/
      brd.md
      prd.md
  adapters/
    codex/
      SKILL.md
      agents/
        openai.yaml
    claude/
      CLAUDE.md
    copilot/
      copilot-instructions.md
    gemini/
      GEMINI.md
    opencode/
      AGENTS.md
    cursor/
      AGENTS.md
  scripts/
    sync.sh
    validate.sh
    check-parity.sh
  tests/
    test_core_assets.sh
    test_sync.sh
    test_validate.sh
    test_parity.sh
  docs/
    compatibility-contract.md
    install-codex.md
    install-claude.md
    install-copilot.md
    install-gemini.md
    install-opencode.md
    install-cursor.md
```

## Source Of Truth

`core/` is the only place where workflow behavior is edited manually.

### `core/SKILL.md`

Contains the canonical behavior for:

- trigger conditions
- document selection
- writing rules
- output expectations
- extensibility rules

### `core/metadata.yaml`

Contains structured metadata reused by adapters, such as:

- `name`
- `display_name`
- `description`
- `default_prompt`
- trigger phrases
- supported modes
- platform notes when needed

### `core/references/`

Contains shared PRD and BRD guidance used by all adapters.

## Adapter Model

Each target agent gets its own adapter directory.

### Codex

`adapters/codex/` contains:

- `SKILL.md`
- `agents/openai.yaml`

This is the most native target and should be treated as the reference platform for packaging quality, but not as the source of truth.

### Claude

`adapters/claude/CLAUDE.md` contains the workflow in the instruction format most suitable for Claude usage.

### Copilot

`adapters/copilot/copilot-instructions.md` contains the workflow in a format suitable for repository-level Copilot instructions.

### Gemini

`adapters/gemini/GEMINI.md` contains the workflow in the instruction format suitable for Gemini usage.

### OpenCode and Cursor

`adapters/opencode/AGENTS.md` and `adapters/cursor/AGENTS.md` contain the workflow in project instruction formats for those harnesses.

## Adapter Boundaries

Adapters may contain:

- platform-specific metadata
- invocation wording
- platform-required file names and file layout
- platform-specific installation notes or references

Adapters must not redefine:

- workflow behavior
- document selection rules
- writing rules
- output expectations
- extensibility rules

## Sync Model

The sync process should stay simple.

### `scripts/sync.sh`

Responsibilities:

- read `core/SKILL.md`
- read `core/metadata.yaml`
- render or refresh files under `adapters/`
- copy shared references where required

## Validation Model

### `scripts/validate.sh`

Checks:

- required files exist
- referenced files exist
- no unresolved placeholders remain
- metadata fields required by each adapter are present

### `scripts/check-parity.sh`

Checks compatibility guarantees across all adapters.

The parity check should verify that the following semantics remain aligned:

- when the skill should be invoked
- supported document modes
- output expectations
- default install layout
- required user-confirmation cases

## Compatibility Contract

`docs/compatibility-contract.md` defines the behavioral contract shared across platforms.

It must specify:

- supported user intents
- expected inputs
- supported modes: draft, revise, review
- output handling rules
- failure handling rules
- minimum reporting format
- situations that require asking the user before proceeding

## Packaging And Installation

The project must support explicit install paths per platform rather than pretending one distribution mechanism works for every target.

### Packaging Rules

- `core/` is never installed directly by end users
- `adapters/` contains platform-specific consumable files
- `docs/` contains install guidance
