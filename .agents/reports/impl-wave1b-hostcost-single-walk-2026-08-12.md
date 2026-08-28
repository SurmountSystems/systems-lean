# HostCost single-walk Nat -- implementer report

**Status:** GREEN

**Name:** HostCost single-walk Nat (two-target emit, Track C Name 2)

**Date:** 2026-08-12

## Named contract

`costCheckFailClosed` is a natural-number model of one live fail-closed walk,
matching HAP Name 9 C (`SINGLE_FAIL_CLOSED_WALK` / `HOST_COMPOSE_SINGLE_WALK`).
It is not well-typed plus a second pre-scan. It is not wall-clock. It is not
PROVABLY speed.

## RED (after definition change, old equalities)

Changed only `costCheckFailClosed` from
`costHostIsWellTyped + costMultPreScan n` to `costMultPreScan n`.

Command: `lake build SystemsLean.HostCostTheorems`

Exit 1.

Named old equality that failed:

- `costCheckFailClosed_eq_live_nodes` expected `1 + nodes.length`; goal
  became `False`.
- `costCheckFailClosed_empty` expected `= 1`; left-hand side is not
  definitionally 1 (`rfl` fail).
- Cap facts `costCheckFailClosedAtCap_eq = 9`,
  `costExtractOkFsAtCap_eq = 10`, `costCheckAndEdgeWalkAtCap_eq = 25`
  unsolved (`False`).
- `costFuseNatSavings_eq` unsolved: `n - 1 = n`.
- `hostCostSurfaceOk_true` / `hostCostOptPreserveOk_true` /
  `hostCostDiffFuseOk_true`: `native_decide` evaluated the proposition as
  false.

`lake build SystemsLean.HostCost` stayed green (defs only).

## GREEN (updated honesty / theorems)

Same command: `lake build SystemsLean.HostCost SystemsLean.HostCostTheorems`

Exit 0.

`just hygiene` exit 0.

## What `costCheckFailClosed` is now

```
def costCheckFailClosed (n : Nat) : Nat := costMultPreScan n
```

That is one look per live node. `costHostIsWellTyped` remains the public
`is_well_typed` API unit if that API is called separately. Name 9 C check
does not add it.

| Fact | Before (nested) | After (one walk) |
|------|----------------:|-----------------:|
| `costCheckFailClosed n` | `1 + n` | `n` |
| empty (`n = 0`) | 1 | 0 |
| at programCap | 9 | 8 |
| extract-at-cap | 10 | 9 |
| check + edge at both caps | 25 | 24 |
| `costCheckFailClosed_eq_live_nodes` | `1 + length` | `length` |
| `costFuseNatSavings n` | `n` | `n - 1` |

Fuse still equals check + 1 (freestanding-goal step). Empty fuse pays that
goal step while two empty walks cost 0, so `costFused_le_naive` and
`cost_diff_fuse_vs_double` take `1 <= n`. All-n slack:
`costFused_le_naive_plus_goal`.

Did not rewrite the red `1 + n` equality to keep the old nested model.

HostCompose Lean predicate is still `hostIsWellTyped && multPreScan`
(Boolean conjunction). Nat cost matches product C, not two nested walks.
Thin extract MULT-1 agreement (`hostCost_thin_extract_mult1_agrees_compose`)
was not re-opened.

## Files changed

- `src/systems/SystemsLean/HostCost.lean`
- `src/systems/SystemsLean/HostCostTheorems.lean`
- Residual lockstep: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
  `doc/SESSION-HANDOFF.md`

No emit SSOT. No product C. No `just build`. HostCost **368** /
HostCostTheorems **595** (both under 1000).

## Pins unchanged

free / complete / PROVABLY **true**. FullHostElaborateRemains **false**.
DominanceClaimed **false**. band FullBackend **false**.

## Next

Highest-value remaining C-wire Name: **Compose leftover isolate**. Reset-path
and Track L stay open. Open was not emptied.

## Status

GREEN
