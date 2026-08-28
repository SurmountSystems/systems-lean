# Implement report: LLVM assemble / object / execute bench

**Date:** 2026-08-12
**Status:** GREEN
**Name:** LLVM execute bench (separate from Compose SSA writer)

## Goal

Living measurement surface for generator LLVM IR under `out/llvm-ir/`.
Mirror the honesty of `just bench-runtime`: stamps, skip if tools missing,
plain "how much faster / slower" language without lying.

## What landed

| Path | Role |
|------|------|
| `just/bench-llvm.just` | New thin just module (332 lines, under 1000). Recipe `just bench-llvm`. |
| `justfile` | One import: `just/bench-llvm.just`. |
| `just/README.md` | One module/recipe row. |
| `doc/BENCH-LLVM-latest.md` | Living report written by the recipe. |
| `out/llvm-ir/README.md` | One honesty sentence after the llvm-as smoke table. |

Did **not** touch: `just/llvm.just`, `just/llvm-ssa.just`, Compose SSA Lean,
`out/llvm-ir/*.ll`, `just/bench-runtime*.just`, C runtime report, residual /
WATCHER / SESSION-HANDOFF, product C emit.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `just --list` (recipe visible as `bench-llvm`) | 0 |
| `just bench-llvm` (first full run) | 0 |
| `just bench-llvm` (after version-line trim) | 0 |
| `just hygiene` (after first run) | 0 |
| `just hygiene` (after second run) | 0 |

Second-run log: `/tmp/systems-lean-bench-llvm-20260812T235146Z.log`.

## Tools present (this host)

All present. LLVM / clang 22.1.8.

| Tool | Present |
|------|---------|
| llvm-as | yes |
| llc | yes |
| clang | yes |
| lli | yes |
| llvm-link | yes (lli fallback only; native clang path used) |

Soft-skip paths exist: `skip_no_llvm_as`, `skip_no_llc`, `skip_absent`,
`skip_no_execute_tools`, `skip_cannot_link`, `skip_no_mult_ssa`,
`skip_no_llvm_tools`. Suite exits 0 when tools or files are missing.

## Numbers (second run, 2026-08-12 23:51:46 UTC)

Measured runs per file: 3 after one warmup. Host: horizon, 16-way, Linux x86_64.

### Assemble (`llvm-as FILE -o /dev/null`)

| File | Status | bytes | median wall (s) |
|------|--------|------:|----------------:|
| slake_mult_ssa.ll | ok | 3139 | 0.006 |
| slake_linear_ssa.ll | ok | 2275 | 0.007 |
| slake_types_ssa.ll | ok | 3240 | 0.007 |
| slake_program_ssa.ll | ok | 3524 | 0.007 |
| slake_graph_ssa.ll | ok | 3382 | 0.007 |
| slake_compose_ssa.ll | ok | 4542 | 0.007 |

Compose SSA was present and timed. Recipe still skip-honest if that file is absent.

### Object (`llc -filetype=obj` into TMPDIR, deleted after)

| File | Status | obj bytes | median wall (s) |
|------|--------|----------:|----------------:|
| slake_mult_ssa.ll | ok | 1152 | 0.011 |
| slake_linear_ssa.ll | ok | 1104 | 0.010 |
| slake_types_ssa.ll | ok | 1152 | 0.010 |
| slake_program_ssa.ll | ok | 1168 | 0.010 |
| slake_graph_ssa.ll | ok | 1152 | 0.009 |
| slake_compose_ssa.ll | ok | 1544 | 0.011 |

### Execute (tiny TMPDIR wrapper; not product C)

Generator IR has no `@main`. Wrapper (TMPDIR-only, deleted) calls
`slake_mult_ssa_kernel_band_ready` then loops `slake_mult_ssa_grade_tag(1)`.

| Item | Value |
|------|-------|
| Status | ok |
| Path | clang -O2 wrap.ll + slake_mult_ssa.ll (native) |
| N | 20000000 |
| median wall (s) | 0.019 |

Override: `BENCH_LLVM_RUNS`, `BENCH_LLVM_EXEC_N`.

## How much faster / slower

LLVM numbers only. This recipe does **not** run `just bench-runtime` and does
**not** print a C-vs-LLVM headline.

## Non-claims

- **Not CompCert. Not PROVABLY.** PROVABLY stays C-only.
- **Not the C product wire.** Different surface from `just bench-runtime`.
- **Not FullBackend.** Band `*FullBackendClaimed` stays false.
- **Not "LLVM is faster than C."** No paired C measurement.
- **Not product Rust** under `src/`. No product C growth.
- Not added to `just check`. Measurement only.

## Notes

Just recipe bodies cannot contain raw `%` / `{` / `[` in LLVM IR text (just
lexer). The wrapper is built with hex bytes (`$'\x25'` and friends), then
deleted with the work dir.
