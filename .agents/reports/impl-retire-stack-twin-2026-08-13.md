# Retire stack mint twin into Lean (2026-08-13)

First runtime-bench retire: Lean owns the stack live-flag protocol and generates
the timed C driver. Hand file kept. C `clock_gettime` kept (not a Lean IO timer).

## TDD

1. RED: empty `generatedSource`; theorem `stackTwinProtocolOk_true`.
   Command: `lake build SystemsLean.RuntimeBenchStackTwin`
   Fail: `native_decide` evaluated `stackTwinProtocolOk = true` is false.
2. GREEN: same command after the generator emitted the protocol text. Exit 0.

## Protocol check (Lean)

Required: `arm=R-stack-twin`, `stack_twin_token`, `uint8_t live`, `twin_mint`,
`twin_consume`, `run_ops`, `for (i = 0; i < n; i++)`, `CLOCK_MONOTONIC`,
`not_product_wire`, `remint_after_spent`.
Forbidden: `malloc(`, `calloc(`, `realloc(`, `slake_`, `slake_freestanding.h`.

## Verify

| Command | Result |
|---------|--------|
| `lake build SystemsLean.RuntimeBenchStackTwin` | exit 0 (incl. fail theorems) |
| `just bench-runtime-twin-contract` | exit 0 (Lean module + generated/hand recipes) |
| `BENCH_RUNTIME_N=2000000 BENCH_RUNTIME_RUNS=1 just bench-runtime-stack-twin` | exit 0; generated C; `arm=R-stack-twin` |
| `BENCH_RUNTIME_N=2000000 BENCH_RUNTIME_RUNS=1 just bench-runtime-stack-twin-hand` | exit 0 (hand file) |
| `just hygiene` | exit 0 |

Hand file still 245 lines. FullHost not flipped. Living suite arm is Lean-generated C.

## Paths

- `src/systems/SystemsLean/RuntimeBenchStackTwin.lean` (SSOT + write + fail theorems)
- `src/systems/SystemsLean/RuntimeBenchStackTwinMain.lean`
- `just/bench-runtime-twins.just` living `bench-runtime-stack-twin`, alias `-generated`, hand `-hand`
- Generated artifact: `out/runtime-bench/stack_twin.c`

## Review follow-up

Assert-only fail theorems (not a rewrite of `stackTwinProtocolOk_true`). Twin-contract
locks the Lean module. Living recipe pointed at generated C. Lakefile count dropped.
