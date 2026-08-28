# Explore: freestanding product runtime perf levers (2026-08-12)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / fullBackend / production-opt claim flips.
ASCII only. Plain American English.

**Scope:** freestanding **product runtime** (what consumers link under
`out/freestanding-c` / emit wire), not host elaborator, not inventing FullHost.

**Living measurement:** `just bench-runtime` -> `doc/BENCH-RUNTIME-latest.md`
(research: `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`).

---

## 1. Runtime bench drivers (`src/systems/smoke/`)

| Driver | Arm | Work per op | Product APIs used | Role |
|--------|-----|-------------|-------------------|------|
| `slake_runtime_bench_freestanding.c` | R-free | N x mint then exact-once consume on one `slake_consume_token` | `slake_consume_token_init` / `_mint` / `_consume` / `_is_live` | Links **emit** `slake_freestanding.c` only; no GC, no Lean RT |
| `slake_runtime_bench_gcshape.c` | R-gc-shape | Same logical acquire/release-once | **none** (local `malloc`/`free` slot) | Baseline **heap_churn** |
| `slake_runtime_bench_boehm.c` | R-boehm | Same protocol | **none** (`GC_MALLOC`/`GC_FREE`) | Baseline **boehm_gc**; soft-skip if no libgc |
| `slake_runtime_bench_freestanding_compose.c` | R-free-compose | init compose; push 3 nodes (OMEGA/MULT-1/MULT-0); 2 edges; mint; mark_erased; well_typed; check_fail_closed; extract; consume; post-consume fail-closed check | `slake_host_compose_*` full surface | Product wire compose-class |
| `slake_runtime_bench_gcshape_compose.c` | R-gc-shape-compose | malloc node/edge/token arrays; walk; free all | **none** | Compose **heap_churn** |

Also (host tool, not freestanding product wire): Lean arm `SystemsLean.RuntimeBenchLean`
/ `slake-runtime-bench-lean` for **lean_managed_runtime** contrast.

**Defaults (from `just/bench-runtime.just`):** mint N=2e8, compose N=1e7 (report
table), CFLAGS `-std=c11 -O2` on hosted timing link; freestanding-first `-c`
with `-ffreestanding -nostdlib` is structural only.

**Latest living headline (2026-08-10 run):** freestanding mint ~6.7x faster than
Boehm, ~2.8x faster than Lean managed; ~4.5x **slower** than heap_churn mint;
compose freestanding ~2.8x **slower** than compose heap_churn. PROVABLY != speed.

---

## 2. Product wire ownership and hot APIs

**SSoT:** `src/systems/emit/host-owned-emit.md`.

| Surface | Authority | Durable text | Stage |
|---------|-----------|--------------|-------|
| Linear + ConsumeToken | Lean `SystemsLean.EmitLinear` + embed via `FreestandingEmit` | `emit/host_emit_linear.ssot.txt` | HOST-EMIT-LINEAR |
| Host compose | Lean `SystemsLean.EmitCompose` | `emit/host_emit_compose.ssot.txt` | HOST-EMIT-COMPOSE |
| Generator output | lake exe `slake-emit-freestanding-c` / product write path | `emit/slake_freestanding.{c,h}` then `out/freestanding-c/` via `just build` | SLAKE_EMIT_FREESTANDING_C_V0 |

**Not hand-authored residual:** freestanding C under emit/out is **generated
product wire**. Smoke benches under `smoke/` are permanent **behavioral /
measurement** role (may link wire; must not become product body).

**Mint path (call chain today):**

1. `slake_consume_token_mint` -> null/id0 checks -> `slake_consume_token_is_live`
   (state + `slake_linear_token_is_live`) -> `slake_linear_token_init` -> state=1
2. `slake_consume_token_consume` -> state checks -> `slake_linear_consume` -> state=2

Several thin call-through layers; no `static inline` in SSOT bodies today.
Token is a stack struct (id + live + host state); **no heap** on freestanding mint.

**Compose path:** fixed-capacity stack IR (`SLAKE_IR_PROGRAM_CAP` 8,
`SLAKE_IR_EDGE_MAX` 16) inside `slake_host_compose` (graph + consume_token +
erased). Mutators are thin wrappers; **cost center** is
`slake_host_compose_check_fail_closed` (well_typed + mult pre-scan loop +
`slake_ir_graph_check_fail_closed`) and **extract** re-runs check_fail_closed.
Compose bench also re-inits a full compose struct every op (not arena reuse).

---

## 3. Existing residual / plans / research on runtime speed

| Artifact | What it covers | Opt content? |
|----------|----------------|--------------|
| Residual Done: Runtime freestanding bench | Measurement suite landed; operator question answered | Measurement only |
| `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` | Methods, arms, causal line (linear enables no-GC path) | Notes freestanding loses to heap_churn on thin mint; compose pays API work |
| `doc/BENCH-RUNTIME-latest.md` | Living numbers + How much faster | Empirical only |
| Compile-path bench / `hot-cold-benchmarks` | Lake vs freestanding **compile** wall-clock | **Secondary**; not runtime |
| LLVM residual / plans | SSA partial, CFG, foreign link, honesty holds | Explicit **production opt non-claim**; no runtime-speed residual |
| Arena / region / stack-alloc specialized mint | **No** open residual or plan found that names these as product work | Opportunity for new Names |

No existing Open residual that says "make freestanding mint beat heap_churn" or
"specialize linear mint path." Safe to propose checkable speed Names without
forging pins.

---

## 4. AGENTS / policy constraints (speed work must respect)

1. **Three languages only** -- product changes in Lean SSOT / emit templates via
   Lean embed, or pure Nix for tooling gates. No new Python; no shell mills.
2. **No hand-written product C growth** -- edit authority in
   `host_emit_*.ssot.txt` + `EmitLinear` / `EmitCompose` (and rebuild wire). Do
   not patch `emit/slake_freestanding.c` as the SSoT.
3. **Smoke C** may grow only as measurement contracts (behavioral role); prefer
   not turning smoke into a second product dialect.
4. **PROVABLY != speed** -- CompCert matrix is wire correctness; never sell
   faster ns/op as PROVABLY.
5. **No claim forge** -- free / complete / FullHost / DominanceClaimed /
   fullBackend / production opt stay as living residual pins say.
6. **Benchmarks and user-facing docs** -- real win vs named baseline requires
   same-slice update of living report + README tip + handoff when measured.
7. **Driver stdout policy** -- stage banners short; honesty in residual/docs.

---

## 5. LLVM path status (brief; not the primary freestanding C speed path)

From `out/llvm-ir/README.md` and residual:

| Pin / surface | Status |
|---------------|--------|
| `llvmUnlocked` | **true** |
| Unit IR + compose text + five-band SSA partial (Mult..Graph) | on disk under `out/llvm-ir/` |
| Foreign link Mult..Graph band-local | done |
| Fixture tip fullBackend (A-light) | true |
| Band `*FullBackendClaimed` | **false** |
| `llvmCfgFixtureDominanceClaimed` | **false** (intentional; Path B) |
| Production opt / machine code | **false** (intentional non-claim) |

LLVM is **not** currently the freestanding runtime bench path (benches link C
wire). Using LLVM for faster consumer binaries would be a **later** residual
with honest non-claims (not fullBackend, not production opt unless bar redesign).

---

## 6. Agent-checkable optimization levers (no pin forge)

Ordered by leverage vs policy risk. **Done when** always includes:
`just build` refresh wire; behavioral probe / mint-consume contract still green;
`just bench-runtime` (or focused arm) before/after median ns/op; `just hygiene`;
user-facing docs only if real win; **no** free/complete/PROVABLY/FullHost/
Dominance/fullBackend flips.

### A. Measurement and compile flags (process / just; S)

- Document and optionally env-parameterize `-O2` vs `-O3` / `-flto` on **timing
  link only** (`just/bench-runtime.just`); keep freestanding-first structural
  `-c` separate.
- Profile one compose op under `perf` / callgraph (host analysis; report under
  `doc/dev/research/`) to rank check_fail_closed vs init vs mint.
- **Does not** change product dialect; pure process honesty.

### B. Lean SSOT mint specialization / inlining (product Lean + SSOT; S-M)

- Emit `static inline` (or single-function specialized) hot path for
  mint+consume exact-once in `host_emit_linear.ssot.txt` / `EmitLinear`,
  preserving fail-closed codes and dual greppables.
- Collapse redundant is_live double-walk where contract allows (document
  desync-heal honesty if changed).
- Remeasure R-free mint vs heap_churn / Boehm.

### C. Compose call overhead + fail-closed fusion (SSOT compose/graph; M)

- Fuse extract + check_fail_closed so compose bench does not pay the mult
  pre-scan **twice** when extract is the only consumer (keep separate public
  API if smoke requires both).
- Optional `static inline` on thin `slake_host_compose_mint` / push / add_edge.
- Consider a **fast-path** compose check when graph size is known small (bench
  uses 3 nodes) without weakening full check.

### D. Reuse / region-style stack buffer for compose ops (SSOT + optional API; M)

- Today compose bench re-inits full struct every op (already stack-backed fixed
  caps -- good). Lever: expose **reset-without-zero-all-edges** or bulk clear
  of count only if init zeros dominate (measure first).
- True **arena** only if product gains a multi-token / multi-compose lifetime
  story; do not invent heap GC. Prefer stack / fixed buffers (already product
  shape).

### E. Stronger compose baseline honesty (smoke only; S)

- heap_churn compose is a thin walk; freestanding pays real fail-closed. Add
  optional baseline that also does mult pre-scan + fail-closed shape so ratios
  answer "API cost" vs "allocator cost" separately. Measurement residual only.

### F. LLVM / later backend (L; held honesty)

- Only after a written bar: emit opt-friendly LLVM for Mult/Linear kernels;
  still **not** production opt claim until residual redesign. Not the first
  freestanding C speed slice.

### Explicit non-levers (do not sell as residual progress)

- Hand-editing `emit/slake_freestanding.c` without SSOT.
- Growing smoke into product dialect.
- Forging PROVABLY or production-opt from faster benches.
- Host elaborator / FullHost work rebranded as "runtime perf."

---

## 7. Top 5 recommended residual Names

| # | Name | Diff | Goal | Done when (shape) | Paths |
|---|------|------|------|-------------------|-------|
| 1 | **Mint path inline emit** | S | Cut freestanding mint/consume call overhead via Lean-owned SSOT | SSOT/EmitLinear emits inlined or fused hot path; contracts + behavioral probe green; `just build`; R-free arm remeasure; median ns/op documented in research or living report if win; hygiene; no claim flips | `EmitLinear.lean`, `host_emit_linear.ssot.txt`, FreestandingEmit, smoke freestanding mint |
| 2 | **Runtime flag matrix** | S | Make -O2/-O3/(optional LTO) comparable without dialect change | just recipe env (e.g. `BENCH_RUNTIME_CFLAGS`); report table or research note with side-by-side medians; same N; structural freestanding-first unchanged; hygiene | `just/bench-runtime.just`, `bench-runtime-report.just`, research note |
| 3 | **Compose check extract fuse** | M | Remove double fail-closed cost on extract path | SSOT compose/extract: extract does not re-walk full check when just validated (or fused helper); smoke contracts still lock both public APIs; compose freestanding remeasure; hygiene; no pins | `EmitCompose` / extract SSOT, smoke compose, probe |
| 4 | **Compose profile research** | S | Evidence for next product edit | `perf`/annotated research note ranking init vs push vs check vs extract; recommended next Name; no product edit required; hygiene if docs only | `doc/dev/research/`, optional local scripts not committed as Python mills |
| 5 | **Compose reset fast path** | M | Faster re-use of fixed-cap compose without full re-zero theater | Lean SSOT `host_compose` reset/clear counts (or documented init that only touches counts); contracts fail-closed after reset; compose ns/op improved or proven neutral with evidence; hygiene | compose SSOT + header API + smoke |

**Out of scope for all five:** FullHost; DominanceClaimed true; production opt;
PROVABLY-as-speed; hand C product growth; inventing GC/arena heap on freestanding
wire.

---

## 8. Suggested implement order

1. **Runtime flag matrix** + **Compose profile research** (cheap evidence).
2. **Mint path inline emit** (largest mint microbench lever under three languages).
3. **Compose check extract fuse** then **Compose reset fast path** if profile
   shows those dominate.

---

## Key sources

- Smoke: `src/systems/smoke/slake_runtime_bench_*.c`
- Ownership: `src/systems/emit/host-owned-emit.md`
- Linear SSOT body: `src/systems/emit/host_emit_linear.ssot.txt`
- Compose SSOT: `src/systems/emit/host_emit_compose.ssot.txt`
- Wire: `src/systems/emit/slake_freestanding.c` (generated)
- Bench: `just/bench-runtime.just`, `doc/BENCH-RUNTIME-latest.md`
- Research: `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`
- LLVM honesty: `out/llvm-ir/README.md`
- Policy: root `AGENTS.md` (three languages; no hand C product; PROVABLY != speed;
  benchmarks user-facing docs)
