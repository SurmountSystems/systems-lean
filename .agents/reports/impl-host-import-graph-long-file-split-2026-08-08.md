# Implement report: HostImportGraph long-file split

**Date:** 2026-08-08
**SCORE:** fail=0

## Goal

Pay Sub-1-KLOC on `src/systems/SystemsLean/HostImportGraph.lean` (~4875 lines)
by extracting coherent role companions. Same namespace
`SystemsLean.HostImportGraph`. Thorough red/green TDD for wiring contracts.
No free / FullHost / proof complete / product free+complete pin flips.

## Line counts (before -> after)

| File | Before | After |
|------|--------|------:|
| `HostImportGraph.lean` (tip hub) | **4875** | **43** |
| `HostImportGraphMain.lean` | 17 | 17 |

### New companions (all under 1000)

| Companion | Lines | Role |
|-----------|------:|------|
| `HostImportGraphSeeds` | 712 | Stage ids, seed module/path lists, honesty pins, reject reasons |
| `HostImportGraphModel` | 235 | RealMod, ImportGraphResult, parse helpers, resolveImportGraph |
| `HostImportGraphMods` | 773 | RealMod fixtures Mult through StepContractFullTheorems |
| `HostImportGraphModsLater` | 767 | Later RealMod fixtures + good/bad expand seeds |
| `HostImportGraphLoadOk` | 995 | LoadOk dual-pin fold + readiness / without-Lake pins |
| `HostImportGraphTheorems` | 171 | HOST-IMPORT-GRAPH-THEOREM + SMOKE |
| `HostImportGraphWalk` | 999 | checkImportOrderEdges on-disk order edge honesty |
| `HostImportGraphDriver` | 136 | filterArgs, loadMultImportGraph, runImportGraph, main |

**Sub-1-KLOC:** every `HostImportGraph*.lean` product module is under 1000.
Tip is import hub only.

## Method

1. Opened residual Name **HostImportGraph long-file split** with checkable Done when.
2. **RED (observed):** added 8 companion paths to pure Nix host-leans + required-files
   before files existed; `just systems-host` failed missing-file for each companion.
3. Extracted role companions from staged living tip (4875-line HostImportGraph);
   tip rewritten as import hub (surgical role extract, not naive half-cut).
4. Walk: lifted accept-branch edge checks into `checkImportOrderEdges`; driver
   calls walk then printOrder.
5. Harness honesty: HostResidualShrink partition **20 -> 28**; dual-pin theorems
   and just host-residual-shrink greps.
6. Pure Nix host-specs-compile-path-3: hub shell tokens + per-companion specs.
7. just host-import-graph / host-import-graph-without-lake: family_mods greps.
8. HostModuleCheck hub presence lag: restored greppable
   `Host elaborator residual remains` (no claim flip).
9. Residual lockstep: Done archive, Open empty, RESIDUAL.md join, WATCHER,
   SESSION-HANDOFF.

## RED evidence

| Named contract | Command | Fail |
|----------------|---------|------|
| Companion files present for required host paths | `just systems-host` | missing HostImportGraphSeeds/Model/Mods/ModsLater/LoadOk/Theorems/Walk/Driver |

## GREEN evidence

| Command | Exit |
|---------|------|
| `lake build` HostImportGraph family + HostResidualShrink + HostResidualShrinkTheorems + slake-host-import-graph | **0** |
| `just host-import-graph-without-lake` | **0** (GREEN; modules=206) |
| `just host-residual-shrink` | **0** (GREEN) |
| `just systems-host` | **0** (241 required paths) |
| `just hygiene` | **0** (GREEN) |

## Claim honesty (unchanged)

| Pin | Value |
|-----|-------|
| DualResidual `hostElaboratorResidualRemains` | **false** |
| DualResidual `hostElaboratorResidualFreeClaimed` | **true** |
| HostResidualShrink FullHostElaborateRemains | **false** |
| SpecProof `proofCompleteClaimed` | **true** |
| product free / complete / PROVABLY | true / true / true |
| product StillUsesLake / DependsOnLake | false |
| `llvmUnlocked` | **true** (not full backend claim) |
| modules=206 seed | unchanged |
| HostImportGraph local host free / residual remains | false / true |

## Out of scope (honored)

- Full elaborator parity / real elaborator judgments / mathlib
- Full LLVM backend / Rust-native link
- free/complete/PROVABLY/FullHost/proof pin flips
- Product C/shell growth; mass find-replace; stitch marks; naive half-cuts

## Residual after

Open empty done-for-now. No further HostImportGraph Sub-1-KLOC residual.
Held tracks stay held. Summary: `/tmp/grok-1000/grok-impl-summary-higpeel08.md`.

**Standing stop rules (living tip / WATCHER, not Open Names):** FixtureTextsLater
~999 headroom; HostImportGraphWalk ~999 / HostImportGraphLoadOk ~995 headroom;
on-touch Sub-1-KLOC. Held only with operator promote: full elaborator parity /
Full LLVM / Rust-native link / mathlib.

**Review closeout:** general APPROVE fail=0; tests APPROVE fail=0; plan re-review
APPROVE fail=0 after residual lockstep (standing rules + RESIDUAL.md living tip).
Mop pass `/tmp/grok-1000/grok-process-mop-higpeel08.md`. Final:
`/tmp/grok-1000/grok-final-report-higpeel08.md`.
