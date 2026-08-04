# Join: Host library seed expand continue (A30 / plan L19)

**Status:** GREEN (lake + without-lake modules=75 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a30seed071

## Goal met

Grow the real-module seed set beyond Mult..EmitBanner modules=71 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems
(modules=**75**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites SelfApplyFs leaf foundation
seed. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..EmitBanner (prior 71) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner bands |
| `SystemsLean.ProductOutKernel` | SelfApplyFs direct leaf dep; no package-local imports |
| `SystemsLean.ProductOutKernelTheorems` | imports ProductOutKernel only |
| `SystemsLean.BootstrapHonesty` | SelfApplyFs direct leaf dep; no package-local imports |
| `SystemsLean.BootstrapHonestyTheorems` | imports BootstrapHonesty only |

**How the band was picked:** inventory after A29 (emit product shells seeded).
SelfApplyFs still imports ProductPath/Capable modules **not** in seed -- held
this slice (not forced). ProductOutKernel and BootstrapHonesty are direct
SelfApplyFs imports that are pure leaves (no package imports); theorems import
parents only. Coherent +4 SelfApplyFs leaf foundation; not full ~270.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for ProductOutKernel/BootstrapHonesty surfaces. **Not** full Lean 4
elaborator typecheck. Remaining library ~270 - 75 still open. SelfApplyFs still
blocked on ProductPath/Capable.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ProductOutKernel..BootstrapHonestyTheorems seed | +4 modules; seed units label ends +ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=75 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=75; L20+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems; RealMod leaf/parent edges; acceptCount 75; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=75; length dual-pins; `runModuleCheck` unless ladder includes ProductOutKernel..BootstrapHonestyTheorems goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L19 + Open L20+ Host library seed expand continue; trailer L20+/modules=75/A1-A30 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=75 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 75); join a31 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L20+ beyond modules=75; L19 A30 done) |
| `src/systems/self-host.md` | Living tip modules=75 + next Name |
| `doc/goals.md` | Living tip modules=75 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A30 modules=75; Phase L L19 done / L20+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a30-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=75 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=75 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L20+) -- next real library band beyond
modules=75 (inventory remaining vs ~270; SelfApplyFs still blocked on ProductPath/
Capable; HostFront/Llvm/Capable leaves candidates; pick next coherent seedable
band). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
