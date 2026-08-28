# Implement report -- remaining residual promote (IMPL b2a2512c)

ASCII only. Plain American English.

**Date:** 2026-08-08
**IMPL_ID:** b2a2512c
**Plan:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md`
**Orchestrator summary:** `/tmp/grok-1000/grok-impl-summary-b2a2512c.md`

## Goal

Operator `/implement --effort 2 all remaining residual` promote of ranked
remaining work from the held-backend plan (revised 2026-08-08). Land checkable
product surface without forging free/complete/PROVABLY/FullHost/full backend/
Rust link success. No in-tree product Rust. No product C/shell growth.

## Names done (priority order)

| Order | Name | Status | What landed |
|------:|------|--------|-------------|
| 1 | Program band SSA lower partial | **done** | `LlvmProgramSsa` + Main; `out/llvm-ir/slake_program_ssa.ll`; pure Nix `program-ssa.nix`; `just llvm-program-ssa`; fullBackend **false** |
| 2 | Graph band SSA lower partial | **done** | `LlvmGraphSsa` + Main; `out/llvm-ir/slake_graph_ssa.ll`; pure Nix `graph-ssa.nix`; `just llvm-graph-ssa`; fullBackend **false** |
| 3 | Mult layout/IR consumer success residual | **done partial** | Pure Nix `mult-layout-ir-success.nix` + `just mult-layout-ir-success`; freestanding Mult API + Mult unit IR + Mult SSA kernel/is_valid + layout fixture; **not** Rust-native link success |
| 4 | Control-flow / dominance deepen | **done partial** | `LlvmCfgFixture` mergePredsOnlyAcceptReject + acceptRejectReachableFromEntry + cfgDeepenPartial; production opt/dominance **false** |
| 5 | Residual lockstep | **done** | RESIDUAL.md, RESIDUAL-systems.md, WATCHER.md, SESSION-HANDOFF.md, plan, llvm inventory |
| 6 | Companion lag scrub | **done** | Living tips reseeded |

## Primary paths touched

### Program SSA
- `src/systems/SystemsLean/LlvmProgramSsa.lean` (647 lines)
- `src/systems/SystemsLean/LlvmProgramSsaMain.lean`
- `out/llvm-ir/slake_program_ssa.ll`
- `nix/systems-llvm-ir/program-ssa.nix` + `specs.nix` join
- `just/llvm.just` (`llvm-program-ssa`)
- `src/systems/lakefile.lean` (lean_exe slake-llvm-program-ssa)
- `src/systems/SystemsLean.lean` import

### Graph SSA
- `src/systems/SystemsLean/LlvmGraphSsa.lean` (648 lines)
- `src/systems/SystemsLean/LlvmGraphSsaMain.lean`
- `out/llvm-ir/slake_graph_ssa.ll`
- `nix/systems-llvm-ir/graph-ssa.nix` + `specs.nix` join
- `just/llvm.just` (`llvm-graph-ssa`)
- lakefile + SystemsLean.lean

### Mult layout/IR consumer success
- `nix/systems-llvm-ir/mult-layout-ir-success.nix`
- `just/llvm.just` (`mult-layout-ir-success`)
- `nix/systems-llvm-ir/specs.nix` + `default.nix` banner

### CFG deepen
- `src/systems/SystemsLean/LlvmCfgFixture.lean` (268 lines)
- `nix/systems-llvm-ir/cfg-fixture.nix`

### Process lockstep
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`
- `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md`

## Design decisions

1. **Program SSA mirrors Types SSA** (KernelProgram three nodes, push-status phi
   ok/bad/full, EMPTY-PROGRAM-FAIL-CLOSED + CAP well-typed sketch, fullBackend
   false).
2. **Graph SSA mirrors Program SSA** (lowerProgramGraph chain edges, addEdge
   status phi, EMPTY-GRAPH-OK + EDGE_MAX well-typed sketch).
3. **Mult layout/IR consumer success** is still Slake-owned pure Nix agreement
   advancing past Mult link readiness (requires freestanding Mult API + Mult SSA
   kernel_band_ready + is_valid_tag + unit is_valid_tag). Named **partial**; not
   foreign link success; no `*.rs` product.
4. **CFG deepen** is one named structural step (merge preds only accept/reject;
   accept/reject reachable from entry). Not production dominance frontier.
5. **No HostImportGraph inventory churn** (same Mult/Linear/Types SSA pattern).

## RED / GREEN notes

- Program/Graph SSA: land then lake write GREEN; pure Nix joins after artifact
  exists.
- Mult layout/IR success: pure Nix token `slake_mult_is_valid` on unit IR was
  RED (actual name `slake_mult_is_valid_tag`); fixed to match artifact then GREEN.
- CFG deepen: lake elaborates new theorems GREEN.

## Verification

| Gate | Exit |
|------|-----:|
| `just hygiene` | 0 |
| `just systems-llvm-ir` | 0 (69 required paths) |
| `lake build SystemsLean.LlvmProgramSsa` | 0 |
| `lake build SystemsLean.LlvmGraphSsa` | 0 |
| `lake build SystemsLean.LlvmCfgFixture` | 0 |
| `just llvm-program-ssa` | 0 (wrote `slake_program_ssa.ll`; fullBackend=false) |
| `just llvm-graph-ssa` | 0 (wrote `slake_graph_ssa.ll`; fullBackend=false) |
| `just mult-layout-ir-success` | 0 (not Rust-native link success) |
| optional `llvm-as` Program + Graph `.ll` | 0 |

## Pin honesty (unchanged living tip where true)

- free / complete / PROVABLY **true** (not re-opened, not forged)
- host free **claimed**; FullHostElaborateRemains **false**
- llvmUnlocked **true**; Mult+Linear+Types+Program+Graph SSA **partial** only; full backend **false**
- `llvmProgramSsaFullBackendClaimed` / `llvmGraphSsaFullBackendClaimed` **false**
- CFG production opt / dominance pipeline **false**
- dual formal map **present-partial** (two edges); **not** isomorphism complete
- Mult layout/IR consumer success **partial**; Rust-native **link success** **not** claimed
- AffineDrop dual **held**
- seed=206 harness=28

## Residual / watcher

- Systems Open: **empty done-for-now**
- Done archive: remaining residual promote row (Program Graph Mult layout CFG)
- Coordinator `RESIDUAL.md` highest-value next + self-validation reseeded
- `WATCHER.md`: DONE-FOR-NOW
- Handoff living tip reseeded to this wave

## Remaining (held only; operator promote)

- True foreign / Rust layout link success (out-of-tree consumer; Mult success partial is not synonym)
- Production CFG / dominance pipeline
- AffineDrop dual; full elaborator / mathlib parity
- Full-backend claim true (far)

## Line-count honesty

| File | Lines |
|------|------:|
| `LlvmProgramSsa.lean` | 647 |
| `LlvmGraphSsa.lean` | 648 |
| `LlvmCfgFixture.lean` | 268 |

All under Sub-1-KLOC bar.
