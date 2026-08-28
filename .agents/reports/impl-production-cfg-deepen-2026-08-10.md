# Implement report: Production CFG deepen

**Date:** 2026-08-10
**Residual Name:** Production CFG deepen
**Status:** GREEN (Done)

## Goal

Deepen Mult CFG beyond structural fixture (merge preds + reachability partial)
toward production-oriented control-flow / dominance evidence without claiming
full LLVM production backend true.

## What landed

### Host Lean (`SystemsLean.LlvmCfgFixture`)

Beyond existing `cfgDeepenPartial` (structural Mult abstract fixture):

| Pin / surface | Meaning |
|---------------|---------|
| `multSsaCfgBlocks` / `multSsaCfgEdges` | Mult SSA `grade_tag` CFG labels/edges matching generator-owned `out/llvm-ir/slake_mult_ssa.ll` |
| `productionIdomTable` / `mergeIdomIsEntry` | Structural immediate-dominator table; merge idom is entry (diamond) |
| `mergePhiPredsFour` | Four Mult SSA phi predecessors: `bb_mult0` / `bb_mult1` / `bb_omega` / `bb_reject` |
| `multSsaCfgDualPin` | Dual-pin inventory against Mult SSA peer readiness (not full backend) |
| `productionCfgDeepen` | Named residual pin: partial + idom + phi preds + dual-pin; non-claims held |

Still **false** (forge-banned in pure Nix):

- `llvmCfgFixtureFullBackendClaimed`
- `llvmCfgFixtureProductionOptClaimed`
- `llvmCfgFixtureDominanceClaimed` (full DF pipeline over arbitrary graphs not claimed)

Theorems + smoke: `productionCfgDeepen_true`, `mergeIdomIsEntry_true`,
`mergePhiPredsFour_true`, `multSsaCfgDualPin_true` (`native_decide` / `rfl`).

### Pure Nix

- New slice: `nix/systems-llvm-ir/cfg-production-deepen.nix`
- Joined in `specs.nix` + summary text in `default.nix`
- Dual-pins Lean tokens + Mult SSA IR phi line + just recipe honesty

### Just

- Recipe: `just production-cfg-deepen`
  - `just systems-llvm-ir`
  - `lake build SystemsLean.LlvmCfgFixture` when lake present
  - optional `llvm-as` on Mult SSA
  - non-claims banner (not full backend / not production opt / not full dominance)

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.LlvmCfgFixture` | GREEN (29 jobs) |
| `just systems-llvm-ir` | GREEN (81 required paths; Production CFG deepen in summary) |
| `just production-cfg-deepen` | GREEN (lake + Mult SSA llvm-as) |
| `just hygiene` | GREEN (source-hygiene + professional-tone) |

## Honesty (unchanged)

| Claim | Status |
|-------|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | false (unchanged) |
| Mult foreign link Mult-only | success unchanged |
| llvm full backend / production opt / full dominance pipeline | **false** |
| Linear/Types/Program/Graph foreign link | not claimed |

## Residual lockstep

- `RESIDUAL-systems.md`: Production CFG deepen **Done**; Open checkable product
  residual empty done-for-now; Full readiness Phase 3 CFG **done**
- `RESIDUAL.md` join board: living tip updated
- `WATCHER.md`: DONE-FOR-NOW (held Full LLVM production backend; no auto invent)
- `out/llvm-ir/README.md`, llvm-backend inventory, plan-held-backend, SESSION-HANDOFF

## Next

**Held (operator promote only):** Full LLVM production backend claim true;
full elaborator/mathlib day-one; AffineDrop dual; other-band foreign link.

No auto `/implement` while held tracks need promote.

## Primary paths touched

- `src/systems/SystemsLean/LlvmCfgFixture.lean`
- `nix/systems-llvm-ir/cfg-production-deepen.nix` (new)
- `nix/systems-llvm-ir/specs.nix`
- `nix/systems-llvm-ir/default.nix`
- `just/llvm.just`
- residual / WATCHER / handoff / inventory / out README / plan
- this report
