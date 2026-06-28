# IT Document

<p align="center">
  <img src="./assets/hero/hero.png" alt="IT Document hero image" width="960" />
</p>

`it-document` is a reusable skill for drafting, revising, and reviewing structured product and business documents such as PRD and BRD.

## Why This Exists

Product notes, business context, and stakeholder decisions are often scattered across chats, docs, and memory. This skill keeps the output structured, explicit about assumptions, and consistent across document types.

## What This Skill Does

- Drafts PRD and BRD documents from source notes
- Revises documents when scope, market, or business assumptions change
- Researches supporting evidence before drafting when the request needs fresh sources
- Covers ADR, architecture, API docs, runbooks, postmortems, README/changelog, and onboarding/SOP documents
- Keeps facts, assumptions, and open questions separated
- Makes it easy to add new document families later through `core/references/`
- Uses `docs/vandor/` as the document root and supports both single-project and multi-project repo layouts

## Who This Is For

- Product managers
- Founders
- Engineers writing specs or decision docs
- Ops or business teams that need structured internal documents

## Installation

Installation differs by harness. If you use more than one, install `it-document` separately for each one.

### Codex

- Copy `adapters/codex/` into your Codex skills directory as `it-document/`.
- Keep `SKILL.md`, `agents/openai.yaml`, and `references/` together.
- Restart or reload Codex so the skill is rediscovered.

Tell Codex:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-codex.md
```

### Claude

- Copy `adapters/claude/CLAUDE.md` and `adapters/claude/references/` into the instruction location you use for Claude.
- Preserve the relative layout so `CLAUDE.md` and `references/` stay together.
- Restart or reload the Claude session before use.

Tell Claude:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-claude.md
```

### Copilot

- Copy `adapters/copilot/copilot-instructions.md` and `adapters/copilot/references/` into the custom-instructions location you use for Copilot.
- Preserve the relative layout so the references remain available beside the instruction file.
- Reload the editor window before use.

Tell Copilot:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-copilot.md
```

### Gemini

- Copy `adapters/gemini/GEMINI.md` and `adapters/gemini/references/` into the instruction location you use for Gemini.
- Preserve the file name `GEMINI.md`.
- Refresh or restart Gemini before use.

Tell Gemini:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-gemini.md
```

### OpenCode

- Copy `adapters/opencode/AGENTS.md` and `adapters/opencode/references/` into the project root used by OpenCode.
- Preserve the file name `AGENTS.md`.
- Restart or reload OpenCode before use.

Tell OpenCode:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-opencode.md
```

### Cursor

- Copy `adapters/cursor/AGENTS.md` and `adapters/cursor/references/` into the project root used by Cursor.
- Preserve the file name `AGENTS.md`.
- Reload the workspace or restart Cursor before use.

Tell Cursor:

```text
Fetch and follow installation instructions from https://raw.githubusercontent.com/vandordev/skills-it-document/refs/heads/main/docs/install-cursor.md
```

## Quick Usage

After installation, ask your agent to use `it-document` when you want to:

- draft a PRD or BRD
- research the market, competitors, or supporting evidence first
- create an ADR, architecture blueprint, API docs, runbook, postmortem, README/changelog, or onboarding/SOP
- revise a document after scope changes
- review a document for gaps, contradictions, or missing assumptions
- create a new document family with the same structured style

## Sponsors

<div align="center">
  <table>
    <tr>
      <td align="center" valign="top" width="240">
        <a href="https://ozonedigitech.com">
          <img src="./assets/sponsors/ozone.png" alt="Ozone logo" width="120" />
        </a>
        <br />
        <strong>Ozone</strong>
        <br />
        <span>A software, app, integration, and automation studio.</span>
      </td>
    </tr>
  </table>
</div>

## Contribution

### Platform Outputs

- `adapters/codex/`: `SKILL.md`, `agents/openai.yaml`, and shared references
- `adapters/claude/`: `CLAUDE.md` and shared references
- `adapters/copilot/`: `copilot-instructions.md` and shared references
- `adapters/gemini/`: `GEMINI.md` and shared references
- `adapters/opencode/`: `AGENTS.md` and shared references
- `adapters/cursor/`: `AGENTS.md` and shared references

### Detailed Install Docs

- `docs/install-codex.md`
- `docs/install-claude.md`
- `docs/install-copilot.md`
- `docs/install-gemini.md`
- `docs/install-opencode.md`
- `docs/install-cursor.md`

### Repository Layout

- `core/`: the canonical workflow, metadata, and shared references
- `adapters/`: rendered platform-specific outputs
- `scripts/`: repo entrypoints for sync, validation, parity, and test runs
- `tests/`: shell checks for repository behavior
- `docs/`: install guides, compatibility contract, design, and implementation plan

### Working Model

Edit the skill in `core/`. Do not edit generated adapter files by hand unless you are debugging the generator.

The normal authoring flow is:

1. Update `core/SKILL.md`, `core/metadata.yaml`, or `core/references/`.
2. Run `bash scripts/sync.sh`.
3. Run `bash scripts/validate.sh`.
4. Run `bash scripts/check-parity.sh`.
5. Run `bash tests/test_repo.sh`.

### Entry Points

- `bash scripts/sync.sh`: regenerate all platform adapters from `core/`
- `bash scripts/validate.sh`: verify required files, metadata, and unresolved markers
- `bash scripts/check-parity.sh`: confirm generated adapters still match the canonical core
- `bash scripts/test.sh`: run the repository test suite
- `bash tests/test_repo.sh`: run the end-to-end repository verification path
