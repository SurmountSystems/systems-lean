# Join: Host library seed expand continue (A27 / plan L16)

**Status:** GREEN (lake + without-lake modules=63 + residual-shrink + hygiene; review nits fixed)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a27seed061

## Goal met

Grow the real-module seed set beyond Mult..ParityEmitTheorems modules=61 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems
(modules=**63**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites SelfApply seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ParityEmitTheorems (prior 61) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + ParityMult + ParityLinear + ParityTypes + ParityProgram + ParityEmit bands |
| `SystemsLean.SelfApply` | Host self-application readiness; imports ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit (all seed) |
| `SystemsLean.SelfApplyTheorems` | Same deps + SelfApply; namespace SystemsLean.SelfApply; stageId_eq / hostSelfApplyId_eq / selfApplySurfaceOk_true / kernelRebuildsKernel_true / selfApplyReady_true |

**How the band was picked:** inventory after A26 (ParityEmit seeded). SelfApply
deps fully seedable (ParityMult + KernelLinear + KernelTypes + KernelProgram +
KernelEmit already in seed); honest multi-import edges (not a false leaf).
Coherent +2 SelfApply band on the SH5 path. Not full ~271. SelfApplyFs still
needs many ProductPath/Capable deps (not seedable this slice).

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk SelfApply (stageId, hostSelfApplyId, selfHostSelfApplyId,
selfApplySurfaceOk, kernelRebuildsKernel, selfApplyReady, acceptancePath,
hostModulePath) and SelfApplyTheorems (stageId_eq, hostSelfApplyId_eq,
selfApplySurfaceOk_true, kernelRebuildsKernel_true, selfApplyReady_true).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 63 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named SelfApply+SelfApplyTheorems seed | +2 modules; seed units label ends +SelfApply+SelfApplyTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=63 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=63; L17+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +SelfApply+SelfApplyTheorems; RealMod multi-import edges; acceptCount 63; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; SelfApply surface checks; loadOk modules=63; length dual-pins for required decls |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | SelfApply/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | SelfApply good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L16 + Open L17+ Host library seed expand continue; next residual trailer L17+/modules=63/A1-A27 aligned |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 63); join a28 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L17+ beyond modules=63; L16 A27 done) |
| `src/systems/self-host.md` | Living tip modules=63 + next Name |
| `doc/goals.md` | Living tip modules=63 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A27 modules=63; Phase L L16 done / L17+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a27-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=63 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=63 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L17+) -- next real library band beyond
modules=63 (inventory remaining vs ~271; next coherent seed importers or
SelfApply dependents when seedable, e.g. SelfApplyFs). Do not flip free. Do not
empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
