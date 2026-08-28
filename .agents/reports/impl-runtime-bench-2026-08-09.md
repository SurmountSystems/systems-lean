# Implement report: Runtime freestanding bench (2026-08-09)

Kind: measurement. Not residual invent. Not free/complete/PROVABLY/FullHost forge.

## Operator question (primary)

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## Answer (evidence)

On this machine (horizon, Linux x86_64, GCC 16.1.1, `-O2`):

| Arm | median ns/op | median wall (s) | Notes |
|-----|-------------:|----------------:|-------|
| R-free (linear mint/consume on product wire) | **3.0787** | 0.616 | No leanshared/libgc; freestanding-first `-c` ok |
| R-gc-shape (malloc/free every op) | **0.9206** | 0.184 | GC-shaped heap churn; not Boehm; not Lean GC |
| Ratio baseline/freestanding | **0.299** | | Freestanding **slower** on this microbench |

**Structural:** R-free links `slake_freestanding.c` + smoke driver only; `ldd` shows
libc only; freestanding-first compile mode `ffreestanding-nostdlib`.

**Mechanism:** linear ownership APIs (`slake_consume_token_*`) make exact-once
resources expressible without a GC on the product path. That is what makes the
freestanding wire feasible. This suite does **not** prove "fastest C on Earth."
On this token-class workload, cheap libc malloc/free beat the mint/consume path
by about 3.3x (empirical). **PROVABLY** remains CompCert correctness, not speed.

## Deliverables

| Path | Role |
|------|------|
| `src/systems/smoke/slake_runtime_bench_freestanding.c` | R-free timed driver |
| `src/systems/smoke/slake_runtime_bench_gcshape.c` | GC-shaped baseline |
| `just/bench-runtime.just` | `bench-runtime*` recipes + report writer |
| `doc/BENCH-RUNTIME-latest.md` | Living primary report |
| `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` | Methods note |
| Secondary scrub | `doc/BENCH-latest.md`, hot-cold research living tip |

## Gates

| Command | Exit |
|---------|------|
| `just bench-runtime` | 0 |
| `just hygiene` | 0 |

## Non-claims

free / complete / PROVABLY / FullHost / full parity **unchanged**.
Compile-path `just bench` is **secondary** only.
