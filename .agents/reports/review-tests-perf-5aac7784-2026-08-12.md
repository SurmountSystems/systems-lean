# Tests / honesty review -- performance program IMPL 5aac7784

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Role:** tests/honesty reviewer (spot-check; no full multi-minute suite re-run)
**Scope:** runtime bench contracts, structural no-GC, soft-skips, stage timers / metrics TSV / regression opt-in, HostCost Nat surface, behavioral probe after emit fuse, living report honesty (mint LTO parity; compose slower)

---

## Verdict

**APPROVE**

## Status

**No open blocking issues.**

Optional non-blocking follow-ups are listed at the end (not required for green on this program).

---

## Method (what was checked)

| Surface | How reviewed |
|---------|----------------|
| Runtime arms + structural gate | `just/bench-runtime.just` (R-free, R-free-compose, soft-skips, T6/T7/T8/T9) |
| Suite / report / metrics | `just/bench-runtime-report.just`; living `doc/BENCH-RUNTIME-latest.md`; `doc/BENCH-RUNTIME-metrics.tsv` stamp **20260812T181445Z** |
| Default CI | root `justfile` `check:` deps (no `bench-runtime`, no regress) |
| HostCost | `src/systems/SystemsLean/HostCost.lean` header + surface; pure Nix presence in `nix/systems-host-presence/` |
| Emit fuse + probe | compose SSOT/wire extract; `slake_runtime_bench_freestanding_compose.c`; `slake_behavioral_probe.c` host_compose block |
| User docs honesty | root `README.md` tip 8; residual living tip; Wave 4b implement report |
| Impl reports | Wave 1-4 tools/Lean/emit + Wave 4b LTO close |

Did **not** re-run full `just bench-runtime` or multi-minute arms. Relied on living stamp + code contracts.

---

## 1. Runtime bench contracts -- fail-closed, soft-skips

| Contract | Evidence | OK? |
|----------|----------|-----|
| Measured arm hard fail | Suite `run_arm`: non-zero arm exit sets `overall=1`; soft-skip arms must exit **0** with `status=skip_*` | Yes |
| Soft-skip no `cc` | Suite + freestanding arms: `status=skip_no_cc`, suite exit 0 | Yes |
| Soft-skip Boehm | `skip_no_boehm` when link/libgc missing; contrast arm only | Yes |
| Soft-skip Lean | `skip_no_lake` / `skip_lean_build`; timed process after untimed warm lake build | Yes |
| Soft-skip perf (T7) | `skip_no_perf` documented; not in default suite | Yes |
| Soft-skip tools in structural gate (T8) | `ldd`/`nm` missing -> `structural_gate_ldd=skip_no_*` / `skip_no_nm`; gate step skipped, not arm soft-pass with GC | Yes |
| Structural fail hard when tools present | R-free and R-free-compose: `leanshared` / `libgc` / `GC_*` / `boehm` in `ldd` or `nm` -> `structural_gate=fail_*`, arm exit 1 | Yes |
| In-driver fail-closed | Freestanding mint: untimed double-consume `-2`; compose: extract/post_check fail-closed paths return nonzero codes | Yes |
| Job class separation | Report tables split mint / lean / compose; labeled N for Lean; "do not merge" prose | Yes |

No issue: suite treats soft-skips as exit 0 and real failures as overall fail. Structural no-GC is fail-closed on freestanding arms when tools exist.

---

## 2. Stage timers / metrics TSV / regression opt-in (not default CI)

| Item | Evidence | OK? |
|------|----------|-----|
| Stage timers smoke-only (T1) | Compose smoke: separate stage pass; keys `stage_ns_per_op_*` + groups; `BENCH_RUNTIME_STAGE_TIMERS=0` off; product wire has **no** always-on timers | Yes |
| Stage `check_fail_closed=0` post-E2 | Living report **0.0000**; cold path uses extract alone (fuse); post_check still runs check | Yes (honest attribution) |
| Spread stats (T2) | Report min/max/stdev columns; scrape drops first sample when multi-run | Yes |
| Metrics TSV (T4) | Each suite writes `doc/BENCH-RUNTIME-metrics.tsv` (header + one row per arm; stamp/arm/exit/job_class/N/ns_*) | Yes (stamp 20260812T181445Z present) |
| Snapshot (T5) | `just bench-runtime-snapshot` -> `doc/bench-history/<stamp>/` + tip baseline | Yes (history dirs present) |
| Regression (T6) | `just bench-runtime-regress` opt-in; suite only if `BENCH_RUNTIME_REGRESS=1`; default suite **never** hard-fails CI on regress; soft-skip missing baseline/metrics | Yes |
| **Not in `just check`** | Root `check:` = build + pure gates + elaborators + `systems-cc-probe` + CompCert matrix. **No** `bench-runtime`, **no** regress | Yes |
| Flag matrix (T3) / LTO default | Timing-link `BENCH_RUNTIME_CFLAGS` default **`-O3 -flto`** (Wave 4b); structural freestanding-first `-c` fixed (`-O2 -ffreestanding -nostdlib`) | Yes |
| Compose micro (T9) | Opt-in; cold remains primary suite arm | Yes |

**CI honesty:** default continuous-integration surface does not depend on wall-clock benches or regression thresholds. Correct for flaky/host-load measurement.

---

## 3. HostCost -- lake / Nat cost proof surface (not wall-clock)

| Claim | Evidence | OK? |
|-------|----------|-----|
| Nat steps only | Module header: "NOT nanoseconds. NOT cycles"; "Not wall-clock or cycle-count theorems" | Yes |
| Not PROVABLY speed | Explicit non-claims; residual / L0 map same | Yes |
| Fuse Nat model | `costExtractOkFs` / `costExtractOkFs_eq_check_plus_one`; L5 `costFused_le_naive` + fail-closed preserve; L7 diff fuse | Yes |
| Surface aggregate | `hostCostSurfaceOk` + `hostCostSurfaceOk_true` (`native_decide`) | Yes |
| Presence gate | `HostCost.lean` in host-leans + required-files; host-specs-core-1 tokens `HOST-COST-*` | Yes |
| Not dual-ok invent | Residual seed/harness **206/99**; HostCost not dual-ok harness | Yes (as claimed) |
| Proof surface | `lake build SystemsLean.HostCost` (implement reports exit 0); not wall-clock | Yes |

HostCost is correctly positioned as **structural Nat accounting** supporting fuse honesty, not a substitute for `just bench-runtime` or PROVABLY.

---

## 4. Behavioral probe after emit fuse (E2)

| Check | Evidence | OK? |
|-------|----------|-----|
| Wire fuse | `slake_host_compose_extract` = one `check_fail_closed` walk then write; greppable `HOST_COMPOSE_EXTRACT_FUSE` in emit C/SSOT | Yes |
| Bench cold path | Compose smoke: extract alone before post_check; does not pre-pay full check in timed loop | Yes |
| Probe host_compose | `slake_behavioral_probe.c`: null fail-closed; empty extract OK + RUNTIME_FS; MULT-1 without mint FAIL_CLOSED on check **and** extract; spend/remint; edges | Yes |
| Fail-closed preserved | Probe + HostCost L5 spent MULT-1 / double-consume refs; Wave 4 report systems-cc-probe green | Yes |
| In default CI | `just check` -> `systems-cc-probe` links probe against product wire | Yes |

Emit fuse does not drop fail-closed. Probe remains a strong product-wire contract surface for host_compose after E2.

---

## 5. Bench report honesty -- mint LTO parity; compose still slower

Living report stamp **2026-08-12 18:14:45 UTC** / metrics **20260812T181445Z**:

| Comparison | Living numbers | User-facing claim | Honest? |
|------------|----------------|-------------------|---------|
| Mint free vs heap_churn | free **0.6164** / heap **0.6171** (~1.001 heap/free) | **~1.0x faster**; bar free <= heap under **`-O3 -flto`** | Yes; notes timing-link flags; noise-band tie language OK |
| Mint free vs Boehm | ~30.1x faster | ~30x faster | Yes |
| Mint free vs Lean RT | ~10.4x faster; N labeled (2e8 vs 5e7) | ~10x; labeled contrast | Yes |
| Compose free vs gcomp | free **25.4574** / gcomp **11.5406** (~2.2x slower) | **~2.2x slower**; protocol | Yes; do-not-merge mint/compose |
| PROVABLY | Explicit not speed | README + report | Yes |
| Structural | ldd no leanshared/libgc on R-free; Boehm shows libgc; Lean RT present | Report structural tables | Yes |
| Quiet-suite caveat | Wave 4b notes high-load re-runs inflate variance | Living tip uses quiet stamp | Yes |

Root `README.md` tip 8 matches living report (LTO default, mint bar met, compose still slower). Good lockstep.

Wave 4 implement report still records pre-LTO mint gap under `-O3` alone; Wave 4b supersedes for living tip. Historical archive is fine as land-time evidence, not living SoT.

---

## 6. Suggested missing regression tests (non-blocking)

None of these are required to APPROVE; they would tighten future residual if reopened.

1. **Dedicated probe case: mint then `extract` alone (no prior `check_fail_closed`)** on a live MULT-1 host_compose. Current probe often pairs check then extract (still validates extract fail paths). Cold bench already uses extract alone; a single probe assert would put the fused happy path under `just check` without wall-clock.

2. **Optional cheap structural ldd/nm on `systems-cc-probe` binary** (soft-skip tools missing). Today no-GC ELF honesty is only on bench-runtime freestanding arms (intentional: not default CI). Only add if operator wants always-on structural in `just check`.

3. **Stale comment** in `slake_behavioral_probe.c` header still mentions deleted `src/systems/check.sh`. Cosmetic mop only.

4. **Residual archive row lag (T3 Done text)** may still say suite default `-O2` at land-time; living tip and code default are `-O3 -flto`. Prefer living tip as SoT; optional archive footnote if re-touched.

5. **HostCost / RuntimeBenchLean**: already lake + presence. No further wall-clock Lean tests desired (would conflate stories).

---

## Summary table

| Focus area | Result |
|------------|--------|
| Fail-closed measured arms | Pass |
| Soft-skips (cc / Boehm / Lean / perf / ldd-nm tools) | Pass |
| Structural no-GC freestanding arms | Pass (hard fail when tools present) |
| Stage timers smoke-only | Pass |
| Metrics TSV each suite | Pass |
| Regression opt-in only; not `just check` | Pass |
| HostCost Nat not wall-clock / not PROVABLY speed | Pass |
| Behavioral probe + fuse fail-closed | Pass |
| Mint LTO parity claim | Pass (quiet suite; free <= heap) |
| Compose still slower claim | Pass (~2.2x) |

---

## Verdict (repeat)

**APPROVE**

**Status:** no open blocking issues.

**Report path:** `.agents/reports/review-tests-perf-5aac7784-2026-08-12.md`
