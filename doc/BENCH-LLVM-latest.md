# LLVM IR assemble / object / execute bench

Generated: **2026-08-12 23:51:46 UTC**

Kind: wall-clock of generator LLVM IR under `out/llvm-ir/`.
**Not** CompCert. **Not** PROVABLY. **Not** the C product wire
(`just bench-runtime` / `doc/BENCH-RUNTIME-latest.md`).
**Not** a production backend claim. Band `*FullBackendClaimed` stays false.

## What was timed (this run)

- **Assemble:** `llvm-as` of existing generator `*_ssa.ll` (skip-honest if a file is absent).
- **Object:** `llc -filetype=obj` into a `TMPDIR` work dir (deleted after), when `llc` is on PATH.
- **Execute:** tiny `TMPDIR` LLVM wrapper over Mult SSA (`slake_mult_ssa_grade_tag` + `slake_mult_ssa_kernel_band_ready`); native `clang` or `lli`. Soft-skip if the IR has no main and cannot link.

## How much faster / slower

This suite reports LLVM wall times **on their own**. It does **not** claim LLVM is faster or slower than the C product wire. Those are different surfaces. This recipe did not run `just bench-runtime`, so there is no paired C-vs-LLVM headline.

## Numbers -- assemble (llvm-as)

Measured runs per file: **3** after one warmup. Times are outer wall seconds for `llvm-as FILE -o /dev/null`.

| File | Status | bytes | median wall (s) | min | max |
|------|--------|------:|----------------:|----:|----:|
| `slake_mult_ssa.ll` | ok | 3139 | 0.006000 | 0.006000 | 0.008000 |
| `slake_linear_ssa.ll` | ok | 2275 | 0.007000 | 0.006000 | 0.007000 |
| `slake_types_ssa.ll` | ok | 3240 | 0.007000 | 0.007000 | 0.008000 |
| `slake_program_ssa.ll` | ok | 3524 | 0.007000 | 0.006000 | 0.007000 |
| `slake_graph_ssa.ll` | ok | 3382 | 0.007000 | 0.005000 | 0.008000 |
| `slake_compose_ssa.ll` | ok | 4542 | 0.007000 | 0.007000 | 0.008000 |

## Numbers -- object (llc -filetype=obj)

Measured runs per file: **3** after one warmup. Object files live only under `TMPDIR` and are deleted after the suite.

| File | Status | obj bytes | median wall (s) | min | max |
|------|--------|----------:|----------------:|----:|----:|
| `slake_mult_ssa.ll` | ok | 1152 | 0.011000 | 0.010000 | 0.011000 |
| `slake_linear_ssa.ll` | ok | 1104 | 0.010000 | 0.009000 | 0.010000 |
| `slake_types_ssa.ll` | ok | 1152 | 0.010000 | 0.009000 | 0.010000 |
| `slake_program_ssa.ll` | ok | 1168 | 0.010000 | 0.010000 | 0.012000 |
| `slake_graph_ssa.ll` | ok | 1152 | 0.009000 | 0.009000 | 0.011000 |
| `slake_compose_ssa.ll` | ok | 1544 | 0.011000 | 0.010000 | 0.011000 |

## Numbers -- execute

IR has no @main; tiny TMPDIR wrapper calls Mult SSA grade_tag + kernel_band_ready.

| Item | Value |
|------|-------|
| Status | ok |
| Path | clang -O2 wrap.ll + slake_mult_ssa.ll (native) |
| N (loop trips) | 20000000 |
| median wall (s) | 0.019000 |
| min / max (s) | 0.019000 / 0.021000 |

## Tools

| Tool | Present | Version line |
|------|---------|--------------|
| llvm-as | 1 | LLVM version 22.1.8 |
| llc | 1 | LLVM version 22.1.8 |
| clang | 1 | clang version 22.1.8 |
| lli | 1 | LLVM version 22.1.8 |
| llvm-link | 1 | (used only for lli path) |

## How to re-run

```bash
just bench-llvm
# calibrate: BENCH_LLVM_RUNS=5 BENCH_LLVM_EXEC_N=50000000 just bench-llvm
```

## Machine

| Item | Value |
|------|-------|
| Hostname | horizon |
| uname -srm | Linux 7.1.8-zen1-3-zen x86_64 |
| nproc | 16 |

## Methods (short)

| Stage | Command | Soft-skip |
|-------|---------|-----------|
| assemble | `llvm-as FILE -o /dev/null` | `skip_no_llvm_as` / `skip_absent` |
| object | `llc -filetype=obj -o TMPDIR/FILE.o FILE` | `skip_no_llc` / `skip_absent` |
| execute | `clang -O2` wrapper + Mult SSA, else `llvm-link`+`lli` | `skip_no_execute_tools` / `skip_cannot_link` / `skip_no_mult_ssa` |

Candidates (existing files only): Mult, Linear, Types, Program, Graph, Compose `*_ssa.ll`.
Compose SSA is skip-honest if the sibling writer has not landed it yet.

## Limits / non-claims

- **Not CompCert. Not PROVABLY.** PROVABLY stays C-only. LLVM assemble success is not a correctness seal.
- **Not the C product wire.** Freestanding C lives under `emit/` and `out/freestanding-c/`. This report is not `doc/BENCH-RUNTIME-latest.md`.
- **Not FullBackend.** Band `*FullBackendClaimed` stays false. Not a production LLVM backend.
- **Not "LLVM is faster than C."** No paired C measurement in this recipe.
- **Not product Rust** under `src/`. Execute driver is TMPDIR-only and is deleted.
- Speed is empirical on this machine. Re-run for your host.

## Paths

| What | Path |
|------|------|
| This report | `doc/BENCH-LLVM-latest.md` |
| Full transcript | `/tmp/systems-lean-bench-llvm-20260812T235146Z.log` |
| Recipes | `just/bench-llvm.just` |
| IR inputs (read-only) | `out/llvm-ir/*_ssa.ll` |
| C runtime suite (different question) | `just bench-runtime` |

## Overall

**ok** (measured what tools allowed; missing files and tools soft-skip)

