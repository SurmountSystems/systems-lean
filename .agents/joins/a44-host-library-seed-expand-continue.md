# Join: Host library seed expand continue (A44 / plan L33)

**Status:** GREEN (lake + without-lake modules=157 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..CompilePathExtract modules=153
to Mult..CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront
(modules=**157**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..CompilePathExtract (prior 153) | prior living seed through CompilePath* unit band |
| `SystemsLean.ProductWireWriteTool` | CapableWriteHc + InstallOut |
| `SystemsLean.HostTerm` | Mult |
| `SystemsLean.LlvmEmitPath` | LlvmHold |
| `SystemsLean.SubsetFront` | CompilePath + IrProgram + Types + Mult |

**How the band was picked:** preferred held band from A43 join (all seed-closed
after prior emit / CapableWriteHc / LlvmHold / CompilePath seed). No *Theorems
companions for these four modules on disk. *Main skipped. HostImportGraph /
HostModuleCheck* / HostResidualShrink / *Main were **not** seeded as product
targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- ProductWireWriteTool <- CapableWriteHc, InstallOut
- HostTerm <- Mult
- LlvmEmitPath <- LlvmHold
- SubsetFront <- CompilePath, IrProgram, Types, Mult

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 157
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +4 modules; seed units label ends +SubsetFront; modules=**157** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=157 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=157; L34+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +4; RealMod edges honest; acceptCount 157; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=157; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L33 + Open L34+ Host library seed expand continue; Done when >157 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=157 |
| `WATCHER.md` | next `/implement` beyond 157; join a45 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=157 + next Name |
| `doc/goals.md` | Living tip modules=157 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A44 modules=157; Phase L L33 done / L34+ open; Immediate next >157; join a45 |
| `.agents/joins/a44-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=157 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=157 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=153;
  preferred ProductWireWriteTool / HostTerm / LlvmEmitPath / SubsetFront not in seed.
- **After:** modules=157; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >157 / a45.
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L34+ beyond modules=157).
Prefer next coherent seed-closed band. Inventory remaining vs ~270 for pure/multi
leaves already seed-closed (skip *Main; HostImportGraph / HostModuleCheck* /
HostResidualShrink). Join next:
`.agents/joins/a45-host-library-seed-expand-continue.md`.
