# Join: Host library seed expand continue (A31 / plan L20)

**Status:** GREEN (lake + without-lake modules=81 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a31seed075

## Goal met

Grow the real-module seed set beyond Mult..BootstrapHonesty modules=75 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems
(modules=**81**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ProductPath writer pure
leaves. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..BootstrapHonestyTheorems (prior 75) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty bands |
| `SystemsLean.ProductPathWriterSurface` | SelfApplyFs ProductPath writer pure leaf (B5); no package-local imports |
| `SystemsLean.ProductPathWriterSurfaceTheorems` | imports ProductPathWriterSurface only |
| `SystemsLean.ProductPathWriterPathPlan` | SelfApplyFs ProductPath writer pure leaf (B6); no package-local imports |
| `SystemsLean.ProductPathWriterPathPlanTheorems` | imports ProductPathWriterPathPlan only |
| `SystemsLean.ProductPathWriterPathExec` | SelfApplyFs ProductPath writer pure leaf (B7); no package-local imports |
| `SystemsLean.ProductPathWriterPathExecTheorems` | imports ProductPathWriterPathExec only |

**How the band was picked:** inventory after A30 (ProductOutKernel+BootstrapHonesty
seeded). SelfApplyFs still imports remaining ProductPath/Capable modules not in
seed -- held this slice (not forced full SelfApplyFs). ProductPathWriterSurface /
PathPlan / PathExec are pure leaves (no package imports); theorems import parents
only. Coherent +6 SelfApplyFs ProductPath writer foundation (B5-B7); not full ~270.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for ProductPathWriter* surfaces. **Not** full Lean 4 elaborator typecheck.
Remaining library ~270 - 81 still open. SelfApplyFs still blocked on remaining
ProductPath/Capable deps.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ProductPathWriterSurface..PathExecTheorems seed | +6 modules; seed units label ends +ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=81 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=81; L21+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ProductPathWriterSurface..PathExecTheorems; RealMod leaf/parent edges; acceptCount 81; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=81; length dual-pins; `runModuleCheck` unless ladder includes ProductPathWriter* goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L20 + Open L21+ Host library seed expand continue; trailer L21+/modules=81/A1-A31 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=81 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 81); join a32 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L21+ beyond modules=81; L20 A31 done) |
| `src/systems/self-host.md` | Living tip modules=81 + next Name |
| `doc/goals.md` | Living tip modules=81 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A31 modules=81; Phase L L20 done / L21+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a31-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=81 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=81 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L21+) -- next real library band beyond
modules=81 (inventory remaining vs ~270; SelfApplyFs still blocked on remaining
ProductPath/Capable; more ProductPathOwnershipInputs/Perform/Capable pure leaves;
HostFront/Llvm candidates; pick next coherent seedable band). Do not flip free.
Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
