# Runtime timing-link flag matrix (2026-08-12)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / fullBackend claim flips. ASCII only.

**Related:** living suite `doc/BENCH-RUNTIME-latest.md` (`just bench-runtime`);
methods `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`.
**Recipes:** `just bench-runtime-flag-matrix` (T3 R-free mint);
`just bench-runtime-flag-matrix-honesty` (mint + compose, `-O3` and `-O3 -flto`);
env `BENCH_RUNTIME_CFLAGS`.
**Track:** residual Name **T3** (Wave 2 tools, done archive) plus Wave 1
**Flag-matrix honesty** (Name 3).

---

## Goal

Compare **hosted timing-link** CFLAGS for freestanding mint without changing
the **structural freestanding-first** compile of product wire:

```text
cc -c -std=c11 -O2 -ffreestanding -nostdlib -I emit -- wire .c
```

Timing link (driver + wire into a runnable binary on the host) uses:

```text
cc -std=c11 $BENCH_RUNTIME_CFLAGS -I emit -o bin driver.c wire.c
```

Default `BENCH_RUNTIME_CFLAGS` is **`-O3 -flto`** (E4 + Runtime LTO timing
default, 2026-08-12 Wave 4b) after production-N fair mint evidence that
freestanding median ns/op is **<=** heap_churn under the same LTO flags on this
host. Override to `-O3` or `-O2` if LTO link fails or for no-LTO contrast.
Structural freestanding-first `-c` is still fixed and **not**
`BENCH_RUNTIME_CFLAGS`.

---

## How to run

```bash
# Full default suite (timing link -O3 -flto), includes protocol twins
just bench-runtime

# One arm with different timing-link flags
BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-freestanding
BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-freestanding-compose
BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-stack-twin
BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-fail-closed-shape
BENCH_RUNTIME_CFLAGS="-O2" just bench-runtime-freestanding

# Matrix recipe T3: -O2, -O3, -O3 -flto on R-free mint (LTO soft-skips on link fail)
just bench-runtime-flag-matrix

# Honesty recipe (Name 3): -O3 and -O3 -flto for mint + compose + twins
just bench-runtime-flag-matrix-honesty

# Calibrate matrix N / runs
BENCH_RUNTIME_FLAG_MATRIX_N=20000000 BENCH_RUNTIME_FLAG_MATRIX_RUNS=2 \
  just bench-runtime-flag-matrix
BENCH_RUNTIME_FLAG_MATRIX_N=20000000 BENCH_RUNTIME_FLAG_MATRIX_COMPOSE_N=2000000 \
  BENCH_RUNTIME_FLAG_MATRIX_RUNS=2 just bench-runtime-flag-matrix-honesty
```

**Outputs:**

| Path | Role |
|------|------|
| `doc/bench-history/flag-matrix-latest.tsv` | Latest T3 R-free mint cells |
| `doc/bench-history/flag-matrix-<stamp>.tsv` | Stamped T3 copy |
| `doc/bench-history/flag-matrix-honesty-latest.tsv` | Latest mint+compose `-O3` / `-O3 -flto` cells |
| `doc/bench-history/flag-matrix-honesty-<stamp>.tsv` | Stamped honesty copy |
| `/tmp/systems-lean-bench-runtime-flag-matrix-*.log` | Full arm transcripts |

**Not in default `just check`.** Measurement only.

---

## What stays fixed (honesty)

| Surface | Policy |
|---------|--------|
| Structural freestanding-first `-c` | Always `-O2 -ffreestanding -nostdlib` (or hosted fallback); **not** `BENCH_RUNTIME_CFLAGS` |
| No GC / no Lean RT gate (T8) | Still runs on freestanding arms after link |
| Default suite | `-O3 -flto` timing link (E4 + LTO); override via `BENCH_RUNTIME_CFLAGS` |
| E4 | **done** (2026-08-12): first default `-O3` |
| Runtime LTO timing default | **done** (2026-08-12 Wave 4b): production-N fair mint free <= heap; default `-O3 -flto` |

---

## Measured table (this host)

Land-time short matrix (N=2000000, runs=2; not production suite N). TSV SoT:
`doc/bench-history/flag-matrix-latest.tsv` (refresh with
`just bench-runtime-flag-matrix`).

| stamp | flags | arm | N | ns_median | ns_mean | ns_min | ns_max | status |
|-------|-------|-----|---|-----------|---------|--------|--------|--------|
| 20260812T174931Z | `-O2` | R-free | 2000000 | 2.7198 | 2.7197 | 2.7099 | 2.7296 | ok |
| 20260812T174931Z | `-O3` | R-free | 2000000 | 2.5378 | 2.5378 | 2.0419 | 3.0337 | ok |
| 20260812T174931Z | `-O3 -flto` | R-free | 2000000 | 0.7931 | 0.7931 | 0.6688 | 0.9173 | ok |

Notes: short N is noisier than production suite N=2e8; LTO cell was much faster
here. **Wave 4b production-N recheck (N=2e8, runs=5 measured after outer
discard):** fair mint under `-O3 -flto` freestanding median **0.6214** ns/op vs
heap_churn **0.6270** ns/op (free **<=** heap; bar met). Under `-O3` alone free
~1.78 vs heap ~0.62 (~2.9x slower). Structural `structural_gate=pass` on every
cell. Default suite is now **`-O3 -flto`**.

**Living production suite:** `doc/BENCH-RUNTIME-metrics.tsv` / `just
bench-runtime` at full N for headline multipliers vs Boehm / Lean / heap_churn
and vs smoke-only protocol twins (stack live-flag, fail_closed_shape; **not
product wire**). Default suite timing link is `-O3 -flto`. Contrast `-O3`
cells live in `flag-matrix-honesty-latest.tsv` and are copied into the living
report when that TSV exists.

## Honesty cells (mint + compose; Name 3)

Recipe: `just bench-runtime-flag-matrix-honesty`. Timing link only. Structural
`-c` stays `-O2 -ffreestanding -nostdlib`. Does not change `just build` or the
product probe compile. Arms: R-free, R-gc-shape, R-stack-twin, R-free-compose,
R-gc-shape-compose, R-fail-closed-shape. Flags: `-O3` and `-O3 -flto`.

Measured table (this host; honesty recipe stamp **20260812T190614Z**; N_mint=20000000,
N_compose=2000000, runs=2). TSV SoT: `doc/bench-history/flag-matrix-honesty-latest.tsv`.
Living report section **Flag-matrix honesty cells**. Operator can reproduce both
cells with the recipe or with `BENCH_RUNTIME_CFLAGS="-O3"` / default `-O3 -flto`
on named arms.

| stamp | flags | arm | N | ns_median | ns_mean | ns_min | ns_max | status |
|-------|-------|-----|---|-----------|---------|--------|--------|--------|
| 20260812T190614Z | `-O3` | R-free | 20000000 | 2.0314 | 2.0314 | 1.9261 | 2.1367 | ok |
| 20260812T190614Z | `-O3` | R-gc-shape | 20000000 | 1.0901 | 1.0901 | 1.0826 | 1.0976 | ok |
| 20260812T190614Z | `-O3` | R-stack-twin | 20000000 | 1.0738 | 1.0738 | 1.0609 | 1.0867 | ok |
| 20260812T190614Z | `-O3` | R-free-compose | 2000000 | 67.8119 | 67.8119 | 63.1390 | 72.4849 | ok |
| 20260812T190614Z | `-O3` | R-gc-shape-compose | 2000000 | 12.4505 | 12.4505 | 11.7300 | 13.1711 | ok |
| 20260812T190614Z | `-O3` | R-fail-closed-shape | 2000000 | 29.5022 | 29.5022 | 26.0889 | 32.9154 | ok |
| 20260812T190614Z | `-O3 -flto` | R-free | 20000000 | 0.9772 | 0.9772 | 0.8291 | 1.1254 | ok |
| 20260812T190614Z | `-O3 -flto` | R-gc-shape | 20000000 | 1.0170 | 1.0170 | 0.9492 | 1.0847 | ok |
| 20260812T190614Z | `-O3 -flto` | R-stack-twin | 20000000 | 0.9008 | 0.9008 | 0.7745 | 1.0271 | ok |
| 20260812T190614Z | `-O3 -flto` | R-free-compose | 2000000 | 31.6688 | 31.6688 | 29.4472 | 33.8905 | ok |
| 20260812T190614Z | `-O3 -flto` | R-gc-shape-compose | 2000000 | 11.8850 | 11.8850 | 11.2503 | 12.5198 | ok |
| 20260812T190614Z | `-O3 -flto` | R-fail-closed-shape | 2000000 | 20.4040 | 20.4041 | 20.2967 | 20.5114 | ok |

Notes: honesty N is smaller than production suite N (mint 2e8 / compose 1e7).
Under **`-O3`** (no LTO) freestanding mint is slower than heap_churn and about
even with the stack twin; compose is slower than both heap_churn and
fail_closed_shape. Under **`-O3 -flto`** mint is close to heap and to the stack
twin. Production-N suite stamp **20260812T190625Z** is the headline table.
Structural `-c` stayed `-O2 -ffreestanding -nostdlib`. Not `just build`.

---

## Structural no-GC gate (T8 polish)

Freestanding arms print greppable lines:

| Line | Meaning |
|------|---------|
| `structural_gate=pass arm=R-free` | ldd/nm clean (or tools soft-skipped) |
| `structural_gate=fail_ldd arm=...` | matched Lean RT / libgc / boehm in ldd; arm exits 1 |
| `structural_gate=fail_nm arm=...` | matched GC_/leanshared/boehm symbols; arm exits 1 |
| `structural_gate_ldd=skip_no_ldd` | no `ldd` on PATH; soft-skip that step |
| `structural_gate_nm=skip_no_nm` | no `nm` on PATH; soft-skip that step |

Fail messages list **matched** lines so operators see why. Soft-skip when tools
missing still OK. Bench is **not** folded into default `just check`.

---

## Baseline snapshot (T5)

| Command | Effect |
|---------|--------|
| `just bench-runtime` | Overwrites living latest + metrics TSV |
| `just bench-runtime-snapshot` | Copies metrics (+ report) to `doc/bench-history/<stamp>/` and tip `doc/BENCH-RUNTIME-baseline.tsv` |

Living files keep overwriting. Snapshots are durable history for later T6
regression compare.

---

## Out of scope

- Changing structural freestanding `-c` flags
- Forging freestanding "no GC" as a Lean theorem about ELF
- Changing default suite flags without E4
- Claim-bool flips
- Product wire hand edits
