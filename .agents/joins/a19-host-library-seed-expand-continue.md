# Join: Host library seed expand continue (A19 / plan L8)

**Status:** GREEN (lake + without-lake modules=45 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..EmitBanner scaffolds modules=43 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems
(modules=**45**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites KernelSelfApply seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..EmitBannerScaffold (prior 43) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body/Erasure/Extract/Banner scaffolds |
| `SystemsLean.KernelSelfApply` | Product kernel self-application leaf (stageId / hostId / selfHostId / productKernel* surface; no package-local import) |
| `SystemsLean.KernelSelfApplyTheorems` | Companion theorems (imports KernelSelfApply; theorem productKernelSelfApplyPartialReady_true) |

**How the band was picked:** inventory after A18 (seed closed on Emit Erasure/
Extract/Banner scaffolds). Preferred remaining Kernel path KernelSelfApply +
KernelSelfApplyTheorems already on disk as coherent leaf+companion. KernelEmit
**not** seeded: real imports include EmitPlan/EmitApply/EmitBody/EmitMult which
are not yet in the seed set (honest edges would MISSING-IMPORT). Coherent two-
module Kernel remainder band. Not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role (KernelSelfApply stageId/hostId/selfHostId/productKernelSelfApplyModuleCite/
productKernelBarSurfaceOk/productKernelSelfApplyPartialReady; theorems corpus 1).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 45 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named KernelSelfApply + KernelSelfApplyTheorems seed | +2 modules; seed units label ends +KernelSelfApply+KernelSelfApplyTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=45 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=45; L9+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +KernelSelfApply+KernelSelfApplyTheorems; RealMod edges; acceptCount 45; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; KernelSelfApply surface checks; loadOk modules=45 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | KernelSelfApply required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | KernelSelfApply good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L8 + Open L9+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 45) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=45 + next Name |
| `doc/goals.md` | Living tip modules=45 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A19 modules=45; L8 done / L9+ open |
| `.agents/joins/a19-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean (mtime unchanged this slice).

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=45 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=45 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # (run after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L9+) -- next real library band beyond
modules=45 (inventory remaining vs ~271; prefer Emit product modules that unlock
KernelEmit, or imports of current seed as evidence picks). Do not flip free. Do
not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
