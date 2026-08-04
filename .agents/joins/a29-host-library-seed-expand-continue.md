# Join: Host library seed expand continue (A29 / plan L18)

**Status:** GREEN (lake + without-lake modules=71 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a29seed068

## Goal met

Grow the real-module seed set beyond Mult..EmitCompose modules=68 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner
(modules=**71**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit Erasure/Extract/Banner
product seed. DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..EmitCompose (prior 68) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + Parity* + SelfApply + EmitLinear..Compose bands |
| `SystemsLean.EmitErasure` | Product emit shell; imports EmitErasureScaffold only (already seed) |
| `SystemsLean.EmitExtract` | Product emit shell; imports EmitExtractScaffold only |
| `SystemsLean.EmitBanner` | Product emit shell; imports EmitBannerScaffold only |

**How the band was picked:** inventory after A28 (Emit Mult..Compose product seeded).
SelfApplyFs imports many ProductPath/Capable modules **not** in seed -- held this
slice (not forced). Remaining emit product shells EmitErasure/Extract/Banner only
import matching scaffolds already in seed; honest scaffold-import edges; coherent
+3; not full ~270.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + empty product
required-decl lists matching on-disk shell modules (scaffold holds product decls).
**Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 71 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named EmitErasure..EmitBanner seed | +3 modules; seed units label ends +EmitErasure+EmitExtract+EmitBanner |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=71 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=71; L19+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +EmitErasure+EmitExtract+EmitBanner; RealMod scaffold edges; acceptCount 71; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=71; length dual-pins; `runModuleCheck` unless ladder includes EmitErasure..EmitBanner goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Emit product required decls + good fixtures (on-disk shell shape) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Emit product good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L18 + Open L19+ Host library seed expand continue; trailer L19+/modules=71/A1-A29 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=71 (review fix) |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 71); join a30 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L19+ beyond modules=71; L18 A29 done) |
| `src/systems/self-host.md` | Living tip modules=71 + next Name |
| `doc/goals.md` | Living tip modules=71 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A29 modules=71; Phase L L18 done / L19+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a29-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=71 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=71 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Review follow-up (Issue 1)

`RESIDUAL.md` living tip Open primary clause lagged at **beyond modules=68** after
L18 landed modules=71 (open table row and residual-systems were already 71). Fixed
to **beyond modules=71**. Re-ran `just hygiene` GREEN. DualResidual unchanged.

## Open next

**Host library seed expand continue** (L19+) -- next real library band beyond
modules=71 (inventory remaining vs ~270; SelfApplyFs still blocked on ProductPath/
Capable; pick next coherent seedable band). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
