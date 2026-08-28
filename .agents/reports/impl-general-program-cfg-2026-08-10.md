# Implement report: general program CFG posture + LlvmCfgFixture long-file split

Date: 2026-08-10
IMPL_ID: fullready-general-cfg-20260810095000
Status: **GREEN**

## Summary

Priority A long-file split and Priority B general program CFG construction posture
landed in one wave. `llvmCfgFixtureFullBackendClaimed` / production opt /
`llvmCfgFixtureDominanceClaimed` stay **false**. free / complete / PROVABLY /
FullHostElaborateRemains **unchanged**.

## Priority A -- long-file split

| Module | Role | ~Lines |
|--------|------|--------|
| `LlvmCfgHonesty.lean` | Claim pins + stage ids | 83 |
| `LlvmCfgMultProduction.lean` | Mult structural + Mult SSA production | ~171 |
| `LlvmCfgMultDf.lean` | Mult DF partial table | 86 |
| `LlvmCfgUnitProduction.lean` | Linear / Types / Program / Graph unit diamonds | 441 |
| `LlvmCfgGeneral.lean` | General compose multi-merge posture | 138 |
| `LlvmCfgFixture.lean` | Join: band ok + surface + package + ready + theorems + smoke | 463 |

Was ~1145 (over Sub-1-KLOC). Tip now 463. Same namespace
`SystemsLean.LlvmCfgFixture` across role modules (HoldTheorems pattern).
No full-file `/tmp` rebuild of product Lean. No stitch markers.

Imports: `SystemsLean.lean` lists role modules + tip. Pure Nix contentSpecs
point production / DF / general tokens at role paths; pin defs grepped in
Honesty.

## Priority B -- general program CFG

Host dual-pin that production CFG is not only five hand-table unit diamonds:

- `generalCfgUnitRoots` -- Mult..Graph band roots (grade_tag / live_flag / ...)
- `generalCfgComposeEdges` -- four compose-path edges between unit roots
- `generalCfgMultiMergeTable` -- five unit merges + `compose:exit`
- `generalCfgTotalUnitBlocks == 34` (8+4+8+8+6 unit diamond sizes)
- `generalCfgDualPin` -- vs `multiUnitCfgProductionDeepenGraph` + Mult DF + compose text
- `generalCfgConstructionPartial` true
- `productionCfgUnitDiamondsOnlyClaimed` **false**

Not a general iterative CFG constructor over arbitrary multi-node IR.
Not R1e fullBackend true.

## Gates (all GREEN)

```
just hygiene
just systems-llvm-ir
lake build SystemsLean.LlvmCfgFixture
just production-cfg-deepen
just types-cfg-production-deepen
just program-cfg-production-deepen
just graph-cfg-production-deepen
just mult-dominance-frontier-partial
just general-program-cfg-partial
```

## Docs

- Bar: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` (general met)
- Posture land note: `doc/dev/research/general-program-cfg-posture-2026-08-10.md`
- Residual: `RESIDUAL-systems.md` Done archive + Open remaining R1e
- Join: `RESIDUAL.md` living tip
- Handoff: `doc/SESSION-HANDOFF.md`
- WATCHER: next R1e honesty review (fullBackend stays false)

## Non-claims

- fullBackend true
- production opt / DominanceClaimed
- full iterative CFG over arbitrary IR
- product C / shell mills / git
