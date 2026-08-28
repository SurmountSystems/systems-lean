# Join: Host library seed expand continue (A45 / plan L34)

**Status:** GREEN (lake + without-lake modules=165 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..SubsetFront modules=157
to Mult..SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit
(modules=**165**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..SubsetFront (prior 157) | prior living seed through preferred multi/pure leaves |
| `SystemsLean.FirstSurface` | CompilePathMult |
| `SystemsLean.LinearSubsetEmit` | CompilePathLinear + EmitLinear |
| `SystemsLean.TypesSubsetEmit` | CompilePathTypes + EmitTypes |
| `SystemsLean.ProgramSubsetEmit` | CompilePathProgram + EmitProgram |
| `SystemsLean.GraphSubsetEmit` | CompilePathGraph + EmitGraph |
| `SystemsLean.ComposeSubsetEmit` | CompilePathCompose + EmitCompose |
| `SystemsLean.ErasureSubsetEmit` | CompilePathErasure + EmitErasure |
| `SystemsLean.ExtractSubsetEmit` | CompilePathExtract + EmitExtract |

**How the band was picked:** preferred coherent L34 band from A44 review
inventory (all seed-closed after CompilePath* unit band). FirstSurface opens
MultSubsetEmit next. Unit SubsetEmit companions close CompilePath* emit
surfaces and unlock *SubsetRebuild parents. HostFront / LlvmMultText /
SelfApplyFs deferred to later slices. *Main skipped. HostImportGraph /
HostModuleCheck* / HostResidualShrink / *Main were **not** seeded as product
targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- FirstSurface <- CompilePathMult
- LinearSubsetEmit <- CompilePathLinear, EmitLinear
- TypesSubsetEmit <- CompilePathTypes, EmitTypes
- ProgramSubsetEmit <- CompilePathProgram, EmitProgram
- GraphSubsetEmit <- CompilePathGraph, EmitGraph
- ComposeSubsetEmit <- CompilePathCompose, EmitCompose
- ErasureSubsetEmit <- CompilePathErasure, EmitErasure
- ExtractSubsetEmit <- CompilePathExtract, EmitExtract

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 165
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +8 modules; seed units label ends +ExtractSubsetEmit; modules=**165** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=165 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=165; L35+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +8; RealMod edges honest; acceptCount 165; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=165; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L34 + Open L35+ Host library seed expand continue; Done when >165 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=165 |
| `WATCHER.md` | next `/implement` beyond 165; join a46 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=165 + next Name |
| `doc/goals.md` | Living tip modules=165 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A45 modules=165; Phase L L34 done / L35+ open; Immediate next >165; join a46 |
| `.agents/joins/a45-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=165 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=165 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=157;
  preferred FirstSurface + unit SubsetEmit band not in seed.
- **After:** modules=165; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >165 / a46.
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L35+ beyond modules=165).
Prefer next coherent seed-closed band. Inventory remaining vs ~270 for pure/multi
leaves already seed-closed (HostFront, LlvmMultText, MultSubsetEmit after
FirstSurface; SelfApplyFs heavy multi-import if desired; skip *Main;
HostImportGraph / HostModuleCheck* / HostResidualShrink). Join next:
`.agents/joins/a46-host-library-seed-expand-continue.md`.
