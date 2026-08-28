# Implement report: Wave 4 Emit speed E1-E4

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** product emit SSOT + dual Lean scaffold + regenerate freestanding wire + runtime rebench.
No claim-bool flips. PROVABLY != speed.
**ASCII only.** Plain American English.

**Status:** **GREEN** (correctness + documented best-effort). Operator bar "at least as good
as C malloc/heap_churn" **not fully met** on this host; honest residual gap remains after
max SSOT opt this wave.

---

## Goal

Implement residual Names **E1 Mint path inline emit**, **E2 Compose check extract fuse**,
**E3 Compose reset fast path**, and **E4 Flag default policy after matrix**. Prove with
`just bench-runtime` medians. Prefer freestanding <= heap_churn; if not, document ceiling.

---

## Done when (met)

| # | Outcome | Evidence |
|---|---------|----------|
| 1 | E1: specialized mint/consume/is_live in linear SSOT; wire regen | `host_emit_linear.ssot.txt` + EmitLinearScaffold dual-eq; `just build` |
| 2 | E2: extract single-walk fuse; fail-closed preserved | `host_emit_compose.ssot.txt` HOST_COMPOSE_EXTRACT_FUSE; stage check_fail_closed=0 |
| 3 | E3: compose reset count-only re-init; cold default full init | `slake_host_compose_reset`; opt-in `BENCH_RUNTIME_COMPOSE_RESET=1` |
| 4 | E4: timing-link default `-O3`; LTO optional ceiling | `just/bench-runtime.just` `BENCH_RUNTIME_CFLAGS` default `-O3` |
| 5 | Behavioral / systems-cc-probe green | probe + emit wire gates |
| 6 | Full `just bench-runtime` after opts | living `doc/BENCH-RUNTIME-latest.md` stamp 20260812T180810Z |
| 7 | Before/after medians recorded | table below |
| 8 | Residual E1-E4 **done**; free/complete/PROVABLY true; FullHost false | residual lockstep |
| 9 | User tip when real win vs named baseline | README tip 8 (compose freestanding win + O3 policy) |
| 10 | This report | path below |

---

## Authority paths

| Role | Path |
|------|------|
| Ownership SSoT | `src/systems/emit/host-owned-emit.md` |
| Linear SSOT | `src/systems/emit/host_emit_linear.ssot.txt` + `SystemsLean.EmitLinear` |
| Compose SSOT | `src/systems/emit/host_emit_compose.ssot.txt` + `SystemsLean.EmitCompose` |
| Generator | FreestandingEmit / `just build` (not hand-edit product C as SSoT) |
| Explore levers | `.agents/reports/explore-runtime-perf-levers-2026-08-12.md` |
| HostCost fuse honesty | `SystemsLean/HostCost.lean` L5/L7 (Nat model, not wall-clock) |
| Bench | `just bench-runtime`, `doc/BENCH-RUNTIME-latest.md`, metrics TSV |

---

## Before / after medians (primary table)

Baseline suite stamp **20260812T173934Z** (pre-Wave-4 product opts; timing-link default
was still **-O2**). Final suite stamp **20260812T180810Z** (E1-E4 in wire; timing-link
default **-O3**). Job classes unchanged: mint N=200000000; compose N=10000000; measured
runs=3 after discard.

| Arm / metric | Before median ns/op | After median ns/op | Delta freestanding | Notes |
|--------------|--------------------:|-------------------:|-------------------:|-------|
| R-free (mint freestanding) | **1.8891** | **1.8358** | ~2.8% faster | Noise band; E1 specialized path |
| R-gc-shape (mint heap_churn) | 0.6134 | 0.6346 | (baseline moves) | Pure malloc/free protocol |
| Mint free / heap ratio | 3.08x slower | **2.89x slower** | slightly closer | Still loses to malloc |
| R-free-compose | **39.7589** | **32.7845** | **~17.5% faster** | E2 fuse primary win |
| R-gc-shape-compose | 10.0805 | 10.1764 | (baseline moves) | malloc node-list |
| Compose free / gcomp ratio | 3.94x slower | **3.22x slower** | smaller gap | Still loses to heap protocol |
| R-boehm (mint) | 17.9711 | 17.7772 | -- | Free still ~9.7x faster after |
| R-lean (mint; N=50M) | 6.6897 | 6.2448 | -- | Free still ~3.4x faster after |
| Timing-link CFLAGS | `-O2` (default then) | **`-O3`** (E4) | policy | Structural freestanding `-c` fixed |
| Stage check_fail_closed | (pre-fuse paid) | **0.0000** | fused | Post-opt stage pass |
| Stage extract (stage pass) | -- | 30.3033 | -- | Relative attribution only |

### Headline ratios (final suite)

| Baseline | Freestanding vs baseline | free ns/op | baseline ns/op |
|----------|--------------------------|-----------:|---------------:|
| Boehm GC (mint) | **~9.7x faster** | 1.8358 | 17.7772 |
| Lean managed (mint) | **~3.4x faster** | 1.8358 | 6.2448 |
| heap_churn malloc (mint) | **~2.9x slower** | 1.8358 | 0.6346 |
| compose heap_churn | **~3.2x slower** | 32.7845 | 10.1764 |

Snapshot after final suite: `doc/bench-history/20260812T180856Z/`.

---

## E1 -- Mint path inline emit

**What:** Linear SSOT specialized mint / consume / is_live hot path (collapse thin call
layers; `static inline` style authority in SSOT text regenerated into wire).

**Paths:** `host_emit_linear.ssot.txt`, `EmitLinearScaffold.lean`, dual-eq WRITE via
CapableRegenerate after lake rebuild of regenerate tool when prebuilt lagged.

**Result:** Mint freestanding 1.8891 -> 1.8358 ns/op (marginal; still ~2.9x vs heap).
Behavioral probe contracts green. Does **not** close the pure-malloc gap alone.

---

## E2 -- Compose check extract fuse

**What:** Compose extract does a single fail-closed walk (`HOST_COMPOSE_EXTRACT_FUSE`);
check reuses one is_live style path; cold bench uses extract alone before post_check so
the driver does not double full check. HostCost L5/L7 already model fuse Nat honesty;
this is the wire realization.

**Paths:** `host_emit_compose.ssot.txt`, `EmitComposeScaffold.lean` (ownership honesty;
dual-eq is real gate), smoke `slake_runtime_bench_freestanding_compose.c`.

**Result:** Compose freestanding 39.7589 -> 32.7845 ns/op (**~17% win**). Stage timer
`check_fail_closed = 0` confirms fused cold path. Fail-closed preserved (probe + spent
MULT-1 product contracts). Still ~3.2x slower than compose heap_churn (setup + mult
pre-scan + API protocol cost dominate remaining gap).

**Note:** Early rebench regressed to ~66 ns/op when `compose_reset_enabled()` called
`getenv` every op. Fixed by caching env once; final numbers above include that fix.

---

## E3 -- Compose reset fast path

**What:** `slake_host_compose_reset` count-only re-init (fields reset without full cold
zero of entire struct when safe). Cold default remains full `init` for product-shape
honesty. Opt-in measurement: `BENCH_RUNTIME_COMPOSE_RESET=1`. Complements T9 micro mode
(`BENCH_RUNTIME_COMPOSE_MICRO=1`).

**Result:** API landed + gated. Cold suite arm stays full init (primary product-shape).
Stage timers still show setup (push/edges) as major cost under cold multi-op.

---

## E4 -- Flag default policy

**What:** After T3 O2/O3/LTO matrix evidence on this host, set **timing-link** default
`BENCH_RUNTIME_CFLAGS=-O3`. Structural freestanding-first `-c` (`-ffreestanding -nostdlib`
style compile check) **unchanged**. Optional `-O3 -flto` is a measured ceiling, not
default (link cost / soft-skip risk).

**Paths:** `just/bench-runtime.just`, `just/bench-runtime-report.just` report prose,
research `doc/dev/research/runtime-flag-matrix-2026-08-12.md`.

**Result:** Living report link lines show `-O3`. Override still
`BENCH_RUNTIME_CFLAGS="-O2"` or `"-O3 -flto"`.

---

## Honest ceiling (operator bar)

Operator bar: freestanding product runtime **at least as good as C** (heap_churn /
malloc baseline), ideally better.

| Job | Met? | Why remaining gap |
|-----|------|-------------------|
| Mint free <= heap | **No** | Fail-closed mult pre-scan, token API protocol, ownership fields vs raw malloc/free churn |
| Compose free <= gcomp | **No** | Graph setup (push nodes/edges), mark/check protocol, extract consume vs thin node-list malloc free |
| Mint free << Boehm / Lean RT | **Yes** | No GC / no Lean managed runtime on freestanding link |

Do **not** claim freestanding is faster than pure malloc microchurn without numbers.
Best-effort SSOT opts this wave are complete; further wins need larger protocol redesign
or different baselines (same work both sides), not more thin call-layer collapse alone.

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

## Gates (this wave)

| Gate | Result |
|------|--------|
| `just build` (wire refresh) | exit 0 (after lake rebuild CapableRegenerate when dual-eq lagged) |
| systems-cc-probe / behavioral | green |
| `just bench-runtime` | exit 0; living report 2026-08-12 18:08:10 UTC |
| `just hygiene` | exit 0 on touch |
| Dual-eq linear/compose | green after regenerate tool rebuild |
| Claim bools | not forged |

---

## Residual / docs lockstep

- `RESIDUAL-systems.md`: E1-E4 status **done**; living tip Wave 1-4 complete
- `RESIDUAL.md` join board: E1-E4 **done**; highest next mop/review
- `doc/SESSION-HANDOFF.md`: Active open table L5-L9 + E1-E4 **done**
- `WATCHER.md`: Wave 4 done; next mop/review
- `README.md` living tip 8: runtime Wave 4 numbers + honest heap gap
- Living report: `doc/BENCH-RUNTIME-latest.md`
- Metrics: `doc/BENCH-RUNTIME-metrics.tsv`
- Snapshot: `doc/bench-history/20260812T180856Z/`

---

## Summary for parent

Wave 4 E1-E4 **done**. Compose freestanding **~17% faster** than pre-opt (39.8 -> 32.8
ns/op). Mint freestanding noise-level improve (1.89 -> 1.84). Still **~2.9x / ~3.2x
slower** than heap_churn mint/compose. Beats Boehm (~9.7x) and Lean managed (~3.4x) on
mint. Timing default `-O3`. Report:
`.agents/reports/impl-wave4-emit-e1e4-5aac7784-2026-08-12.md`.
