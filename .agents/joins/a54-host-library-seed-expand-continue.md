# Join: Host library seed expand continue (A54 / plan L43)

**Status:** GREEN (lake + without-lake modules=199 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ProductPath modules=197
to Mult..ProductPath+ProductPathTheorems+DualResidual
(modules=**199**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPath (prior 197) | prior living seed through ProductPath |
| `SystemsLean.ProductPathTheorems` | multi-import ProductPath + path/unit deps (same namespace ProductPath) |
| `SystemsLean.DualResidual` | ProductPath + InventoryClose + SelfApplyFs + LlvmHold (PARTIAL-STRUCTURAL; free claimed false) |

**How the band was picked:** A53 left ProductPathTheorems as preferred seed-closed
after ProductPath (skip *Main / HostImportGraph / HostModuleCheck /
HostResidualShrink). DualResidual is a real library module with seed-closed
deps and is seeded only as PARTIAL-STRUCTURAL with
`hostElaboratorResidualFreeClaimed` left false (do not flip free).

**RealMod import honesty:** verified with live without-lake order lines:

- ProductPathTheorems <- InventoryClose, CompilePath, KernelEmit, KernelProgram,
  HostCompose, IrProgram, JoinMap, SelfHost, SurfaceMatrix, SelfApplyFs,
  LlvmHold, ProductPath
- DualResidual <- ProductPath, InventoryClose, SelfApplyFs, LlvmHold

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining product library
still open beyond Mult..DualResidual.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +2 modules; seed units label ends +ProductPath+ProductPathTheorems+DualResidual; modules=**199** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=199 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual free false | No free flip; `hostElaboratorResidualFreeClaimed := false` unchanged |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=199; L44+; prefer DualResidualTheorems / remaining library; free stays false) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ProductPathTheorems+DualResidual; RealMod honesty; acceptCount 199; order edge checks; dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface check; loadOk modules=199; good fixture wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture text for new two |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smoke; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L43 + Open L44+ Host library seed expand continue; Done when >199 |
| `RESIDUAL.md` | Systems Open table + L43 Done + living tip Open floor beyond modules=199 |
| `WATCHER.md` | next `/implement` beyond 199; join a55 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=199 + next Name |
| `doc/goals.md` | Living tip modules=199 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A54 modules=199; Phase L L43 done / L44+ open; Immediate next >199; join a55 |
| `.agents/joins/a54-host-library-seed-expand-continue.md` | this join |

## DualResidual free unchanged false (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

DualResidual.lean seeded as PARTIAL-STRUCTURAL only. **Do not flip free.**

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=199 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=199 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=197;
  ProductPathTheorems / DualResidual not in seed.
- **After:** modules=199; same expandSliceName; without-Lake measured green;
  RealMod edges honest for both. Floors lockstep >199 / a55.
- Host free / DualResidual free **not** flipped.
- maxRecDepth stayed default; no timeout/OOM/maxRecDepth failure.
- After this band, prefer next seed-closed: DualResidualTheorems (parent DualResidual),
  then remaining library modules. Free claim stays false until A-last plan gate.

## Next

**Open:** Host library seed expand continue (L44+ beyond modules=199).
Prefer next coherent seed-closed band: **DualResidualTheorems** (parent DualResidual),
then remaining product library. Skip *Main; HostImportGraph / HostModuleCheck* /
HostResidualShrink. **Do not flip DualResidual free.**
