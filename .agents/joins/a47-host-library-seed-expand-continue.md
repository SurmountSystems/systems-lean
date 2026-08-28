# Join: Host library seed expand continue (A47 / plan L36)

**Status:** GREEN (lake + without-lake modules=183 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..LlvmMultText modules=176
to Mult..LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin
(modules=**183**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..LlvmMultText (prior 176) | prior living seed through HostFront + LlvmMultText |
| `SystemsLean.HostFrontTheorems` | HostFront (theorem companion; ns HostFront on disk) |
| `SystemsLean.HostCheck` | HostFront |
| `SystemsLean.HostGraph` | HostFront + HostTerm |
| `SystemsLean.LlvmLinearText` | Linear + LlvmHold + LlvmEmitPath + LlvmMultText |
| `SystemsLean.MultFsWriteTool` | MultSubsetEmit |
| `SystemsLean.FrontMultPackage` | SubsetFront + MultSubsetEmit + MultSubsetRebuild |
| `SystemsLean.SubsetPackageJoin` | Mult/Linear/Types/Program/Extract/Erasure/Graph/Compose SubsetRebuild |

**How the band was picked:** preferred coherent L36 band from A46 review
inventory (all seed-closed after HostFront / LlvmMultText / unit SubsetRebuild
parents). SelfApplyFs is seed-closed on imports but deferred for maxRecDepth /
heavy multi-import risk. *Main skipped. HostImportGraph / HostModuleCheck* /
HostResidualShrink were **not** seeded as product targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- HostFrontTheorems <- HostFront
- HostCheck <- HostFront
- HostGraph <- HostFront, HostTerm
- LlvmLinearText <- Linear, LlvmHold, LlvmEmitPath, LlvmMultText
- MultFsWriteTool <- MultSubsetEmit
- FrontMultPackage <- SubsetFront, MultSubsetEmit, MultSubsetRebuild
- SubsetPackageJoin <- MultSubsetRebuild, LinearSubsetRebuild, TypesSubsetRebuild, ProgramSubsetRebuild, ExtractSubsetRebuild, ErasureSubsetRebuild, GraphSubsetRebuild, ComposeSubsetRebuild

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 183
still open. `set_option maxRecDepth` unchanged this slice.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +7 modules; seed units label ends +SubsetPackageJoin; modules=**183** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=183 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=183; L37+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +7; RealMod edges honest; acceptCount 183; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=183; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L36 + Open L37+ Host library seed expand continue; Done when >183 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=183 |
| `WATCHER.md` | next `/implement` beyond 183; join a48 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=183 + next Name |
| `doc/goals.md` | Living tip modules=183 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A47 modules=183; Phase L L36 done / L37+ open; Immediate next >183; join a48 |
| `.agents/joins/a47-host-library-seed-expand-continue.md` | this join |
| `.agents/reports/review-a46-seed-176.md` | tone scrub (banned token) for hygiene |

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
just host-import-graph-without-lake   # GREEN modules=183 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=183 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after tone scrub on a46 review)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=176;
  preferred HostFrontTheorems + HostCheck + HostGraph + LlvmLinearText +
  MultFsWriteTool + FrontMultPackage + SubsetPackageJoin band not in seed.
- **After:** modules=183; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >183 / a48.
- Host free / DualResidual free **not** flipped.
- SelfApplyFs deferred (seed-closed on imports; maxRecDepth / heavy multi-import risk).

## Next

**Open:** Host library seed expand continue (L37+ beyond modules=183).
Prefer next coherent seed-closed band. Inventory remaining vs ~270 for pure/multi
leaves already seed-closed (skip *Main; HostImportGraph / HostModuleCheck* /
HostResidualShrink; SelfApplyFs if still seed-closed without maxRecDepth blowup).
Join next: `.agents/joins/a48-host-library-seed-expand-continue.md`.
