# Join: Host library seed expand continue (A17 / plan L6)

**Status:** GREEN (lake + without-lake modules=40 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..EmitCompose scaffolds modules=37 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold
(modules=**40**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit Plan/Apply/Body
seed. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..EmitComposeScaffold (prior 37) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit Mult..Compose scaffolds |
| `SystemsLean.EmitPlanScaffold` | Plan emit scaffold leaf (ns EmitPlan; productStageId path) |
| `SystemsLean.EmitApplyScaffold` | Apply emit scaffold leaf (ns EmitApply) |
| `SystemsLean.EmitBodyScaffold` | Body emit scaffold leaf (ns EmitBody) |

**How the band was picked:** inventory after A16 (seed closed on Emit Mult..Compose
scaffolds). Preferred Emit body/plan band: Plan + Apply + Body (body path uses
plan+apply readiness). Coherent three-module leaf band; all package-local
import-free leaves. Not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
scaffold role (productStageId / hostEmit*Id / selfHostEmit*Id /
productAcceptancePath / productHostModulePath / *SsotArtifactPath). **Not** full
Lean 4 elaborator typecheck. Remaining library ~271 - 40 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Emit Plan/Apply/Body scaffold seed | +3 modules; seed units label ends +EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=40 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=40; L7+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +Emit Plan/Apply/Body scaffolds; RealMod edges; acceptCount 40; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Plan/Apply/Body surface checks; loadOk modules=40 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Plan/Apply/Body required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Plan/Apply/Body good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L6 + Open L7+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 40) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=40 + next Name |
| `doc/goals.md` | Living tip modules=40 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A17 modules=40; L6 done / L7+ open |
| `.agents/joins/a17-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=40 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=40 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # (run after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L7+) -- next real library band beyond
modules=40 (inventory remaining vs ~271; prefer Emit Erasure/Extract/Banner
scaffolds or imports of current seed as evidence picks). Do not flip free. Do
not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
