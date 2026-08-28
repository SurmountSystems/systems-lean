# Package 1 -- Full backend claim true (Option A-light) -- implement summary

**Date:** 2026-08-10
**Workspace:** /home/hunter/Projects/ai/iso
**Status:** GREEN

## Design decisions (join redesign strategy)

**Trap avoided:** progressive pins required `!llvmCfgFixtureFullBackendClaimed`.
Naive flip alone would zero `productionCfgDeepen`, Mult DF partial, all Mult..Graph
unit deepen joins, general/iterative dual-pins, `fullLlvmBarEvidencePartial`, and
`llvmCfgFixturePackageOk`.

**Strategy:** redesign progressive joins **first** by removing only the
`!llvmCfgFixtureFullBackendClaimed` conjunct (keep `!DominanceClaimed` and
`!ProductionOptClaimed`). Progressive partial means bar evidence rungs green
**independent of tip polarity**. Then flip tip pin true. Then invert pure Nix for
fixture tip only.

**A-light product meaning:** tip fullBackend true means progressive bar (1)-(7)
under path B met with lake proof. Production opt stays false. DominanceClaimed
stays false. Band Mult..Graph SSA / foreign / rustIrInterop `*FullBackendClaimed`
stay false. Never alias unlock / fullLlvmBarEvidencePartial / foreign alone /
rustIrInterop pins.

**packageOk:** now requires `llvmCfgFixtureFullBackendClaimed` (positive) plus
`fullLlvmBarEvidencePartial` (progressive still true after redesign).

## Files changed

### Lean (join redesign + pin flip)
- `src/systems/SystemsLean/LlvmCfgHonesty.lean` -- tip `:= true` + docs
- `src/systems/SystemsLean/LlvmCfgMultProduction.lean` -- drop `!fullBackend` from productionCfgDeepen
- `src/systems/SystemsLean/LlvmCfgMultDf.lean` -- drop from multDominanceFrontierPartial
- `src/systems/SystemsLean/LlvmCfgUnitProduction.lean` -- drop from Linear..Graph deepen joins
- `src/systems/SystemsLean/LlvmCfgGeneral.lean` -- drop from general/iterative/fullLlvmBarEvidencePartial
- `src/systems/SystemsLean/LlvmCfgFixture.lean` -- packageOk requires tip true; theorem `_true`

### Pure Nix (fixture tip invert only)
- `nix/systems-llvm-ir/cfg-fixture.nix`
- `nix/systems-llvm-ir/cfg-general-program-partial.nix`
- `nix/systems-llvm-ir/cfg-iterative-cfg-partial.nix`
- `nix/systems-llvm-ir/cfg-mult-dominance-frontier-partial.nix`
- `nix/systems-llvm-ir/cfg-production-deepen.nix`
- `nix/systems-llvm-ir/cfg-linear-production-deepen.nix`
- `nix/systems-llvm-ir/cfg-types-production-deepen.nix`
- `nix/systems-llvm-ir/cfg-program-production-deepen.nix`
- `nix/systems-llvm-ir/cfg-graph-production-deepen.nix`
- `nix/systems-llvm-ir/default.nix` (OK prose)

### just banners
- `just/llvm.just` progressive CFG recipes: "fixture tip fullBackend" honesty

### Docs lockstep
- `RESIDUAL-systems.md` -- Package 1 done; Open Next unit TERM-SURFACE (Package 2a)
- `RESIDUAL.md` -- join living tip + ranked next
- `WATCHER.md` -- Package 2a implement prompt
- `doc/SESSION-HANDOFF.md`
- `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` -- Option A closed A-light
- `.agents/plans/plan-full-readiness-2026-08-09.md`
- `out/llvm-ir/README.md`

### Unchanged (A-light policy)
- Mult..Graph SSA / foreign / rustIrInterop FullBackend pins + their Nix forge-bans
- free/complete/PROVABLY; FullHost false; product Lake pins false; mathlib held

## RED/GREEN for claim flip

| Step | Result |
|------|--------|
| Naive flip without redesign | Would RED progressive theorems + pure Nix requiring `!fullBackend` |
| After redesign + flip | progressive partials stay true; tip true |
| `lake build SystemsLean.LlvmCfgFixture` | **exit 0** (claim flip mandatory GREEN) |
| `just systems-llvm-ir` | **exit 0** |
| `just hygiene` | **exit 0** |

### Lake (claim flip mandatory)
```
cd src/systems && lake build SystemsLean.LlvmCfgFixture
# Build completed successfully (44 jobs). exit 0
```

### Gates
```
just systems-llvm-ir  # EXIT:0
just hygiene          # EXIT:0 (1045 files; professional-tone OK)
```

## Spot-check pins (post flip)

| Pin | Value |
|-----|-------|
| `llvmCfgFixtureFullBackendClaimed` | **true** |
| `fullLlvmBarEvidencePartial` | **true** (after redesign) |
| band `llvm*SsaFullBackendClaimed` | **false** (unchanged) |
| `*ForeignLinkFullBackendClaimed` | **false** (unchanged) |
| `rustIrInteropFullBackendClaimed` | **false** (unchanged) |
| production opt / DominanceClaimed | **false** |
| free/complete/PROVABLY / FullHost | unchanged |

## Residual Open next Name after close

**Next unit TERM-SURFACE** (Package 2a)

- Goal: real accept/reject term dialect on one more host module that still greps-only
- Done when: companion checker + E-good/E-bad + dualOk + lake + hygiene + Sub-1-KLOC
- Out of scope: FullHost true; mathlib; seed-wide L4; re-flip fullBackend false

## Reports
- `/tmp/grok-1000/grok-impl-summary-fullbackend-a-light.md` (this file)
- `.agents/reports/impl-full-backend-claim-true-2026-08-10.md` (durable copy)

## Fix round (review issues 1-10)

Review file: `/tmp/grok-1000/grok-review-fullbackend-a-light.md` -- all open -> fixed.

Docs lockstep: RESIDUAL-systems Open intro/Deferred/program-phases; plan Phase 3 + scoreboard;
surface-matrix Full LLVM row; goals living tip; SESSION-HANDOFF mid-file archive supersede;
out/llvm-ir README H1.

Lean: packageOk docstring (requires tip + progressive); progressive headers in
LlvmCfgGeneral + LlvmCfgUnitProduction (independent of tip polarity).

Nix: cfg-fixture adds packageOk_true theorem + tip conjunct near packageOk join.

Gates after fix: hygiene 0; lake LlvmCfgFixture 0; systems-llvm-ir 0.
Tip stays true; band FullBackend / opt / DF / FullHost stay false.
