# General review -- next-level high-assurance performance (Waves 1-3 + mop)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Role:** general reviewer (did not implement Waves 1-3)
**Scope:** Wave 1a twins, Wave 1b HostCost split, Wave 2 HostCost theorems,
Wave 3 single fail-closed walk, Wave 4a process mop

**Verdict:** **APPROVE** (0 open findings)

ASCII only. Plain American English. No product edits.

Trusted reports (spot-checked, not re-implemented):

- `.agents/reports/impl-wave1a-hap-twins-2026-08-12.md`
- `.agents/reports/impl-wave1b-hap-hostcost-split-2026-08-12.md`
- `.agents/reports/impl-wave2-hap-hostcost-theorems-2026-08-12.md`
- `.agents/reports/impl-wave3-hap-single-fail-closed-walk-2026-08-12.md`
- `.agents/reports/process-mop-hap-wave4-2026-08-12.md`

Did **not** re-run `just bench-runtime`. Did **not** re-run full lake / hygiene
(mop already listed those green). Spot-check is code + residual + living report
vs the five reports.

---

## Summary

Names 1-9 match the approved program. Name 10 Init unroll stays **not open**.
Living Open is empty. Wave 4 mop + review + closeout is process, not a product
Name.

| Wave | Names | On disk | Honest leftover |
|------|-------|---------|-----------------|
| 1a | 1-3 twins + flag cells | Smoke twins + just recipes + living report stamp **20260812T192951Z** | Twins labeled not product wire |
| 1b | 4 HostCost split | `HostCost.lean` **359**; `HostCostTheorems.lean` **576**; same namespace | Line-count notes in some residual tables still cite the post-split 351/471 |
| 2 | 5-8 theorems | Four named theorems; no sorry; extract gap named not closed | HostCost Nat is Lean HostCompose, not C walk counts |
| 3 | 9 single walk | SSOT + Lean duals + regenerated wire; no hand product C | Subset packages still nest well-typed; leftover cost is mixed |
| 4a | mop | Hygiene / host / emit-wire / probe / lake HostCost green | Residual footer nit below |

Pins free / complete / PROVABLY **true**, FullHostElaborateRemains **false**,
DominanceClaimed / band FullBackend **false** are **not** forged. Compose vs
heap is still **~1.6x slower**. PROVABLY stays CompCert, not speed.

---

## Open findings

None.

---

## Nits (Wave 4 closeout; do not block APPROVE)

### Nit 1 -- stale "Next residual implement prompt" footer

`RESIDUAL-systems.md` living Open (top) says Names 1-9 **done** and Open
**empty**. The footer under **Next residual implement prompt** still says
"Open queue: **Names 1-9 open**" (about line 2025). That footer is leftover
Phase 0 text.

Living driver surfaces are honest:

- Living Open / Open queue tables: Names 1-9 **done**; Name 10 **not open**
- `WATCHER.md`: Wave 3 done; Open empty; Wave 4 mop + review
- `doc/SESSION-HANDOFF.md`: same
- Coordinator `RESIDUAL.md` Systems Open: same

`WATCHER.md` remains the sole next-action fence. Closeout should scrub the
footer so it does not contradict living Open. Not a product forge.

### Nit 2 -- HostCost line-count notes lag Wave 2

Name 4 Done-when and `SESSION-HANDOFF.md` table still say HostCost **723->351**
and companion **471**. After Wave 2 docs + theorems, disk is **359** /
**576**. Status **done** is still true. Optional closeout line-count refresh
only.

---

## Spot-check matrix

### 1. Pin forges

| Pin | Disk | Result |
|-----|------|--------|
| Product residual free (`DualResidual.residualFreeClaimed`) | `true` | **OK.** Not re-opened |
| Complete (`SelfApplyFs.freestandingProductSelfHostComplete`) | `true` | **OK.** Not re-opened |
| PROVABLY (`LlvmHold.provablyUnlocked`) | `true` | **OK.** Not sold as speed |
| FullHostElaborateRemains | `hostResidualShrinkFullHostElaborateRemains = false`; DualResidual header says stays false | **OK.** Not flipped |
| DominanceClaimed | `llvmGraphTextDominanceClaimed` / `llvmCfgFixtureDominanceClaimed` **false** | **OK.** |
| Band FullBackend | `llvm*SsaFullBackendClaimed` **false** (Mult/Linear/Types/Graph sampled) | **OK.** |
| Seed / harness | Residual still **206** / **99**; HostCost is not a dual-ok increment | **OK.** (docs; not re-counted) |

No claim-bool flips in HostCost, emit SSOT, or smoke twins.

### 2. Hand product C

Wave 3 owners are SSOT + Lean duals, then `just build` regenerate:

- `src/systems/emit/host_emit_{program,graph,compose}.ssot.txt`
- `SystemsLean/Emit{Program,Graph,Compose}Scaffold.lean` (same comments / tokens)
- Regenerated `src/systems/emit/slake_freestanding.{c,h}` and
  `out/freestanding-c/` match `SINGLE_FAIL_CLOSED_WALK` /
  `HOST_COMPOSE_SINGLE_WALK`
- `src/systems/emit/host-owned-emit.md` documents one live-node walk, graph
  edge-then-program check, compose pre-scan then one graph check

Public `is_well_typed` still exists. Program / graph / compose `check` no
longer re-call the matching `is_well_typed`. Node check still requires
well-typed, so ill-typed still FAIL_CLOSED. Empty graph still OK. Extract
still E2 fuse (one check then write `RUNTIME_FS`).

Bootstrap subset packages `emit/slake_{program,graph,compose}_subset.c` still
nest well-typed walks. Wave 3 report names this as M1 subset, not product Out.
Honest leftover. Not Name 10.

Wave 1 twins are smoke-only: no `#include slake_freestanding.h`, no `slake_*`
calls, no `malloc(` in the stack twin. `just/bench-runtime-twins.just` contract
greps those rules.

### 3. Thin Extract gap (Name 8)

`ExtractTheorems.extractOk_mult1_fs_true` is still `rfl` (intentional gap).

`hostCost_thin_extract_mult1_disagrees_compose` is `And.intro` of that theorem
and compose spent reject (`hostCost_opt_preserves_spent_mult1_reject`). Header
says do not close the gap. **OK.** Gap named, not closed.

### 4. Forged compose <= heap

Living report stamp **20260812T192951Z**, timing-link `-O3 -flto`:

| Comparison | free-compose | baseline | Phrase |
|------------|-------------:|---------:|--------|
| vs heap_churn | 17.5277 | 10.6737 | **~1.6x slower** (ratio 0.609) |
| vs fail_closed_shape | 17.5277 | 18.2351 | **~1.0x faster** (ratio 1.040) |

README tip 8, `out/freestanding-c/README.md`, `SESSION-HANDOFF.md`, and
residual all say compose did **not** beat heap. **OK.**

### 5. PROVABLY-as-speed

HostCost / HostCostTheorems headers: Nat is not ns, not PROVABLY speed.
Living report Limits: PROVABLY is CompCert correctness. README tip 2 vs tip 8
keeps the split. **OK.**

### 6. Name 10 invented

Name 10 Status **not open** on residual, handoff, WATCHER, and Wave 3 report.
Stage timers still mixed (init / push / edges / mint / mark / well_typed /
extract / consume / post_check all similar; `check_fail_closed` stage 0.0000
because extract owns the walk). Leftover vs heap is **not** clearly init-only.
Honest skip. **OK.**

### 7. Residual / WATCHER vs disk

| Surface | Matches disk? |
|---------|---------------|
| Living Open Names 1-9 done, 10 not open | **Yes** |
| `WATCHER.md` Wave 3 done, Wave 4 next | **Yes** |
| `SESSION-HANDOFF.md` Active tip | **Yes** |
| `RESIDUAL.md` Systems Open table | **Yes** |
| `RESIDUAL-systems.md` footer "Names 1-9 open" | **No** (Nit 1) |

WATCHER is the next-action SSoT and is not lying.

### 8. Sub-1-KLOC

| File | Lines | Bar |
|------|------:|-----|
| `SystemsLean/HostCost.lean` | 359 | under 1000 |
| `SystemsLean/HostCostTheorems.lean` | 576 | under 1000 (under 900) |
| `EmitProgramScaffold.lean` | 437 | under 1000 |
| `EmitGraphScaffold.lean` | 518 | under 1000 |
| `EmitComposeScaffold.lean` | 422 | under 1000 |
| `just/bench-runtime-twins.just` | 363 | under 1000 |
| `host_emit_*.ssot.txt` | 174 / 214 / 291 | under 1000 |
| `slake_freestanding.c` | 1168 | product wire exception |

**OK.**

### 9. Unicode / tone in novel md

HostCostTheorems: no non-ASCII (Wave 2 report said constructors were rewritten
to `cases` / `Exists.intro` / `And.intro`). Residual / handoff / reports read
as ASCII professional tone. Mop: `just hygiene` exit 0 after probe regenerate.
**OK.**

### 10. HostCost Nat vs C walk (honesty, not a forge)

Lean `HostCompose.checkFailClosed` is still `hostIsWellTyped && multPreScan`.
HostCost still charges `costCheckFailClosed n = 1 + n`. Wave 3 C compose check
no longer calls `slake_ir_graph_is_well_typed`. Wave 3 report is explicit:
HostCost models Lean HostCompose, not C nested walks; Nat defs were not
edited. Plan said update HostCost only if the Nat model changed. **OK.**

`costMultPreScan_eq_live_nodes` is `n * 1 = n` (simp). Plan asked for that
tie to `nodes.length`. Thin, but named.

`hostCost_spent_mult1_rejects_check` is a real forall on `List.any` MULT-1 and
`linear.live = false`. Spent fixture is an instance. **OK.**

`hostCost_omega_share_vs_mult1_exact_once` is `And.intro` of `shareNat_reuse`
and exact-once sequential. Docs say HostCost contrast, not Token LinearCheck.
**OK.**

No mathlib. No `sorry`. Presence specs list the four Wave 2 theorem names.
`SystemsLean.lean` and `RuntimeBenchLean.lean` import the companion.

### 11. Wave 1 twins + flags

- `slake_runtime_bench_stack_twin.c`: stack id+live+state; mint/consume codes;
  remint after spent; no product header.
- `slake_runtime_bench_fail_closed_shape.c`: stack 8+16; 3+2 graph; well-typed
  + pre-scan + extract-shaped write + consume + post fail-closed; label
  `fail_closed_shape`; not heap_churn.
- Living report publishes mint vs heap **and** vs stack twin; compose vs heap
  **and** vs fail_closed_shape. Flags `-O3` / `-O3 -flto` named. Structural
  `-c` still `-O2 -ffreestanding -nostdlib`.
- Primary cold compose arm still full re-init; extract not skipped.

**OK.**

---

## Process mop

`.agents/reports/process-mop-hap-wave4-2026-08-12.md`: hygiene 0 (twice),
`just systems-host` 0, `just systems-emit-wire` 0, `just systems-cc-probe` 0
(invokes `just build`), `lake build SystemsLean.HostCost` 0,
`lake build SystemsLean.HostCostTheorems` 0. No fallout files. Did not
re-run `just bench-runtime` (Wave 3 stamp stands). Did not open Name 10.
Did not flip pins. **Accept.**

---

## What closeout may do (not required for this verdict)

1. Scrub `RESIDUAL-systems.md` **Next residual implement prompt** so it does
   not say Names 1-9 are open. Point at `WATCHER.md` only.
2. Optional: refresh Name 4 line counts to 359 / 576.

Do **not** open Name 10. Do **not** flip pins. Do **not** hand-author product
C. Do **not** close `extractOk_mult1_fs_true`. Do **not** claim compose beat
heap.

---

## Verdict (repeat)

**APPROVE** (0 open findings). Two closeout nits only.
