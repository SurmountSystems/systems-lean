# Join: Host library seed expand continue (A48 / plan L37)

**Status:** GREEN (lake + without-lake modules=187 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..SubsetPackageJoin modules=183
to Mult..SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite
(modules=**187**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..SubsetPackageJoin (prior 183) | prior living seed through SubsetPackageJoin |
| `SystemsLean.HostGraphTheorems` | HostGraph (theorem companion; ns HostGraph on disk) |
| `SystemsLean.LlvmTypesText` | Types + Mult + LlvmHold + LlvmEmitPath + LlvmMultText + LlvmLinearText |
| `SystemsLean.MultFsDeepen` | MultSubsetRebuild + EmitMult + MultFsWriteTool |
| `SystemsLean.HostPackageWrite` | HostFront + HostGraph + Mult/Linear/Types/Program/Graph/Compose SubsetEmit |

**How the band was picked:** preferred coherent L37 band from A47 review
inventory (all seed-closed after HostGraph / LlvmLinearText / MultFsWriteTool /
unit SubsetEmit parents). SelfApplyFs is seed-closed on imports but deferred for
maxRecDepth / heavy multi-import risk. *Main skipped. HostImportGraph /
HostModuleCheck* / HostResidualShrink were **not** seeded as product targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- HostGraphTheorems <- HostGraph
- LlvmTypesText <- Types, Mult, LlvmHold, LlvmEmitPath, LlvmMultText, LlvmLinearText
- MultFsDeepen <- MultSubsetRebuild, EmitMult, MultFsWriteTool
- HostPackageWrite <- HostFront, HostGraph, MultSubsetEmit, LinearSubsetEmit, TypesSubsetEmit, ProgramSubsetEmit, GraphSubsetEmit, ComposeSubsetEmit

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 187
still open. `set_option maxRecDepth` unchanged this slice.

**Nit scrub:** `RESIDUAL-systems.md` plan-status cell `L35 modules=183 ...`
corrected to `L35 modules=176 MultSubsetEmit+unit *SubsetRebuild+HostFront+LlvmMultText`.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +4 modules; seed units label ends +HostPackageWrite; modules=**187** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=187 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=187; L38+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +4; RealMod edges honest; acceptCount 187; order edge checks; imports dual-pins; fixed duplicate seed prose |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=187; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L37 + Open L38+ Host library seed expand continue; Done when >187; L35 nit scrub |
| `RESIDUAL.md` | Systems Open table + L37 Done + living tip Open floor beyond modules=187 |
| `WATCHER.md` | next `/implement` beyond 187; join a49 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=187 + next Name |
| `doc/goals.md` | Living tip modules=187 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A48 modules=187; Phase L L37 done / L38+ open; Immediate next >187; join a49 |
| `.agents/joins/a48-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=187 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=187 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=183;
  preferred HostGraphTheorems + LlvmTypesText + MultFsDeepen + HostPackageWrite
  band not in seed.
- **After:** modules=187; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >187 / a49.
- Host free / DualResidual free **not** flipped.
- SelfApplyFs deferred (seed-closed on imports; maxRecDepth / heavy multi-import risk).

## Next

**Open:** Host library seed expand continue (L38+ beyond modules=187).
Prefer next coherent seed-closed band. Inventory remaining vs ~270 for pure/multi
leaves already seed-closed (skip *Main; HostImportGraph / HostModuleCheck* /
HostResidualShrink; SelfApplyFs if still seed-closed without maxRecDepth blowup).
Join next: `.agents/joins/a49-host-library-seed-expand-continue.md`.
