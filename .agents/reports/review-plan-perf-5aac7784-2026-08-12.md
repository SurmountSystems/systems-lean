# Plan review: Provable performance optimization (IMPL 5aac7784)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** plan review (Z2). Read-only compare of approved program vs residual Open/Done + wave reports.
**Reviewer:** plan reviewer subagent

**ASCII only.** Plain American English. Complete sentences.

---

## Verdict

# **APPROVE**

Product program Tracks **T1-T9**, **L0-L9**, **E1-E4**, plus additive **Runtime LTO timing default** (Wave 4b), are opened, implemented, and closed with tools proof. Operator mint bar (freestanding vs C heap_churn) is **met** under fair timing-link flags. Compose gap remains honest. Living product Open for this program is **empty**; next action is process mop / residual honesty only (not inventable product Names).

No **REQUEST CHANGES** on product Done when. Process nits below are for Wave 5 mop (Z1/Z3), not reopen of T/L/E.

---

## Authority compared

| Surface | Path | Role |
|---------|------|------|
| Approved program (status plan body) | Session `plan.md` Remaining work: T1-T9 / L0-L9 / E1-E4 waves + Phase 0 / Wave 5 Z | Program definition at approve time (still describes pre-implement "not started" living tip) |
| Residual Systems SSoT | `RESIDUAL-systems.md` Living Open + Open queue tables | Done status per Name |
| Coordinator join | `RESIDUAL.md` Systems Open Open Names table | Join lockstep |
| Next action | `WATCHER.md` | Wave 4b done; mop/review next |
| Reseed | `doc/SESSION-HANDOFF.md` Active open | T/L/E + LTO done |
| Living speed evidence | `doc/BENCH-RUNTIME-latest.md` stamp **20260812T181445Z** | Mint/compose medians |
| Phase 0 open | `.agents/reports/impl-phase0-perf-program-open-5aac7784-2026-08-12.md` | All T/L/E opened |
| Wave reports | `impl-wave{1,2,3}-*-5aac7784-*`, `impl-wave4-emit-e1e4-*`, `impl-wave4b-close-c-gap-*` | Implement evidence |
| Explores (design only) | `explore-runtime-perf-levers`, `explore-perf-prove-tools`, `explore-perf-bench-tools` (2026-08-12) | Pre-implement analysis |

---

## Checklist (required)

### 1. All T1-T9, L0-L9, E1-E4 opened and closed (or honest remaining)

| Band | Opened (Phase 0) | Closed | Evidence |
|------|------------------|--------|----------|
| **T1-T9** | yes | **all done** | Wave 1 tools T1 T2 T4; Wave 2 tools T3 T5 T8; Wave 3 tools T6 T7 T9 |
| **L0-L9** | yes | **all done** | Wave 1 Lean L0 L1; Wave 2 Lean L2 L3 L4; Wave 3 Lean L5-L9 (`HostCost.lean` + RuntimeBenchLean twin) |
| **E1-E4** | yes | **all done** | Wave 4 emit report; E4 first `-O3`, living default superseded by Wave 4b `-O3 -flto` |
| **Runtime LTO** (additive bar close) | residual Name after Wave 4 | **done** | Wave 4b report + living suite stamp |

**Honest remaining (not failed Done when):**

- Compose freestanding still **~2.2x slower** than compose heap_churn under LTO (protocol / setup + extract, not forged free).
- High-load machine noise can inflate both mint arms; living tip uses quiet suite stamp.
- T7 host `perf` soft-skips when `perf` missing (`skip_no_perf`); recipe exists.
- HostCost is Nat structural cost, **not** wall-clock PROVABLY; pins free/complete/PROVABLY **true** unchanged; FullHost **false**.

No product Name left **open** with unfinished Done when.

### 2. Wave order followed

Approved order:

```
Phase 0 -> Wave 1 (T1 T2 T4 + L0 L1) -> Wave 2 (T3 T5 T8 + L2 L3 L4)
        -> Wave 3 (T6 T7 T9 + L5..L9) -> Wave 4 (E1..E4 sequential) -> Wave 5 (Z mop/review/final)
```

| Phase | What landed | Match |
|-------|-------------|-------|
| Phase 0 | Residual/WATCHER/handoff open all T/L/E | **yes** (Z Names not residual-opened as full Open schema; process only) |
| Wave 1 | tools T1 T2 T4 + Lean L0 L1 in parallel tracks | **yes** |
| Wave 2 | tools T3 T5 T8 + Lean L2 L3 L4 | **yes** |
| Wave 3 | tools T6 T7 T9 + Lean L5-L9 | **yes** |
| Wave 4 | E1 then E2 then E3 then E4 (one report, sequential Done when) | **yes** |
| Wave 4b | LTO timing default after E4 O3 still lost mint bar | **honest additive**; closes operator mint bar |
| Wave 5 | Z1 mop / Z2 this review / Z3 final | **in flight** (WATCHER queues mop; this file is Z2) |

Emit after T+L preferred: **respected**. No invent FullHost / seed-wide H2 / mathlib.

### 3. Operator performance bar: mint vs C with tools proof

| Requirement | Result |
|-------------|--------|
| Fair freestanding mint vs C malloc (`heap_churn`) | **Bar met** under default timing-link **`-O3 -flto`** |
| Quiet full suite (stamp **20260812T181445Z**) | free **0.6164** vs heap **0.6171** (~1.0x faster; free <= heap) |
| Focused 5-run production N | free **0.6214** vs heap **0.6270** |
| Pre-LTO honesty | Wave 4 under `-O3` alone still ~2.9x slower; LTO is the lever |
| Tools proof surface | `just bench-runtime` (T1 stage timers, T2 min/max/stdev, T4 metrics TSV), T3 flag matrix history, T5 snapshot `doc/bench-history/20260812T181558Z/`, living `doc/BENCH-RUNTIME-latest.md` |
| Compose vs C | **Not** bar-met; free **25.4574** vs gcomp **11.5406** (~2.2x slower). Documented; no forge |

Default CFLAGS confirmed in `just/bench-runtime.just`: `BENCH_RUNTIME_CFLAGS` default **`-O3 -flto`**. Structural freestanding-first `-c` unchanged.

### 4. Residual empty or next action clear

| Surface | State |
|---------|-------|
| Product Open Names (T/L/E + LTO) | **empty / all done** |
| WATCHER | Wave 4b done; next **process mop** residual/WATCHER/handoff consistency; optional hygiene; **do not invent Open Names** |
| SESSION-HANDOFF | Active: program done Wave 1-4 + 4b; next mop/review |
| Pins | free/complete/PROVABLY **true**; FullHost **false**; DominanceClaimed **false**; band FullBackend **false**; seed 206 harness 99; TERM dual-ok 46 |

Next action is **clear** and process-scoped. Optional compose protocol residual only if operator reopens (not currently Open).

### 5. No false DONE-FOR-NOW while checkable work remains

| Check | Result |
|-------|--------|
| Product T/L/E Done when unfinished? | **No** |
| Empty Open while plan still lists unstarted T/L/E? | **No** on disk residual (session plan body is stale status prose; residual owns living tip) |
| DONE-FOR-NOW used to skip mop/review? | **No**: WATCHER still points at process mop; not silent park of Z |
| Invented product Names after program close? | **No** |

---

## Name-by-name rollup (residual + report)

### Track T (tools)

| Id | Name | Status | Report |
|----|------|--------|--------|
| T1 | Compose stage timers | done | `impl-wave1-tools-t1t2t4-5aac7784-2026-08-12.md` |
| T2 | Runtime run spread stats | done | same |
| T3 | Runtime flag matrix | done | `impl-wave2-tools-t3t5t8-5aac7784-2026-08-12.md` |
| T4 | Machine-readable arm metrics | done | Wave 1 tools |
| T5 | Living baseline snapshot store | done | Wave 2 tools |
| T6 | Runtime regression vs previous | done | `impl-wave3-tools-t6t7t9-5aac7784-2026-08-12.md` |
| T7 | Host perf attach recipe | done (soft-skip no perf OK) | Wave 3 tools |
| T8 | Structural no-GC gate polish | done | Wave 2 tools |
| T9 | Compose microbench mode | done | Wave 3 tools |

### Track L (Lean Nat cost)

| Id | Name | Status | Report |
|----|------|--------|--------|
| L0 | Perf-prove user map | done | `impl-wave1-lean-l0l1-5aac7784-2026-08-12.md` |
| L1 | Host cost steps | done | same; `SystemsLean/HostCost.lean` |
| L2 | Fixed cap complexity | done | `impl-wave2-lean-l2l3l4-5aac7784-2026-08-12.md` |
| L3 | Extract fuse cost | done | same |
| L4 | Mint consume automaton | done | same |
| L5 | Fail-closed opt preserve | done | `impl-wave3-lean-l5l9-5aac7784-2026-08-12.md` |
| L6 | No-heap host machine | done | same |
| L7 | Differential fuse model | done | same |
| L8 | Joint mult cost table | done | same |
| L9 | RuntimeBenchLean step twin | done | same |

### Track E (emit speed) + LTO

| Id | Name | Status | Report |
|----|------|--------|--------|
| E1 | Mint path inline emit | done | `impl-wave4-emit-e1e4-5aac7784-2026-08-12.md` |
| E2 | Compose check extract fuse | done (~17% compose win pre-LTO) | same |
| E3 | Compose reset fast path | done (cold default full init) | same |
| E4 | Flag default policy | done (`-O3`; living superseded by LTO) | same |
| LTO | Runtime LTO timing default | done (mint bar met) | `impl-wave4b-close-c-gap-5aac7784-2026-08-12.md` |

---

## Process nits (non-blocking; Wave 5 mop)

These do **not** change the APPROVE verdict for product T/L/E/LTO.

1. **Session `plan.md` living tip is stale.** Status plan still says Phase 0 not landed / T/L/E not implemented. Residual + WATCHER + handoff + living bench are authoritative. Z3/final should rewrite session plan status (or leave it as historical approve snapshot and point at residual).
2. **`RESIDUAL.md` top "Living tip wins" paragraph** still says "Wave 1-4 complete" without Wave 4b in one early sentence, while Systems Open join + Host finish table already say Wave 1-4 + 4b. Mop should make the top tip match join.
3. **Wave 5 Z1/Z2/Z3** were not Phase-0 residual Open Names with full schema. Acceptable for process close if mop lands reports; do not invent product residual. This review satisfies Z2 substance.
4. **Open Names table header** in `RESIDUAL.md` still says "perf program T/L/E open" while all rows are **done**. Cosmetic honesty mop.

---

## Honesty confirmation

| Claim | Reviewer view |
|-------|---------------|
| free / complete / PROVABLY true | **not reopened**; no forge |
| FullHostElaborateRemains false | **held** |
| Speed != PROVABLY | **consistent** across residual, HostCost, living report |
| Mint free <= heap under LTO | **tools-proved** on quiet suite |
| Compose free <= gcomp | **false**; remaining protocol gap honest |
| False DONE-FOR-NOW | **not observed** for this program |

---

## Verdict summary

| Question | Answer |
|----------|--------|
| Product program complete per plan Tracks T/L/E? | **Yes** |
| Wave order honest? | **Yes** (+ justified 4b for mint bar) |
| Operator mint vs C bar with tools proof? | **Met** |
| Residual product Open empty / next clear? | **Yes** (mop) |
| False park while checkable product remains? | **No** |
| **Verdict** | **APPROVE** |

**Report path:** `.agents/reports/review-plan-perf-5aac7784-2026-08-12.md`

---

## Suggested Wave 5 mop (not required for this APPROVE)

1. Align `RESIDUAL.md` top living tip + Open Names header with Wave 4b done.
2. Optionally refresh session `plan.md` status tip to "program complete" or archive pointer.
3. `just hygiene` if docs touch.
4. Short Z3 final lockstep report if harness expects one; product residual may stay empty.
