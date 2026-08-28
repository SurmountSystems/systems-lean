# Implement report: Mult dominance frontier partial (R1c)

**Date:** 2026-08-10
**IMPL_ID:** fullready-r1c-r2-20260810091659
**Status:** GREEN

## Goal

Progressive Full LLVM bar slice **R1c**: Mult SSA grade_tag CFG structural
dominance frontier (DF) table dual-pin in host Lean `SystemsLean.LlvmCfgFixture`.
Not a full dominance algorithm. Not production opt. Not fullBackend.
`llvmCfgFixtureDominanceClaimed` stays **false**.

## Paths touched

| Path | Role |
|------|------|
| `src/systems/SystemsLean/LlvmCfgFixture.lean` | `multDfTable`, `multDfMergeIsJoin`, `multDfTableDualPin`, `multDominanceFrontierPartial` + theorems/examples |
| `nix/systems-llvm-ir/cfg-mult-dominance-frontier-partial.nix` | Pure Nix presence + forge bans |
| `nix/systems-llvm-ir/specs.nix` | Join new slice |
| `nix/systems-llvm-ir/default.nix` | Banner mentions Mult DF partial |
| `just/llvm.just` | `mult-dominance-frontier-partial` recipe |
| `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | R1c done; next R1d |
| `RESIDUAL-systems.md` | Done archive + Open remaining |
| `RESIDUAL.md` | Join tip Mult DF partial done; next Program/Graph R1d |
| `doc/SESSION-HANDOFF.md` | Active/Next |
| `WATCHER.md` | Next R1d Program/Graph CFG |
| `.agents/plans/plan-full-readiness-2026-08-09.md` | Living tip |

## Design (structural DF table)

Mult SSA diamond dual-pinned to `slake_mult_ssa.ll`:

- entry -> checks / grade arms -> merge (four-pred phi)
- Classical DF honesty: merge is in DF(n) for grade arms (`bb_mult0`,
  `bb_mult1`, `bb_omega`, `bb_reject`) and check nodes (`check1`, `check2`)
  that dominate a merge pred without strictly dominating merge
- Entry is excluded (`merge:entry` idom => entry strictly dominates merge)
- Fixed table format `node:merge` (same spirit as `productionIdomTable`)
- Join bool: `multDominanceFrontierPartial` =
  `productionCfgDeepen` && `multDfTableDualPin` && recipe name match
  && !DominanceClaimed && !production opt && !fullBackend

## Pin honesty

| Pin | Value after R1c |
|-----|-----------------|
| `multDominanceFrontierPartial` | **true** |
| `productionCfgDeepen` | **true** (no regression) |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| `llvmCfgFixtureFullBackendClaimed` | **false** |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| free / complete / PROVABLY | **unchanged** |
| FullHostElaborateRemains | **false** (unchanged) |
| Mult foreign Mult-only | **unchanged** |

## Commands + exits

| Command | Exit |
|---------|------|
| `just hygiene` | **0** |
| `just systems-llvm-ir` | **0** |
| `(cd src/systems && lake build SystemsLean.LlvmCfgFixture)` | **0** |
| `just mult-dominance-frontier-partial` | **0** |
| `just production-cfg-deepen` | **0** (no regression) |

## Theorems as tests

`native_decide` theorems:
`multDfMergeIsJoin_true`, `multDfTableDualPin_true`,
`multDominanceFrontierPartial_true` (lake GREEN with package ready chain).

## Sibling honesty

`LinearForeignLink` / `just linear-foreign-link-success` already on disk
(sibling R2 track). This slice did **not** edit MultForeignLink or create
LinearForeignLink. Residual tips mention Linear foreign success without
deleting sibling Done rows. WATCHER next is **R1d Program/Graph CFG** (not R2).

## Remaining next

1. **R1d** Program or Graph SSA CFG production dual-pin
2. R1e fullBackend claim only when bar fully met (stays false)
3. Types/Program/Graph foreign residual when capacity

## Status

**GREEN** -- R1c Mult DF partial structural dual-pin landed with gates green.
fullBackend / DominanceClaimed / production opt remain false.
