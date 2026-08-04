# Sub-1-KLOC inventory reseed (2026-08-03)

Kind: analysis only. Not residual invent. Not free/complete/PROVABLY/llvm forge.
ASCII only. Date: 2026-08-03.

Closes residual Open Name **Long-file inventory reseed** (Track 6a hygiene).
Implement join: `/tmp/grok-1000/grok-impl-summary-sub-1kloc-nix-agents.md`.
Plan cite: `.agents/plans/plan-long-file-refactor.md` (historical dual-pin seams).

Related:

- `AGENTS.md` **Sub-1-KLOC** (hard rule + honesty exceptions)
- Companion process docs extracted from AGENTS: `doc/nix-tooling.md`,
  `doc/lean4-skill-use.md`, `doc/subagents-project.md`
- just tree modularized earlier: root `justfile` + `just/*.just` (all under 1000)
- Pure Nix: `nix/systems-host-presence/`, `nix/systems-emit-wire/`

---

## 1. Goal

Fresh `wc -l` after AGENTS + pure Nix kitchen-sink paydown. Priority table for
the next long-file seam residual. No product claim pin flips.

---

## 2. Paid down this campaign (under 1000)

| Surface | Status | Notes |
|---------|--------|-------|
| Root `justfile` + `just/*.just` | **done** (prior turn) | All modules under 1000; do not re-split |
| `AGENTS.md` | **done** (830) | Law index; detail in companion docs |
| Every `nix/systems-host-presence/*.nix` | **done** | Largest slice files ~843; thin joins |
| Every `nix/systems-emit-wire/*.nix` | **done** | Largest ~833; role slices + eval join |

Gates at reseed (2026-08-03):

| Gate | Result |
|------|--------|
| `just systems-host` | GREEN |
| `just systems-emit-wire` | Pre-existing red only: `LlvmGraphText` / `LlvmProgramText` UNIT_SURFACE IR contract id |
| `just systems-llvm-ir` | GREEN |
| `just hygiene` | GREEN |

---

## 3. Remaining novel files >= 1000 lines

Exclude: `ref/`, `skills/`, `.lake/`, `.git/`, `.cache/`.

| Lines | Path | Role | Paydown stance |
|------:|------|------|----------------|
| 1038 | `.agents/plans/plan-close-six-claims.md` | Historical plan | Leave; do not grow; not product |
| 1117 | `src/systems/emit/slake_freestanding.c` | Product wire (generated) | Honesty exception; shrink via emit SSOT / generator only |
| 1117 | `out/freestanding-c/slake_freestanding.c` | Product wire (release) | Same as emit; refresh via `just build` |
| 1615 | `src/systems/smoke/slake_behavioral_probe.c` | Behavioral tests | Permanent test role; shrink only when Lean covers live contract |
| 999 | `src/systems/SystemsLean/SelfApplyFs.lean` | Host Lean tip | **done** 2026-08-03 (1922->999; SelfApplyFsTheorems role module) |
| 5409 | `src/systems/emit/slake_product_wire_fs_write_tool.c` | Generated write tool | Product wire; generator-owned; no hand-author growth |
| 5525 | `src/systems/self-host.md` | Living self-host map | **Second seam:** prose long-file split by role sections |

No pure Nix under `nix/systems-host-presence/` or `nix/systems-emit-wire/` remains over 1000.
`AGENTS.md` is under 1000.

---

## 4. Priority table (next seams)

| Priority | Name (suggested residual) | Target path | Done when (sketch) | Out of scope |
|---------:|---------------------------|-------------|--------------------|--------------|
| 1 | SelfApplyFs long-file split | `SystemsLean/SelfApplyFs.lean` | **done** 1922->999; `SelfApplyFsTheorems` | (closed) |
| 2 | Self-host map long-file split | `src/systems/self-host.md` | Map under 1000 via companion role docs + thin index | Claim flips; invent free/complete |
| 3 | (optional) Write-tool generator shrink | `slake_product_wire_fs_write_tool.c` | Only if Lean emit owns smaller fragments; not hand C | Hand-written product C residual |
| -- | Historical plan | `plan-close-six-claims.md` | Leave | Rewrite novel |
| -- | Freestanding C + probe | emit/out + smoke | Honesty exception until generator/test shrink is named | Treat C as Systems Lean body |

**Primary next long-file residual (checkable):** Self-host map long-file split
(priority 2). SelfApplyFs tip under 1000 closed 2026-08-03.

---

## 5. Honesty exceptions (from AGENTS)

Do **not** claim "all novel files under 1000" while product wire C, behavioral
probe, large generated writers, or `self-host.md` remain over. Those are named
exceptions or living maps until a split residual closes them.

---

## 6. Non-claims

- freestanding product residual free / complete / PROVABLY / llvm backend: **unchanged**
- host elaborator residual free: **not** claimed
- emit-wire Graph/Program UNIT_SURFACE pre-existing red: **not** fixed here
- no product claim pin flips in this inventory
