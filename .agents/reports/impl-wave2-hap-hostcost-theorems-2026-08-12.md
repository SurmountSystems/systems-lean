# Wave 2 HostCost theorems (Names 5-8) -- implementer report

**Status:** GREEN

**Names:** Scan cost vs live nodes; Universal spent reject; Omega share
exact-once contrast; Thin extract MULT-1 disagreement

**Date:** 2026-08-12

## What landed

Formalize then prove on `SystemsLean.HostCostTheorems` (same namespace
`SystemsLean.HostCost`). Cost defs stay in `HostCost.lean`. Structural Nat
and Bool only. Not nanoseconds. Not PROVABLY speed (PROVABLY is CompCert).
Not wall-clock. Measure stays in Wave 1/3 benches. No emit or product C.

### Name 5 -- Scan cost vs live nodes

- `costMultPreScan_eq_live_nodes`:
  `costMultPreScan hc.graph.prog.nodes.length = hc.graph.prog.nodes.length`
- Optional check form `costCheckFailClosed_eq_live_nodes`:
  `costCheckFailClosed hc.graph.prog.nodes.length = 1 + hc.graph.prog.nodes.length`
- Uses existing `costMultPreScan n = n * costNodeMultOk` and `costNodeMultOk = 1`.
- Does not prove every Host has length `<= 8`.

### Name 6 -- Universal spent reject

- `hostCost_spent_mult1_rejects_check`: forall Host with `List.any` MULT-1
  and `linear.live = false`, `checkFailClosed = false`. Proof: `nodeMultOk`
  on MULT-1 is `linear.live`; `List.any_eq_true` / `List.all_eq_false`; then
  `multPreScan` fails so check fails.
- `hostCost_spent_mult1_rejects_extractFs`: fused extract under FS also
  fails (via `hostCost_fuse_preserves_reject`).
- L5 spent fixture is an instance:
  `hostCost_spent_mult1_rejects_check_instance` and
  `hostCost_spent_mult1_rejects_extractFs_instance`.
- Existing L5 `native_decide` fixture theorems stay greppable.

### Name 7 -- Omega share exact-once contrast

- `hostCost_omega_share_vs_mult1_exact_once`: `And.intro` of
  `Linear.shareNat_reuse` and `hostCost_exact_once_sequential_ref`
  (HostCompose `mint_consume_exact_once_sequential`).
- Header says this is a HostCost contrast, **not** Token LinearCheck and
  not elaborator LINEAR-EXACT-ONCE on `Linear.Token` axioms.
- Grades stay 0/1/omega. Linear axioms not eliminated.

### Name 8 -- Thin extract MULT-1 disagreement

- `hostCost_thin_extract_mult1_disagrees_compose`:
  `Extract.extractOk Mult.mult1 e runtimeFs = true` **and**
  HostCompose `extractOkFs` on the spent/unminted MULT-1 fixture is false.
- Cites `Extract.extractOk_mult1_fs_true` (intentional Extract gap) vs
  compose close (`hostCost_opt_preserves_spent_mult1_reject` /
  HostCompose `extractOkFs_mult1_unminted_false` family).
- Does **not** change `extractOk_mult1_fs_true`. Does **not** close the
  thin gap.

## Line counts (after)

| File | After |
|------|-------|
| `src/systems/SystemsLean/HostCost.lean` | 359 |
| `src/systems/SystemsLean/HostCostTheorems.lean` | 576 |

Both under the 1000-line bar. Companion well under 900.

## Presence

`nix/systems-host-presence/host-specs-core-1.nix`: HostCost and
HostCostTheorems specs list the four Wave 2 theorem names. L1-L9 tokens
unchanged.

## Gates (commands + exit)

From `src/systems`:

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostCost` | 0 |
| `lake build SystemsLean.HostCostTheorems` | 0 |

From repo root:

| Command | Exit |
|---------|------|
| `just systems-host` | 0 |
| `just hygiene` | 0 |

Lake version: 5.0.0-src+8c9756b (Lean 4.32.0). No sorry. No mathlib.

Hygiene first failed on Unicode anonymous constructors in the spent-reject
proof; rewritten to `cases` / `Exists.intro` / `And.intro` (ASCII). Second
hygiene pass exit 0.

## Pins untouched (not flipped)

- free / complete / PROVABLY: **true**
- FullHostElaborateRemains: **false**
- DominanceClaimed / band FullBackend: **false**
- seed 206 / harness 99 (HostCost is not a dual-ok harness increment)
- No FullHost / seed / mathlib invent

## Residual honesty

- Names 5-8 **done**. Name 9 Single fail-closed walk **still open**.
- Name 10 Init unroll still **not open**. Open queue not emptied.
- No emit SSOT, smoke C, bench recipes, or product C edits.

## Out of scope (held)

- Wall-clock / cycle-count theorems
- Closing the thin Extract MULT-1 gap
- C opt-pass model; emit fuse re-open (Wave 3)
- Claim-bool flips
