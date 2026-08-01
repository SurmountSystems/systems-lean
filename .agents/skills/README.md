# Project agent skills (discovery root)

This directory is the **project skill root**. Coding agents that walk
`.agents/skills/` from the repository root find skills here.

| Name | Kind | Points at |
|------|------|-----------|
| `lean4` | symlink | `../../skills/lean4-skills/plugins/lean4/skills/lean4` |

Bodies live in the **`skills/lean4-skills`** git submodule (not edited as product).

## When to load lean4 (short)

| If the task is... | Do this |
|-------------------|---------|
| Editing / proving under `src/systems/` or `src/lean4/` | Load **lean4** skill at start of the slice |
| Residual Name Done when mentions Lake, theorems, or `.lean` | Same -- use draft/prove/review as needed |
| Plan under `.agents/plans/` with Lean host work | Same |
| Pure Nix, shell glue, Idris side, or freestanding C hand-edit | Do **not** use lean4 skill as the main tool |

Full map (task shape -> workflow name -> repo workstream): root **`AGENTS.md`**
section **Project agent skills** -> **When to reach for lean4 tools**.

Checkpoint / commit steps in the skill are **status only** here -- humans sign
`git commit`. Project freestanding honesty still applies.

## Why a symlink

- Hosts discover `SKILL.md` under `.agents/skills/<name>/`.
- The submodule keeps a full upstream pin (helpers, references, docs).
- One checkout: clone submodules once; discovery is local to this repo.

## Related

| Path | Role |
|------|------|
| `skills/README.md` | Submodule inventory + clone notes |
| `AGENTS.md` | **Project agent skills** (policy + when-to-use SSoT) |
| `doc/lean-entry.md` | Lean 4 entry map + skill pointer |
| `.agents/plans/` | Ephemeral implement plans (not skills) |

Do not put novel product logic here. Novel Systems Lean code lives under `src/`.
