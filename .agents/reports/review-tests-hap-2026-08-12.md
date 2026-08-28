# Tests / honesty review -- next-level high-assurance performance (2026-08-12)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Role:** tests/honesty reviewer (did not implement; spot-check)
**Scope:** Wave 1 twins + flag-matrix honesty; Wave 2 HostCost theorems vs
residual Done when; Wave 3 single fail-closed walk (probe, emit SSOT vs
generated C, living stamp **20260812T192951Z**, extract not skipped);
HostCost Nat not sold as ns/op.

---

## Verdict

**APPROVE**

**Blocking findings: 0**

No suggested failing tests. Residual Done when for Names 1-9 matches the
code and the gates this reviewer ran. Optional mop notes at the end are
not contract breaks.

---

## Method (what was checked)

| Surface | How reviewed |
|---------|----------------|
| Wave 1 twins + recipes | Read `slake_runtime_bench_stack_twin.c`, `slake_runtime_bench_fail_closed_shape.c`, `just/bench-runtime-twins.just`; ran `just bench-runtime-twin-contract` (exit 0) |
| Wave 2 Lean | Read `HostCost.lean` + `HostCostTheorems.lean` Wave 2 statements; presence tokens in `nix/systems-host-presence/host-specs-core-1.nix`; ran `lake build SystemsLean.HostCostTheorems` from `src/systems` (exit 0) |
| Wave 3 emit + probe | Read program/graph/compose SSOT + `host-owned-emit.md`; spot-check generated `emit/slake_freestanding.c` and `out/freestanding-c/`; ran `just systems-cc-probe` (exit 0; includes `just build` dual-eq regenerate) |
| Living bench stamp | Read `doc/BENCH-RUNTIME-latest.md` + `doc/BENCH-RUNTIME-metrics.tsv`; did **not** re-run full `just bench-runtime` |
| HostCost honesty | Headers, living report, RuntimeBenchLean; no ns/op sale |

Did **not** re-run `just bench-runtime` or `just bench-runtime-flag-matrix-honesty`.
Relied on living stamp + TSV + code contracts.

---

## 1. Wave 1 twins and flag-matrix honesty

Residual Done when (Names 1-3): smoke arms exist; living report shows mint vs
stack twin **and** mint vs heap; compose vs heap_churn **and** vs
`fail_closed_shape`; twins labeled not product wire; `-O3` and `-O3 -flto`
named; structural `-c` stays `-O2 -ffreestanding -nostdlib`; no `just build`
change.

| Contract | Evidence | OK? |
|----------|----------|-----|
| Stack twin smoke | `src/systems/smoke/slake_runtime_bench_stack_twin.c`: prints `arm=R-stack-twin`, `not_product_wire=1`; no `slake_freestanding.h`; no `malloc(`; mint/consume codes 0 / -1 / -2; remint after spent; untimed contract then timed loop | Yes |
| Fail-closed compose twin | `slake_runtime_bench_fail_closed_shape.c`: label `fail_closed_shape`; arm `R-fail-closed-shape`; caps 8+16; 3+2 graph; extract-shaped write; post spend FAIL_CLOSED; not heap_churn | Yes |
| Recipes | `just/bench-runtime-twins.just`: `bench-runtime-stack-twin`, `bench-runtime-fail-closed-shape`, `bench-runtime-flag-matrix-honesty`, `bench-runtime-twin-contract` | Yes |
| Twin contract gate | `just bench-runtime-twin-contract` this review: **exit 0** (`status=ok`) | Yes |
| Living report two-ratio story | Stamp **20260812T192951Z**: mint vs heap **0.6645 / 0.6748** (~1.0x faster); mint vs stack twin **0.6645 / 0.6336** (~1.0x slower); compose vs heap **17.5277 / 10.6737** (~1.6x slower; did **not** beat heap); compose vs fail_closed_shape **17.5277 / 18.2351** (~1.0x faster) | Yes |
| Flag-matrix honesty | Recipe writes `doc/bench-history/flag-matrix-honesty-latest.tsv`; living report embeds stamp **20260812T190614Z** cells for `-O3` and `-O3 -flto`; names `just bench-runtime-flag-matrix-honesty`; structural `-c` still `-O2 -ffreestanding -nostdlib` | Yes |
| Metrics TSV lockstep | `doc/BENCH-RUNTIME-metrics.tsv` stamp **20260812T192951Z** matches living medians (R-stack-twin, R-fail-closed-shape present) | Yes |

Twins do not include product headers and do not call `slake_*`. Heap_churn
arms remain. Primary cold compose arm is still full re-init (see Wave 3).

---

## 2. Wave 2 HostCost theorems (Names 5-8)

Companion `src/systems/SystemsLean/HostCostTheorems.lean` (576 lines; same
namespace `SystemsLean.HostCost`). Defs stay in `HostCost.lean` (359 lines).
Both under the 1000-line bar. Presence specs list the four Wave 2 theorem
names. This review: `lake build SystemsLean.HostCostTheorems` **exit 0**
(Lake 16 jobs). No sorry. No mathlib.

| Residual Done when | Statement on disk | Matches? |
|--------------------|-------------------|----------|
| Name 5: `costMultPreScan hc.graph.prog.nodes.length = hc.graph.prog.nodes.length` | `costMultPreScan_eq_live_nodes`: that equality via `costMultPreScan n = n * costNodeMultOk` and `costNodeMultOk = 1`. Optional `costCheckFailClosed_eq_live_nodes` = `1 + length` | Yes |
| Name 6: forall MULT-1 `!live` fail check and fused extract | `hostCost_spent_mult1_rejects_check` / `_extractFs`: `List.any` MULT-1 and `linear.live = false` imply `checkFailClosed = false` / `extractOkFs = false`. Fixture instances exist | Yes |
| Name 7: omega reuse vs MULT-1 exact-once | `hostCost_omega_share_vs_mult1_exact_once`: `And.intro (shareNat_reuse n) hostCost_exact_once_sequential_ref`. Header: HostCost contrast, **not** Token LinearCheck | Yes |
| Name 8: name thin Extract gap; do not close it | `hostCost_thin_extract_mult1_disagrees_compose`: `Extract.extractOk_mult1_fs_true` **and** compose `extractOkFs` spent fixture false. `extractOk_mult1_fs_true` still `rfl` in `ExtractTheorems.lean` | Yes |

`shareNat_reuse` remains `shareNat (shareNat n) = (n + n) + (n + n)` in
`LinearTheorems.lean`. Name 8 did not change the thin Extract theorem.

HostCost models Lean `HostCompose` (`checkFailClosed` = well-typed bar +
`multPreScan`). It does **not** count C nested walks. Wave 3 correctly left
the Nat model unchanged.

---

## 3. Wave 3 single fail-closed walk

Residual Done when: SSOT + Lean emit owners; `just build` regenerates wire;
behavioral probe + compose contract green; HostCost fuse honesty if Nat
changed; cold rebench vs both twins; no hand product C; do not skip extract;
do not change public extract/check meaning; do not forge compose <= heap.

| Contract | Evidence | OK? |
|----------|----------|-----|
| Program check one live walk | `host_emit_program.ssot.txt`: guards then `slake_ir_node_check_fail_closed` per live node; **does not** call `slake_ir_program_is_well_typed`. Token `SINGLE_FAIL_CLOSED_WALK` | Yes |
| Graph check | `host_emit_graph.ssot.txt`: edge soundness then `slake_ir_program_check_fail_closed`; **does not** call `slake_ir_graph_is_well_typed`. Empty graph still OK | Yes |
| Compose check | `host_emit_compose.ssot.txt`: Mult 1 / Mult 0 pre-scan then graph check; **does not** re-call graph well-typed. Token `HOST_COMPOSE_SINGLE_WALK` | Yes |
| Lean dual owners | `EmitProgramScaffold.lean`, `EmitGraphScaffold.lean`, `EmitComposeScaffold.lean` carry the same tokens | Yes |
| Ownership map | `src/systems/emit/host-owned-emit.md` lines 165-188: one live-node walk / edge soundness then program check / pre-scan then graph check; public `is_well_typed` stays; extract stays E2 fuse | Yes |
| Generated C = SSOT | `just systems-cc-probe` ran `just build`; dual-eq GREEN on program/graph/compose; wrote emit 33794 / 32574 chars; `cmp` emit vs `out/freestanding-c` identical | Yes |
| No hand product C | Wire comes from SSOT + Lean fragments + dual-eq writer. Reviewer did not see hand patches in `out/` | Yes |
| Public meaning unchanged | Probe still expects: null/empty program FAIL_CLOSED; well-typed OMEGA OK without mint; MULT-1 without token FAIL_CLOSED, with live token OK; MULT-0 unmarked FAIL_CLOSED, marked OK; empty compose extract writes `RUNTIME_FS`; extract fail leaves poison `out_rt`; `slake_extract_with_checks` still OK / FAIL_CLOSED | Yes |
| Probe this review | `just systems-cc-probe` **exit 0** (`systems-cc-probe GREEN`) | Yes |
| Extract not skipped | Cold compose driver `slake_runtime_bench_freestanding_compose.c`: poison `out_rt`, then `slake_host_compose_extract` (E2 fuse); post spend still `check_fail_closed` FAIL_CLOSED. Living report: "full re-init each op; extract not skipped" | Yes |
| Stage `check_fail_closed=0` | Living report **0.0000**; comment in driver: cost sits under extract. Attribution, not skipped extract | Yes (honest) |
| HostCost Nat unchanged | `costCheckFailClosed n = costHostIsWellTyped + costMultPreScan n`; Wave 2 theorems still those defs. Not re-sold as C walk counts | Yes |
| Compose did not beat heap | Living + residual: ~1.6x **slower** vs heap_churn (ratio 0.609). vs fail_closed_shape ~1.0x faster (ratio 1.040). No forge | Yes |
| Name 10 stays not open | Residual: leftover mixed (init + well_typed + pre-scan + node check + extract + post). Honest skip | Yes |

Subset packages (`emit/slake_{program,graph,compose}_subset.c`) still nest
well-typed walks. Wave 3 report names them as M1 subset, not product Out /
not the cold compose arm. Honest.

---

## 4. HostCost Nat not sold as ns/op

| Surface | What it says | OK? |
|---------|--------------|-----|
| `HostCost.lean` header | "NOT nanoseconds. NOT cycles." "Not wall-clock or cycle-count theorems (those are just bench-runtime)." | Yes |
| `HostCostTheorems.lean` header | Same; Wave 2 block: "Structural Nat / Bool only. NOT nanoseconds. NOT PROVABLY speed." | Yes |
| Living report | "HostCost Nat bounds (extract fuse, grade looks) are **not** nanoseconds. PROVABLY is CompCert wire correctness, not speed." | Yes |
| `RuntimeBenchLean.lean` | `stepTwin*` greppable "Not freestanding ns/op." | Yes |
| Residual / README tip 8 | Speed is empirical (`just bench-runtime`); never rename as PROVABLY | Yes |

No user-facing line treats HostCost `Nat` as wall-clock.

---

## 5. Gates this reviewer ran

| Command | Exit |
|---------|-----:|
| `just bench-runtime-twin-contract` | 0 |
| `just systems-cc-probe` (includes `just build` dual-eq) | 0 |
| `lake build SystemsLean.HostCostTheorems` (from `src/systems`) | 0 |

Did not re-run full `just bench-runtime`. Living stamp **20260812T192951Z**
and metrics TSV agree.

---

## Optional mop (not blocking; no failing-test theater)

These do **not** break residual Done when. Do not invent tests for them.

1. **`src/systems/types.md` graph check one-liner is stale.** Table still
   says `slake_ir_graph_check_fail_closed` is "well-typed then program check
   call-through." Product check is now edge soundness then program check
   (no `graph_is_well_typed` re-call). Public return cases are unchanged.
   Ownership map is already correct. On-touch scrub if that file is edited.

2. **Fail-closed-shape twin still nests well-typed walks.** Smoke comment
   still says "product re-walks these layers." After Wave 3, product check
   does not. Twin remains labeled **not product wire**; living report does
   not claim walk-count lockstep. Useful as a heavier protocol bar, not a
   lying product twin. Optional later: drop the stale "product re-walks"
   comment.

3. **Honesty-matrix TSV is pre-single-walk.** Embedded cells are stamp
   **20260812T190614Z** at smaller N (mint 2e7 / compose 2e6). Suite stamp
   **20260812T192951Z** is production N after the walk collapse. Stamps
   differ; section says suite numbers are `-O3 -flto` only. A reader who
   ignores the stamp could mix 31.67 compose with 17.53 compose. Optional:
   one sentence that honesty cells are a prior snapshot, or re-run
   `just bench-runtime-flag-matrix-honesty` after Wave 3.

No claim-bool flips were sold as this program's value. Pins remain:
free/complete/PROVABLY **true**; FullHostElaborateRemains **false**.

---

## Closeout

Wave 1-3 contracts hold. Wave 4 mop + review + closeout may take the optional
notes above; they are not REQUEST CHANGES.
