# Join: Host library seed expand continue (A32 / plan L21)

**Status:** GREEN (lake + without-lake modules=87 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a32seed081

## Goal met

Grow the real-module seed set beyond Mult..ProductPathWriterPathExecTheorems
modules=81 to Mult..ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+
ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+
ProductPathPerformStep+ProductPathPerformStepTheorems (modules=**87**) on both
import graph and PARTIAL-STRUCTURAL module check **without Lake on the measured
hot path**. HostResidualShrink cites ProductPath ownership/perform pure leaves.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPathWriterPathExecTheorems (prior 81) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* bands |
| `SystemsLean.ProductPathOwnershipInputs` | SelfApplyFs ProductPath pure leaf (B8); no package-local imports |
| `SystemsLean.ProductPathOwnershipInputsTheorems` | imports ProductPathOwnershipInputs only |
| `SystemsLean.ProductPathPerform` | SelfApplyFs ProductPath pure leaf (B9); no package-local imports |
| `SystemsLean.ProductPathPerformTheorems` | imports ProductPathPerform only |
| `SystemsLean.ProductPathPerformStep` | SelfApplyFs ProductPath pure leaf (B10); no package-local imports |
| `SystemsLean.ProductPathPerformStepTheorems` | imports ProductPathPerformStep only |

**How the band was picked:** inventory after A31 (ProductPathWriter* seeded).
SelfApplyFs still imports remaining ProductPath/Capable modules not in seed --
held this slice (not forced full SelfApplyFs). ProductPathOwnershipInputs /
Perform / PerformStep are pure leaves (no package imports); theorems import
parents only. Coherent +6 SelfApplyFs ProductPath ownership/perform foundation
(B8-B10); not full ~270.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for ProductPathOwnership*/Perform* surfaces. **Not** full Lean 4 elaborator
typecheck. Remaining library ~270 - 87 still open. SelfApplyFs still blocked on
remaining ProductPath/Capable deps.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ProductPathOwnershipInputs..PerformStepTheorems seed | +6 modules; seed units label ends +ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=87 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=87; L22+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ProductPathOwnershipInputs..PerformStepTheorems; RealMod leaf/parent edges; acceptCount 87; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=87; length dual-pins; `runModuleCheck` unless ladder includes ProductPathOwnership*/Perform* goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L21 + Open L22+ Host library seed expand continue; trailer L22+/modules=87/A1-A32 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=87 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 87); join a33 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L22+ beyond modules=87; L21 A32 done) |
| `src/systems/self-host.md` | Living tip modules=87 + next Name |
| `doc/goals.md` | Living tip modules=87 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A32 modules=87; Phase L L21 done / L22+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a32-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=87 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=87 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after residual/markdown lockstep)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=81;
  acceptCount == 81; seed label ended ProductPathWriterPathExecTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 87 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=87; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L22+) -- next real library band beyond
modules=87 (inventory remaining vs ~270; SelfApplyFs still blocked on remaining
ProductPath/Capable; more ProductPath/Capable pure leaves; HostFront/Llvm
candidates; pick next coherent seedable band). Do not flip free.
Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
