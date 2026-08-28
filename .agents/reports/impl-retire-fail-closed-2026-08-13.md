# Retire fail-closed shape bench into Lean (2026-08-13)

Second runtime-bench retire: Lean owns the fail-closed-shape compose protocol
and generates the timed C driver. Same stack-twin pattern. Hand file kept.
C `clock_gettime` kept (not a Lean IO timer). Extract is not skipped.

## TDD

1. RED: empty `generatedSource`; theorem `failClosedShapeProtocolOk_true`.
   Command: `lake build SystemsLean.RuntimeBenchFailClosedShape`
   Fail: `native_decide` evaluated `failClosedShapeProtocolOk = true` is false.
2. GREEN: same command after the generator emitted the protocol text. Exit 0.

## Verify

| Command | Result |
|---------|--------|
| `lake build SystemsLean.RuntimeBenchFailClosedShape` | exit 0 (incl. fail theorems) |
| `lake exe slake-runtime-bench-fail-closed-shape` | wrote `out/runtime-bench/fail_closed_shape.c` |
| `just bench-runtime-twin-contract` | exit 0 (Lean arm required) |
| `just bench-runtime-fail-closed-shape` (N=50000, 1 run) | exit 0; generated C compiles and runs |
| `just bench-runtime-fail-closed-shape-hand` | exit 0 (hand file) |
| `just hygiene` | exit 0 |

Hand file still 511 lines. FullHost not flipped. Living suite arm is Lean-generated C.

## Paths

- `src/systems/SystemsLean/RuntimeBenchFailClosedShape.lean`
- `src/systems/SystemsLean/RuntimeBenchFailClosedShapeMain.lean`
- `just/bench-runtime-twins.just` living / `-generated` / `-hand`
- Generated artifact: `out/runtime-bench/fail_closed_shape.c`
