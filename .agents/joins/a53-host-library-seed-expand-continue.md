# Join: Host library seed expand continue (A53 / plan L42)

**Status:** GREEN (lake + without-lake modules=197 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ProductPathBars modules=195
to Mult..ProductPathBars+InventoryCloseTheorems+ProductPath
(modules=**197**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPathBars (prior 195) | prior living seed through ProductPathBars |
| `SystemsLean.InventoryCloseTheorems` | SelfApplyFs + LlvmHold + InventoryClose (on-disk multi-import; namespace InventoryClose) |
| `SystemsLean.ProductPath` | InventoryClose + SelfApplyFs + LlvmHold + ProductPathBars |

**How the band was picked:** A52 left InventoryCloseTheorems / ProductPath as the
preferred seed-closed after ProductPathBars (skip *Main / HostImportGraph /
HostModuleCheck / HostResidualShrink). Both import edges were already seed-closed
after A52; DualResidual free flip held (do not seed as free-claim theater).

**RealMod import honesty:** verified with live without-lake order lines:

- InventoryCloseTheorems <- SelfApplyFs, LlvmHold, InventoryClose
- ProductPath <- InventoryClose, SelfApplyFs, LlvmHold, ProductPathBars

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining product library
still open beyond Mult..ProductPath.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +2 modules; seed units label ends +ProductPathBars+InventoryCloseTheorems+ProductPath; modules=**197** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=197 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=197; L43+; prefer ProductPathTheorems / DualResidual structural only with free false) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +InventoryCloseTheorems+ProductPath; RealMod honesty; acceptCount 197; order edge checks; dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface check; loadOk modules=197; good fixture wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture text for new two |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smoke; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L42 + Open L43+ Host library seed expand continue; Done when >197 |
| `RESIDUAL.md` | Systems Open table + L42 Done + living tip Open floor beyond modules=197 |
| `WATCHER.md` | next `/implement` beyond 197; join a54 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=197 + next Name |
| `doc/goals.md` | Living tip modules=197 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A53 modules=197; Phase L L42 done / L43+ open; Immediate next >197; join a54 |
| `.agents/joins/a53-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice. **Do not flip free** even when DualResidual
becomes seedable after ProductPath chains.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=197 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=197 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=195;
  InventoryCloseTheorems / ProductPath not in seed.
- **After:** modules=197; same expandSliceName; without-Lake measured green;
  RealMod edges honest for both. Floors lockstep >197 / a54.
- Host free / DualResidual free **not** flipped.
- maxRecDepth stayed 16384; no timeout/OOM/maxRecDepth failure.
- After this band, prefer next seed-closed: ProductPathTheorems (parent ProductPath),
  DualResidual structural seed only if free claimed stays false.

## Next

**Open:** Host library seed expand continue (L43+ beyond modules=197).
Prefer next coherent seed-closed band: **ProductPathTheorems** (parent ProductPath),
**DualResidual** only as PARTIAL-STRUCTURAL seed with free claimed false.
Skip *Main; HostImportGraph / HostModuleCheck* / HostResidualShrink.
**Do not flip DualResidual free.** DualResidual may become seedable as
PARTIAL-STRUCTURAL only; free claim stays false until A-last plan gate.
