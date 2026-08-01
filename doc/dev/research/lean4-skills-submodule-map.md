# Lean 4 skills submodule map

**Kind:** analysis only. Not residual.
**Date:** 2026-07-25
**Audience:** humans/agents reseed after skill-pack wiring

## Decision (done)

Project-specific **cameronfreer/lean4-skills** is a git submodule and is
discoverable via project `.agents/skills/`.

| Layer | Path |
|-------|------|
| Submodule | `skills/lean4-skills` -> https://github.com/cameronfreer/lean4-skills.git |
| Discovery symlink | `.agents/skills/lean4` -> `../../skills/lean4-skills/plugins/lean4/skills/lean4` |
| Policy SSoT | `AGENTS.md` section **Project agent skills** |
| Entry pointer | `doc/lean-entry.md` |
| Inventory | `skills/README.md`, `.agents/skills/README.md` |
| License row | `LICENSES.md` (MIT at pin) |

## Why not under `ref/`

`ref/` is language/compiler upstream only (Idris 2, Lean 4, CompCert, Rust).
Agent skill packs are separate: read-only under `skills/`, excluded from novel
hygiene and honest `scc` like `ref/`.

## Not the same as

`ref/lean4/.claude/skills/` -- upstream Lean **compiler** CI/build agent notes
inside the lean4 pin. Prefer project `lean4` skill for prove/formalize work.

## Hygiene

`nix/novel-source.nix`, `nix/source-hygiene.nix`, `nix/professional-tone.nix`,
and `just progress-scc` exclude `skills/`.

## Policy overrides

Project `AGENTS.md` wins over skill defaults (no agent `git commit`, no novel
project Python, freestanding honesty).

## When agents should use the tools

SSoT table lives in `AGENTS.md` **When to reach for lean4 tools** (task shape,
workstream, residual slice loop). Short copies: `skills/README.md`,
`.agents/skills/README.md`, `doc/lean-entry.md`, fork prompts, residual headers.
