# Implement report: DominanceClaimed or band FullBackend honesty (T4)

**Date:** 2026-08-11
**Status:** GREEN
**Name:** DominanceClaimed or band FullBackend honesty (T4)

## Goal

Advance LLVM only with written bar + lake. `multiUnitDominanceFrontierDeepen` is already
**true** after N4 (Mult..Graph DF Cytron dual-pin). That join is **not**
`llvmCfgFixtureDominanceClaimed`. Prefer product deepen **or** honest inventory without
forge. This slice chose honest inventory + polished docs (no A-heavy pin flip).

## Design (option B: honest inventory)

N4 already delivered the last checkable progressive dual-pin short of XL work:

| Surface | Status after N4 / T4 |
|---------|----------------------|
| Mult..Graph unit CFG dual-pin | **done** |
| Mult DF partial + Cytron deepen | **done** |
| Linear+Types+Program+Graph DF | **done** (R5 + N4) |
| `multiUnitDominanceFrontierDeepen` | **true** |
| General + iterative CFG partial | **done** |
| Path B / tip A-light / announce B | **done** |
| DominanceClaimed | **false** (held) |
| Band Mult..Graph `*FullBackendClaimed` | **false** (held) |
| Production opt | **false** (held) |

Further product deepen that would justify DominanceClaimed true needs:

1. Proved dominator-tree constructor (not hand structural idom tables)
2. Arbitrary-graph / multi-join DF export beyond fixed unit diamonds
3. Pure Nix forge-ban invert + written A-heavy bar + lake proof (XL; operator-held)

Band FullBackend true needs separate A-heavy honesty redesign (C1b / XL). Neither is
in-scope progressive dual-pin this wave. Prefer polish over forge.

### Why DominanceClaimed stays false

| Reason | Detail |
|--------|--------|
| Structural idom | Per-band production idom tables remain hand dual-pins, not a proved dominator-tree constructor |
| Fixed unit diamonds | Mult..Graph DF covers unit SSA diamonds only; not arbitrary-graph DF export |
| Path B | `dominancePipelineRequiredForFullBackend` remains **false**; bar (2) already met without DominanceClaimed |
| Forge ban | Pure Nix forbids `def llvmCfgFixtureDominanceClaimed : Bool := true` until XL redesign |

### Why band FullBackend stays false

| Reason | Detail |
|--------|--------|
| Partial SSA | Each band `llvm*SsaFullBackendClaimed` is intentional false (partial lower) |
| Tip != band | Fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (A-light) is a different pin |
| Foreign band-local | Mult..Graph foreign success is not multi-band fullBackend |
| Forge ban | Pure Nix requires band FullBackend false; A-heavy redesign only |

## Paths touched

| Path | Role |
|------|------|
| `out/llvm-ir/README.md` | Consumer lag fix: multiUnit DF; why DominanceClaimed / band FullBackend false; ladder 10d; non-claims |
| `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | Bar reseed T4; Mult..Graph DF rows; plain English why pins stay false |
| `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` | Inventory reseed T4; harness 59; honesty bullets |
| `RESIDUAL-systems.md` | T4 Open -> done; Done archive; living tip |
| `RESIDUAL.md` | Systems Open join T4 done |
| `WATCHER.md` | T4 removed from open multi-track |
| `doc/SESSION-HANDOFF.md` | Active open: T4 done |

**No product Lean claim-bool edits.** Pins left exactly as measured.

## Pin honesty (mandatory table)

| Pin | After T4 |
|-----|----------|
| `multiUnitDominanceFrontierDeepen` | **true** (unchanged; Mult..Graph) |
| `llvmCfgFixtureDominanceClaimed` | **false** (measured; reasons above) |
| Mult..Graph band `*FullBackendClaimed` | **false** each |
| `llvmCfgFixtureFullBackendClaimed` | **true** (A-light tip; unchanged) |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| `dominancePipelineRequiredForFullBackend` | **false** |
| free / complete / PROVABLY | **true** unchanged |
| FullHostElaborateRemains | **false** unchanged |

## Commands + exits

| Command | Exit |
|---------|------|
| `just systems-llvm-ir` | **0** (186 required paths; multi-unit Mult..Graph DF + DominanceClaimed false in banner) |
| `just hygiene` | **0** (source-hygiene + professional-tone) |
| Pin greps (DominanceClaimed / band FullBackend defs) | **false** as required |

No lake claim flip (no Lean claim-bool change). Lake not required for inventory-only honesty.

## Out of scope (honored)

- DominanceClaimed true
- Band Mult..Graph FullBackend true
- free/complete/PROVABLY/FullHost flips
- Product Rust under `src/`
- HostModuleCheck (T1/T3)
- FullHost flip (T2)
- git commit

## Next

Remaining Open (disjoint):

1. T1 Package env seed expand (ParityTypes band)
2. T2 FullHost meet Phase 2 after T1 (Phase 1 inventory already FULLHOST_FLIP=no)
3. T3 ParityProgram / ParityEmit TERM-SURFACE
4. T5 Completeness polish

Optional later A-heavy: proved idom + pure Nix invert for DominanceClaimed true, or band
FullBackend honesty redesign (operator C1b / XL; not auto Open).

## Status

**GREEN** -- honest inventory + polished bar / inventory / consumer README / residual;
DominanceClaimed confirmed **false**; band FullBackend confirmed **false**;
free/complete/PROVABLY/FullHost unchanged; `just systems-llvm-ir` + `just hygiene` green.
