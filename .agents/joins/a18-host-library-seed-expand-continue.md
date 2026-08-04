# Join: Host library seed expand continue (A18 / plan L7)

**Status:** GREEN (lake + without-lake modules=43 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..EmitBody scaffolds modules=40 to
10->Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold
(modules=**43**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit Erasure/Extract/Banner
seed. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..EmitBodyScaffold (prior 40) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds |
| `SystemsLean.EmitErasureScaffold` | Erasure emit scaffold leaf (ns EmitErasure; stageId path) |
| `SystemsLean.EmitExtractScaffold` | Extract emit scaffold leaf (ns EmitExtract) |
| `SystemsLean.EmitBannerScaffold` | Banner emit scaffold leaf (ns EmitBanner) |

**How the band was picked:** inventory after A17 (seed closed on Emit Plan/Apply/Body
scaffolds). Preferred Emit Erasure/Extract/Banner scaffolds already on disk as
package-local import-free leaves. Coherent three-module leaf band. Not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
scaffold role (stageId / hostEmit*Id / selfHostEmit*Id / acceptancePath /
hostModulePath / ssotArtifactPath -- Mult-band naming, not Plan-band productStageId).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 43 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Emit Erasure/Extract/Banner scaffold seed | +3 modules; seed units label ends +EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=43 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=43; L8+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +Emit Erasure/Extract/Banner scaffolds; RealMod edges; acceptCount 43; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Erasure/Extract/Banner surface checks; loadOk modules=43 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Erasure/Extract/Banner required decls + good fixtures (stageId Mult-band names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Erasure/Extract/Banner good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L7 + Open L8+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 43) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=43 + next Name |
| `doc/goals.md` | Living tip modules=43 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A18 modules=43; L7 done / L8+ open |
| `.agents/joins/a18-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=43 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=43 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # (run after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L8+) -- next real library band beyond
modules=43 (inventory remaining vs ~271; prefer remaining Emit product modules,
KernelSelfApply, or imports of current seed as evidence picks). Do not flip free. Do
not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
