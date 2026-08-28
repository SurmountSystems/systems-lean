# Explore: compose freestanding cost vs malloc node-list (2026-08-12)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / fullBackend / production-opt claim flips.
ASCII only. Plain American English.

**Questioned headline:** freestanding compose is **~2.2x slower** than
"a malloc node-list" (quiet suite stamp **20260812T181445Z**, timing link
`-O3 -flto`). That ratio is real for the **named arms**. It is **not** a
fair same-protocol C race. Most of the gap is product-shape fail-closed
work the heap arm does not do.

Living numbers: `doc/BENCH-RUNTIME-latest.md`.
Closed program: `.agents/reports/impl-final-perf-5aac7784-2026-08-12.md`.
Prior lever inventory (partially stale on E2): `.agents/reports/explore-runtime-perf-levers-2026-08-12.md`.

---

## 1. What one compose op does

Driver: `src/systems/smoke/slake_runtime_bench_freestanding_compose.c`.
Links product wire `src/systems/emit/slake_freestanding.c` only.

### Cold (default suite; primary product-shape)

Each timed op is a **full re-init** of a stack `slake_host_compose`:

1. `slake_host_compose_init` (or opt-in `reset` if `BENCH_RUNTIME_COMPOSE_RESET=1`)
2. Push 3 nodes: OMEGA+VALUE, MULT-1+LINEAR, MULT-0+ERASED
3. Add 2 edges: 0->1, 1->2
4. Mint host token (`id` from the loop)
5. `mark_erased` (MULT-0 pre-scan needs it)
6. `is_well_typed` must be 1
7. `extract` (E2 fuse: one fail-closed walk, then write `RUNTIME_FS`)
8. Exact-once `consume`
9. Post-consume `check_fail_closed` must be `FAIL_CLOSED`

Driver comment: do **not** call `check_fail_closed` before extract (that
would double the mult pre-scan). Stage key `check_fail_closed` stays 0
on this path; cost sits under `extract`.

Fail-closed second consume is checked **once untimed** in
`contract_compose_once`.

### Micro (T9; measurement only)

Env `BENCH_RUNTIME_COMPOSE_MICRO=1` or
`just bench-runtime-freestanding-compose-micro`.

- Setup once: init + 3 push + 2 edges + mark
- Hot loop: remint + well_typed + extract + consume + post_check

Micro is **not** the living headline. Do not merge cold vs micro ns/op.

### Reset (E3; measurement opt-in)

`BENCH_RUNTIME_COMPOSE_RESET=1`: first op full init; later ops
`slake_host_compose_reset` (clear live counts + re-init host token;
dead slots overwritten by push). Still **not** the primary suite arm.

### Assumption to reject

"One op is a thin node-list walk." False. Cold product-shape is
**init + typed IR build + mint/mark + well-typed + extract fuse +
consume + post-check fail-closed**. Heap compose is a different job.

---

## 2. Stage timers and latest numbers

Stamp **20260812T181445Z**. N compose = **10000000**. Stage pass N = **200000**.

### Whole-op (what the 2.2x uses)

| Arm | median ns/op | mean | min | max | stdev |
|-----|-------------:|-----:|----:|----:|------:|
| R-free-compose | **25.4574** | 25.4832 | 25.4240 | 25.5683 | 0.0755 |
| R-gc-shape-compose | **11.5406** | 12.2705 | 10.5683 | 14.7026 | 2.1616 |

Ratio heap/free = **0.453** => freestanding **~2.2x slower**.
Delta ~**13.9 ns/op**. Heap arm is noisier (allocator).

History (same machine, Wave 4b closeout):

| Era | Compose free ns/op | Notes |
|-----|-------------------:|-------|
| Pre-Wave-4 `-O2` | ~39.8 | |
| Wave 4 `-O3` | 32.7845 | E1-E4 landed |
| Wave 4b `-O3 -flto` | **25.4574** | LTO closed some call cost; protocol remains |

### Stage keys (smoke only; product wire has no always-on timers)

| Stage / group | ns/op (stage pass) |
|---------------|-------------------:|
| init | 22.0314 |
| push_nodes | 25.3951 |
| edges | 24.1203 |
| mint | 23.7032 |
| mark | 23.4913 |
| well_typed | 25.1487 |
| check_fail_closed | **0.0000** (E2: not called before extract) |
| extract | **28.7999** |
| consume | 23.6888 |
| post_check | 25.9975 |
| group setup (init+push+edges) | 71.5467 |
| group mint_mark | 47.1946 |
| group check (well_typed+fail_closed+post) | 51.1462 |
| group extract_consume | 52.4887 |

### Does extract dominate? **No, not in a product-claim sense.**

**Question the stage table.** Whole-op is **25.46 ns**. Sum of stage
ns/op is ~**222 ns** (about 8.7x the whole op). Every non-zero stage
sits in a **22-29 ns** band, which is `clock_gettime` + call overhead
on this host, not isolated product work.

What the stage pass **can** say:

- `check_fail_closed` is honestly **0** (fuse still holds).
- Extract is the **fattest labeled bucket** because it contains the
  fused fail-closed walk plus timer noise.
- Groups (setup vs extract_consume vs check) are **same-order**.
  Setup (zero-all slots + 3 push + 2 edges) is as large as extract
  in the noisy grouping, not a 2x extract win waiting in the table.

What it **cannot** say: "extract is 28.8 ns of product C." Use T7
`just bench-runtime-perf-compose` / `perf record` for real attribution.
Stage timers stay relative smoke, as the living report already warns.

HostCost Nat model (`SystemsLean/HostCost.lean`) also does **not**
rank wall-clock. It counts extract = check + 1 and check =
well_typed + one mult pre-scan. The **emitted C** re-walks well-typed
at graph, program, and node layers inside that one "check" (below).
HostCost undercounts C walks.

---

## 3. Emit compose SSOT: fuse, reset, remaining loops

Authority: `src/systems/emit/host_emit_compose.ssot.txt`
(owner `SystemsLean.EmitCompose`). Generated wire only; do not
hand-edit `slake_freestanding.c`.

### Already landed

| Token | What |
|-------|------|
| `HOST_COMPOSE_EXTRACT_FUSE` (E2) | `extract` = one `check_fail_closed` then write `*out_rt = RUNTIME_FS`. Fail leaves `*out_rt` untouched. |
| `HOST_COMPOSE_RESET` (E3) | Clear `prog.count`, `edge_count`, re-init host token, `erased.marked=0`. Does **not** zero dead node/edge slots. Requires prior `valid==1`. |
| Thin mutators | push / add_edge / mint / consume / mark_erased are valid-guard + call-through. |

### Remaining loops and walks (product C today)

**Cold init (every default-suite op):**

- `slake_ir_program_init`: loop **`SLAKE_IR_PROGRAM_CAP` (8)** dead slots
  (`valid=0`, OMEGA+VALUE, tag 0).
- `slake_ir_graph_init`: that plus loop **`SLAKE_IR_EDGE_MAX` (16)**
  dead edges (`from=to=valid=0`).

Reset skips those loops. Cold does not.

**One extract (after bench already called `is_well_typed`):**

1. Compose `check_fail_closed`:
   - `slake_ir_graph_is_well_typed` (program live-node well-typed +
     2 edge endpoint checks)
   - Mult pre-scan over **live count** (bench: 3) for any MULT-1 / MULT-0
   - `is_live` / `is_runtime_absent` once, then pointer select
   - `slake_ir_graph_check_fail_closed`:
     - **well_typed again**
     - `slake_ir_program_check_fail_closed`:
       - **program well_typed again**
       - per live node: `slake_ir_node_check_fail_closed`
         (node well_typed **again** + `slake_check_fail_closed`)
2. Write `RUNTIME_FS`

**Post-check after consume:** full compose `check_fail_closed` again,
expected `FAIL_CLOSED` (MULT-1 present, host spent).

**Count for the 3-node bench graph (cold op):**

| Walk | Times |
|------|------:|
| Graph/program well-typed (bench explicit + inside extract + inside post) | **4+** (graph well_typed at bench, compose-check, graph-check; program well_typed nested) |
| Mult pre-scan (3 nodes) | **2** (extract + post) |
| Per-node fail-closed | **2** full passes (extract success + post fail) |
| Cap-8 + cap-16 zero loops | **1** (cold init only) |

SSOT comment already admits compose mult pre-scan is **redundant-safe**
with graph/node checks. That honesty is the remaining product-shape
cost after E2.

---

## 4. Heap compose driver: not a fair "C" baseline

File: `src/systems/smoke/slake_runtime_bench_gcshape_compose.c`.
Role: **heap_churn**, not Boehm, not Lean RT, **not product wire**.

Per op it:

- `malloc` 3-node array + 2-edge array + one `uint32_t` token
- Fills fields that **mirror** mult/kind pairing
- Walks nodes/edges **once** into a sink; checks token live + erased==1
- `free` token; mark spent; `free` nodes and edges

It does **not**:

- Fail-closed mult pre-scan or `slake_check_fail_closed`
- Kind/mult well-typed pairing checks
- Extract / `RUNTIME_FS` write
- Post-consume fail-closed
- Zero a fixed 8+16 cap
- Use linear exact-once codes (`-2` spent). "Second free" contract is
  a spent-state check, not product consume

**Verdict:** same **story class** (build a tiny graph, use it, tear it
down), different **protocol**. The 2.2x compares product fail-closed
compose to **three mallocs + one walk + three frees**. Mint-class was
a fairer race (one acquire/release). Compose-class is not.

Heap paying allocator tax and still winning is evidence that
**protocol + init loops + layered checks** cost more than ~3-4
malloc/free on this host (~11.5 ns), not that "linear types are
slower than C." Freestanding compose uses **no heap**.

---

## 5. What LTO already did vs remaining product-shape cost

### LTO did (Wave 4b; timing link only)

- Cross-TU inlining of mint/consume into the **mint** smoke loop.
  Closed mint: `-O3` alone ~**2.9x slower** than heap; `-O3 -flto`
  mint **0.6164 vs 0.6171** (bar met).
- Compose improved **32.78 -> 25.46** ns/op (~22% of the post-O3
  compose number). Thin compose wrappers can inline. Structural
  freestanding-first `-c` stays `-O2 -ffreestanding -nostdlib`.

### LTO cannot remove

- Cold zero of 8 nodes + 16 edges every op
- Four-ish well-typed walks + two fail-closed walks
- Redundant-safe compose pre-scan + graph + node checks
- Post-consume fail-closed (intentional exact-once proof in the arm)
- Bench calling `is_well_typed` **and** extract
- Different heap protocol

So remaining ~13.9 ns vs heap is **product-shape**, not "forgot `-flto`."

---

## 6. Ranked compose levers (legal: Lean SSOT + regenerate C)

Policy floor for any product edit:

- Edit `host_emit_*.ssot.txt` + owning `Emit*.lean`; `just build`
  regenerates wire. No hand product C.
- Behavioral probe + compose contract stay green.
- Remeasure `just bench-runtime-freestanding-compose` (and heap
  compose if the question is the ratio).
- Do not flip free / complete / PROVABLY / FullHost.
- PROVABLY is not speed.
- Smoke-only changes must stay measurement role.

| Rank | Lever | Likely effect | Policy risk | How |
|------|-------|---------------|-------------|-----|
| **1** | **Fairer C baseline (same fail-closed work)** | Honesty, not product speed. May shrink or erase the "2.2x" **story** if stack+same walks land near 25 ns. | **Low.** Smoke only. Label as `fail_closed_shape` not heap_churn. | New or flag-gated arm in `slake_runtime_bench_gcshape_compose.c` (or sibling smoke): stack 8+16, same 3+2 graph, well-typed + mult pre-scan + extract-shaped write + post fail-closed. No product dialect. |
| **2** | **Collapse redundant well-typed inside extract/check** | Real product ns if one walk replaces 3 nested well_typed. Biggest **legal** SSOT win after E2. | **Medium.** Fail-closed must still reject ill-typed / null. Need probe cases: ill-typed node, bad edge, empty program vs empty graph. HostCost should stay fuse = check+1 or be updated in the same slice. | `host_emit_compose.ssot.txt` + program/graph/types SSOT: one live walk that types **and** fail-closes; or graph check that does not re-call program well_typed after compose already did. Keep public `check_fail_closed` and `extract` semantics. |
| **3** | **Hotter documented consumer path (reset / skip post on hot)** | Cold headline stays; **reset** drops cap-8/16 zeros. Micro already exists. | **Low-medium.** Must not replace primary cold arm without labels. Reset is already product API. Selling reset vs heap malloc-every-op is a new unfairness unless labeled. | Promote `slake_host_compose_reset` in consumer docs; optional suite **labeled** reset arm. Do not change default cold. |
| **4** | **Specialize MULT-1-only / grade flags at push** | Skip MULT-0/erased branches and maybe pre-scan when no MULT-0 live. Bench graph **has** MULT-0, so default suite gain is small unless the specialized API is what the bench calls (then it is a different job). | **Medium-high** if flags can lie. Must fail closed if a MULT-0 node exists and erased is unmarked. Extra compose state needs SSOT + smoke. | Track `needs_mult1` / `needs_mult0` on push/reset in compose SSOT. Pre-scan becomes O(1) flags. Graph/node checks still required unless lever 2 fuses them. |
| **5** | **Unroll cap-8 / cap-16 init (and only init)** | Small cold win (24 stores). Check unrolling **live** n=3 is the compiler's job; forcing a full-cap check walk would be slower. | **Low** if init still writes the same dead-slot pairing (OMEGA+VALUE). Do not unroll check to always 8. | Program/graph SSOT init: explicit 8/16 stores or `#pragma` only if CompCert/wire still match (honesty: CompCert is correctness, not speed; keep C still obviously a bounded loop or explicit stores). |
| **6** | **Skip extract when already checked** | Bench could drop extract after well_typed; that is **not** product compose-class (extract writes `RUNTIME_FS` / emit boundary). Product "extract assumes check" is unsafe unless one fused API. | **High** as a product default. **Low** as a labeled micro variant. | Prefer lever 2 (one fused walk). Do not skip extract on the primary arm. |
| **7** | **Arena / reuse without heap** | Product **already** stack-fixed. No GC. Extra arena would be a second allocator story. | **High** if it grows heap or a new lifetime dialect. **None** if it only means reset (already E3). | Do not add malloc to the wire. Reuse = reset. |
| **8** | **More LTO / flags** | Diminishing. Mint bar already LTO. Compose leftover is walks. | **Low** process; do not change structural `-c`. | Optional flag-matrix **compose** cells for honesty; not a product Name. |

### Explicit non-levers

- Hand-edit emit/out C.
- Grow smoke into a second product dialect.
- Forge compose free <= gcomp.
- Call a faster bench PROVABLY.
- Invent heap GC "to match C."
- Change primary cold arm to micro and keep the same headline.

---

## 7. Cost breakdown (best current model)

Because stage timers are clock-dominated, this is **structural**, not
ns-accurate.

```
Cold freestanding ~25.5 ns/op  (LTO, quiet host)
  +- Heap-like teardown          ~0     (no malloc)
  +- Cap-8 + cap-16 cold zero    small but every op (reset removes)
  +- 3 push + 2 edge + mint/mark small (already inlined-ish under LTO)
  +- well_typed (explicit)       real, overlaps extract
  +- extract fuse                real: 1 pre-scan + nested well_typed
  |                                + 3 node fail-closed
  +- consume                     tiny (mint-class is 0.62 ns pair)
  +- post_check fail-closed      ~same order as extract walk
  +- leftover vs heap 11.5       ~13.9 ns = those walks + init
                                 minus heap's 3-4 malloc/free

Heap compose ~11.5 ns/op
  +- 3 malloc + 3 free + 1 token malloc/free
  +- one unstructured walk
  +- no fail-closed, no extract, no post-check
```

**Assumption rejected:** "extract dominates, so skip extract and we
beat malloc." Extract is fused; the **check family** (including
post-check and nested well_typed) plus **cold init** is the remaining
shape. Heap is not the same C.

**Assumption rejected:** "2.2x means linear types lost to C." Mint
already ties malloc under LTO. Compose loses to a **weaker protocol**.

---

## 8. If the operator reopens compose residual

Suggested order (checkable; no pin forge):

1. **Same-work C baseline** (smoke). Publish two ratios: vs heap_churn
   (allocator) and vs fail-closed-shape C (protocol).
2. **Single fail-closed walk** in compose/graph/program/types SSOT
   (lever 2). Green probe + HostCost honesty + rebench cold.
3. Only then consider MULT-1-only flags or init unroll.

Do not auto-queue while `WATCHER.md` is DONE-FOR-NOW and Open is empty
unless the operator reopens a named compose protocol residual.

---

## Paths

| What | Path |
|------|------|
| This report | `.agents/reports/explore-hap-compose-cost-2026-08-12.md` |
| Compose bench (cold/micro/reset) | `src/systems/smoke/slake_runtime_bench_freestanding_compose.c` |
| Heap compose bench | `src/systems/smoke/slake_runtime_bench_gcshape_compose.c` |
| Compose SSOT | `src/systems/emit/host_emit_compose.ssot.txt` |
| Program / graph SSOT | `host_emit_program.ssot.txt`, `host_emit_graph.ssot.txt` |
| Living runtime report | `doc/BENCH-RUNTIME-latest.md` |
| LTO closeout | `.agents/reports/impl-wave4b-close-c-gap-5aac7784-2026-08-12.md` |
| HostCost Nat | `src/systems/SystemsLean/HostCost.lean` |
