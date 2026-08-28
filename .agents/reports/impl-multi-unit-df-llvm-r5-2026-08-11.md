# Implement report: Multi-unit DF / LLVM deepen (R5)

**Date:** 2026-08-11
**Status:** GREEN
**Name:** Multi-unit DF / LLVM deepen (R5)

## Goal

Advance multi-unit dominance frontier product evidence beyond Mult-only
`multDominanceFrontierDeepen`. Prefer Linear/Types DF dual-pin parallel to Mult.
Keep `llvmCfgFixtureDominanceClaimed` false. Do not forge band Mult..Graph
FullBackend true. free / complete / PROVABLY / FullHost unchanged.

## Design (product deepen)

New role module `SystemsLean.LlvmCfgUnitDf` (same namespace
`SystemsLean.LlvmCfgFixture`):

1. **Parameterized Cytron helpers** (`unitDfParseEdge` / `unitDfIdomOf` /
   `unitDfPredsOf` / `unitDfWalkRunner` / `unitDfCytronFromJoin` /
   `unitDfComputed` / `unitDfSetEq` / `unitDfDedup`) over edges + idom table +
   blocks (shared algorithm path for Linear and Types).
2. **Linear DF:** structural `linearDfTable` (bb_live/bb_reject -> merge);
   `linearDfComputed` via unit helpers; set-eq dual-pin `linearDfAlgorithmOk`;
   join pins `linearDominanceFrontierPartial` + `linearDominanceFrontierDeepen`.
3. **Types DF:** structural `typesDfTable` (four kind arms + check1/check2 ->
   merge; six rows, Mult-shaped); `typesDfComputed` / `typesDfAlgorithmOk`;
   join pins `typesDominanceFrontierPartial` + `typesDominanceFrontierDeepen`.
4. **Multi-unit join:** `multiUnitDominanceFrontierDeepen` =
   Mult deepen && Linear deepen && Types deepen &&
   `multiUnitCfgProductionDeepenTypes` && recipe name &&
   !DominanceClaimed && !production opt.

### Why DominanceClaimed stays false

| Reason | Detail |
|--------|--------|
| Structural idom | Per-band production idom tables remain hand dual-pins, not a proved dominator-tree constructor |
| Not full Mult..Graph DF | Program and Graph bands have no DF dual-pin in this slice |
| Not general pipeline | Fixed unit diamonds only; not arbitrary-graph DF export / multi-join production claim |
| Path B | `dominancePipelineRequiredForFullBackend` remains false; bar (2) already met without DominanceClaimed |

Flipping DominanceClaimed true would need multi-unit general DF pipeline evidence
(Program/Graph + proved idom construction) plus pure Nix forge-ban invert with
lake proof. Out of scope for R5.

## Paths touched

| Path | Role |
|------|------|
| `src/systems/SystemsLean/LlvmCfgUnitDf.lean` | **new** Linear/Types DF + multi-unit join |
| `src/systems/SystemsLean/LlvmCfgFixture.lean` | Import + surface/package join + theorems/smoke |
| `nix/systems-llvm-ir/cfg-multi-unit-dominance-frontier-deepen.nix` | Pure Nix presence + DominanceClaimed forge-ban |
| `nix/systems-llvm-ir/cfg-fixture.nix` | Required path + LlvmCfgUnitDf tokens |
| `nix/systems-llvm-ir/specs.nix` | Join multi-unit DF slice |
| `nix/systems-llvm-ir/default.nix` | Banner mentions multi-unit DF |
| `just/llvm.just` | Linear/Types/multi-unit recipes (**990** lines under Sub-1-KLOC) |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | R5 Done archive + Open join |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` | Next action R1/R2/R3 |

## Pin honesty (mandatory table)

| Pin | After R5 |
|-----|----------|
| `multDominanceFrontierDeepen` | **true** (no regression) |
| `linearDominanceFrontierDeepen` | **true** (new) |
| `typesDominanceFrontierDeepen` | **true** (new) |
| `multiUnitDominanceFrontierDeepen` | **true** (new) |
| `llvmCfgFixtureDominanceClaimed` | **false** (measured; reasons above) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (A-light tip; unchanged) |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| Mult..Graph band `*FullBackendClaimed` | **false** each |
| free / complete / PROVABLY | **unchanged** true |
| FullHostElaborateRemains | **false** (unchanged) |

## Commands + exits

| Command | Exit |
|---------|------|
| `lake build SystemsLean.LlvmCfgUnitDf SystemsLean.LlvmCfgFixture` | **0** |
| `just systems-llvm-ir` | **0** (184 required paths) |
| `just multi-unit-dominance-frontier-deepen` | **0** |
| `just hygiene` | **0** |

## Theorems as tests

`native_decide` theorems in `LlvmCfgFixture`:

- `linearDominanceFrontierPartial_true`
- `linearDfAlgorithmOk_true`
- `linearDominanceFrontierDeepen_true`
- `typesDominanceFrontierPartial_true`
- `typesDfAlgorithmOk_true`
- `typesDominanceFrontierDeepen_true`
- `multiUnitDominanceFrontierDeepen_true`
- existing `multDominanceFrontierDeepen_true` / `llvmCfgFixtureDominanceClaimed_false` (no regression)

## Out of scope (honored)

- DominanceClaimed true
- Band Mult..Graph FullBackend true
- free/complete/PROVABLY/FullHost flips
- Product Rust under `src/`
- Growing product C
- HostModuleCheck package-env (R1)
- Dual examples (R4)

## Next

Remaining Open (disjoint from this track):

1. R1 Package env seed expand
2. R2 FullHost meet progress (reseed after R1; pin false until bar + lake)
3. R3 ParityLinear TERM-SURFACE

Optional later A-heavy: Program/Graph DF dual-pin + proved idom + pure Nix invert
for DominanceClaimed true (operator-held).

## Status

**GREEN** -- multi-unit Mult+Linear+Types DF host evidence deepened with Cytron
algorithm dual-pin; DominanceClaimed stays false with named reasons; gates green.
