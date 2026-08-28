# Impl summary 84d080e4 -- HostCompose joint mult1 mult0 extract

## Status
GREEN. Residual Name closed. Next Open: EmitPlan spent mult1 reject.

## Files changed
- `src/systems/SystemsLean/HostComposeTheorems.lean` -- joint fixtures + 11 theorems + greppable header
- `src/systems/SystemsLean/HostCompose.lean` -- header theorem cite list
- `nix/systems-host-presence/host-specs-core-1.nix` -- presence tokens for joint theorem names
- `src/systems/extract.md` -- COMPOSE-THEOREM inventory (spent + joint)
- `src/systems/host-partial-inventory.md` -- HostCompose theorem list lag scrub
- `src/systems/surface-matrix.md` -- SpecProof row living Open tip
- `RESIDUAL-systems.md` -- Done + Open EmitPlan spent mult1 reject
- `RESIDUAL.md` -- coordinator join living tip / highest value next
- `WATCHER.md` -- next /implement EmitPlan spent mult1 reject
- `doc/SESSION-HANDOFF.md` -- Active / Next / recommended residual
- `.agents/reports/impl-hostcompose-joint-extract-2026-08-07.md` -- durable report

## RED / GREEN (theorem work)
- RED: not required as separate failing lake step; net-new joint theorems are definitional `rfl` / And.intro on new multi-node fixtures that single-grade theorems do not cover (property was absent, not broken).
- GREEN: `lake build SystemsLean.HostComposeTheorems` exit 0 (observed after edit).

## Theorems landed (net-new joint)
Fixtures: `thmHostJointMintedMarked`, `thmHostJointUnmintedMarked`, `thmHostJointMintedUnmarked` (MULT-1 + MULT-0 nodes).

Success:
- `multPreScan_joint_minted_marked_true`
- `extractOkFs_joint_minted_marked_true`
- `checkFailClosed_joint_minted_marked_true`
- `joint_mult1_mult0_extract_ok` (And.intro all three)

Either-side fail-closed:
- unminted+marked: `multPreScan_joint_unminted_marked_false`, `extractOkFs_joint_unminted_marked_false`, `checkFailClosed_joint_unminted_marked_false`
- minted+unmarked: `multPreScan_joint_minted_unmarked_false`, `extractOkFs_joint_minted_unmarked_false`, `checkFailClosed_joint_minted_unmarked_false`
- `joint_mult1_mult0_either_side_fail_closed` (And.intro both sides)

## Gates
| Command | Exit |
|---------|------|
| `cd src/systems && lake build SystemsLean.HostComposeTheorems` | 0 |
| `just systems-host` | 0 |
| `just hygiene` | 0 |

## Pins unchanged
- `SpecProof.proofCompleteClaimed` stays **false**
- product free / complete / PROVABLY true unchanged
- product Lake pins false unchanged
- FullHostElaborateRemains false unchanged
- host free claimed F1 unchanged
- no product C/shell growth

## Residual next Open
**EmitPlan spent mult1 reject** (inventory deferred #2 after joint compose).
WATCHER fenced `/implement --effort 1 EmitPlan spent mult1 reject`.

## Report copy
`.agents/reports/impl-hostcompose-joint-extract-2026-08-07.md`
