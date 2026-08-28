# Compose leftover isolate + Reset-path measure -- implementer report

**Status:** GREEN

**Names:** Compose leftover isolate (two-target 3); Reset-path measure (two-target 4)

**Date:** 2026-08-12

## Named contract

Split the ~1.6x compose vs heap leftover into bench `is_well_typed` vs extract
vs cold init. Measure opt-in reset vs default cold. Extract must stay on the
primary cold arm. Default cold stays full `init`. Do not claim compose beats
heap. Bench `is_well_typed` is not product Out.

## TDD

Recipe `just bench-runtime-compose-isolate-contract` (pure grep honesty).

**Red first:** contract added before isolate keys / reset recipe / isolate
recipe existed. Missing `isolate_ns_per_op_well_typed` / extract / init,
`isolate_extract_skipped=0`, reset recipe, isolate recipe vs heap and
fail_closed_shape.

**Green:** same recipe after driver + `just/bench-runtime-twins.just` recipes.

Re-run this continuation: `just bench-runtime-compose-isolate-contract` ok.

## What landed

| Surface | Change |
|---------|--------|
| `src/systems/smoke/slake_runtime_bench_freestanding_compose.c` | Batch isolate pass (well_typed / extract / init / reset). Honesty lines: bench-only well_typed, `isolate_extract_skipped=0`, default cold full init. |
| `just/bench-runtime-twins.just` | Isolate contract, isolate recipe, opt-in reset recipe. |
| `just/README.md` | One-line twins role. |
| `doc/BENCH-RUNTIME-latest.md` | Isolate section. Mint suite stamp unchanged. |
| `doc/bench-history/compose-isolate-latest.tsv` | Stamp **20260812T203148Z**. |

No product emit C. No Extract.lean / HostCost.lean. No claim-bool flips.
No Track L. Did not run `just build`.

Per-call T1 stage sandwiches stay timer-dominated (~22-26 ns/stage vs ~17 ns
whole-op). Isolate pass times one call kind in a batch loop so timer overhead
is amortized. Product walk is not redundant, so no SSOT edit.

## Split numbers (N=10M, `-O3 -flto`, stamp **20260812T203148Z**)

| Arm / bucket | median ns/op | Role |
|--------------|-------------:|------|
| R-free-compose cold (whole-op) | 17.2105 | Default product-shape; full re-init; extract not skipped |
| R-gc-shape-compose (heap) | 9.8852 | Allocator only |
| R-fail-closed-shape | 17.1701 | Protocol twin; not product wire |
| R-free-compose reset (whole-op) | 16.0208 | Opt-in `BENCH_RUNTIME_COMPOSE_RESET=1` |
| isolate well_typed | 3.0905 | Bench `is_well_typed` only; not product Out |
| isolate extract | 4.5060 | Product extract; not skipped |
| isolate init | 3.6766 | Batch full `init` |
| isolate reset call | 0.8400 | Batch E3 count-only `reset` |

Of cold **17.2105** ns:

- bench well_typed **~18%** (3.0905)
- extract **~26%** (4.5060)
- cold init **~21%** (3.6766)
- those three sum to **11.2731** ns
- remainder (push, edges, mint, mark, consume, post_check) **~5.94** ns

Versus heap **9.8852**: cold is **~1.7x slower** (did **not** beat heap). Gap
about **7.33** ns. Bench well_typed is extra to product Out.

Versus fail_closed_shape **17.1701**: about the same (~1.0x). Twin is not
product wire.

Living quiet suite mint numbers stay stamp **20260812T192951Z** (this slice
did not re-run mint).

## Reset-path result

Default cold stayed. Reset is optional compare only.

Reset whole-op **16.0208** vs cold **17.2105** saves **~1.19** ns (**~16%** of
the heap gap). Isolate reset call is **0.8400** ns. The leftover is **not**
mostly E3 cold-init tax.

## Gates

| Command | Result |
|---------|--------|
| `just hygiene` | exit 0 (source-hygiene OK; professional-tone OK) |
| `just bench-runtime-compose-isolate-contract` | exit 0 |
| `just bench-runtime-compose-isolate` | focused rebench stamp **20260812T203148Z** |

## Residual lockstep

Compose leftover isolate **done**. Reset-path measure **done**. HostCost
single-walk Nat left **done** as the other implementer wrote it (did not
clobber). Track L four Names stay **open**. Highest-value next: Compose SSA
lower partial.

Updated: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
`doc/SESSION-HANDOFF.md`.

## GREEN / BLOCKED

**GREEN.** Both Names closed. Default cold unchanged. Extract not skipped.
Compose still slower than heap. No product SSOT. No claim flips.
