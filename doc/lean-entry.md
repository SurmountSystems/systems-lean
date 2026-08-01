# Lean 4 entry map

Read-only language upstream: `ref/lean4/`.
Do not edit upstream as product source.

**Systems Lean** (this project) and **Slake** (its compiler) are developed here. Use `ref/lean4` as the Lean 4 reference; implement product code in this repository when the time comes. Do **not** default to other trees (see [goals.md](goals.md) isolation policy).

---

## Project Lean agent skill (discover first)

Coding agents working on Lean sources in this repo should load the **project** `lean4` skill (prove / formalize / review / golf workflows):

| What | Path |
|------|------|
| **Discovery (hosts walk this)** | `.agents/skills/lean4` -> `skills/lean4-skills/plugins/lean4/skills/lean4` |
| **SKILL.md** | `.agents/skills/lean4/SKILL.md` |
| **Submodule pin** | `skills/lean4-skills` ([cameronfreer/lean4-skills](https://github.com/cameronfreer/lean4-skills)) |
| **Policy / when to use** | Root `AGENTS.md` section **Project agent skills** (task map, residual loop, commits, freestanding honesty) |
| **Init submodule** | `git submodule update --init --recursive skills/lean4-skills` |

This is **not** the same as `ref/lean4/.claude/skills/` (upstream Lean compiler CI/build agent notes). Prefer the project skill for theorem-proving and `.lean` edit workflows.

Optional helper `PATH` for full script wrappers: `skills/lean4-skills/plugins/lean4/bin`.

### Match tools to planned work (Lean entry)

| You are trying to... | lean4 workflow |
|----------------------|----------------|
| Land a new dual or host API with `sorry` | draft -> prove (or formalize) |
| Clear a file / module under a time or cycle budget | autoprove |
| Show a statement is wrong | disprove |
| Unblock Lake / typeclass / timeout failures | doctor, then skill error references |
| Close residual Done when that needs proof quality | review, then project gates (`just check` / Lake) |
| Simplify a green proof | refactor / golf |
| Explore mathlib for a correspondence lemma | learn |

Full workstream table (Systems vs Lean dual vs Nix vs emit wire): `AGENTS.md`
**When to reach for lean4 tools**. Residual Open Names still come from
`RESIDUAL-*.md` / the human -- the skill does not invent residual. Product claim
program (how skill maps to self-host / residual free / duals):
`.agents/plans/plan-close-six-claims.md` section 4.

---

## Start here (language upstream)

| Purpose | Path |
|---------|------|
| Project overview / build | `ref/lean4/README.md` |
| Contributing / build notes | `ref/lean4/CONTRIBUTING.md` |
| Dev docs index | `ref/lean4/doc/` |
| Toolchain pin | `ref/lean4/lean-toolchain` |
| Flake (if using Nix) | `ref/lean4/flake.nix` |

---

## Source landmarks

| Area | Path |
|------|------|
| Init prelude | `ref/lean4/src/Init/` |
| Lean elaborator / compiler | `ref/lean4/src/Lean/` |
| Std library | `ref/lean4/src/Std/` |
| Lake (classic package/build) | `ref/lean4/src/lake/` |
| Runtime (C++) | `ref/lean4/src/runtime/` |
| Kernel (C++) | `ref/lean4/src/kernel/` |
| Tests | `ref/lean4/tests/` |

---

## Honest product notes

- Classic Lean **AOT** produces native code that still expects the **managed Lean runtime**. That is not freestanding.
- **AOT != freestanding.** Freestanding means no Lean managed runtime on the product wire.
- Lake is the classic package/build driver. Slake (this project) is the **compiler**, not a Lake rename.

See [divergence.md](divergence.md) and [vocabulary.md](vocabulary.md).

---

## What Systems Lean uses this for

- Kernel / elaborator / proof-ecosystem side of the meet-in-the-middle
- Understanding classic AOT residual vs freestanding goals
- Later: surface matrix and dual examples

Product Systems Lean extensions and the Slake compiler will live **outside** `ref/lean4` in this repository.
