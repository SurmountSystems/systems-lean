# Plan review: Next-level high-assurance performance (2026-08-12)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** plan review (role-swap; this reviewer did not write or implement the plan).
**Reviewer:** plan reviewer subagent
**Authority:** session `plan.md` vs `RESIDUAL-systems.md` + wave reports.

ASCII only. Plain American English. Complete sentences.

---

## Verdict

# **APPROVE**

Names 1-9 match the approved Done when. Assumption verdicts were honored.
Name 10 stays **not open** with leftover evidence that the remaining compose
gap is mixed, not clearly init. Two compose ratios are published. The
assurance triple is not collapsed into PROVABLY-as-speed. Pin floor is
intact. Hierarchical wave reports exist.

No **REQUEST CHANGES**. Findings below are nits for Wave 4 mop / closeout
(or plan-body lag). They do not reopen Names 1-9.

**Finding count:** 5 nits, 0 blockers.

---

## Authority compared

| Surface | Path | Role |
|---------|------|------|
| Approved program | Session `plan.md` (Next-level high-assurance performance) | Program at Approve time |
| Residual Systems SSoT | `RESIDUAL-systems.md` living tip + Open queue tables | Done status per Name |
| Coordinator join | `RESIDUAL.md` Systems Open | Join lockstep |
| Next action | `WATCHER.md` | Wave 3 done; Wave 4 mop + review + closeout |
| Reseed | `doc/SESSION-HANDOFF.md` Active tip | Names 1-9 done; Name 10 not open |
| Living speed evidence | `doc/BENCH-RUNTIME-latest.md` stamp **20260812T192951Z** | Mint/compose medians + honesty cells |
| Phase 0 | `.agents/reports/impl-phase0-hap-open-2026-08-12.md` | Opened Names 1-9; Name 10 not open |
| Wave 1a | `.agents/reports/impl-wave1a-hap-twins-2026-08-12.md` | Names 1-3 |
| Wave 1b | `.agents/reports/impl-wave1b-hap-hostcost-split-2026-08-12.md` | Name 4 |
| Wave 2 | `.agents/reports/impl-wave2-hap-hostcost-theorems-2026-08-12.md` | Names 5-8 |
| Wave 3 | `.agents/reports/impl-wave3-hap-single-fail-closed-walk-2026-08-12.md` | Name 9; Name 10 skip |

---

## Names 1-9 Done when

| # | Name | Residual | Plan Done when | Disk evidence | Met? |
|---|------|----------|----------------|---------------|------|
| 1 | Stack live-flag twin | **done** | Smoke arm; living report mint vs stack twin and vs heap under `-O3` and `-O3 -flto`; labeled not product wire; hygiene | `src/systems/smoke/slake_runtime_bench_stack_twin.c` (id+live+state; no malloc; no `slake_*`); suite stamp **20260812T192951Z**; honesty TSV **20260812T190614Z** both flag cells; labeled not product wire | **yes** |
| 2 | Fail-closed compose twin | **done** | Labeled `fail_closed_shape`; both compose ratios; primary cold arm unchanged | `slake_runtime_bench_fail_closed_shape.c`; living report vs heap **and** vs fail_closed_shape; "full re-init; extract not skipped"; heap_churn kept | **yes** |
| 3 | Flag-matrix honesty | **done** | Operator can reproduce both cells; living report names flags; no `just build` / probe LTO | Recipe `just bench-runtime-flag-matrix-honesty`; TSV + living-report table; structural `-c` still `-O2 -ffreestanding -nostdlib`; `just/*.just` product-wire has no `-flto` | **yes** |
| 4 | HostCost theorems split | **done** | Companion same namespace; HostCost under 1000; lake + presence; L1-L9 greppable | `HostCostTheorems.lean` namespace `SystemsLean.HostCost`; import in `SystemsLean.lean`; nix host-leans / required-files / host-specs-core-1; L1-L9 names remain; Wave 2 line counts HostCost **359** / companion **576** | **yes** |
| 5 | Scan cost vs live nodes | **done** | `costMultPreScan hc.graph.prog.nodes.length = ...nodes.length`; lake; not wall-clock | `theorem costMultPreScan_eq_live_nodes` plus optional `costCheckFailClosed_eq_live_nodes`; header says not wall-clock | **yes** |
| 6 | Universal spent reject | **done** | forall MULT-1 + `!live` fails check and fused extract; fixture is an instance | `hostCost_spent_mult1_rejects_check` / `_extractFs`; instances on `hostCostSpentMult1` | **yes** |
| 7 | Omega share exact-once contrast | **done** | Conjoin `shareNat_reuse` with exact-once; not Token LinearCheck | `hostCost_omega_share_vs_mult1_exact_once` is `And.intro` of `shareNat_reuse` and `hostCost_exact_once_sequential_ref`; header not Token LinearCheck | **yes** |
| 8 | Thin extract MULT-1 disagreement | **done** | Named theorem; cite gap; do not close it | `hostCost_thin_extract_mult1_disagrees_compose`; still cites `extractOk_mult1_fs_true`; gap not closed | **yes** |
| 9 | Single fail-closed walk | **done** | SSOT + Lean emit owners; `just build`; probe; HostCost if Nat changed; rebench vs both twins; no hand C | Program/graph/compose SSOT + `Emit*Scaffold.lean`; `host-owned-emit.md` walk prose; `just build` / probe / emit-wire claimed 0; HostCost Nat **unchanged** (documented); rebench stamp **20260812T192951Z** | **yes** |
| 10 | Init unroll | **not open** | Skip if leftover is not init | Wave 3 leftover mixed (init + explicit well_typed + pre-scan + per-node check + extract + post). Residual / WATCHER / handoff agree | **yes** (honest skip) |

Wave order matches the plan: Phase 0 docs, Wave 1a tools parallel with Wave 1b split, Wave 2 serialized on `HostCostTheorems.lean`, Wave 3 emit after fairness published. Emit waited for twins so story vs product stay distinct.

---

## Assumption verdicts

| # | Verdict | Honored? | Evidence |
|---|---------|----------|----------|
| 1 | Keep grades 0 / 1 / omega | **yes** | Product enum is only `SLAKE_MULT_0` / `_1` / `_OMEGA`. No `SLAKE_MULT_3`. Affine not this program. |
| 2 | Malloc is allocator baseline; add stack live-flag twin | **yes** | heap_churn kept; stack twin is the protocol bar; living report names both. |
| 3 | LTO is a production **timing-link** flag, not `just build` | **yes** | Default suite `-O3 -flto`; honesty cells include `-O3`; structural `-c` unchanged; living report says not `just build`. |
| 4 | Keep PROVABLY as CompCert; present a triple | **yes** | README item 2: PROVABLY is wire correctness. Living report: HostCost Nat is not ns. Speed stays `just bench-runtime`. |
| 5 | Drop compile-path re-run | **yes** | No `just bench` refresh claimed. |
| 6 | Drop seed / TERM / FullHost as perf work | **yes** | seed **206** / harness **99** / TERM **46**; FullHostElaborateRemains stays false; no seed-wide H2. |
| 7 | Revise compose 2.2x story; add fail-closed-shape twin; then collapse nested walks | **yes** | Two ratios published; Wave 3 collapsed nested well-typed re-calls; compose improved and still did **not** beat heap. |
| 8 | Reject stage timers as proof extract dominates | **yes** | Living report warns clock overhead. Name 10 skip uses mixed leftover, not timer-as-proof. Fuse `check_fail_closed` stage still 0. |
| 9 | Do not skip extract on the primary cold arm | **yes** | Living report: extract not skipped. Extract remains E2 fuse (one check then `RUNTIME_FS`). |
| 10 | Split HostCost before the prove wave | **yes** | Name 4 before Names 5-8. |

---

## Hierarchical subagents

Required reports exist per wave. Parent was coordinator; implementers wrote on disk.

| Wave | Report |
|------|--------|
| Phase 0 | `.agents/reports/impl-phase0-hap-open-2026-08-12.md` |
| Wave 1a (Names 1-3) | `.agents/reports/impl-wave1a-hap-twins-2026-08-12.md` |
| Wave 1b (Name 4) | `.agents/reports/impl-wave1b-hap-hostcost-split-2026-08-12.md` |
| Wave 2 (Names 5-8) | `.agents/reports/impl-wave2-hap-hostcost-theorems-2026-08-12.md` |
| Wave 3 (Name 9) | `.agents/reports/impl-wave3-hap-single-fail-closed-walk-2026-08-12.md` |

Wave 4 process mop is still queued (`WATCHER.md`). That is closeout, not a Names 1-9 miss.

---

## Two compose ratios

Living report stamp **20260812T192951Z** (timing-link `-O3 -flto`):

| Comparison | free-compose | baseline | Phrase |
|------------|-------------:|---------:|--------|
| vs heap_churn (allocator) | 17.5277 | 10.6737 | **~1.6x slower** (did **not** beat heap) |
| vs fail_closed_shape (protocol; not product wire) | 17.5277 | 18.2351 | **~1.0x faster** |

Mint also publishes both bars: vs heap **~1.0x faster** (0.6645 / 0.6748); vs stack twin **~1.0x slower** (0.6645 / 0.6336). Same numbers appear in residual living tip, `README.md` item 8, `doc/SESSION-HANDOFF.md`, and `out/freestanding-c/README.md`. Freestanding compose ns/op also dropped versus the Wave 1 stamp (27.8212 -> 17.5277). That is a product-arm change, not a story-only win.

---

## Triple not collapsed into PROVABLY speed

| Column | Living surface | What it may say (this program) |
|--------|----------------|--------------------------------|
| PROVABLY | CompCert product matrix; README item 2 | Wire correctness. Not speed. |
| Measured ns/op | `just bench-runtime` -> `doc/BENCH-RUNTIME-latest.md` | Nx faster/slower under named CFLAGS. |
| HostCost Nat | `HostCost.lean` + `HostCostTheorems.lean` | Structural bounds / fuse / spent reject / omega contrast. Not ns. |

Living report short answer states HostCost is not nanoseconds and PROVABLY is CompCert. Wave 2 theorems headers repeat that. No claim-bool flip sold the program.

---

## Pin floor intact

| Pin | Required | Observed |
|-----|----------|----------|
| free / complete / PROVABLY | **true** (do not re-open) | Residual living tip true; `provablyUnlocked : Bool := true` unchanged |
| FullHostElaborateRemains | **false** | Residual + DualResidual + HostResidualShrink false; FULLHOST_FLIP=no |
| DominanceClaimed / band FullBackend | **false** | Residual living tip |
| seed / harness / TERM | 206 / 99 / 46 | Residual + `measuredHostLibraryDiskPartition = "seed=206+Main=59+harness=99"` |
| package-env | Mult..ParityEmit + U2 + S5, not seed-wide | Residual living tip |
| Speed vs PROVABLY | Empirical only | README item 8 + living report |
| Three languages / no hand product C | Emit via SSOT + `just build` | Wave 3: regenerate, not hand C |
| Sub-1-KLOC HostCost | Split before Wave 2 | Both files well under 1000 |

---

## Name 10 leftover evidence

Plan default: skip Init unroll if Wave 3 leftover is not init.

Wave 3 stage pass (attribution only; clock-dominated; not whole-op 17.5 ns): init ~22, push_nodes ~25, edges ~24, mint ~23, mark ~23, well_typed ~25, extract ~26, consume ~24, post_check ~24; `check_fail_closed` 0. Remaining compose vs heap ~1.6x is mixed: cold init + bench explicit `is_well_typed` + Mult pre-scan + per-node check + extract + post_check.

Residual living tip, WATCHER, SESSION-HANDOFF, and the Wave 3 report all say leftover is **mixed, not clearly init**. Name 10 Status remains **not open**. Honest skip. Do not invent this work in closeout.

M1 subset packages (`emit/slake_{program,graph,compose}_subset.c`) still nest well-typed walks. Wave 3 report names that leftover. Those packages are not product Out and are not Name 10.

---

## Plan mid-body lag (not a residual lie)

Session `plan.md` **Read this first** / **Living tip (disk today, before this program)** still describes pre-program disk: empty Open DONE-FOR-NOW, HostCost **723** lines, suite stamp **20260812T181445Z**, compose **~2.2x** slower. Residual is the source of truth after implement. That plan-body lag would mislead only if someone reseeded from the plan instead of residual. Nit, not a blocker. Residual living tip matches stamp **20260812T192951Z**.

---

## Findings

### 1. Plan mid-body living tip is pre-program (nit)

Session plan still says Open empty done-for-now and HostCost 723. Residual + WATCHER + handoff are current. Do not rewrite residual to match the plan. Optional: a one-line "implemented; residual wins" note on the plan is closeout polish only.

### 2. Some residual Status snapshots lag the living tip (nit)

- Name 1 Status still cites suite stamp **20260812T190625Z** (Wave 1 close). Living tip is **20260812T192951Z**.
- Name 4 Status / SESSION-HANDOFF notes still say HostCost **351** / companion **471**. Wave 2 report after new theorems: **359** / **576**.
- Done-archive Wave 1 tools row still quotes Wave 1 medians (compose 27.8212).

Living tip is honest. Per-Name Status lines are close-time snapshots. Wave 4 closeout may refresh those snapshots if a reader would treat them as current suite numbers.

### 3. T3 archive Status still says default suite `-O2` (nit)

`RESIDUAL-systems.md` T3 **done** archive: "Default suite still `-O2`." That was true when T3 closed in the prior program. Living tip, E4, and LTO rows now say timing-link default **`-O3 -flto`**. Historical close text, not living Open. A one-line "superseded by E4+LTO" on that archive row would stop a reseed from T3 alone.

### 4. User-facing triple is split across README items (nit; Wave 4 item 12)

Plan Wave 4 closeout asked to present CompCert + ns/op + HostCost **together** in user-facing speed prose. README item 2 is PROVABLY-as-CompCert. Item 8 is the two mint and two compose ratios and "not PROVABLY." Item 8 does not name HostCost Nat as the third column. The living report does keep the three columns distinct. Not a collapse into PROVABLY speed. Closeout may add one HostCost sentence next to item 8.

### 5. Fail-closed-shape driver default N comment (nit)

`slake_runtime_bench_fail_closed_shape.c` header and `main` default **5000000**, with a comment that this matches freestanding compose calibration. Suite `BENCH_RUNTIME_COMPOSE_N` default is **10000000**; the just recipe passes that N, so the published suite is fair. The smoke comment is slightly stale. Not a fairness bug on the living report.

---

## Wave 4 remaining (not findings against Names 1-9)

Plan Wave 4: process mop, general + plan + tests reviews, then empty-Open done-for-now only after reviews APPROVE.

Already true: living product Open Names 1-9 **done**; Name 10 **not open**; WATCHER still **IN PROGRESS** (not DONE-FOR-NOW). That is the correct stop before mop + this review.

This file is the plan-review report. Do not mark WATCHER DONE-FOR-NOW from this review alone.

---

## Confirm (this reviewer)

- Read-only on product. Wrote only this report.
- Did not re-run implementer benches or lake as the Done when proof.
- Did not implement, flip pins, or open Name 10.

**Report path:** `.agents/reports/review-plan-hap-2026-08-12.md`
