# Join: Host library seed expand continue (A20 / plan L9)

**Status:** GREEN (lake + without-lake modules=49 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** 161f9633

## Goal met

Grow the real-module seed set beyond Mult..KernelSelfApply modules=45 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody
(modules=**49**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit product seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..KernelSelfApplyTheorems (prior 45) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply |
| `SystemsLean.EmitMult` | Product Mult emit; imports EmitMultScaffold only (def-empty shell; empty required decls) |
| `SystemsLean.EmitPlan` | Product plan; imports Mult+Types+HostCompose+EmitPlanScaffold; key planFromCompose / planOk surface |
| `SystemsLean.EmitApply` | Product apply; imports Mult+Types+HostCompose+EmitApplyScaffold; key applyFromCompose / applyOk surface |
| `SystemsLean.EmitBody` | Product body; imports Mult+Types+HostCompose+EmitPlan+EmitApply+EmitBodyScaffold; key bodyFromCompose / bodyOk surface |

**How the band was picked:** inventory after A19 (seed closed on KernelSelfApply).
Preferred Emit product Mult/Plan/Apply/Body so KernelEmit deps become fully
seedable (HostCompose, EmitPlan, EmitApply, EmitBody, EmitMult, KernelProgram).
KernelEmit **not** seeded this slice (held for A21/L10+ now that Body is in seed).
Coherent +4 Emit product band. Not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk product modules (not scaffolds only). EmitMult: empty required decls +
scaffold import. Plan/Apply/Body: product def keys from live modules.
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 49 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named EmitMult+EmitPlan+EmitApply+EmitBody seed | +4 modules; seed units label ends +EmitMult+EmitPlan+EmitApply+EmitBody |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=49 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=49; L10+; prefer KernelEmit) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +EmitMult+EmitPlan+EmitApply+EmitBody; RealMod edges; acceptCount 49; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Emit Mult/Plan/Apply/Body surface checks; loadOk modules=49 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Emit Mult/Plan/Apply/Body required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Emit product good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L9 + Open L10+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 49; KernelEmit) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=49 + next Name |
| `doc/goals.md` | Living tip modules=49 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A20 modules=49; L9 done / L10+ open |
| `.agents/joins/a20-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=49 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=49 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L10+) -- next real library band beyond
modules=49 (inventory remaining vs ~271; prefer KernelEmit now that Emit product
deps are in seed, or imports of current seed as evidence picks). Do not flip free.
Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
