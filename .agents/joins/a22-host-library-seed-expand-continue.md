# Join: Host library seed expand continue (A22 / plan L11)

**Status:** GREEN (lake + without-lake modules=53 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** b3a52e76

## Goal met

Grow the real-module seed set beyond Mult..KernelEmitTheorems modules=51 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems
(modules=**53**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ParityMult seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..KernelEmitTheorems (prior 51) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit band |
| `SystemsLean.ParityMult` | Mult closed-loop parity; imports Mult+KernelMult+EmitMult (all seed) |
| `SystemsLean.ParityMultTheorems` | Same deps + ParityMult; namespace SystemsLean.ParityMult; multParityReady_true / multParityOk_true (+ stage ids) |

**How the band was picked:** inventory after A21 (KernelEmit seeded). ParityMult
deps fully seedable; honest multi-import edges (not a false leaf). Coherent +2
ParityMult band on the parity path toward ParityEmit/SelfApply. Not full ~271.
ParityEmit still blocked (needs ParityProgram); SelfApply still blocked (needs
more parity ladder).

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk ParityMult (stageId, hostParityMultId, selfHostParityMultId,
multParityReady, multParityOk, paritySurfaceOk, acceptancePath, hostModulePath)
and ParityMultTheorems (stageId_eq, hostParityMultId_eq, selfHostParityMultId_eq,
multParityReady_true, multParityOk_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 53 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ParityMult+ParityMultTheorems seed | +2 modules; seed units label ends +ParityMult+ParityMultTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=53 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=53; L12+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ParityMult+ParityMultTheorems; RealMod multi-import edges; acceptCount 53; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; ParityMult surface checks; loadOk modules=53 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | ParityMult/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | ParityMult good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L11 + Open L12+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 53) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=53 + next Name |
| `doc/goals.md` | Living tip modules=53 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A22 modules=53; L11 done / L12+ open |
| `.agents/joins/a22-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=53 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=53 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L12+) -- next real library band beyond
modules=53 (inventory remaining vs ~271; next coherent seed importers or
ParityMult dependents when seedable, e.g. ParityLinear). Do not flip free. Do
not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
