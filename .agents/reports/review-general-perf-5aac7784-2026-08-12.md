# General review -- hierarchical performance program (T / L / E + Wave 4b LTO)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Role:** general reviewer (L2)
**Scope:** Phase 0 open + Waves 1-4 tools/Lean/emit + Wave 4b LTO + process mop

**Verdict:** **APPROVE** (with nits; no open correctness bugs)

ASCII only. Plain American English.

---

## Summary

The provable performance program is complete and honest for the named bar:

| Track | Status | Evidence class |
|-------|--------|----------------|
| T tools T1-T9 | done | just process glue + smoke measure + living report / metrics / history |
| L Lean L0-L9 | done | `SystemsLean.HostCost` + L0 map + RuntimeBenchLean step twin; lake green |
| E emit E1-E4 | done | linear/compose SSOT + regenerate wire; compose fuse + mint specialize + O3 policy |
| Runtime LTO timing default | done | production-N quiet suite free mint <= heap under `-O3 -flto`; compose gap held |

Pins free / complete / PROVABLY **true**, FullHostElaborateRemains **false**, DominanceClaimed / band FullBackend **false**, seed/harness **206/99**, TERM dual-ok **46** are **not** forged by this program. Speed is kept separate from PROVABLY everywhere that matters (HostCost headers, L0 map, living report, residual tip, README tip 8).

Process mop (`.agents/reports/process-mop-perf-5aac7784-2026-08-12.md`) reports hygiene / systems-host / systems-emit-wire / lake HostCost / systems-cc-probe green. Reviewer spot-check matches residual, living report stamp **20260812T181445Z**, and default `BENCH_RUNTIME_CFLAGS=-O3 -flto`.

---

## Spot-check matrix

### Correctness -- emit fuse / fail-closed

| Check | Result |
|-------|--------|
| Compose extract single-walk fuse (`HOST_COMPOSE_EXTRACT_FUSE`) | **OK.** `host_emit_compose.ssot.txt` extract calls `slake_host_compose_check_fail_closed` once then writes `SLAKE_RUNTIME_FS`; fail leaves `*out_rt` alone. Regenerated wire matches (`slake_freestanding.c`). |
| Cold smoke uses fuse path | **OK.** `slake_runtime_bench_freestanding_compose.c` cold loop: extract alone; explicit comment not to call check before extract. Stage `check_fail_closed` stays **0.0000** on living suite (cost under extract). |
| Post-consume still fail-closed | **OK.** Driver still expects spent post-check FAIL_CLOSED after consume. |
| E3 reset | **OK.** Count-only re-init; cold default full init; env cached once (Wave 4 getenv-per-op regression fixed). |
| E1 mint specialize | **OK.** Linear SSOT mint/consume/is_live collapse thin calls; same fail-closed codes (id 0, already live, double spend). |
| HostCost fuse vs wire | **OK.** Nat model: `costExtractOkFs = check + 1`; `hostCost_fuse_preserves_fail_closed` / `hostCost_fuse_preserves_reject`; spent MULT-1 fixture rejects under fuse. Structural host model, not wall-clock. |

**Honesty of "fuse":** Wire fuse is **driver single-walk** (one check inside extract), not a second mult-scan algebra on the host model. That matches HostCost L3/L5/L7 and stage timers. Acceptable for E2 Done when.

### Honesty -- PROVABLY != speed; mint bar; compose gap

| Check | Result |
|-------|--------|
| PROVABLY vs speed | **OK.** Living report short answer + L0 map + HostCost module header + residual tip + README tip 2/8. |
| Mint bar under LTO | **OK.** Quiet suite free **0.6164** <= heap **0.6171**; 5-run focused free **0.6214** <= heap **0.6270**. Policy default `-O3 -flto` timing-link only; freestanding-first `-c` fixed. High-load re-run noise documented. |
| Compose gap | **OK.** Free compose **25.46** vs gcomp **11.54** (~2.2x slower). Not forged free <= gcomp. |
| L6 no-heap | **OK.** Bool+Nat token model; explicit not ELF / ldd theorem. |
| L9 step twin | **OK.** Prints `step_twin_not=wall_clock`. |

### Claim-bool forge

**None found.** No free/complete/PROVABLY/FullHost/DominanceClaimed/band FullBackend flips in product Lean claim tips for this program. HostCost surface bools are host Nat/shape readiness only.

### Residual lockstep

| Surface | Status |
|---------|--------|
| `RESIDUAL-systems.md` T1-T9 L0-L9 E1-E4 + Runtime LTO | all **done** with Status detail |
| `RESIDUAL.md` join | Wave 4b tip; mint bar met; compose gap; Open Names done rows |
| Living report | stamp 20260812T181445Z; LTO link lines; spread + stage sections |
| README tip 8 | LTO mint bar + compose gap + not PROVABLY |
| Process mop | GREEN gates listed |

### Sub-1-KLOC / three languages

| Surface | Lines (reports / mop) | Bar |
|---------|----------------------:|-----|
| `HostCost.lean` | ~723 | under 1000 |
| `just/bench-runtime.just` | ends ~930 | under 1000 |
| `just/bench-runtime-report.just` | ends ~856 | under 1000 |
| RuntimeBenchLean | ~141 | fine |

Languages: product Lean (HostCost + dual emit scaffolds), pure Nix presence tokens, just process glue, permanent smoke C / product wire. No novel project Python. No restored shell mills. **OK.**

---

## Issues

### Issue 1 -- Severity: nit
- File: `/home/hunter/Projects/ai/iso/WATCHER.md:37`
- Description: After Wave 4b and a **GREEN** process mop report, the fenced block still ends with `/implement --effort 2 Process mop after Wave 4b...`. That can re-queue mop work the harness already finished, or look like the program is still mid-flight when residual Open for this program is empty.
- Suggestion: Parent or residual mop: rewrite `WATCHER_BEGIN`..`WATCHER_END` to a short **done-for-now** / review-complete fence (no `/implement` token) until a new Open Name (e.g. compose protocol redesign) is intentionally reopened. Keep pin floor and mint/compose honesty lines.
- Status: open

### Issue 2 -- Severity: nit
- File: `/home/hunter/Projects/ai/iso/RESIDUAL-systems.md:228` (T3 Done when historical field)
- Description: Open-schema **Done when** for T3 still says default path remains `-O2` unless E4 changes policy. Living Status and Wave 4b correctly supersede to `-O3 -flto`. Stale Done when text is easy to misread after compaction.
- Suggestion: Optional residual hygiene: one-line Status note already covers supersession; or append "historical Done when at open; living default is E4+LTO" without rewriting history bulk.
- Status: open

### Issue 3 -- Severity: nit
- File: `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/HostCost.lean:1` (module ~723 lines)
- Description: HostCost absorbed L1-L9 in one file. Still under Sub-1-KLOC with headroom, but another wave of cost theory would risk the 1000-line bar.
- Suggestion: If a future residual deepens HostCost further, open a named long-file split residual (role modules: fuse/opt, mult table, step twin) before stitching. Not required for this program close.
- Status: open

### Issue 4 -- Severity: suggestion
- File: `/home/hunter/Projects/ai/iso/doc/BENCH-RUNTIME-latest.md:20` and `just/bench-runtime.just:35-39`
- Description: Mint "as good as C" bar is met under **hosted timing-link** `-O3 -flto` (cross-TU inlining into the smoke driver), not under freestanding-first object compile alone. Implementers documented this; still easy for a later tip to drop the qualifier.
- Suggestion: Keep the timing-link / LTO qualifier on every user-facing mint-vs-heap claim (already present in tip 8 and living report). No product change required if discipline holds.
- Status: open

---

## What was deliberately not flagged as bugs

- Wave 4 pre-LTO mint still ~2.9x slower than heap under `-O3` alone: honest ceiling, then Wave 4b closed mint bar with policy change.
- Compose remaining ~2.2x: protocol cost (setup + extract/check shape), not a failed fuse.
- T6 regression not in default `just check`: intentional soft policy.
- Measurement smoke C growth: permanent behavioral/measure role, not freestanding product body.
- Wave 1 tools temporary hygiene red from peer HostCost non-ASCII: fixed before mop GREEN.

---

## Verdict

**APPROVE**

No open **bug** issues. Four nits/suggestions only (WATCHER mop token lag, residual T3 Done when archaeology, HostCost future split headroom, LTO qualifier discipline). Prefer ship / close program residual as implementers claimed; parent may clear WATCHER fence when review lands.

**Report path:** `.agents/reports/review-general-perf-5aac7784-2026-08-12.md`
