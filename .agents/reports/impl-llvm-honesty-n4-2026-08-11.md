# Implement report: DominanceClaimed or band FullBackend honesty (N4)

**Date:** 2026-08-11
**Status:** GREEN
**Name:** DominanceClaimed or band FullBackend honesty (N4)

## Goal

Honest LLVM deepen beyond R5 multi-unit Mult+Linear+Types DF without forging
`llvmCfgFixtureDominanceClaimed` or band Mult..Graph `*FullBackendClaimed` true.
`multiUnitDominanceFrontierDeepen` already true from R5 is **not** DominanceClaimed.

## Design (option A product deepen)

Extend `SystemsLean.LlvmCfgUnitDf` with Program and Graph DF dual-pins parallel
to Linear/Types (shared `unitDf*` Cytron helpers already in the module):

1. **Program DF:** structural `programDfTable` (bb_ok/bb_bad/bb_full/bb_reject +
   check1/check2 -> merge; six rows, Mult/Types shape); `programDfComputed` via
   unit helpers; set-eq dual-pin `programDfAlgorithmOk`; join pins
   `programDominanceFrontierPartial` + `programDominanceFrontierDeepen`.
2. **Graph DF:** structural `graphDfTable` (bb_ok/bb_fail/bb_reject + check1 ->
   merge; four rows); `graphDfComputed` / `graphDfAlgorithmOk`; join pins
   `graphDominanceFrontierPartial` + `graphDominanceFrontierDeepen`.
3. **Multi-unit join upgrade:** `multiUnitDominanceFrontierDeepen` =
   Mult + Linear + Types + **Program** + **Graph** deepen &&
   `multiUnitCfgProductionDeepenGraph` && recipe name &&
   !DominanceClaimed && !production opt.
   (Was Mult+Linear+Types + multiUnitCfgProductionDeepenTypes after R5.)

### Why DominanceClaimed stays false

| Reason | Detail |
|--------|--------|
| Structural idom | Per-band production idom tables remain hand dual-pins, not a proved dominator-tree constructor |
| Fixed unit diamonds | Mult..Graph DF covers unit SSA diamonds only; not arbitrary-graph DF export / multi-join production pipeline |
| Path B | `dominancePipelineRequiredForFullBackend` remains false; bar (2) already met without DominanceClaimed |
| Forge ban | Pure Nix `cfg-multi-unit-dominance-frontier-deepen.nix` forbids `def llvmCfgFixtureDominanceClaimed : Bool := true` |

Flipping DominanceClaimed true would need proved idom construction + general DF
pipeline evidence plus pure Nix forge-ban invert with lake proof. Out of scope;
operator-held A-heavy / XL.

### Why band FullBackend stays false

Each band `llvm*SsaFullBackendClaimed` remains **false** by design (partial SSA
lower + fixture tip A-light only). Tip `llvmCfgFixtureFullBackendClaimed` **true**
is not band FullBackend true. No honesty redesign of pure Nix forge-bans this wave.

## Paths touched

| Path | Role |
|------|------|
| `src/systems/SystemsLean/LlvmCfgUnitDf.lean` | Program/Graph DF + multi-unit Mult..Graph join |
| `src/systems/SystemsLean/LlvmCfgFixture.lean` | Surface/package join + theorems/smoke |
| `nix/systems-llvm-ir/cfg-multi-unit-dominance-frontier-deepen.nix` | Pure Nix presence + DominanceClaimed forge-ban + Program/Graph tokens |
| `nix/systems-llvm-ir/default.nix` | Banner Mult..Graph DF |
| `just/llvm.just` | Program/Graph recipes; multi-unit deps (**996** under Sub-1-KLOC) |
| `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` | Reseed N4 |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | N4 Done + Open N1-N3 |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` | Next N1-N3 |

## Pin honesty (mandatory table)

| Pin | After N4 |
|-----|----------|
| `multDominanceFrontierDeepen` | **true** (no regression) |
| `linearDominanceFrontierDeepen` | **true** (no regression) |
| `typesDominanceFrontierDeepen` | **true** (no regression) |
| `programDominanceFrontierDeepen` | **true** (new) |
| `graphDominanceFrontierDeepen` | **true** (new) |
| `multiUnitDominanceFrontierDeepen` | **true** (now Mult..Graph) |
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
| `just systems-llvm-ir` | **0** (186 required paths) |
| `just multi-unit-dominance-frontier-deepen` | **0** |
| `just hygiene` | **0** |

## Theorems as tests

`native_decide` theorems in `LlvmCfgFixture`:

- `programDominanceFrontierPartial_true`
- `programDfAlgorithmOk_true`
- `programDominanceFrontierDeepen_true`
- `graphDominanceFrontierPartial_true`
- `graphDfAlgorithmOk_true`
- `graphDominanceFrontierDeepen_true`
- `multiUnitDominanceFrontierDeepen_true` (still true after Mult..Graph join)
- existing `llvmCfgFixtureDominanceClaimed_false` (no regression)

## Sub-1-KLOC

| File | Lines |
|------|-------|
| `LlvmCfgUnitDf.lean` | 550 |
| `LlvmCfgFixture.lean` | 617 |
| `just/llvm.just` | 996 |

## Out of scope (honored)

- DominanceClaimed true
- Band Mult..Graph FullBackend true
- free/complete/PROVABLY/FullHost flips
- Product Rust under `src/`
- HostModuleCheck package-env (N1)
- FullHost meet (N2)
- Inventing mathlib

## Next

Remaining Open (disjoint from this track):

1. N1 Package env seed expand (prefer ParityLinear package-env)
2. N2 FullHost meet progress (reseed after N1; pin false until bar+lake)
3. N3 Next named unit TERM-SURFACE (optional; honest no-unit OK)

Optional later A-heavy: proved idom constructor + pure Nix invert for
DominanceClaimed true (operator-held; not auto Open).

## Status

**GREEN** -- Program+Graph DF host evidence deepened; multiUnit Mult..Graph DF
join true; DominanceClaimed stays false with named reasons; band FullBackend
false; free/complete/PROVABLY/FullHost unchanged; gates green.
