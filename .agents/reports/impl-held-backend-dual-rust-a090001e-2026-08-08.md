# Implement report -- held-backend dual / LLVM / Rust wave (IMPL a090001e)

ASCII only. Plain American English.

**Date:** 2026-08-08
**IMPL_ID:** a090001e
**Plan:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md`
**Orchestrator summary:** `/tmp/grok-1000/grok-impl-summary-a090001e.md`

## Goal

Land all plan residual Names in priority order with real gates, residual
lockstep, and honest non-claims (no free/complete/PROVABLY/FullHost/full LLVM
backend/Rust link forge).

## Names done (priority order)

| Order | Name | Status | What landed |
|------:|------|--------|-------------|
| 1 | C1 LinearPairSwap dual pair | **done** | Idris + Lean examples; JOIN-ALG id; JoinMap cite + `linearPairSwapHostUseOk` PARTIAL (single-live remint reject); SurfaceMatrix dual cite; dual pure Nix |
| 2 | D1 Dual formal map edge | **done** (present-partial) | Named theorem `failClosedGrade_host_use_implies_mult_unknown_reject` (+ alias); SurfaceMatrix `rowDualFormalMap` present-partial; not isomorphism complete |
| 3 | C2 RuntimeExtract dual pair | **done** | Idris + Lean examples; `runtimeExtractHostUseOk` Extract RuntimeClaim FS-only; join + matrix + dual Nix |
| 4 | A0 LLVM backend gap reseed | **done** | `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` after Mult + Linear SSA |
| 5 | A1 Linear SSA lower partial | **done** | `SystemsLean/LlvmLinearSsa.lean` (+ Main); `out/llvm-ir/slake_linear_ssa.ll`; `nix/systems-llvm-ir/linear-ssa.nix`; `just llvm-linear-ssa`; `fullBackend` / local pin **false** |
| 6 | B0/B1 Mult layout residual + consumer | **done** | Residual honesty; pure Nix Mult layout consumer + `just mult-layout-consumer`; not Rust link success |

## Primary paths touched

### Dual product

- `src/idris2/examples/LinearPairSwap.idr`
- `src/lean4/examples/LinearPairSwap.lean`
- `src/idris2/examples/RuntimeExtract.idr`
- `src/lean4/examples/RuntimeExtract.lean`
- `src/idris2/JOIN.md`, `src/lean4/JOIN.md` (and multiplicity-map / TRUST as needed)
- `src/systems/join-map.md`, `src/systems/surface-matrix.md`
- `src/systems/SystemsLean/JoinMap.lean`, `JoinMapTheorems.lean`
- `src/systems/SystemsLean/SurfaceMatrix.lean` (+ Theorems if wired)
- `nix/idris-side-presence/specs.nix`, `nix/lean-side-presence/specs.nix`
- host presence dual tokens under `nix/systems-host-presence/` as required

### LLVM

- `src/systems/SystemsLean/LlvmLinearSsa.lean` (and Main / lakefile / SystemsLean root)
- `out/llvm-ir/slake_linear_ssa.ll`
- `nix/systems-llvm-ir/linear-ssa.nix` + specs join
- `just/llvm.just` (`llvm-linear-ssa`)
- `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`

### Rust layout (not link)

- `nix/systems-llvm-ir/mult-layout-consumer.nix` + specs join
- `just` mult-layout-consumer recipe
- residual / research honesty only for B0

### Process lockstep

- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `doc/dev/research/dual-gap-inventory-2026-08-08.md`
- plan status rows

## Verification (closeout re-run)

| Gate | Exit |
|------|-----:|
| `just hygiene` | 0 |
| `just idris-side` | 0 (9 required paths) |
| `just lean-side` | 0 (12 required paths) |
| `just systems-host` | 0 (241 required paths) |
| `just systems-llvm-ir` | 0 (45 required paths; Mult + Linear SSA; Mult layout consumer) |
| `lake build SystemsLean.JoinMap SystemsLean.JoinMapTheorems SystemsLean.SurfaceMatrix SystemsLean.LlvmLinearSsa` | 0 |
| `just abi-parity-smoke` | 0 |
| `just layout-ir-dual-pin` | 0 |
| `just mult-layout-consumer` | 0 |
| `just llvm-linear-ssa` | 0 (wrote `slake_linear_ssa.ll`; fullBackend=false) |

### RED / GREEN notes

- Dual presence: pure Nix dual-side gates require new paths/tokens; landed product
  files then GREEN on idris-side / lean-side.
- D1 theorem: lake elaborates `failClosedGrade_host_use_implies_mult_unknown_reject`
  via Mult `ofNat?_fail_closed` after MultTheorems import; lake GREEN.
- A1 / B1: systems-llvm-ir path count includes Linear SSA + Mult layout consumer;
  focused just recipes GREEN with explicit non-claims on stdout.

## Non-claims (living tip unchanged where listed true)

- free / complete / PROVABLY **true** (not re-opened, not forged this wave)
- host free **claimed**; FullHostElaborateRemains **false**
- llvmUnlocked **true**; Mult+Linear SSA **partial** only; full backend **false**
- dual formal map **present-partial** (one edge); **not** isomorphism complete
- LinearPairSwap host use **PARTIAL** (single live-token; multi-token product C not claimed)
- Mult layout consumer **green**; Rust-native **link success** not claimed
- AffineDrop dual **held**
- seed=206 harness=28

## Residual / watcher

- Systems Open: **empty done-for-now**
- Done archive: held-backend wave row (C1 D1 C2 A0 A1 B0 B1)
- Coordinator `RESIDUAL.md` Systems Open join + dual alg list (six JOIN-ALG ids)
- `WATCHER.md`: DONE-FOR-NOW; no `/implement` theater while held-only
- Handoff living tip + next product reseeded to this wave

## Remaining (held only; operator promote)

- Full LLVM backend; Types/Program/Graph SSA partial; CFG + dominance fixture
- Rust-native link success (and optional in-tree Rust crate)
- AffineDrop dual; full elaborator / mathlib parity

## Line-count honesty (sample)

| File | Lines (approx) |
|------|---------------:|
| `LlvmLinearSsa.lean` | 556 |
| `JoinMap.lean` | 408 |
| `JoinMapTheorems.lean` | 321 |
| `SurfaceMatrix.lean` | 338 |

All under Sub-1-KLOC bar.
