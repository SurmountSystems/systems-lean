# Join: Host library seed expand continue (A33 / plan L22)

**Status:** GREEN (lake + without-lake modules=93 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a33seed087

## Goal met

Grow the real-module seed set beyond Mult..ProductPathPerformStepTheorems
modules=87 to Mult..ProductPathPerformStepTheorems+ProductPathReadSsot+
ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+
Capable+CapableTheorems (modules=**93**) on both import graph and
PARTIAL-STRUCTURAL module check **without Lake on the measured hot path**.
HostResidualShrink cites ProductPath ReadSsot/ComposePlan + Capable pure leaves.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPathPerformStepTheorems (prior 87) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* bands |
| `SystemsLean.ProductPathReadSsot` | SelfApplyFs ProductPath pure leaf (B11); no package-local imports |
| `SystemsLean.ProductPathReadSsotTheorems` | imports ProductPathReadSsot only |
| `SystemsLean.ProductPathComposePlan` | SelfApplyFs ProductPath pure leaf (B12); no package-local imports |
| `SystemsLean.ProductPathComposePlanTheorems` | imports ProductPathComposePlan only |
| `SystemsLean.Capable` | SelfApplyFs freestanding-capable gap pure leaf; no package-local imports |
| `SystemsLean.CapableTheorems` | imports Capable only |

**How the band was picked:** inventory after A32 (ProductPathOwnership*/Perform*
seeded). Preferred +6 pure-leaf band ReadSsot + ComposePlan + Capable (+
theorems). All three parents are pure leaves (package imports=0); theorems import
parents only. Coherent SelfApplyFs ProductPath perform READ/COMPOSE foundation
plus Capable gap measure; not full ~270. SelfApplyFs still blocked on remaining
ProductPath/Capable deps (CapableStepContract, InstallOut, OfficialPath,
PerformEvidence, ...).

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for ProductPathReadSsot/ComposePlan/Capable surfaces. **Not** full Lean 4
elaborator typecheck. Remaining library ~270 - 93 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ProductPathReadSsot..CapableTheorems seed | +6 modules; seed units label ends +ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=93 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=93; L23+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ProductPathReadSsot..CapableTheorems; RealMod leaf/parent edges; acceptCount 93; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=93; length dual-pins; `runModuleCheck` unless ladder includes ReadSsot/ComposePlan/Capable goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L22 + Open L23+ Host library seed expand continue; trailer L23+/modules=93/A1-A33 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=93 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 93); join a34 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L23+ beyond modules=93; L22 A33 done) |
| `src/systems/self-host.md` | Living tip modules=93 + next Name |
| `doc/goals.md` | Living tip modules=93 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A33 modules=93; Phase L L22 done / L23+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a33-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=93 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=93 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after residual/markdown lockstep)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=87;
  acceptCount == 87; seed label ended ProductPathPerformStepTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 93 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=93; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L23+) -- next real library band beyond
modules=93 (inventory remaining vs ~270; SelfApplyFs still blocked on remaining
ProductPath/Capable; next candidates CapableStepContract, InstallOut,
OfficialPath, PerformEvidence pure leaves; HostFront/Llvm candidates; pick next
coherent seedable band). Do not flip free.
Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
