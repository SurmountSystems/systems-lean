# Plan status: what we finished and what is left

**Date:** 2026-08-08 (revised after operator notes: plain English, almost no Rust in-repo, benchmarks called out)
**Project:** Systems Lean language and Slake compiler (`/home/hunter/Projects/ai/iso`)
**Durable twin:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md` (sync after this reseed)

---

## How to read this plan

- **Done** means shipped on disk with green checks we can re-run.
- **Partial** means a real slice landed; a stronger claim stays false on purpose.
- **Held** means not open residual; only start after you say to promote it.
- Open residual is **empty** (done-for-now). Next work starts only when you promote a name.

**Almost no Rust in this repository.** Novel product work stays **Idris 2**, **Lean 4 (Systems Lean / Slake)**, and **pure Nix**. Freestanding C is emitted product wire, not where we implement the language. We do **not** grow a Rust crate tree here as the happy path. When people said "Rust-native link," the real product goal is: **Slake owns layout-compatible LLVM intermediate representation (IR) and freestanding surfaces so another language (including Rust, outside this repo) can consume the same memory shapes without hand-written C glue as the story.** Implementation of that bar lives in **Systems Lean and Slake**, not in new Rust product sources under `src/`.

---

## Where we are (one screen)

| Item | Living state |
|------|----------------|
| Open residual | **Full backend claim true** (Package 1 A-light) after Package 0 mop |
| Watcher | Package 1 next implement (not false done-for-now) |
| Freestanding product self-host / free / CompCert PROVABLY path | Claimed true (not re-opened this plan) |
| Host free claimed; full classic host elaborate | Free claimed; full-host elaborate remains **false** |
| LLVM path | Unlocked. Mult..Graph SSA partial + unit CFG dual-pin + progressive path B **done**. Mult..Graph foreign band-local **done**. fullBackend claim pin still **false** |
| Dual examples (Idris + Lean) | Six pairs. Two small formal bridge theorems. Not "languages are isomorphic" |
| Layout / interop readiness | Mult layout + Mult..Graph foreign band-local **done**; Rust IR partial + multi-band full **done** (`rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed`). Not fullBackend synonym |
| Benchmarks (Phase M + runtime) | **Done** -- compile-path + `just bench-runtime` living report |
| Library seed modules / harness | 206 / **40** |

**Reports:**

- First held wave (product + later re-verify gates): `.agents/reports/impl-held-backend-dual-rust-a090001e-2026-08-08.md`
- Remaining promote (Types wave): `.agents/reports/impl-remaining-residual-8cce6f5a-2026-08-08.md`
- Remaining promote (Program/Graph wave): `.agents/reports/impl-remaining-residual-b2a2512c-2026-08-08.md`
- Benchmarks: `doc/dev/research/hot-cold-benchmarks-2026-08-08.md`, recipes in `just/bench.just`

---

## Benchmarks (you asked; they landed in Phase M)

**Status: done** as measurement research + thin recipes. Not residual theater. Not a claim that freestanding beat Lake forever.

| Piece | What it is |
|-------|------------|
| Research note | `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` (methods, machine, numbers, honesty limits) |
| Recipes | `just/bench.just`: hot freestanding build, cold freestanding (trash generated wire then rebuild), without-Lake host tools, hot Lake package build, optional cold Lake (trash `.lake`), CompCert matrix timing, `just bench-phase-m` menu |
| Earlier peer benches | Lake vs Slake same-job Mult and serial notes under `doc/dev/research/` (2026-08-01 / 2026-08-02) |

**What benchmarks are for:** compare wall-clock on named jobs (product wire, host tools, Lake, CompCert matrix). They do **not** flip free / complete / PROVABLY / full LLVM backend.

**What we did not claim:** permanent performance win over Lake; cold total wipe of every prebuilt every session (cold Lake is optional and long).

**If you want more later (held until you ask):** re-run and pin fresh numbers after Program/Graph IR growth; same-job peer timings for new host tools; never grow a bash timing farm (keep thin just + research note).

---

## Track map in plain English

### 1) LLVM IR from Slake (primary backend deepen)

**Meaning:** Slake writes freestanding-oriented LLVM IR under `out/llvm-ir/`, with host Lean writers and pure Nix checks. "Full backend" would mean real control-flow and dominance over general programs, not only small unit-band fixtures.

**Done:**

| Slice | What you get |
|-------|----------------|
| Unlock | LLVM work allowed (`llvmUnlocked` true) |
| Unit IR text Mult through Graph + compose | Writers + pure Nix |
| Mult band SSA-shaped lower partial | `LlvmMultSsa`, sample `.ll`, `just llvm-mult-ssa` |
| Linear band same shape | `LlvmLinearSsa`, `just llvm-linear-ssa` |
| Types band same shape | `LlvmTypesSsa`, `just llvm-types-ssa` |
| Program band same shape | `LlvmProgramSsa`, `just llvm-program-ssa` |
| Graph band same shape | `LlvmGraphSsa`, `just llvm-graph-ssa` |
| Mult control-flow **fixture** + deepen (structural) | `LlvmCfgFixture`: Mult graph model + merge preds + reachability; **not** production optimizer or dominance pipeline claim |
| Production CFG deepen | Mult SSA grade_tag dual-pin (idom + four-pred merge phi); `just production-cfg-deepen`; fullBackend / production opt / full dominance **false** |
| Inventory | `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` |

Local full-backend flags stay **false**.

**Left (finish program):**

| Rank | Name | Done when (sketch) |
|-----:|------|--------------------|
| Package 1 | Full backend claim true (A-light) | Lake pin flip + honesty bar; progressive evidence already on disk |

### 2) Layout-compatible IR for outside consumers (was "Rust-native link")

**Meaning (rewritten):** Systems Lean and Slake own **agreed Mult (then more) memory layout and IR tags** so a consumer language **outside this repo** can match sizes/alignments/tags without our story being "write `extern "C"` glue forever." Classic C ABI remains a valid **fallback**, not the success bar.

**What we refuse as product growth here:** a Rust crate farm under `src/`, Rust as a fourth novel language, editing `ref/rust` as product.

**Done (all in Lean / Nix / freestanding surfaces):**

| Slice | What you get |
|-------|----------------|
| Design bar | `doc/dev/research/rust-native-layout-design-2026-08-03.md` (name is historical; bar is layout/ABI) |
| Mult ABI parity smoke | `just abi-parity-smoke` |
| Mult layout IR tag dual-pin | `just layout-ir-dual-pin` |
| Mult layout consumer fixture | `just mult-layout-consumer` |
| Mult **link readiness** partial | `just mult-link-readiness` (freestanding Mult + Mult unit IR + Mult SSA tags + layout fixture agree). **Does not** mean "Rust linked successfully" |
| Mult **layout/IR consumer success** partial | `just mult-layout-ir-success` (freestanding Mult API + unit IR + Mult SSA kernel/is_valid + layout size/align). **Does not** mean "Rust linked successfully" |
| Mult **foreign link success** (Mult band) | `just mult-foreign-link-success`; host Lean `MultForeignLink`; dual agreement + out-of-tree rustc dogfood; evidence `doc/dev/research/mult-foreign-link-success-2026-08-09.md` |
| Linear/Types/Program/Graph **foreign link success** | **done** band-local each (`just linear/types/program/graph-foreign-link-success`); Mult..Graph progressive complete |
| Rust IR interop partial + multi-band full | **done** (`rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed`; not fullBackend synonym) |
| Progressive Full LLVM path B | **done** (`fullLlvmBarEvidencePartial` true; tip fullBackend later true under Package 1 A-light; band FullBackend false) |
| Fixture tip fullBackend (Package 1 A-light) | **done** (`llvmCfgFixtureFullBackendClaimed` true; band FullBackend / opt / DominanceClaimed false) |
| Packages 2a-2c Emit* TERM | **done** (EmitPlan/EmitApply/EmitBody; harness=**44**) |
| Completeness Package C0 honesty mop | **done** (2026-08-10; inventory + pin prose lockstep) |

**Left (completeness program / held):**

| Rank | Name | Done when (sketch) |
|-----:|------|--------------------|
| C1 | Without-classic-FFI end announce | Surface-matrix + public sentence + non-claims; interop evidence already green |
| C2 | FullHost progressive deepen | Named progressive bar; FullHost stays false until C2z |
| C1b / C3 | Optional A-heavy LLVM / AffineDrop honesty | Operator promote only |
| C4 | mathlib day-one | **Non-goal** for freestanding finish line (offline/no-mathlib law); reaffirm only |
| C5 | Host UX clear-prompt/resume | **Out of this repo** (Grok Build host product) |
| -- | Optional further out-of-tree dogfood | Documented command outside git; never required novel Rust under `src/` |

### 3) Dual algorithm pairs (Idris side + Lean side)

**Meaning:** Real sources both sides for the same idea, plus host join cite/use. Not "Idris equals Lean."

**Done (six pairs):** ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap, RuntimeExtract.

**Left (held):** AffineDrop honesty dual only if product opens affine ABI work. No auto-open.

### 4) Dual formal bridge theorems

**Meaning:** Host Lean theorems that go past cite/use pins.

**Done present-partial (two edges):**

1. FailClosedGrade host use implies Mult unknown-tag reject
2. RuntimeExtract host use implies unknown-runtime reject

**Left (optional):** more edges only if product needs them. Never claim full isomorphism or mathlib dependency.

### 5) Benchmarks / measurement

**Done:** Phase M note + `just/bench.just` (see section above).

**Left (optional):** refresh numbers after large IR growth; keep thin recipes.

---

## Two implement waves already closed (for audit)

### Wave A -- duals first (IMPL a090001e)

LinearPairSwap dual, first formal edge, RuntimeExtract dual, LLVM inventory reseed, Linear SSA partial, Mult layout consumer. Re-verify IMPL 6c7f8730 green.

### Wave B -- remaining promote (IMPL 8cce6f5a)

Types SSA partial, second formal edge, living prose six duals, Mult link readiness partial, Mult CFG structural fixture, residual lockstep. Review fixed companion lag (README / residual). Zero open.

### Wave C -- remaining promote (IMPL b2a2512c)

Program SSA partial, Graph SSA partial, Mult layout/IR consumer success partial, Mult CFG deepen partial, residual lockstep. Zero open.

---

## Highest value next (finish program)

1. **Full backend claim true** (Package 1 A-light): lake pin flip of
   `fullBackend` / `llvmCfgFixtureFullBackendClaimed` with honesty bar SSoT still
   green; progressive path B + Mult..Graph foreign + Rust IR full already met as
   evidence; never alias those pins alone as the claim.
2. **Package 2 progressive deepen** after Package 1 if residual still names gaps.
3. **AffineDrop dual** / mathlib day-one only if operator opens Package 3 held.

Default next implement: **Full backend claim true** (Package 1).

---

## What we will not do

- Claim full LLVM backend, Rust (or any foreign) link success, free/complete/PROVABLY/full-host flips without proof
- Grow novel product Rust, Python, or shell mills
- Hand-author product C as "implementation"
- Treat unlock or partial SSA / structural CFG fixture as production backend
- Invent open residual names while done-for-now is honest
- Agents never git commit or push

---

## Self-checks you (or agents) can re-run

```
just hygiene
just systems-host
just systems-llvm-ir
just llvm-program-ssa        # expect fullBackend=false
just llvm-graph-ssa          # expect fullBackend=false
just llvm-types-ssa
just llvm-linear-ssa
just mult-layout-ir-success  # consumer success partial, not foreign link success
just mult-link-readiness     # readiness only, not foreign link success
just mult-layout-consumer
just bench-phase-m           # optional timing menu; long if you include cold Lake
# lake build on modules you touch when lake is on PATH
```

---

## First slice after a real promote

**Name:** True foreign layout link success (out-of-tree)

**Goal:** Prove Mult happy path with a consumer **outside** this repo matching Slake-owned layout and IR tags.

**Done when:** Documented out-of-tree command + evidence; residual honesty names remaining bands; no product Rust under `src/` unless operator orders a tiny exception; residual and watcher updated.

**Out of scope:** Full production LLVM backend true; AffineDrop dual; claim forge; in-tree Rust farm.

If you do not promote: stay done-for-now; no auto implement loop.

---

## Operator corrections absorbed this reseed

1. **Plain English** over residual stage codes and stacked jargon in living plan prose.
2. **Almost no Rust in-repo:** layout and IR compatibility are Systems Lean / Slake work; outside consumers are optional and out of tree.
3. **Benchmarks:** Phase M is already done; called out above with paths and recipes so it is not invisible next to backend tracks.
