# Report: Types SSA CFG production dual-pin (R1b)

**Date:** 2026-08-10
**IMPL_ID:** fullready-types-20260810091039
**Status:** GREEN
**Kind:** implement residual (Full LLVM production backend progressive)

## Summary

Landed **R1b**: Types SSA CFG production dual-pin against generator-owned
`out/llvm-ir/slake_types_ssa.ll`, mirroring Mult (`productionCfgDeepen`) and
Linear (`linearCfgProductionDeepen`). Multi-unit join
`multiUnitCfgProductionDeepenTypes` requires Mult + Linear + Types production
CFG dual-pin. **fullBackend / production opt / full dominance stay false.**

Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`
(R1b **done**; next **R1c** Mult dominance frontier partial).

## Product Lean

Module: `src/systems/SystemsLean/LlvmCfgFixture.lean`

| Def | Role |
|-----|------|
| `typesSsaCfgBlocks` / `typesSsaCfgEdges` | Match kind_tag labels/br targets in Types SSA LL |
| `typesProductionIdomTable` | Structural idom; merge:entry |
| `typesMergeIdomIsEntry` | Merge idom honesty |
| `typesMergePhiPredsFour` | Four-pred phi: bb_value / bb_linear / bb_erased / bb_reject |
| `typesSsaCfgDualPin` | Inventory + LlvmTypesSsa peer readiness (partial true; fullBackend/cfgProduction false) |
| `typesCfgProductionDeepen` | Living Types dual-pin tip |
| `multiUnitCfgProductionDeepenTypes` | Mult+Linear+Types join (does not flip fullBackend) |
| Theorems / examples | `typesCfgProductionDeepen_true`, `multiUnitCfgProductionDeepenTypes_true`, native_decide smoke |

Greppable: `TYPES-CFG-PRODUCTION-DEEPEN`, `typesCfgProductionDeepen`,
`TYPES-SSA-CFG-DUAL-PIN`, `TYPES-MERGE-PHI-PREDS-FOUR`,
`MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES`.

## Pure Nix + just

| Surface | Path |
|---------|------|
| Spec slice | `nix/systems-llvm-ir/cfg-types-production-deepen.nix` |
| Join | `nix/systems-llvm-ir/specs.nix` (`cfgTypesProductionDeepen`) |
| Banner | `nix/systems-llvm-ir/default.nix` |
| Recipe | `just types-cfg-production-deepen` in `just/llvm.just` |

Recipe: systems-llvm-ir + lake `SystemsLean.LlvmCfgFixture` + optional
`llvm-as` on `slake_types_ssa.ll`.

## Gates (all exit 0)

| Command | Result |
|---------|--------|
| `just hygiene` | GREEN |
| `just systems-llvm-ir` | GREEN (Types CFG production dual-pin in banner) |
| `just types-cfg-production-deepen` | GREEN (llvm-as Types SSA when present) |
| `lake build SystemsLean.LlvmCfgFixture` | GREEN |
| `just production-cfg-deepen` | GREEN (no regression) |
| `just linear-cfg-production-deepen` | GREEN (no regression) |

## Pin honesty

| Pin | After R1b |
|-----|-----------|
| `llvmCfgFixtureFullBackendClaimed` | **false** |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| FullHostElaborateRemains | **false** (unchanged) |
| Mult foreign link | Mult-only (unchanged) |

## Docs lockstep

- Bar note R1b done / R1c next
- `RESIDUAL-systems.md` Done archive Types dual-pin; Open remaining DF
- `RESIDUAL.md` join tip
- `WATCHER.md` next R1c Mult DF partial
- `doc/SESSION-HANDOFF.md` Active/Next
- plan living tip Types CFG done

## Out of scope this slice

- fullBackend true
- Mult DF partial implement (R1c next)
- Program/Graph CFG dual-pin
- MultForeignLink other bands
- freestanding C / shell growth

## Next residual

Mult dominance frontier **partial** structural table dual-pin (R1c). See
`WATCHER.md` fenced implement prompt.
