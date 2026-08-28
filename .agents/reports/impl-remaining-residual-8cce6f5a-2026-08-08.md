# Implement report -- remaining residual promote (IMPL 8cce6f5a)

ASCII only. Plain American English.

**Date:** 2026-08-08
**IMPL_ID:** 8cce6f5a
**Plan:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md`
**Orchestrator summary:** `/tmp/grok-1000/grok-impl-summary-8cce6f5a.md`

## Goal

Operator `/implement --effort 2 all remaining residual` promote of ranked
remaining work from the held-backend plan. Land checkable product surface
without forging free/complete/PROVABLY/FullHost/full backend/Rust link success.

## Names done (priority order)

| Order | Name | Status | What landed |
|------:|------|--------|-------------|
| 1 | A2 Types SSA lower partial | **done** | `LlvmTypesSsa` + Main; `out/llvm-ir/slake_types_ssa.ll`; `nix/systems-llvm-ir/types-ssa.nix`; `just llvm-types-ssa`; fullBackend **false** |
| 2 | D2 Dual formal map second edge | **done** present-partial | Theorem `runtimeExtract_host_use_implies_unknown_runtime_reject` + alias; SurfaceMatrix dual formal still present-partial (two edges) |
| 3 | Companion prose mop | **done** | surface-matrix.md / host-partial-inventory / JoinMapTheorems + SurfaceMatrixTheorems comments four->six duals |
| 4 | B3 Mult link readiness partial | **done** partial | Pure Nix `mult-link-readiness.nix` + `just mult-link-readiness`; freestanding Mult + Mult unit IR + Mult SSA tags + layout fixture; **not** Rust-native link success |
| 5 | A3 Mult CFG fixture | **done** partial | `LlvmCfgFixture` structural Mult CFG + entry dominates all; production opt **false**; dominance claim **false**; pure Nix `cfg-fixture.nix` |
| 6 | Residual lockstep | **done** | RESIDUAL.md, RESIDUAL-systems.md, WATCHER.md, SESSION-HANDOFF.md, plan, llvm + dual-gap inventories |

## Primary paths touched

### Types SSA (A2)

- `src/systems/SystemsLean/LlvmTypesSsa.lean` (636 lines)
- `src/systems/SystemsLean/LlvmTypesSsaMain.lean`
- `out/llvm-ir/slake_types_ssa.ll`
- `nix/systems-llvm-ir/types-ssa.nix` + `specs.nix` join
- `just/llvm.just` (`llvm-types-ssa`)
- `src/systems/lakefile.lean` (lean_exe slake-llvm-types-ssa)
- `src/systems/SystemsLean.lean` import

### Dual formal D2 + prose

- `src/systems/SystemsLean/JoinMapTheorems.lean` (RuntimeExtract edge)
- `src/systems/SystemsLean/SurfaceMatrix.lean` (row comment)
- `src/systems/SystemsLean/SurfaceMatrixTheorems.lean` (six dual smoke comment)
- `src/systems/surface-matrix.md`
- `src/systems/host-partial-inventory.md`
- `nix/systems-host-presence/host-specs-join-surface.nix`

### B3 Mult link readiness

- `nix/systems-llvm-ir/mult-link-readiness.nix`
- `just/llvm.just` (`mult-link-readiness`)
- `nix/systems-llvm-ir/specs.nix` + `default.nix` banner

### A3 CFG fixture

- `src/systems/SystemsLean/LlvmCfgFixture.lean` (222 lines)
- `nix/systems-llvm-ir/cfg-fixture.nix`
- `src/systems/SystemsLean.lean` import

### Process lockstep

- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`
- `doc/dev/research/dual-gap-inventory-2026-08-08.md`
- plan status rows

## Design decisions

1. **Types SSA mirrors Linear SSA** (KernelTypes three-node band, kind-tag phi,
   fail-closed unknown kind, fullBackend false, no HostImportGraph inventory
   churn -- same pattern Mult/Linear SSA used).
2. **B3 is Mult link readiness partial**, not link success: pure Nix agreement
   Mult freestanding header + Mult unit IR + Mult SSA tags + layout fixture.
   True Rust-native link still needs out-of-tree consumer evidence (no product
   Rust crate).
3. **A3 is a structural Mult CFG fixture** in Lean only (blocks + edges + entry
   dominates all). Production opt and dominance pipeline claims stay false.
4. **D2 second dual formal edge** uses Extract unknown-runtime-tag reject
   (same shape as FailClosedGrade Mult edge). Not isomorphism complete.
5. **No Program/Graph SSA** this wave (Types first band only; Sub-1-KLOC ok).

## RED / GREEN notes

- Types SSA: product files landed then `lake build` / `just llvm-types-ssa` /
  `just systems-llvm-ir` GREEN (path count 45->56 with Types SSA + CFG + link
  readiness slices).
- D2: lake elaborates new RuntimeExtract formal edge GREEN after ExtractTheorems
  import.
- B3: pure Nix gate requires Mult SSA IR tags; GREEN with existing Mult SSA
  artifact (no product Rust).

## Verification

| Gate | Exit |
|------|-----:|
| `just hygiene` | 0 |
| `just systems-host` | 0 (241 required paths) |
| `just systems-llvm-ir` | 0 (56 required paths) |
| `lake build SystemsLean.LlvmTypesSsa` | 0 |
| `lake build SystemsLean.JoinMapTheorems SystemsLean.LlvmCfgFixture SystemsLean.SurfaceMatrixTheorems` | 0 |
| `just llvm-types-ssa` | 0 (wrote `slake_types_ssa.ll`; fullBackend=false) |
| `just mult-link-readiness` | 0 (not Rust-native link success) |
| `just mult-layout-consumer` | 0 |
| optional `llvm-as out/llvm-ir/slake_types_ssa.ll` | 0 |

## Pin honesty (unchanged living tip where true)

- free / complete / PROVABLY **true** (not re-opened, not forged)
- host free **claimed**; FullHostElaborateRemains **false**
- llvmUnlocked **true**; Mult+Linear+Types SSA **partial** only; full backend **false**
- `llvmTypesSsaFullBackendClaimed` **false**; CFG production / dominance **false**
- dual formal map **present-partial** (two edges); **not** isomorphism complete
- Mult link readiness **partial**; Rust-native **link success** **not** claimed
- AffineDrop dual **held**
- seed=206 harness=28

## Residual / watcher

- Systems Open: **empty done-for-now**
- Done archive: remaining residual promote row (A2 B3 A3 D2 prose)
- Coordinator `RESIDUAL.md` highest-value next + self-validation reseeded
- `WATCHER.md`: DONE-FOR-NOW
- Handoff living tip reseeded to this wave

## Remaining (held only; operator promote)

- Program / Graph SSA partial
- True Rust-native link success (out-of-tree consumer; Mult readiness is not synonym)
- Production CFG / dominance pipeline
- AffineDrop dual; full elaborator / mathlib parity
- Full-backend claim true (far)

## Line-count honesty

| File | Lines |
|------|------:|
| `LlvmTypesSsa.lean` | 636 |
| `LlvmCfgFixture.lean` | 222 |
| `JoinMapTheorems.lean` | 355 |

All under Sub-1-KLOC bar.
