# Join: Host library seed expand continue (A28 / plan L17)

**Status:** GREEN (lake + without-lake modules=68 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a28seed063

## Goal met

Grow the real-module seed set beyond Mult..SelfApplyTheorems modules=63 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose
(modules=**68**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit Mult..Compose product
seed. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..SelfApplyTheorems (prior 63) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + Parity* + SelfApply bands |
| `SystemsLean.EmitLinear` | Product emit shell; imports EmitLinearScaffold only (already seed) |
| `SystemsLean.EmitTypes` | Product emit shell; imports EmitTypesScaffold only |
| `SystemsLean.EmitProgram` | Product emit shell; imports EmitProgramScaffold only |
| `SystemsLean.EmitGraph` | Product emit shell; imports EmitGraphScaffold only |
| `SystemsLean.EmitCompose` | Product emit shell; imports EmitComposeScaffold only |

**How the band was picked:** inventory after A27 (SelfApply seeded). SelfApplyFs
imports many ProductPath/Capable modules **not** in seed -- held this slice (not
forced). Remaining Mult..Compose emit product shells only import matching scaffolds
already in seed; honest scaffold-import edges; coherent +5; not full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + empty product
required-decl lists matching on-disk shell modules (scaffold holds product decls).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 68 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named EmitLinear..EmitCompose seed | +5 modules; seed units label ends +EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=68 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=68; L18+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose; RealMod scaffold edges; acceptCount 68; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=68; length dual-pins; `runModuleCheck` unless ladder includes EmitLinear..EmitCompose goods (review fix) |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Emit product required decls + good fixtures (on-disk shell shape) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Emit product good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L17 + Open L18+ Host library seed expand continue; trailer L18+/modules=68/A1-A28 aligned |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 68); join a29 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L18+ beyond modules=68; L17 A28 done) |
| `src/systems/self-host.md` | Living tip modules=68 + next Name |
| `doc/goals.md` | Living tip modules=68 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A28 modules=68; Phase L L17 done / L18+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a28-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=68 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=68 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

### Review follow-up (Issue 1)

Driver `runModuleCheck` fail-closed `unless` ladder now covers EmitLinear, EmitTypes,
EmitProgram, EmitGraph, EmitCompose goods (same shape as SelfApply). Re-ran lake
HostModuleCheck + `just host-module-check-without-lake` + `just hygiene` GREEN
modules=68. DualResidual unchanged.

## Open next

**Host library seed expand continue** (L18+) -- next real library band beyond
modules=68 (inventory remaining vs ~271; SelfApplyFs still blocked on ProductPath/
Capable; prefer EmitErasure/Extract/Banner product shells or other seedable band).
Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
