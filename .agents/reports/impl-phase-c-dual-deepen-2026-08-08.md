# Implement report -- Phase C Curry-Howard dual deepen (2026-08-08)

ASCII only. Plain American English.

## Goal

Phase C: usable-core dual map growth (plan Part 5). C1 inventory + C2 one new
real dual pair. Not full isomorphism. No free/PROVABLY/FullHost/llvm full-backend
forge.

## Done

### C1 -- Dual gap inventory reseed

- Research: `doc/dev/research/dual-gap-inventory-2026-08-08.md`
- Kind: analysis only; ranked next duals; living claim pins stated
- Rank-1 selected for C2: **FailClosedGrade** (FAIL-CLOSED-UNKNOWN-GRADE)

### C2 -- FailClosedGrade dual pair

| Side | Path |
|------|------|
| Idris | `src/idris2/examples/FailClosedGrade.idr` |
| Lean | `src/lean4/examples/FailClosedGrade.lean` |
| JOIN | `src/idris2/JOIN.md`, `src/lean4/JOIN.md` (EX-FAIL-CLOSED) |
| Maps | multiplicity-map both sides; TRUST both sides |
| Join map | `src/systems/join-map.md` row + `SystemsLean/JoinMap.lean` cite + `failClosedGradeHostUseOk` |
| Matrix | `src/systems/surface-matrix.md` + `SystemsLean/SurfaceMatrix.lean` dualCiteOk (four pairs) |
| Dual Nix | `nix/idris-side-presence/specs.nix`, `nix/lean-side-presence/specs.nix` |
| Host Nix | `nix/systems-host-presence/host-specs-join-surface.nix`, `unit-surface.nix` |
| Lake | `src/lean4/lakefile.toml` defaultTargets + lean_lib FailClosedGrade |

### C3 (included small)

Matrix dual-cite table and JoinMap/SurfaceMatrix path inventory updated for the
fourth dual. Dual formal map theorems row stays **open**.

## Verification

| Gate | Result |
|------|--------|
| `just hygiene` | exit 0 |
| `just idris-side` | exit 0 (7 required paths) |
| `just lean-side` | exit 0 (10 required paths) |
| `just systems-host` | exit 0 (241 required paths) |
| `just lean-elaborate` | GREEN (FailClosedGrade built 205ms) |
| `just idris-elaborate` | skipped (idris2 not on PATH this session) |

## Non-claims (unchanged living tip)

- free / complete / PROVABLY **true** (not flipped)
- host free **claimed**; FullHostElaborateRemains **false**
- llvmUnlocked **true** (not full backend)
- Not Curry-Howard complete; not formal dual-bridge theorems finished
- Not full Idris 2 / Lean 4 elaborator parity

## Residual / watcher lockstep

- Done archive: FailClosedGrade dual pair (Phase C) in `RESIDUAL-systems.md`
- Next product: **Phase L** LLVM SSA lower partial
- `WATCHER.md` points at Phase L
- Handoff living tip reseeded (Phase C done)

## Summary paths

- Report: `.agents/reports/impl-phase-c-dual-deepen-2026-08-08.md`
- Temp summary: `/tmp/grok-1000/grok-impl-summary-phase-c.md`
