# Join: Host library seed expand continue (A52 / plan L41)

**Status:** GREEN (lake + without-lake modules=195 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..SelfApplyFs modules=192
to Mult..SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars
(modules=**195**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..SelfApplyFs (prior 192) | prior living seed through SelfApplyFs |
| `SystemsLean.SelfApplyFsTheorems` | parent-only SelfApplyFs (same namespace SelfApplyFs) |
| `SystemsLean.InventoryClose` | SelfApplyFs + LlvmHold (on-disk multi-import) |
| `SystemsLean.ProductPathBars` | CompilePath + KernelEmit + KernelProgram + HostCompose + IrProgram + JoinMap + SelfHost + SurfaceMatrix + SelfApplyFs |

**How the band was picked:** A51 left SelfApplyFsTheorems / InventoryClose /
ProductPathBars as the preferred seed-closed after SelfApplyFs (skip *Main /
HostImportGraph / HostModuleCheck / HostResidualShrink). All three import edges
were already seed-closed after A51; DualResidual free flip held (do not seed
as free-claim theater; ProductPath may still need ProductPathBars for DualResidual
chain later). `set_option maxRecDepth 16384` unchanged.

**RealMod import honesty:** verified with live without-lake order lines:

- SelfApplyFsTheorems <- SelfApplyFs
- InventoryClose <- SelfApplyFs, LlvmHold
- ProductPathBars <- CompilePath, KernelEmit, KernelProgram, HostCompose,
  IrProgram, JoinMap, SelfHost, SurfaceMatrix, SelfApplyFs

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining product library
still open beyond Mult..ProductPathBars.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +3 modules; seed units label ends +SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars; modules=**195** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=195 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=195; L42+; prefer InventoryCloseTheorems / ProductPath) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +SelfApplyFsTheorems+InventoryClose+ProductPathBars; RealMod honesty; acceptCount 195; order edge checks; dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface check; loadOk modules=195; good fixture wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture text for new three |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smoke; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L41 + Open L42+ Host library seed expand continue; Done when >195 |
| `RESIDUAL.md` | Systems Open table + L41 Done + living tip Open floor beyond modules=195 |
| `WATCHER.md` | next `/implement` beyond 195; join a53 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=195 + next Name |
| `doc/goals.md` | Living tip modules=195 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A52 modules=195; Phase L L41 done / L42+ open; Immediate next >195; join a53 |
| `.agents/joins/a52-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice. **Do not flip free** even when DualResidual
becomes seedable after InventoryClose / ProductPath chains.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=195 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=195 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=192;
  SelfApplyFsTheorems / InventoryClose / ProductPathBars not in seed.
- **After:** modules=195; same expandSliceName; without-Lake measured green;
  RealMod edges honest for all three. Floors lockstep >195 / a53.
- Host free / DualResidual free **not** flipped.
- maxRecDepth stayed 16384; no timeout/OOM/maxRecDepth failure.
- After this band, prefer next seed-closed: InventoryCloseTheorems, ProductPath
  (when deps closed); skip DualResidual free-flip theater.

## Next

**Open:** Host library seed expand continue (L42+ beyond modules=195).
Prefer next coherent seed-closed band: **InventoryCloseTheorems** (parent-only),
**ProductPath** (when InventoryClose+ProductPathBars edges closed -- already are).
Skip *Main; HostImportGraph / HostModuleCheck* / HostResidualShrink.
**Do not flip DualResidual free.** DualResidual may become seedable as
PARTIAL-STRUCTURAL only; free claim stays false until A-last plan gate.
