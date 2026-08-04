# Join: Host library seed expand continue (A24 / plan L13)

**Status:** GREEN (lake + without-lake modules=57 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a24815269

## Goal met

Grow the real-module seed set beyond Mult..ParityLinearTheorems modules=55 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems
(modules=**57**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ParityTypes seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ParityLinearTheorems (prior 55) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + ParityMult + ParityLinear bands |
| `SystemsLean.ParityTypes` | Types freestanding path parity; imports KernelTypes+ParityLinear (all seed) |
| `SystemsLean.ParityTypesTheorems` | Same deps + ParityTypes; namespace SystemsLean.ParityTypes; typesParityReady_true / typesParityOk_true (+ stage ids) |

**How the band was picked:** inventory after A23 (ParityLinear seeded). ParityTypes
deps fully seedable (KernelTypes + ParityLinear already in seed); honest multi-import
edges (not a false leaf). Coherent +2 ParityTypes band on the parity path toward
ParityProgram/SelfApply. Not full ~271. SelfApply still blocked (needs more parity
ladder). ParityProgram later when deps seedable.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk ParityTypes (stageId, hostParityTypesId, selfHostParityTypesId,
typesParityReady, typesParityOk, paritySurfaceOk, acceptancePath, hostModulePath)
and ParityTypesTheorems (stageId_eq, hostParityTypesId_eq, selfHostParityTypesId_eq,
typesParityReady_true, typesParityOk_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 57 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ParityTypes+ParityTypesTheorems seed | +2 modules; seed units label ends +ParityTypes+ParityTypesTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=57 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=57; L14+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ParityTypes+ParityTypesTheorems; RealMod multi-import edges; acceptCount 57; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; ParityTypes surface checks; loadOk modules=57 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | ParityTypes/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | ParityTypes good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L13 + Open L14+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 57) |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L14+ beyond modules=57; L13 A24 done) |
| `src/systems/self-host.md` | Living tip modules=57 + next Name |
| `doc/goals.md` | Living tip modules=57 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A24 modules=57; Phase L L13 done / L14+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a24-host-library-seed-expand-continue.md` | this join |

### Review lockstep scrub (same slice)

After review Issues 1-3: SESSION-HANDOFF **Active product residual** and
**Decisions Open residual** now name L14+ / modules=57 / A24 L13 ParityTypes done;
plan Phase L marks L13 done and L14+ open with Goal past modules=57; section 5
immediate next, Step 3+, and defaults item 4 match. Hygiene re-green after
markdown touch.

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
just host-import-graph-without-lake   # GREEN modules=57 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=57 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L14+) -- next real library band beyond
modules=57 (inventory remaining vs ~271; next coherent seed importers or
ParityTypes dependents when seedable, e.g. ParityProgram/SelfApply). Do not flip
free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
