# Explore: HAP assumptions (grades, mint vs malloc, LTO, PROVABLY, benches)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / band FullBackend / production-opt claim flips.
ASCII only. Plain American English.

**Question:** six assumptions used by the 2026-08-12 performance program.
**Evidence date:** 2026-08-12 (living residual after IMPL 5aac7784 Waves 1-4 + 4b).

**Cite roots:** `AGENTS.md` (Three languages; min multiplicities; PROVABLY);
`src/systems/SystemsLean/Mult.lean`; `Linear.lean`; `HostCost.lean`;
`src/systems/mult.md`; `src/systems/emit/host_emit_linear.ssot.txt`;
`src/systems/smoke/slake_runtime_bench_{freestanding,gcshape}.c`;
`out/freestanding-c/README.md` + `slake_freestanding.h`;
`just/bench-runtime.just`; `just/dual-side.just` (`systems-cc-probe`);
`doc/vocabulary.md`; `doc/goals.md`; `doc/BENCH-latest.md`;
`doc/BENCH-RUNTIME-latest.md`; `doc/dev/research/runtime-flag-matrix-2026-08-12.md`;
`.agents/reports/impl-wave4b-close-c-gap-5aac7784-2026-08-12.md`;
`.agents/reports/explore-runtime-perf-levers-2026-08-12.md`;
`.agents/reports/explore-perf-prove-tools-2026-08-12.md`.

---

## Verdict table (short)

| # | Assumption | Verdict | One-line why |
|---|------------|---------|--------------|
| 1 | Freestanding Slake only needs 0 / 1 / omega | **Keep** (product grades). Extra constructors do **not** buy cheaper emit. | Closed inductive + fail-closed tags. Affine is held ABI, not a fourth tag. MULT-0 already erases. |
| 2 | Mint vs malloc is the right "as good as C" bar | **Revise** | Mint is a stack live-flag protocol. heap_churn is libc malloc/free. Different jobs. |
| 3 | LTO default is "real product" vs "bench cheat" | **Revise** | LTO is a real production flag, but **not** what consumers or `just build` / probe compile with. Headline bar is LTO-only. |
| 4 | PROVABLY can never mean speed | **Keep** (name). Honest middle is a **triple of reports**, not a rename. | CompCert seal stays PROVABLY. Speed + Nat bounds stay named separately. |
| 5 | Compile-path bench (2026-08-10) is stale and needed | **Drop** as a performance-program need | Secondary wall-clock of emit vs Lake. Does not answer runtime ns/op. Optional freshness only. |
| 6 | More seeds / TERM / FullHost help performance | **Drop** | Host elaborator surface. No path into `slake_consume_token` ns/op. |

---

## 1. Multiplicities: only 0 / 1 / omega?

### Assumption

`AGENTS.md` and `Mult.lean`: freestanding Slake product grades are only
MULT-0, MULT-1, MULT-OMEGA. "No multiplicity zoo." Affine is talked about in
product English (at most once) but is **not** first-class on the Mult inductive
or the C enum.

### Evidence

**Closed product set**

- `src/systems/SystemsLean/Mult.lean`: inductive `mult0` / `mult1` / `multOmega`.
  Raw tags 0/1/2 only. `ofNat?` / `isValidTag` fail-closed for `n > 2`.
  Header: "No multiplicity zoo."
- `src/systems/mult.md`: MULT-0 = erased / no runtime presence when checks
  succeed; MULT-1 = use-once; MULT-OMEGA = unrestricted. "Only these three
  grades on freestanding Slake."
- Product C `enum slake_mult` in `out/freestanding-c/slake_freestanding.h`:
  `SLAKE_MULT_0/1/OMEGA` only. Header: "No multiplicity zoo beyond these three."
- Idris public grades are the same three (`src/idris2/multiplicity-map.md`:
  Rig0 / Rig1 / RigW). EDGE-AFFINE: Idris has **no** first-class affine quantity.

**Affine today**

- `Linear.lean`: "Affine (at most once / discard without use) is NOT first-class
  here." Pin `AFFINE-NOT-FIRST-CLASS`.
- AffineDrop / AffineOwn are **dual-tree honesty** under `src/idris2/examples/`
  and `src/lean4/examples/`. Residual: full product affine ABI **held**.
- `src/systems/join-map.md`: do not invent AffineShare/Copy, N-tuple theater, or
  AffineBorrow without a product affine ABI residual.

**What HostCost already says about grade cost**

- `HostCost.lean` L8: `costNodeMultByGrade` maps all three grades to **1** node
  look. Theorem `costNodeMultByGrade_eq_one`. Comment: grades differ in **which
  field** is inspected (erasure / live / constant), not Nat step count.
- So adding a fourth constructor would **not** automatically drop the compose
  pre-scan cost. The scan still walks every node.

**What already cheapens emit (no new grade)**

| Existing grade | Runtime emit today | Perf meaning |
|----------------|--------------------|--------------|
| MULT-0 | Erasure mark / `isRuntimeAbsent` / `ERASE-RULE-MULT-0` (`host_emit_erasure.ssot.txt`). Vocabulary: compile-time only; no runtime payload. Product may keep a **zero-payload marker**. | **Already** "no consume token." This is the erase lever. |
| MULT-1 | Stack `slake_consume_token` live-flag; mint/consume specialized (E1). Exact-once stores on consume. | Ownership check cost, not heap. |
| MULT-OMEGA | Ordinary value; `nodeMultOk` is the constant-ok path. | No token automaton. |

### Would extra grades help **performance** or only expressiveness?

| Candidate | Expressiveness | Cheaper emit? | Recommend? |
|-----------|----------------|---------------|------------|
| **Affine (at most once; drop unused)** | Yes: drop without consume vs linear exact-once. Duals already document the edge. | **Maybe, tiny:** unused affine could emit **no consume stores** (no `live=0` / `id=0` / `state=2`). Unused linear today still needs consume or fail-closed. Win is a few stores vs a protocol already ~0.6 ns/op under LTO. | **Do not add a fourth Mult constructor or enum tag.** If product ever opens affine ABI, lower unused resources as **no-op drop in emit**, still tagged MULT-1 or a **use-mode** bit, not `SLAKE_MULT_3`. Held ABI stays held. |
| **Grade 2 / n (use exactly n times)** | Yes: counted resources. | **No.** Needs a decrementing counter at runtime. More stores than MULT-1. | **Do not add** for performance. Expressiveness only, and it fights "min 0/1/omega." |
| **Relevant (must use; may copy)** | Yes: relevance logic. | **No.** Copy + must-use tracking is **more** runtime, not less. | **Do not add.** |
| **Second MULT-0-like erase** | No new meaning. | **No.** MULT-0 already is erase. | **Drop.** |

**Strategic multiplicity recommendation**

1. **Keep** the closed 0 / 1 / omega product set. Fail-closed unknown tags stay.
2. **Do not** open a multiplicity zoo to chase ns/op.
3. **Use existing MULT-0** for cheaper emit: erased nodes must not grow a
   consume-token or heap payload. That is already policy (`mult.md`, vocabulary
   MULT-0 / erased).
4. **Do not** treat affine dual sketches as a license to change `enum slake_mult`.
5. Only reopen affine as a **lowering** (drop = omit consume) if a product
   residual names affine ABI and measures a real win. Not for this closed
   performance program.

**Verdict: Keep** the three-grade product assumption. Extra grades are
expressiveness (or held ABI). The only emit-cheap story that already exists is
MULT-0 erase. Affine drop is a possible future micro-lowering, not a new grade.

---

## 2. Mint vs malloc as the "as good as C" bar

### Assumption

Freestanding mint is "as good as C" when median ns/op <= heap_churn
(`malloc`/`free` of a `uint32_t` each op). Wave 4b closed that bar under
`-O3 -flto` (free 0.6164 vs heap 0.6171 on quiet suite stamp 20260812T181445Z).

### Evidence: they are different machines

**Freestanding mint** (`slake_runtime_bench_freestanding.c` +
`host_emit_linear.ssot.txt`):

- Stack struct `slake_consume_token` (embedded `slake_linear_token` id+live
  plus host `state` 0/1/2).
- Loop: `mint(id)` then `consume()`. Remint after spent is allowed by E1
  (mint keys off "already live", not "must init empty").
- **No heap.** Fail-closed branches: null, id==0, already live, empty, spent,
  desync heal.
- E1 inlined former call-throughs; still a multi-field protocol.

**heap_churn** (`slake_runtime_bench_gcshape.c`):

- `malloc(sizeof(uint32_t))` then `free` every iteration.
- Explicit `s.state = 0` after release so the next acquire is legal.
- libc allocator (thread cache / size class). **Not** a C twin of the live-flag
  automaton. Header says so: "GC-shaped heap churn"; "NOT product wire."

**Why LTO ties them (Wave 4b):** under `-O3` alone, free mint ~1.78 ns/op vs
heap ~0.62 (~2.9x slower). Under `-O3 -flto`, both ~0.62. LTO inlines
cross-TU mint/consume into the smoke loop. `malloc` is already a highly
optimized libc symbol and does not need that inlining to hit ~0.62.

Early research (`linear-freestanding-runtime-bench-2026-08-08.md`) already
warned: "On a thin mint/consume microbench, freestanding can lose to
heap_churn (allocator noise vs stack protocol)."

### Fairer C twins of `slake_consume_token`

Name the job first. Then pick the twin.

| Twin | What C would do | What it answers | What it does not |
|------|-----------------|-----------------|------------------|
| **A. Stack live-flag twin (recommended)** | Same struct shape on the stack: id + live + state; same fail-closed codes; no `malloc`. Implement in smoke only (not product wire). | "Is Slake's ownership protocol as cheap as a careful C coder writing the same protocol?" | Heap allocator quality. |
| **B. Keep malloc, rename the claim** | Keep R-gc-shape. Say **"beats / ties libc malloc on this acquire/release microbench"** not "as good as C." | Allocator-vs-ownership contrast (already useful vs Boehm / Lean). | C stack quality. |
| **C. Protocol-honest compose twin** | heap_churn compose that also does a mult pre-scan + fail-closed shape (explore-runtime-perf-levers lever E). | Separates API/check cost from allocator cost on compose (still ~2.2x). | Mint bar. |

**Recommended bar language**

- **Keep** heap_churn as a **named allocator baseline** (with Boehm and Lean).
- **Do not** use "as good as C" as a synonym for "ties malloc."
- If the operator wants "as good as C" for the **token protocol**, add twin A
  (smoke-only stack automaton) and compare under the **same** CFLAGS, including
  a no-LTO cell.

**Verdict: Revise.** Mint vs malloc is a useful contrast, not a fair C twin.

---

## 3. LTO default: real product or bench cheat?

### What consumers actually compile with

| Surface | Flags | LTO? |
|---------|-------|------|
| Header contract (`slake_freestanding.h` ~lines 80-85) | `cc -c -std=c11 -ffreestanding -nostdlib -I. slake_freestanding.c` (hosted fallback: `-std=c11` only) | **No** |
| `just systems-cc-probe` (`just/dual-side.just`) | Same freestanding-first `-c`; behavioral probe `cc -std=c11 -I...` **no -O, no -flto** | **No** |
| `just build` | Lean emit + copy to `out/freestanding-c/`. Does **not** compile consumer objects with LTO. | N/A (generate only) |
| `out/freestanding-c/README.md` | "normal C toolchain"; no prescribed `-O3` / `-flto` | Unspecified |
| Bench **structural** `-c` | Fixed `-O2 -ffreestanding -nostdlib` | **No** (honest: not `BENCH_RUNTIME_CFLAGS`) |
| Bench **timing link** (default after Wave 4b) | `cc -std=c11 -O3 -flto` (`BENCH_RUNTIME_CFLAGS`) | **Yes** |

### Interpretation

- **Not a cheat** if the sentence is: "When the consumer links the wire and the
  driver with `-O3 -flto`, mint ties heap_churn on this host." LTO is ordinary
  production C. Cross-TU inlining is what you want for a static product library.
- **Is a headline skew** if the sentence is: "Freestanding mint is as fast as
  malloc" without naming flags. The **documented consumer compile** and the
  **product probe** do not use `-O3 -flto`. Under `-O3` alone the mint bar
  **fails** (~2.9x slower).

Living docs already mostly name the flags (`README.md` tip 8, `BENCH-RUNTIME-latest.md`).
Keep that honesty. Do **not** move structural freestanding-first `-c` to LTO
(that would mix hosted link policy into the no-stdlib object check).

**Verdict: Revise.** Treat `-O3 -flto` as **timing-link / production-N policy**,
not as the consumer default in `out/freestanding-c`. Publish both LTO and no-LTO
cells when claiming the malloc bar.

---

## 4. PROVABLY can never mean speed -- honest middle?

### Keep the name

- `AGENTS.md`: "PROVABLY remains wire correctness, not speed."
- `doc/goals.md`: PROVABLY true = CompCert product matrix; "wire correctness,
  not speed."
- `doc/vocabulary.md`: CompCert / compile-path bench "Not PROVABLY and not
  runtime-fastest-C."
- `WATCHER.md`: "Speed is empirical (`just bench-runtime`); never rename as
  PROVABLY."

Renaming PROVABLY to cover speed would smash the CompCert seal with a noisy
microbench. That assumption **stays**.

### Honest triple (no rename)

The tools already exist as **three columns**. Do not invent a fourth claim bool.

| Column | What | Living surface | May say |
|--------|------|----------------|---------|
| **PROVABLY** | Resolved `ccomp` product matrix (smoke + full wire + Mult) | `just product-compcert-matrix` / `just check` | Wire is CompCert-sealable. |
| **Measured ns/op** | Empirical medians vs named baselines | `just bench-runtime` -> `doc/BENCH-RUNTIME-latest.md` | Nx faster/slower under named CFLAGS. |
| **Lean cost bounds** | Nat step / fuse / grade-look model | `SystemsLean.HostCost` (L5-L9): fuse <= naive; fuse savings = n; every grade look = 1; step twins | Structural bounds on **host model** shapes. Not wall-clock. Not ELF. |

This is the middle: **report the triple together** in user-facing speed prose
("CompCert-checked emit; measured X ns/op under `-O3 -flto`; HostCost says
extract fuse is not a second scan"). Do **not** mint `provablyFast` or change
`provablyUnlocked`.

**Verdict: Keep** "PROVABLY never means speed." **Adopt** the triple as
presentation, not as a pin rename.

---

## 5. Compile-path bench stale (2026-08-10) -- re-run?

### What it measures

`doc/BENCH-latest.md` generated **2026-08-10 22:35:44 UTC**. Wall-clock of:

- Arm A: hot/cold `just build` (emit C) and without-Lake host tools
- Arm B: Lake `lake build` first + second pass
- Seal: CompCert matrix wall-clock (~109 s)

It is **explicitly secondary**. It does **not** answer mint/compose ns/op.
AGENTS: compile-path is secondary; runtime is primary for the linear / no-GC
story.

### Did the performance program change those jobs?

Wave 4 edited Linear/Compose SSOT (mint inline, extract fuse, compose reset,
O3/LTO **timing** policy). That can change **bytes** of generated C and maybe
a few milliseconds of emit write. It does **not** change the meaning of
"hot freestanding 0.142 s vs Lake hot second 0.412 s." Those jobs are still
different (emit C vs elaborate host Lean).

### When to re-run

| Need | Re-run? |
|------|---------|
| Close this performance program / mint bar | **No** |
| User-facing "how long is `just build`?" freshness | Optional; not blocking |
| After a large emit-writer or Lake package shape change | Yes, later |

**Verdict: Drop** as a required step of this program. Optional later freshness.

---

## 6. More seeds / TERM / FullHost -- performance?

### What they are

| Dial | Living tip (2026-08-12) | Job |
|------|-------------------------|-----|
| **seed** | 206 | Host module-check fixture corpus size |
| **TERM dual-ok** | 46 | Host elaborator term-surface dual-ok count |
| **harness** | 99 | HostModuleCheck harness (HostCost is **not** dual-ok harness) |
| **FullHostElaborateRemains** | **false** | Full package elaborate bar (H1-H8; H2 still partial vs seed 206) |

These grow **classic Lean host checkers** under `HostModuleCheck*`. They do not
edit `host_emit_linear.ssot.txt`, compose extract, or consumer CFLAGS.

### Could they help runtime?

No causal path:

- More seeds: more fixtures to accept/reject. Host wall-clock of
  `host-module-check-without-lake` may get **slower** (compile-path Arm A
  without-Lake already ~2.1 s). That is host develop cost, not product ns/op.
- More TERM: more term-surface twins. Same host story.
- FullHost true: would mean Slake elaborates the host package more fully.
  Still not freestanding mint/compose.

Residual already says: do not invent seed-wide H2 or FullHost true for this
program.

**Verdict: Drop.** Not performance levers.

---

## Strategic grade recommendations (only if cheaper emit)

Policy test from the prompt: recommend an extra grade **only** if it enables
cheaper emit (affine drop = no consume store; MULT-0 erase = no runtime token).

| Action | Grade change? | Emit effect | Decision |
|--------|---------------|-------------|----------|
| Keep using MULT-0 erase | None | No token / no payload when marked absent | **Already the right lever.** Enforce in emit, do not add a twin erase grade. |
| Affine drop as **lowering** | None (no new tag) | Unused resource: omit consume stores | **Park.** Held ABI. Micro win only. Reopen only with a named product residual + measure. |
| Affine as `SLAKE_MULT_3` | New constructor + enum | Same drop lowering plus zoo + fail-closed table rewrite + dual Idris gap | **Do not.** |
| Grade 2 / n / relevant | New constructors | More runtime accounting | **Do not** for performance. |

---

## What to keep saying in public language

1. Freestanding product grades are **0 / 1 / omega**. Affine remains a documented
   edge, not a shipped fourth grade.
2. Mint **ties malloc/free heap_churn under timing-link `-O3 -flto`** on the
   quiet 2026-08-12 suite. That is not "as good as all C" and not the
   header's compile line.
3. Consumers are documented to compile **without** LTO. Probe compiles without
   `-O3`. Do not hide that.
4. **PROVABLY** = CompCert matrix. Speed = `just bench-runtime`. Bounds =
   `HostCost`. Triple, not a rename.
5. Compile-path bench and seed/TERM/FullHost are **not** this runtime story.

---

## Non-claims

- No Open Name invented.
- No pin flips (free / complete / PROVABLY / FullHost / Dominance / FullBackend).
- No product C or Mult inductive change recommended in this report.
