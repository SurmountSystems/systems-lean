# Final closeout: Provable performance optimization program (IMPL 5aac7784)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** hierarchical program final closeout (docs lockstep only).
**ASCII only.** Plain American English.

**Status:** **GREEN**. Product T/L/E + Runtime LTO **closed**. Living Open **empty
done-for-now**. Process mop already **GREEN**. Reviews all **APPROVE** (nits only).

---

## Hierarchy summary

| Stage | What | Outcome |
|-------|------|---------|
| **Phase 0** | Open residual Names T1-T9, L0-L9, E1-E4; lockstep residual / WATCHER / handoff | Opened program after S1-S8 empty done-for-now |
| **Wave 1 tools** | T1 compose stage timers; T2 run spread; T4 metrics TSV | **done** |
| **Wave 1 Lean** | L0 perf-prove user map; L1 HostCost Nat steps | **done** |
| **Wave 2 tools** | T3 flag matrix; T5 snapshot baseline; T8 structural gate polish | **done** |
| **Wave 2 Lean** | L2 fixed cap complexity; L3 extract fuse cost; L4 mint/consume automaton | **done** |
| **Wave 3 tools** | T6 regression gate; T7 host perf attach; T9 compose micro mode | **done** |
| **Wave 3 Lean** | L5 fail-closed opt preserve; L6 no-heap host machine; L7 differential fuse; L8 mult cost table; L9 RuntimeBenchLean step twin | **done** |
| **Wave 4 emit** | E1 mint path inline; E2 compose check/extract fuse; E3 compose reset; E4 O3 policy | **done** |
| **Wave 4b** | Runtime LTO timing default; mint bar free <= heap under `-O3 -flto` | **done** (bar **met**) |
| **Process mop** | Hygiene / host / emit-wire / lake HostCost / cc-probe consistency | **GREEN** |
| **Reviews** | Plan + general + tests | **APPROVE** x3 (nits only) |
| **Final closeout** | Residual / WATCHER / handoff / RESIDUAL.md lockstep; this report | **this file** |

---

## Tools inventory (Track T) -- all done

| Id | Name | Role |
|----|------|------|
| T1 | Compose stage timers | `stage_ns_per_op_*` on compose smoke (not product wire) |
| T2 | Runtime run spread stats | min / max / sample stdev in living report |
| T3 | Runtime flag matrix | O2 / O3 / optional LTO on timing link only |
| T4 | Machine-readable arm metrics | `doc/BENCH-RUNTIME-metrics.tsv` |
| T5 | Living baseline snapshot store | `doc/bench-history/` + tip baseline TSV |
| T6 | Runtime regression vs previous | `just bench-runtime-regress` (suite opt-in) |
| T7 | Host perf attach recipe | `just bench-runtime-perf-mint` / `compose` |
| T8 | Structural no-GC gate polish | structural_gate=pass/fail lines |
| T9 | Compose microbench mode | hot shell reuse; cold remains primary |

Primary paths: `just/bench-runtime*.just`, smoke drivers, living report, research notes under
`doc/dev/research/runtime-*-2026-08-12.md`.

---

## Lean inventory (Track L) -- all done

| Id | Name | Role |
|----|------|------|
| L0 | Perf-prove user map | PROVABLY vs speed vs structural cost (research) |
| L1 | Host cost steps | `SystemsLean/HostCost.lean` mint/consume/check/extract Nats |
| L2 | Fixed cap complexity | programCap / edgeMax bounds lemmas |
| L3 | Extract fuse cost | extract = check + 1 |
| L4 | Mint consume automaton | exact-once sequential Nat=3 |
| L5 | Fail-closed opt preserve | fuse le naive + spent reject |
| L6 | No-heap host machine | HostCostTokenState Bool+Nat (not ELF proof) |
| L7 | Differential fuse model | double-check vs fused Nat |
| L8 | Joint mult cost table | MULT-0/1/OMEGA look costs |
| L9 | RuntimeBenchLean step twin | stepTwin* + HostCost twin |

HostCost stays under Sub-1-KLOC. No dual-ok harness invent. Seed **206** harness **99**.

---

## Emit inventory (Track E + LTO) -- all done

| Id | Name | Role |
|----|------|------|
| E1 | Mint path inline emit | Specialized mint / consume / is_live linear SSOT |
| E2 | Compose check extract fuse | Single-walk extract; stage check_fail_closed=0 |
| E3 | Compose reset fast path | `slake_host_compose_reset`; cold default full init |
| E4 | Flag default policy after matrix | First `-O3`; living default superseded by LTO |
| LTO | Runtime LTO timing default | Default `BENCH_RUNTIME_CFLAGS=-O3 -flto`; mint bar met |

Structural freestanding-first `-c` flags remain fixed (`-O2 -ffreestanding -nostdlib`).
Only hosted timing-link flags changed for fair production comparison.

---

## Performance proof table

Quiet full suite stamp **20260812T181445Z** (living `doc/BENCH-RUNTIME-latest.md`).
Timing-link default **`-O3 -flto`**. Production N on mint arms.

| Comparison | Free (ns/op) | Baseline (ns/op) | Result |
|------------|-------------:|-----------------:|--------|
| Mint freestanding vs heap_churn | **0.6164** | **0.6171** | **~1.0x faster**; free <= heap **bar met** |
| Mint freestanding vs Boehm | 0.6164 | 18.5725 | **~30x faster** |
| Mint freestanding vs Lean managed | 0.6164 | 6.4041 | **~10x faster** (N labeled) |
| Compose freestanding vs compose heap | **25.4574** | **11.5406** | **~2.2x slower** (protocol gap; honest) |

Focused 5-run mint pair (same flags): free median **0.6214** <= heap **0.6270**.
Under `-O3` alone (no LTO), mint free was ~2.9x slower than heap; LTO closed that gap.
High-load re-runs noisier; living tip uses the quiet suite stamp above.
**PROVABLY is wire correctness, not speed.**

---

## Pins unchanged (must stay)

| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| tip fullBackend A-light | **true** |
| multiUnit Mult..Graph DF deepen | **true** (not DominanceClaimed) |
| seed / harness | **206** / **99** |
| TERM dual-ok | **46** |
| package-env | Mult..ParityEmit + U2 + S5 CompilePathJoinMapSelfHostSurfaceMatrix |
| FULLHOST_FLIP | **no** (S7) |
| Speed renamed PROVABLY | **never** |

No claim-bool flips in this closeout. Docs only.

---

## Review verdicts

| Review | Path | Verdict |
|--------|------|---------|
| Plan | `.agents/reports/review-plan-perf-5aac7784-2026-08-12.md` | **APPROVE** (nits for mop only) |
| General | `.agents/reports/review-general-perf-5aac7784-2026-08-12.md` | **APPROVE** (nits only) |
| Tests | `.agents/reports/review-tests-perf-5aac7784-2026-08-12.md` | **APPROVE** (nits only) |
| Process mop | `.agents/reports/process-mop-perf-5aac7784-2026-08-12.md` | **GREEN** |

Nits addressed by this final closeout: WATCHER **DONE-FOR-NOW** (no auto `/implement`);
residual Open empty done-for-now; highest-value next = program closed; handoff tip closed.

---

## Report index (this program)

### Explore (design only)

| Report |
|--------|
| `.agents/reports/explore-runtime-perf-levers-2026-08-12.md` |
| `.agents/reports/explore-perf-prove-tools-2026-08-12.md` |
| `.agents/reports/explore-perf-bench-tools-2026-08-12.md` |

### Phase 0 + implement waves

| Report | Role |
|--------|------|
| `.agents/reports/impl-phase0-perf-program-open-5aac7784-2026-08-12.md` | Phase 0 open |
| `.agents/reports/impl-wave1-tools-t1t2t4-5aac7784-2026-08-12.md` | Wave 1 tools |
| `.agents/reports/impl-wave1-lean-l0l1-5aac7784-2026-08-12.md` | Wave 1 Lean |
| `.agents/reports/impl-wave2-tools-t3t5t8-5aac7784-2026-08-12.md` | Wave 2 tools |
| `.agents/reports/impl-wave2-lean-l2l3l4-5aac7784-2026-08-12.md` | Wave 2 Lean |
| `.agents/reports/impl-wave3-tools-t6t7t9-5aac7784-2026-08-12.md` | Wave 3 tools |
| `.agents/reports/impl-wave3-lean-l5l9-5aac7784-2026-08-12.md` | Wave 3 Lean |
| `.agents/reports/impl-wave4-emit-e1e4-5aac7784-2026-08-12.md` | Wave 4 emit |
| `.agents/reports/impl-wave4b-close-c-gap-5aac7784-2026-08-12.md` | Wave 4b LTO |

### Mop + reviews + final

| Report | Role |
|--------|------|
| `.agents/reports/process-mop-perf-5aac7784-2026-08-12.md` | Process mop GREEN |
| `.agents/reports/review-plan-perf-5aac7784-2026-08-12.md` | Plan APPROVE |
| `.agents/reports/review-general-perf-5aac7784-2026-08-12.md` | General APPROVE |
| `.agents/reports/review-tests-perf-5aac7784-2026-08-12.md` | Tests APPROVE |
| `.agents/reports/impl-final-perf-5aac7784-2026-08-12.md` | **This final closeout** |

### Living evidence surfaces

| Surface | Role |
|---------|------|
| `doc/BENCH-RUNTIME-latest.md` | Living runtime report (stamp 20260812T181445Z) |
| `doc/BENCH-RUNTIME-metrics.tsv` | Machine metrics |
| `doc/BENCH-RUNTIME-baseline.tsv` | Tip baseline for regress |
| `doc/bench-history/` | Snapshots |
| `doc/dev/research/perf-prove-user-map-2026-08-12.md` | L0 map |
| `doc/dev/research/runtime-flag-matrix-2026-08-12.md` | T3 matrix |
| `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` | T6/T7/T9 |

---

## Lockstep updated this slice

| Path | Change |
|------|--------|
| `WATCHER.md` | **DONE-FOR-NOW**; pin floor; no `/implement` auto-queue |
| `RESIDUAL-systems.md` | Next product work **closed**; Open empty done-for-now; Done archive final row |
| `RESIDUAL.md` | Highest value next = program closed; Open Names header closed; evidence index |
| `doc/SESSION-HANDOFF.md` | Active tip program closed; WATCHER DONE-FOR-NOW |

No product Lean / C edits. No claim flips.

---

## Promote-later only (not Open)

1. Compose protocol residual (optional) if operator wants to close ~2.2x compose gap
2. FullHost true: H1-H8 bar + lake (H2 still partial vs seed 206)
3. DominanceClaimed / band FullBackend true: XL bar + lake
4. Package 3 mathlib: **C4 non-goal**
5. Host UX: **C5 out of this repo**

---

## Stop rule

Empty Open with no checkable plan default next residual: **honest done-for-now**.
Do not invent Open Names. Do not forge free / complete / PROVABLY / FullHost /
DominanceClaimed / band FullBackend without bar + lake. Speed is empirical only.
