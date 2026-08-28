# HostCost theorems split (Name 4) -- implementer report

**Status:** GREEN

**Name:** HostCost theorems split

**Date:** 2026-08-12

## What moved

Long-file split of `SystemsLean.HostCost` L1-L9 theorems into a companion, same
pattern as `HostCompose` / `HostComposeTheorems`.

- New file: `src/systems/SystemsLean/HostCostTheorems.lean`
- Same namespace: `SystemsLean.HostCost`
- `HostCost.lean` keeps cost defs, `HostCostTokenState`, joint mult cost table,
  surface Bools, and docs.
- Theorem and lemma blocks L1-L9 moved, not renamed.
- Surface Bools stay on `HostCost.lean` as `def`s. `*_true` proofs live in the
  companion (`native_decide`). No import cycle.

## Line counts

| File | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/HostCost.lean` | 723 | 351 |
| `src/systems/SystemsLean/HostCostTheorems.lean` | (none) | 471 |

HostCost is well under the 1000-line bar.

## Wire-up

- `src/systems/SystemsLean.lean` imports `SystemsLean.HostCostTheorems` after
  `SystemsLean.HostCost`.
- `src/systems/SystemsLean/RuntimeBenchLean.lean` also imports the companion so
  L9 `costStepTwinMintConsume_eq` / `costStepTwinTotal_eq` stay visible.
- `nix/systems-host-presence/host-leans.nix` and `required-files.nix` list the
  companion (mirror HostComposeTheorems).
- `nix/systems-host-presence/host-specs-core-1.nix`: HostCost spec points at
  `HostCostTheorems`; new companion spec requires L1-L9 `theorem` tokens.

## Gates (commands + exit)

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostCost` (from `src/systems`) | 0 |
| `lake build SystemsLean.HostCostTheorems` (from `src/systems`) | 0 |
| `lake build SystemsLean.RuntimeBenchLean` (from `src/systems`) | 0 |
| `just systems-host` | 0 |
| `just hygiene` | 0 |

Lake version: 5.0.0-src+8c9756b (Lean 4.32.0).

## L1-L9 names still greppable

Companion still declares (not renamed):

- L1: `costMintConsumeSequential_eq`, `costMultPreScan_zero`,
  `costMultPreScan_one`, `costCheckFailClosed_empty`, `costExtractOkFs_eq`,
  `costExtractOkFs_ge_check`
- L2: `costMultPreScanAtCap_eq`, `costCheckFailClosed_le_atCap`,
  `costMultPreScan_le_atCap`, `costEdgeWalkAtCap_eq`, `costEdgeWalk_le_atCap`
- L3: `costExtractOkFs_eq_check_plus_one` and fuse family
- L4: `costMintConsumeExactOnceAutomaton_eq`,
  `hostCost_exact_once_sequential_ref`, `hostCost_double_consume_notLive_ref`
- L5: `costFused_le_naive`, `hostCost_fuse_preserves_fail_closed`,
  `hostCost_opt_preserves_spent_mult1_reject`,
  `hostCost_opt_preserves_double_consume_ref`
- L6: `hostCost_linearHost_fields_bool_nat`, `hostCostNoHeapModelOk_true`
- L7: `costDoubleCheckPath_eq`, `costFuseNatSavings_eq`,
  `cost_diff_fuse_vs_double`
- L8: `costNodeMultByGrade_eq_one`, `costJointMultTableOk_true`
- L9: `costStepTwinMintConsume_eq`, `hostCostSurfaceOk_true`

HostCost header still lists those names so existing presence tokens keep
matching.

## Confirmations

- No new cost lemmas beyond the move.
- No mathlib. No `fun x \mapsto`. ASCII `->` / `omega` only.
- No claim-bool flips.
- Seed / harness stay 206 / 99 (HostCost is not a dual-ok harness increment).
- Did not touch smoke C, just bench recipes, or emit SSOT.
- Names 1-3 and 5-9 left open. Open not emptied. WATCHER not DONE-FOR-NOW.

## Residual

`RESIDUAL-systems.md` Name 4 **done**. Coordinator `RESIDUAL.md` row 4 **done**.
`doc/SESSION-HANDOFF.md` and `WATCHER.md` say eight Names still open; Wave 1
tools 1-3 remain; Wave 2 is unblocked on `HostCostTheorems.lean`.
