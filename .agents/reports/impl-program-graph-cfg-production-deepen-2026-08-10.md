# Implement report: R1d Program + Graph SSA CFG production dual-pin

**IMPL_ID:** fullready-r1d-20260810092500
**Date:** 2026-08-10
**Status:** GREEN

## Goal

Beyond Mult/Linear/Types unit diamonds: dual-pin Program and Graph SSA CFG
production shape vs generator-owned `out/llvm-ir/slake_program_ssa.ll` and
`slake_graph_ssa.ll` in host Lean `SystemsLean.LlvmCfgFixture`, with pure Nix +
just recipes. fullBackend / production opt / DominanceClaimed stay false.

## What landed

### Host Lean (`src/systems/SystemsLean/LlvmCfgFixture.lean`)

**Program SSA push-status (four-pred merge phi, matches LL):**

| Def | Role |
|-----|------|
| `programSsaCfgBlocks` | 8 labels: entry/check1/check2/bb_ok/bb_bad/bb_full/bb_reject/merge |
| `programSsaCfgEdges` | 10 edges matching `br` targets in `slake_program_ssa_push_status` |
| `programProductionIdomTable` | Structural idom table; merge:entry |
| `programMergeIdomIsEntry` | Merge idom honesty |
| `programMergePhiPredsFour` | Four-pred phi: bb_ok/bb_bad/bb_full/bb_reject |
| `programSsaCfgDualPin` | Inventory + `LlvmProgramSsa` peer ready; local fullBackend/cfgProduction false |
| `programCfgProductionDeepen` | Join of above + recipe name; pins false |
| `multiUnitCfgProductionDeepenProgram` | Mult+Linear+Types+Program join |

**Graph SSA addEdge-status (three-pred merge phi, matches LL):**

| Def | Role |
|-----|------|
| `graphSsaCfgBlocks` | 6 labels: entry/check1/bb_ok/bb_fail/bb_reject/merge |
| `graphSsaCfgEdges` | 7 edges matching `br` targets in `slake_graph_ssa_add_edge_status` |
| `graphProductionIdomTable` | Structural idom table; merge:entry |
| `graphMergeIdomIsEntry` | Merge idom honesty |
| `graphMergePhiPredsThree` | Three-pred phi: bb_ok/bb_fail/bb_reject |
| `graphSsaCfgDualPin` | Inventory + `LlvmGraphSsa` peer ready; local fullBackend/cfgProduction false |
| `graphCfgProductionDeepen` | Join of above + recipe name; pins false |
| `multiUnitCfgProductionDeepenGraph` | Mult..Program+Graph join |

Surface / package / ready canaries include Program+Graph bands. Theorems + smoke
examples dual-pin true. Pins remain:

- `llvmCfgFixtureFullBackendClaimed = false`
- `llvmCfgFixtureProductionOptClaimed = false`
- `llvmCfgFixtureDominanceClaimed = false`

Greppable tokens: `PROGRAM-CFG-PRODUCTION-DEEPEN`, `GRAPH-CFG-PRODUCTION-DEEPEN`,
`MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM`, `MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH`.

### Pure Nix

- `nix/systems-llvm-ir/cfg-program-production-deepen.nix`
- `nix/systems-llvm-ir/cfg-graph-production-deepen.nix`
- Joined in `nix/systems-llvm-ir/specs.nix`
- Banner honesty in `nix/systems-llvm-ir/default.nix`

### Just recipes (`just/llvm.just`)

- `just program-cfg-production-deepen` (systems-llvm-ir + lake LlvmCfgFixture + optional Program SSA llvm-as)
- `just graph-cfg-production-deepen` (systems-llvm-ir + lake LlvmCfgFixture + optional Graph SSA llvm-as)

### Durable prose

- Bar: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` (R1d done)
- Residual Done + Open status: `RESIDUAL-systems.md`
- Join board: `RESIDUAL.md`
- Reseed: `doc/SESSION-HANDOFF.md`
- Next action: `WATCHER.md`

## Evidence (commands)

| Command | Result |
|---------|--------|
| `lake build SystemsLean.LlvmCfgFixture` | exit 0 (38 jobs) |
| `just systems-llvm-ir` | GREEN (Program + Graph CFG dual-pin in banner) |
| `just program-cfg-production-deepen` | GREEN (+ Program SSA llvm-as) |
| `just graph-cfg-production-deepen` | GREEN (+ Graph SSA llvm-as) |
| `just hygiene` | GREEN |

## Long-file honesty

`LlvmCfgFixture.lean` is **~1145 lines** after R1d (over Sub-1-KLOC bar of 1000).
Landed R1d with checkable Done when; open residual for long-file split of this
module remains honest standing work (not a forge claim). Do not treat this as
license to grow further without a named split residual.

## Non-claims (unchanged)

- free / complete / PROVABLY
- FullHostElaborateRemains
- fullBackend / production opt / DominanceClaimed (full DF pipeline)
- Types/Program/Graph foreign link
- General CFG builder beyond five unit diamonds
- R1e fullBackend claim true

## Next progressive (WATCHER)

General CFG construction posture beyond five unit diamonds, and/or honesty
review residual toward R1e fullBackend (stays false until bar complete). Optional
capacity: Types foreign R2, R3 dual, R5 mop.
