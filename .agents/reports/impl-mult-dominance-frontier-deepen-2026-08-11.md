# Implement report: Mult dominance frontier deepen

**Date:** 2026-08-11
**Status:** GREEN
**Name:** Mult dominance frontier deepen (heavier-LLVM first slice / Track P5)

## Goal

Deepen Mult dominance frontier host evidence beyond the structural DF table
partial (R1c). Prefer honest algorithm dual-pin. Keep
`llvmCfgFixtureDominanceClaimed` false unless a full multi-unit DF pipeline
is ready (it is not). Do not forge band Mult..Graph FullBackend true.
free / complete / PROVABLY / FullHost unchanged.

## Design (algorithm + measured partial)

Structural `multDfTable` (R1c) stays. Deepen adds a **Cytron-style** Mult DF
walk over Mult SSA inventory already dual-pinned to `slake_mult_ssa.ll`:

1. Parse `multSsaCfgEdges` (`src->tgt`) and `productionIdomTable` (`block:idom`).
2. For each Mult SSA block with two or more predecessors (here: `merge` with
   four grade-arm preds), walk each pred up the idom chain until the join
   idom (`entry`), emitting `node:join` rows.
3. Dedup; set-equality dual-pin against structural `multDfTable`.
4. Join bool `multDominanceFrontierDeepen` =
   partial && algorithm ok && recipe name && !DominanceClaimed && !production opt.

Computed rows match the structural six: grade arms + check1/check2 map to
`merge`; entry is excluded (strict dominate of merge via `merge:entry` idom).

### Why DominanceClaimed stays false

| Reason | Detail |
|--------|--------|
| Mult-band only | Algorithm runs on Mult SSA fixed diamond, not multi-unit Mult..Graph DF |
| Structural idom | `productionIdomTable` is still a hand dual-pin table, not a proved dominator tree constructor |
| Not full pipeline | No general arbitrary-graph DF export / multi-join production claim |
| Path B | `dominancePipelineRequiredForFullBackend` remains false; bar (2) already met without DominanceClaimed |

Flipping DominanceClaimed true would need multi-unit / general DF pipeline
evidence plus pure Nix forge-ban invert with lake proof. Out of scope for this
first deepen slice.

## Paths touched

| Path | Role |
|------|------|
| `src/systems/SystemsLean/LlvmCfgMultDf.lean` | Cytron helpers + `multDfComputed` + `multDfAlgorithmOk` + `multDominanceFrontierDeepen` |
| `src/systems/SystemsLean/LlvmCfgFixture.lean` | Surface/package join + theorems + smoke |
| `nix/systems-llvm-ir/cfg-mult-dominance-frontier-deepen.nix` | Pure Nix presence + DominanceClaimed forge-ban |
| `nix/systems-llvm-ir/specs.nix` | Join deepen slice |
| `nix/systems-llvm-ir/default.nix` | Banner mentions Cytron deepen |
| `just/llvm.just` | `mult-dominance-frontier-deepen` (deps partial; module **999** lines) |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | Done archive + Open join |
| `WATCHER.md` | Mult DF removed from remaining Open list |

## Pin honesty

| Pin | After deepen |
|-----|----------------|
| `multDominanceFrontierPartial` | **true** (no regression) |
| `multDfAlgorithmOk` | **true** (new) |
| `multDominanceFrontierDeepen` | **true** (new) |
| `llvmCfgFixtureDominanceClaimed` | **false** (measured; reasons above) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (A-light tip; unchanged) |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| Mult..Graph band `*FullBackendClaimed` | **false** each |
| free / complete / PROVABLY | **unchanged** |
| FullHostElaborateRemains | **false** (unchanged) |

## Commands + exits

| Command | Exit |
|---------|------|
| `lake build SystemsLean.LlvmCfgMultDf SystemsLean.LlvmCfgFixture` | **0** |
| `just systems-llvm-ir` | **0** (176 required paths) |
| `just mult-dominance-frontier-deepen` | **0** |
| `just mult-dominance-frontier-partial` | **0** (via deepen dep) |
| `just hygiene` | **0** on Mult DF tree (all touched files ASCII-clean). Full-repo hygiene may fail on concurrent package-env `HostModuleCheckPackageEnv.lean` non-ASCII -- out of Mult DF scope (disjoint track). |

## Theorems as tests

`native_decide` theorems in `LlvmCfgFixture`:

- `multDfAlgorithmOk_true`
- `multDominanceFrontierDeepen_true`
- existing `multDominanceFrontierPartial_true` / `llvmCfgFixtureDominanceClaimed_false` (no regression)

## Out of scope (honored)

- Band Mult..Graph FullBackend true
- Re-run Mult..Graph foreign / SSA partial theater
- Product Rust under `src/`
- HostModuleCheck package-env
- Dual examples

## Next

Remaining promote-all Open (disjoint from this track):

1. Package env Kernel expand
2. Affine product dual deepen
3. FullHost meet progress (inventory reseed; no forge)
4. ParityMult TERM-SURFACE after Kernel expand

Optional later A-heavy: multi-unit general DF + pure Nix invert for
DominanceClaimed true (operator-held).

## Status

**GREEN** -- Mult DF host evidence deepened with Cytron algorithm dual-pin;
DominanceClaimed stays false with named reasons; gates green.
