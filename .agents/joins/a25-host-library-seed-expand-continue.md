# Join: Host library seed expand continue (A25 / plan L14)

**Status:** GREEN (lake + without-lake modules=59 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a25seed059

## Goal met

Grow the real-module seed set beyond Mult..ParityTypesTheorems modules=57 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems
(modules=**59**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ParityProgram seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ParityTypesTheorems (prior 57) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + ParityMult + ParityLinear + ParityTypes bands |
| `SystemsLean.ParityProgram` | Program freestanding path parity; imports KernelProgram+ParityTypes (all seed) |
| `SystemsLean.ParityProgramTheorems` | Same deps + ParityProgram; namespace SystemsLean.ParityProgram; programParityReady_true / programParityOk_true (+ stage ids) |

**How the band was picked:** inventory after A24 (ParityTypes seeded). ParityProgram
deps fully seedable (KernelProgram + ParityTypes already in seed); honest multi-import
edges (not a false leaf). Coherent +2 ParityProgram band on the parity path toward
ParityEmit/SelfApply. Not full ~271. SelfApply still blocked (needs more ladder).

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk ParityProgram (stageId, hostParityProgramId, selfHostParityProgramId,
programParityReady, programParityOk, paritySurfaceOk, acceptancePath, hostModulePath)
and ParityProgramTheorems (stageId_eq, hostParityProgramId_eq, selfHostParityProgramId_eq,
programParityReady_true, programParityOk_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 59 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ParityProgram+ParityProgramTheorems seed | +2 modules; seed units label ends +ParityProgram+ParityProgramTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=59 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=59; L15+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ParityProgram+ParityProgramTheorems; RealMod multi-import edges; acceptCount 59; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; ParityProgram surface checks; loadOk modules=59; length dual-pins 8/5 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | ParityProgram/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | ParityProgram good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L14 + Open L15+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 59); join a26 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L15+ beyond modules=59; L14 A25 done) |
| `src/systems/self-host.md` | Living tip modules=59 + next Name |
| `doc/goals.md` | Living tip modules=59 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A25 modules=59; Phase L L14 done / L15+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a25-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=59 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=59 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L15+) -- next real library band beyond
modules=59 (inventory remaining vs ~271; next coherent seed importers or
ParityProgram dependents when seedable, e.g. ParityEmit/SelfApply). Do not flip
free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
