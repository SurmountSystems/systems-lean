# Implement report: DominanceClaimed or band FullBackend honesty (W4)

**Date:** 2026-08-11
**Status:** GREEN
**Name:** DominanceClaimed or band FullBackend honesty (W4)

## Goal

Best-effort advance only with written bar + lake. Progressive dual-pin path already closed
at T4 (`multiUnitDominanceFrontierDeepen` true for Mult..Graph is **not**
`llvmCfgFixtureDominanceClaimed`). **Expected outcome:** honest inventory reseed; pins stay
**false**. Do **not** forge DominanceClaimed or band FullBackend true.

## Design (honest hold -- expected)

No checkable A-heavy product dual-pin remains short of XL bar redesign + pure Nix forge-ban
invert + lake. W4 is hierarchical-wave living-tip confirmation of T4, not a forge path.

### Why hold (T4 reasons re-confirmed)

| Reason | Detail |
|--------|--------|
| Structural idom only | Per-band production idom tables are hand dual-pins, not a proved dominator-tree constructor |
| Fixed unit diamonds | Mult..Graph DF covers unit SSA diamonds only, not arbitrary-graph DF export or multi-join production pipeline |
| Path B bar (2) | `dominancePipelineRequiredForFullBackend` is **false**; progressive bar already met without DominanceClaimed |
| Forge ban | Pure Nix forbids `def llvmCfgFixtureDominanceClaimed : Bool := true` until operator XL redesign |
| Band FullBackend A-heavy | Fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (A-light) is a separate pin; band Mult..Graph `*FullBackendClaimed` stay **false** by design |

## Paths touched

| Path | Role |
|------|------|
| `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | W4 reseed + hold pin table; cite T4 reasons |
| `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` | W4 reseed; candidate row done; honesty bullets |
| `out/llvm-ir/README.md` | Consumer lockstep W4 hold note; ladder 10d cite |
| `RESIDUAL-systems.md` | W4 Open -> done; living Open W1-W3/W5; archive |
| `RESIDUAL.md` | Systems Open join W4 done; evidence + Done archive |
| `WATCHER.md` | W4 closed; W1-W3 and W5 remain open |
| `doc/SESSION-HANDOFF.md` | Active open lockstep |
| `.agents/reports/impl-llvm-honesty-w4-2026-08-11.md` | This report |

**No product Lean claim-bool edits.** Pins left exactly as measured.

## Pin honesty (mandatory table)

| Pin | After W4 |
|-----|----------|
| `multiUnitDominanceFrontierDeepen` | **true** (unchanged; Mult..Graph) |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| Mult..Graph band `*FullBackendClaimed` | **false** each |
| `llvmCfgFixtureFullBackendClaimed` | **true** (A-light tip; unchanged) |
| `dominancePipelineRequiredForFullBackend` | **false** |
| free / complete / PROVABLY | **true** unchanged |
| FullHostElaborateRemains | **false** unchanged |

Measured defs (product Lean, no edit this slice):

- `LlvmCfgHonesty.lean`: `llvmCfgFixtureDominanceClaimed := false`; tip FullBackend `:= true`; `dominancePipelineRequiredForFullBackend := false`
- Band SSA modules Mult/Linear/Types/Program/Graph: each `*FullBackendClaimed := false`

## Commands + exits

| Command | Exit |
|---------|------|
| `just systems-llvm-ir` | **0** (186 required paths; multi-unit Mult..Graph DF + DominanceClaimed false in banner) |
| `just hygiene` | **0** (source-hygiene + professional-tone; re-run after md touch) |
| Pin greps (DominanceClaimed / band FullBackend defs) | **false** as required |

No lake claim flip (no Lean claim-bool change). Lake not required for inventory-only honesty.

## Out of scope (honored)

- DominanceClaimed true
- Band Mult..Graph FullBackend true
- free/complete/PROVABLY/FullHost flips
- Product Rust under `src/`
- HostModuleCheck package-env / TERM (W3/W1)
- git commit

## Why hold (summary)

Multi-unit Mult..Graph DF Cytron dual-pin is already **true**. That is progressive unit-diamond
evidence, not a full dominance pipeline claim. Path B closed bar (2) without DominanceClaimed.
Band FullBackend would need A-heavy honesty redesign. Prefer documented hold over forge.

## Next

Remaining Open (disjoint):

1. W1 Package env seed expand (ParityProgram and ParityEmit bands) after W3 TERM
2. W2 FullHost meet flip-or-partial (after W1/W3)
3. W3 ParityProgram and ParityEmit TERM-SURFACE
4. W5 Completeness polish

Optional later A-heavy: proved idom + pure Nix invert for DominanceClaimed true, or band
FullBackend honesty redesign (operator C1b / XL; not auto Open).

## Status

**GREEN** -- honest inventory hold reseed; DominanceClaimed confirmed **false**; band
FullBackend confirmed **false**; free/complete/PROVABLY/FullHost unchanged;
`just systems-llvm-ir` + `just hygiene` green; residual / WATCHER / bar / inventory /
consumer README lockstep.
