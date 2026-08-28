# Join: Host library seed expand continue (A46 / plan L35)

**Status:** GREEN (lake + without-lake modules=176 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ExtractSubsetEmit modules=165
to Mult..ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText
(modules=**176**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ExtractSubsetEmit (prior 165) | prior living seed through FirstSurface + unit SubsetEmit |
| `SystemsLean.MultSubsetEmit` | FirstSurface + EmitMult |
| `SystemsLean.MultSubsetRebuild` | MultSubsetEmit |
| `SystemsLean.LinearSubsetRebuild` | LinearSubsetEmit |
| `SystemsLean.TypesSubsetRebuild` | TypesSubsetEmit |
| `SystemsLean.ProgramSubsetRebuild` | ProgramSubsetEmit |
| `SystemsLean.GraphSubsetRebuild` | GraphSubsetEmit |
| `SystemsLean.ComposeSubsetRebuild` | ComposeSubsetEmit |
| `SystemsLean.ErasureSubsetRebuild` | ErasureSubsetEmit |
| `SystemsLean.ExtractSubsetRebuild` | ExtractSubsetEmit |
| `SystemsLean.HostFront` | HostTerm + Mult |
| `SystemsLean.LlvmMultText` | Mult + LlvmHold + LlvmEmitPath |

**How the band was picked:** preferred coherent L35 band from A45 review
inventory (all seed-closed after FirstSurface + unit SubsetEmit parents).
MultSubsetEmit opens MultSubsetRebuild. Unit *SubsetRebuild companions close
unit SubsetEmit self-application surfaces. HostFront and LlvmMultText close
preferred multi-import leaves (HostTerm/Mult; Mult/LlvmHold/LlvmEmitPath).
*Main skipped. HostImportGraph / HostModuleCheck* / HostResidualShrink / *Main
were **not** seeded as product targets. SelfApplyFs heavy multi-import deferred.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- MultSubsetEmit <- FirstSurface, EmitMult
- MultSubsetRebuild <- MultSubsetEmit
- LinearSubsetRebuild <- LinearSubsetEmit
- TypesSubsetRebuild <- TypesSubsetEmit
- ProgramSubsetRebuild <- ProgramSubsetEmit
- GraphSubsetRebuild <- GraphSubsetEmit
- ComposeSubsetRebuild <- ComposeSubsetEmit
- ErasureSubsetRebuild <- ErasureSubsetEmit
- ExtractSubsetRebuild <- ExtractSubsetEmit
- HostFront <- HostTerm, Mult
- LlvmMultText <- Mult, LlvmHold, LlvmEmitPath

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 176
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +11 modules; seed units label ends +LlvmMultText; modules=**176** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=176 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=176; L36+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +11; RealMod edges honest; acceptCount 176; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=176; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L35 + Open L36+ Host library seed expand continue; Done when >176 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=176 |
| `WATCHER.md` | next `/implement` beyond 176; join a47 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=176 + next Name |
| `doc/goals.md` | Living tip modules=176 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A46 modules=176; Phase L L35 done / L36+ open; Immediate next >176; join a47 |
| `.agents/joins/a46-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=176 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=176 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=165;
  preferred MultSubsetEmit + unit *SubsetRebuild + HostFront + LlvmMultText
  band not in seed.
- **After:** modules=176; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >176 / a47.
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L36+ beyond modules=176).
Prefer next coherent seed-closed band. Inventory remaining vs ~270 for pure/multi
leaves already seed-closed (skip *Main; HostImportGraph / HostModuleCheck* /
HostResidualShrink; SelfApplyFs heavy multi-import if seed-closed). Join next:
`.agents/joins/a47-host-library-seed-expand-continue.md`.
