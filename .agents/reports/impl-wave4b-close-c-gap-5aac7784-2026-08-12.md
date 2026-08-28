# Implement report: Wave 4b close C gap (Runtime LTO timing default)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** tools / timing-link policy + measurement. No product C SSoT edit.
No claim-bool flips. PROVABLY != speed.
**ASCII only.** Plain American English.

**Status:** **GREEN**. Operator bar freestanding mint **at least as good as C**
(heap_churn malloc/free) **met** under fair `-O3 -flto` at production N on quiet
host suite. Compose still loses to compose heap_churn (protocol).

---

## Goal

After Wave 4 (E1-E4), freestanding mint was ~2.9x slower than heap_churn under
`-O3` alone. Wave 2 short-N matrix had freestanding LTO ~0.79 ns/op. This slice
re-checks production N, sets default if bar met, documents honest remaining gaps.

---

## Done when (met)

| # | Outcome | Evidence |
|---|---------|----------|
| 1 | Fair mint free vs heap under `-O3 -flto` at N=2e8 | Focused arms + full suite |
| 2 | If free median <= heap: default policy + rebench + docs | Default `-O3 -flto`; quiet suite stamp 20260812T181445Z |
| 3 | Else further mint SSOT | **Not needed** for mint bar (LTO closed gap) |
| 4 | Compose fuse / remaining gap documented | Stage check_fail_closed already 0; compose ~2.2x slower remains |
| 5 | Residual Name **Runtime LTO timing default** done | `RESIDUAL-systems.md` |
| 6 | User docs + living report | README tip 8; `doc/BENCH-RUNTIME-latest.md` |
| 7 | This report | path below |

---

## Fair mint comparison (production N)

**Flags on both arms:** hosted timing link `cc -std=c11 -O3 -flto` (structural
freestanding-first `-c` unchanged). N=**200000000**. Measured runs after outer
discard.

### Quiet focused 5-run trial (primary bar evidence)

| Arm | Measured ns/op samples | Median |
|-----|------------------------|-------:|
| R-free | 0.6273, 0.6179, 0.6214, 0.6230, 0.6179 | **0.6214** |
| R-gc-shape (heap_churn) | 0.6219, 0.6291, 0.6284, 0.6215, 0.6270 | **0.6270** |

**Result:** free **0.6214** <= heap **0.6270** (free slightly faster; noise band
tie). **Bar met.**

### Quiet full suite (default policy stamp)

Stamp **20260812T181445Z** / living report generated **2026-08-12 18:14:45 UTC**.
Default `BENCH_RUNTIME_CFLAGS=-O3 -flto`. Snapshot:
`doc/bench-history/20260812T181558Z/`.

| Arm / metric | Median ns/op | Notes |
|--------------|-------------:|-------|
| R-free mint | **0.6164** | stdev 0.0021 |
| R-gc-shape mint | **0.6171** | stdev 0.0044 |
| Ratio heap/free | **1.001** | free ~1.0x faster |
| R-boehm mint | 18.5725 | free ~30.1x faster |
| R-lean mint | 6.4041 | free ~10.4x faster (N labeled) |
| R-free-compose | **25.4574** | |
| R-gc-shape-compose | **11.5406** | free ~2.2x slower |
| Stage check_fail_closed | 0.0000 | fuse still holds |
| Stage extract | 28.7999 | still dominant group with setup |

### Contrast: same machine under `-O3` alone (no LTO)

From 5-run fair pair earlier same day (production N):

| Arm | Median-ish (5 measured) | vs other |
|-----|------------------------:|----------|
| R-free `-O3` | ~1.78 | ~2.9x slower than heap |
| R-gc-shape `-O3` | ~0.62 | |

LTO is the lever that closes the mint gap on this host (cross-TU inlining of
mint/consume into the smoke loop), not more multi-field SSOT alone under O3.

### High-load re-runs (honesty)

Later re-runs with load average ~25 showed both arms inflated (free ~1.2-1.5,
heap ~1.0-1.4) with higher variance. Living tip uses the **quiet** suite stamp
above. Do not claim forever-guaranteed free < heap on a thrashing machine.

---

## Policy change (E4 extension)

| Surface | Before Wave 4b | After Wave 4b |
|---------|----------------|---------------|
| Default `BENCH_RUNTIME_CFLAGS` | `-O3` | **`-O3 -flto`** |
| Structural freestanding-first `-c` | fixed `-O2 -ffreestanding -nostdlib` | **unchanged** |
| Override if LTO link fails | n/a | `BENCH_RUNTIME_CFLAGS="-O3"` |
| Residual Name | E4 done (O3) | **Runtime LTO timing default** done |

**Paths:** `just/bench-runtime.just`, `just/bench-runtime-report.just` (data-driven
heap honesty note), `doc/dev/research/runtime-flag-matrix-2026-08-12.md`.

---

## Mint SSOT further specialize

**Not required** for mint bar after LTO. Wave 4 E1 already specialized mint /
consume / is_live (no thin call layers). Remaining O3-only gap is call/protocol
vs raw malloc, closed by LTO into the driver. No further linear SSOT edit this
slice. No hand-edit product C.

---

## Compose remaining gap

| Item | Status |
|------|--------|
| E2 extract fuse | already landed; stage check_fail_closed = 0 |
| T9 micro mode | exists; cold remains primary suite arm |
| Quiet LTO compose vs heap | free **25.46** vs gcomp **11.54** (~2.2x slower) |
| Dominant cost | setup (init/push/edges) + extract/check protocol vs thin malloc list |

Operator bar for **mint** met. Compose still loses; do not forge compose free <=
gcomp. Further compose wins need protocol redesign / richer same-work baselines,
not more thin fuse alone.

---

## Before / after summary

| State | Mint free ns/op | Mint heap ns/op | free vs heap | Compose free | Timing default |
|-------|----------------:|----------------:|--------------|-------------:|----------------|
| Pre-Wave-4 (O2 era living) | ~1.89 | ~0.61 | ~3.1x slower | ~39.8 | `-O2` |
| Wave 4 done (O3) | 1.8358 | 0.6346 | ~2.9x slower | 32.7845 | `-O3` |
| **Wave 4b quiet (O3 -flto)** | **0.6164** | **0.6171** | **~1.0x faster (bar met)** | **25.4574** | **`-O3 -flto`** |

---

## Pins (unchanged)

| Pin | Value |
|-----|-------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness | 206 / 99 |
| TERM dual-ok | 46 |
| Speed == PROVABLY | **false** (never) |

---

## Gates

| Gate | Result |
|------|--------|
| Fair LTO mint free + heap | exit 0; bar met on quiet medians |
| `just bench-runtime` quiet suite | exit 0; stamp 20260812T181445Z |
| `just bench-runtime-snapshot` | `doc/bench-history/20260812T181558Z/` |
| `just hygiene` | exit 0 after docs |
| Claim bools | not forged |
| Product wire / `just build` | not required (no SSOT/wire change) |

---

## Residual / docs lockstep

- `RESIDUAL-systems.md`: Open Name **Runtime LTO timing default** **done**; living tip Wave 4b
- `RESIDUAL.md` join: LTO row **done**; ceiling text mint bar met
- `doc/SESSION-HANDOFF.md`: Active open + residual tip Wave 4b
- `WATCHER.md`: Wave 4b done; next mop/review
- `README.md` living tip 8: LTO mint bar + compose gap
- `out/freestanding-c/README.md`: Runtime evidence digest updated
- Living report: `doc/BENCH-RUNTIME-latest.md` (quiet stamp; honesty note fixed)
- Metrics / baseline: restored from quiet snapshot as tip
- Research: `doc/dev/research/runtime-flag-matrix-2026-08-12.md` production-N LTO

---

## Bar met?

| Question | Answer |
|----------|--------|
| Freestanding mint median <= heap_churn under fair LTO? | **Yes** (quiet suite free 0.6164 vs heap 0.6171; 5-run free 0.6214 vs heap 0.6270) |
| Freestanding compose <= compose heap? | **No** (~2.2x slower under same quiet suite) |
| Ideal "better than C" mint? | **Tied / slight free win** on quiet medians; not a large free win |
| Policy | Default timing link **`-O3 -flto`** |

---

## Report path

`.agents/reports/impl-wave4b-close-c-gap-5aac7784-2026-08-12.md`
