# Join: Host library seed expand continue (A21 / plan L10)

**Status:** GREEN (lake + without-lake modules=51 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** 5a9cda61

## Goal met

Grow the real-module seed set beyond Mult..EmitBody modules=49 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems
(modules=**51**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites KernelEmit seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..EmitBody (prior 49) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body |
| `SystemsLean.KernelEmit` | Host emit plan/apply/body codegen honesty; imports HostCompose+EmitPlan+EmitApply+EmitBody+EmitMult+KernelProgram (all seed) |
| `SystemsLean.KernelEmitTheorems` | Same deps + KernelEmit; namespace SystemsLean.KernelEmit; emitKernelReady_true / emitKernelOk_true (+ stage ids) |

**How the band was picked:** inventory after A20 (Emit product Mult/Plan/Apply/Body
seeded). KernelEmit deps fully seedable; honest multi-import edges (not a false
leaf). Coherent +2 KernelEmit band. Not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk KernelEmit (stageId, kernelEmitId, hostKernelEmitId, emitKernelReady,
emitKernelOk, emitPlanPathReady, emitApplyPathReady, emitBodyPathReady) and
KernelEmitTheorems (stageId_eq, kernelEmitId_eq, hostKernelEmitId_eq,
emitKernelReady_true, emitKernelOk_true, emitPlanPathReady_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 51 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named KernelEmit+KernelEmitTheorems seed | +2 modules; seed units label ends +KernelEmit+KernelEmitTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=51 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=51; L11+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +KernelEmit+KernelEmitTheorems; RealMod multi-import edges; acceptCount 51; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; KernelEmit surface checks; loadOk modules=51 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | KernelEmit/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | KernelEmit good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L10 + Open L11+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 51) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=51 + next Name |
| `doc/goals.md` | Living tip modules=51 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A21 modules=51; L10 done / L11+ open |
| `.agents/joins/a21-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=51 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=51 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L11+) -- next real library band beyond
modules=51 (inventory remaining vs ~271; next coherent seed importers or
KernelEmit dependents when seedable). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
