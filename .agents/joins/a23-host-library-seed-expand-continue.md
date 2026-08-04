# Join: Host library seed expand continue (A23 / plan L12)

**Status:** GREEN (lake + without-lake modules=55 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** b530196b

## Goal met

Grow the real-module seed set beyond Mult..ParityMultTheorems modules=53 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems
(modules=**55**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ParityLinear seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ParityMultTheorems (prior 53) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + ParityMult band |
| `SystemsLean.ParityLinear` | Linear freestanding path parity; imports KernelLinear+ParityMult (all seed) |
| `SystemsLean.ParityLinearTheorems` | Same deps + ParityLinear; namespace SystemsLean.ParityLinear; linearParityReady_true / linearParityOk_true (+ stage ids) |

**How the band was picked:** inventory after A22 (ParityMult seeded). ParityLinear
deps fully seedable; honest multi-import edges (not a false leaf). Coherent +2
ParityLinear band on the parity path toward ParityTypes/SelfApply. Not full ~271.
ParityTypes still later (prefer ParityLinear first). SelfApply still blocked
(needs more parity ladder). EmitLinear product shell held unless filler needed.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk ParityLinear (stageId, hostParityLinearId, selfHostParityLinearId,
linearParityReady, linearParityOk, paritySurfaceOk, acceptancePath, hostModulePath)
and ParityLinearTheorems (stageId_eq, hostParityLinearId_eq, selfHostParityLinearId_eq,
linearParityReady_true, linearParityOk_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 55 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ParityLinear+ParityLinearTheorems seed | +2 modules; seed units label ends +ParityLinear+ParityLinearTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=55 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=55; L13+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ParityLinear+ParityLinearTheorems; RealMod multi-import edges; acceptCount 55; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; ParityLinear surface checks; loadOk modules=55 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | ParityLinear/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | ParityLinear good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L12 + Open L13+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 55) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=55 + next Name |
| `doc/goals.md` | Living tip modules=55 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A23 modules=55; L12 done / L13+ open |
| `.agents/joins/a23-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=55 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=55 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L13+) -- next real library band beyond
modules=55 (inventory remaining vs ~271; next coherent seed importers or
ParityLinear dependents when seedable, e.g. ParityTypes/SelfApply). Do not flip
free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
