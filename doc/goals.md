# Goals

Canonical goals for **Systems Lean** and its **Slake** compiler.

Related: [vocabulary.md](vocabulary.md), [architecture.md](architecture.md), [divergence.md](divergence.md).

---

## One-sentence goal

**Slake** is a compiler, written in **Systems Lean**, that is a usable **superset** of the programming and proof capabilities of **Idris 2** and **Lean 4**, reached by a **meet-in-the-middle** correspondence (Curry-Howard + QTT), emitting **freestanding** products toward **CompCert-oriented C** and **LLVM IR**, with efficient **Rust ecosystem interop without classic FFI** as the happy-path design bar.

## Primary product focus (do not dilute)

Day-to-day work serves **Systems Lean** and the **Slake** compiler. The freestanding product bar is non-negotiable:

| Focus | Meaning |
|-------|---------|
| **Systems Lean** | Language + project: Lean 4 with linear/affine ownership and only the **minimum** Quantitative Type Theory multiplicities (**0** erased, **1** once, **omega** unrestricted) needed for freestanding work |
| **Slake** | Compiler written in Systems Lean that consummates the Idris/Lean meet-in-the-middle map |
| **Runtimeless freestanding C** | Primary emit: `out/freestanding-c` -- no managed Lean runtime, **no garbage collection** on the product wire |
| **Memory safety** | From types: linear/affine discipline and related checks -- not from a garbage collector |
| **LLVM / Rust path** | Layout-compatible Rust-ecosystem interop is a real design bar (`out/llvm-ir`). For Mult through Graph layout and the foreign dual-map consumer path we document, classic foreign-function interface (FFI) ceremony is **not** required as the happy path. Classic freestanding **C** product wire (`out/freestanding-c/`) remains a permanent valid emit path. Not "no FFI ever"; not formalized all of rustc; not product Rust under `src/` |

Bridge sides (`src/idris2/`, `src/lean4/`) exist to feed an honest map into
Slake -- not as a substitute for freestanding product work.

---

## Origin / Formal Vibefication

**Systems Lean** (and **Slake**, freestanding emit, the dual Lean / Idris
path, and this monorepo's residual process) is inspired by -- and was started
because of -- the essay
[Formal Vibefication](https://proofofkeags.com/research/2026-05-12-formal-vibefication.html)
by Keags (accessed: 2026-08-09). That essay is the **inspiration for this
entire project**, not a side citation.

The essay argues that AI re-prices the relative costs of **writability**,
**literacy**, and **performance-correctness** across programming and formal
methods. This repository is a concrete product answer on that landscape:
freestanding runtimeless C with linear / Quantitative Type Theory (QTT)
ownership, a dual Lean / Idris host path, and CompCert-oriented product
validation. It is **not** a claim that Keags endorses, owns, or maintains
Systems Lean or Slake.

Full readiness planning (phases + essay-to-product map):
`.agents/plans/plan-full-readiness-2026-08-09.md` (**Why this project exists**).

| Cost axis | Our answer |
|-----------|------------|
| **Performance-correctness** | Freestanding product wire: no garbage collection and no Lean managed runtime on the link; linear / QTT ownership; CompCert path when PROVABLY is earned |
| **Literacy** | Lean host under `src/systems/`, dual Lean / Idris sides, and queryable checks (`just check`, pure Nix presence gates) |
| **Writability** | Residual ledgers plus coding agents, with human co-sign of durable claims and product surface |

Related motivation for the Idris / Lean split: **Why this exists** below. Full
north-star list: **North-star goals**.

---

## Why this exists

Idris 2 and Lean 4 both inhabit dependent type theory, but they do not share one product surface:

- Idris 2 puts **QTT multiplicities** and linear resources in the core language story.
- Lean 4 puts a production **kernel, elaborator, and proof ecosystem** first; classic AOT still carries a managed runtime.
- **Systems Lean** is our invention: Lean 4 plus linear/affine ownership and full QTT multiplicities, aimed at freestanding systems binaries.

**This repository is Systems Lean:** we document the bridge, keep agent hygiene honest, and implement the language and Slake **in isolation** -- using upstream trees only as **read-only references** under `ref/`.

---

## North-star goals

1. **Meet in the middle.** Map Idris 2 and Lean 4 toward a shared core (erasure, multiplicity, linearity, extract trusted computing base honesty). Consummate that core in Slake -- not a third fashion language.
2. **Superset surface (phased).** Cover the *useful cores* of both languages with progressive gates. Day-one full upstream parity is not required and not claimed.
3. **Minimum multiplicities only.** Quantitative Type Theory grades **0 / 1 / omega** -- only what freestanding Slake needs; no multiplicity zoo.
4. **Linear/affine memory safety.** Safety on the product wire comes from ownership discipline and checks, **not** garbage collection.
5. **Runtimeless freestanding C first.** Primary release surface `out/freestanding-c`. Dual residual honesty (product vs host elaborator): product residual free may be claimed while host Lake residual remains.
6. **Host finish line: Slake does everything Lake does.** For Systems Lean host develop under `src/systems/`, Slake must own every job classic Lake does today: load the package, follow imports, elaborate and check modules (including theorems), and build the host tools we currently build with Lake. Freestanding product free, freestanding product self-host complete, and product path without Lake on the normal step are already **true**. **Living status:** host elaborator residual free **claimed** under free bar choice **(a)** (F1 dual-ok 2026-08-07; DualResidual remains **false** / free claimed **true**). **FullHostElaborateRemains false** (A66; cold full Lake is bootstrap / emergency / claim-proof only for day-to-day). A60 day-to-day tools empty + claim/diagnostic Lake-only explicit. Full Lean 4 / mathlib elaborator parity and "Slake owns every Lake judgment forever" stay **unclaimed** (layers 2-4 preserve; do not forge). Program: `.agents/plans/plan-slake-replaces-lake.md`.
7. **Full goal chain (keep linked).** Host Lake-job ownership is layer 1. The project story also keeps (2) Systems Lean with linear/affine types (no product GC), (3) runtimeless freestanding C on the product wire, and (4) CompCert `ccomp` validation honesty. Agents must not treat "replace Lake" as an isolated tooling slogan that drops layers 2-4.
8. **Six-unit Mult / Linear / Types / Program / Graph / Compose path is foundation only.** Host checkers and package writers for those six units (plus recipes that avoid Lake on those steps) are a measured regression harness and early elaborator foundation. They are **not** the finish line for "Slake does everything Lake does" and **not** enough alone to claim host develop no longer needs Lake day to day.
9. **CompCert path.** C sealable with CompCert when PROVABLY is earned with a real resolved `ccomp`. Living tip: PROVABLY claimed true with product matrix evidence; keep validating; do not forge weaker dogfood as a new PROVABLY.
10. **LLVM / Rust path.** Layout-compatible interop without classic foreign-function interface (FFI) ceremony as the **happy path** for Mult through Graph layout and the documented foreign dual-map consumer path (end announce measured; gates `just rust-ir-interop-partial` / `just rust-ir-interop-full`). Living tip: `llvmUnlocked` **true**; Mult SSA lower partial **done**; fixture tip fullBackend **true** A-light (not band FullBackend; not production opt). Classic freestanding **C** product wire remains permanent. Not "no FFI ever"; not formalized all of rustc; not product Rust under `src/`.
11. **Three languages only.** Novel work is **Idris 2** (`src/idris2/`), **Lean 4** including Systems Lean / Slake (`src/lean4/`, `src/systems/`), or **pure modern Nix flakes** (`nix/`, thin `flake.nix`) designed as small modules for large language model attention limits. No project Python. No growing shell/bash mills. No bash/shell/Python smuggled inside Nix. Freestanding C is product *emit*, not a fourth source language. `just` is thin orchestration only. Full rule: `AGENTS.md` (Three languages only); terms: `doc/vocabulary.md`.
12. **Hygiene and thoughtful language on touch.** Every implement slice applies plain American English, ASCII-only novel work (allowlist exceptions in `AGENTS.md`), and professional tone to the files it touches, **including markdown**. Gate: `just hygiene` (pure Nix `nix/source-hygiene.nix` + `nix/professional-tone.nix`). Gradual on-touch scrub; no bulk Done-archive rewrite. Detail: `AGENTS.md` Language / ASCII / Documentation hygiene; plan section H in `plan-slake-replaces-lake.md`.
13. **Honesty ladder.** Every major claim has an evidence bar (below). Prefer greppable gates over prose.
14. **Theory and experiment.** Spec/proof separation for formal work **and** red/green tests -- both, like scientific method (hypothesis + experiment).

---

## Near-term goals (repo foundation)

1. Durable goals, vocabulary, architecture, and divergence docs (this tree).
2. Agent hygiene that survives compaction (`AGENTS.md`, session handoff, residual, research quarantine).
3. Complete read-only references: `ref/Idris2`, `ref/lean4`.
4. Isolation: all product work happens here unless a human explicitly escalates out of isolation.

## Living product goal (after free + complete foundation)

**Freestanding product path foundation is closed.** Living tip for humans
(detail and claim board: `RESIDUAL-systems.md`; stranger map: root `README.md`):

| What | Status (plain English) |
|------|------------------------|
| Freestanding product path; product residual free; freestanding self-host complete | **true** (normal product path does not need Lake on the step) |
| **PROVABLY** (CompCert product matrix in `just check`) | **true** (wire correctness, not speed) |
| Host elaborator residual free (free bar **(a)**) | **claimed**: day-to-day host tools without Lake on the step; full host package elaborate remains **false**; free is **not** Lake gone |
| LLVM unlocked; Mult through Graph SSA lower | unlocked / **partial** (not full production backend) |
| Fixture tip fullBackend | **true** under light A bar; band FullBackend / production opt **false** |
| Host library seed | modules=**206**, harness=**99** (S8 CompilePath unit TERM; TERM dual-ok **46**) |
| Idris 2 and Lean 4 dual map (CHI ready) | working map: three grades, six JOIN-ALG algorithms; AffineDrop+AffineOwn EDGE-AFFINE duals **documented** (not freestanding affine ABI); formal dual-map present-partial; gates `just idris-side` / `just lean-side`; not full isomorphism |
| Lean to Rust dual map (CHI ready) | Mult through Graph layout/foreign measured under named bars; joint partial + multi-band full true; gates `just systems-llvm-ir` / `rust-ir-interop-partial` / `rust-ir-interop-full`; not full isomorphism; not product Rust under `src/` |
| Without classic FFI as happy path | **measured** for Mult through Graph dual-map consumers; freestanding **C** remains permanent; not "no FFI ever" |
| Done (recent pilots) | package-env Mult..ParityEmit; ParityMult..ParityEmit TERM dual-ok; multiUnit Mult..Graph DF deepen true; LLVM honesty hold (DominanceClaimed/band FullBackend false) |
| Still open / not claimed | FullHostElaborateRemains **false** (H2 package-env pilot not seed-wide 206); DominanceClaimed **false**; band FullBackend **false**; mathlib day-one non-goal; freestanding product affine ABI held; host UX out of this repo |
| Proof honesty | `proofCompleteClaimed` **true** is Track 4c SpecProof bar only -- **not** full elaborator parity or FullHost true |
| Standing hygiene | Sub-1-KLOC; `just hygiene` |

Classic Lean **Lake** remains bootstrap / emergency / claim-proof for host
elaborate; day-to-day host tools have without-Lake recipes under free bar (a).
Do **not** read this section as "S1 next" or "PROVABLY/LLVM held from zero."
Mult SSA partial is not a full backend claim. Progressive Full LLVM path B,
Mult through Graph foreign, and Rust IR interop partial + multi-band full are
**done**. Full readiness announce closed under announce-bar B. Living runtime
is `doc/BENCH-RUNTIME-latest.md` (stamp **20260812T192951Z**; mint vs heap ~1.0x
and vs Boehm ~28.2x; compose vs heap ~1.6x slower). Held only with operator promote: full elaborator
/ mathlib parity; mathlib as product dependency (**C4** day-one non-goal); AffineDrop dual; further dual
pairs beyond present-partial. Gap inventory (free bar a vs FullHost vs measured M1-M6 vs mathlib):
`doc/dev/research/full-elaborator-parity-inventory-r4-2026-08-11.md`. Full held + standing list: `RESIDUAL-systems.md`
Remaining map (plan Part 2). Finish-line program:
`.agents/plans/plan-slake-replaces-lake.md`. Historical freestanding ladder:
`.agents/plans/plan-residual-free-freestanding.md`.

---

## Honesty ladder

| Claim | Evidence bar |
|-------|----------------|
| QTT multiplicities supported | Binder mult + use-check + tests |
| Linear resources safe on product wire | Affine/use checks + residual gates |
| Freestanding product / product residual free | No managed Lean / GC residual on product release wire + honesty agreement (claim A); dual residual: host elaborator residual separate. May be true while host still needs Lake |
| Product path without Lake on the normal step | Building and shipping freestanding product C does not need Lake on the normal path (product StillUsesLake / DependsOnLake false with proof). Does **not** mean host develop is free of Lake |
| Host develop no longer needs Lake day to day | Slake owns the full host checklist for `src/systems/` (load package, imports, elaborate/check modules including theorems, build host tools). Six-unit Mult..Compose checkers and writers alone do **not** meet this bar. **Never forge** while Lake still elaborates full host develop |
| GC-free / residual_free host elaborator | Same bar as host develop free of Lake day to day; measured inventory + DualResidual flip with elaborator proof only |
| CompCert PROVABLY | Resolved real `ccomp` + full product matrix |
| Rust interop without classic FFI | Mult..Graph layout + foreign dual-map consumer path documented; partial/full interop pins true with lake gates; happy path does **not** require classic FFI ceremony for that path (C1 end announce). Not "no FFI ever"; freestanding C remains permanent |
| Superset of Idris 2 and Lean 4 | Explicit surface matrix + progressive gates |

Do not claim mathematical "isomorphism finished" until the correspondence is stated, imperfect edges documented, and progressive gates exist.

### Dual map status (what exists vs what is not claimed)

**Cross-host integrity (CHI) readiness (2026-08-11):** correspondence interfaces
for Idris-Lean JOIN-ALG and Lean-Rust measured interop are **finished under the
honesty bar** -- pure Nix dual presence and rust/llvm dual gates green, living
value prose lockstep -- and are **not** a forge of full isomorphism.

**Living value (plain English):** the project already has an honest dual
correspondence for minimum QTT grades (0 / 1 / omega) and six paired algorithms
(JOIN-ALG under `src/idris2/examples/` and `src/lean4/examples/`), plus named
imperfect edges in `doc/divergence.md`. AffineDrop and AffineOwn EDGE-AFFINE
dual-tree pairs are **documented** (dual honesty only; freestanding product
affine ABI remains held). The Systems host uses those six JOIN-ALG algorithms in
Mult / Linear / Erasure / HostCompose / Extract (`src/systems/join-map.md`).
Formal dual-map theorems on the host are **present-partial** (two named
product-backed edges only: FailClosedGrade and RuntimeExtract host-use
implications). Gates: `just idris-side`, `just lean-side`; optional
`just idris-elaborate` checks all six Idris dual sources when `idris2` is on
PATH. Lean-Rust value: Mult through Graph layout and foreign dual-pins under
`just systems-llvm-ir` / `just rust-ir-interop-partial` /
`just rust-ir-interop-full` (see `doc/rust-entry.md`).

**Must not claim from this dual work alone:** "isomorphism complete," "Idris =
Lean," classic Lean enforces exact-once linear use, dual examples are freestanding
product C, freestanding product affine ABI shipped, full elaborator or mathlib
parity, formalization of all of rustc, product Rust under `src/`.

---

## Non-goals

- Day-one full Idris 2 or full Lean 4 compatibility
- Forging residual, PROVABLY, or host residual_free tokens
- Calendar ship dates as success criteria
- Replacing upstream Idris 2 or Lean 4 development
- Marketing "safer than Rust" without greppable gates
- Ephemeral wave language as permanent APIs or module names
- Racing or residual-chasing **external** Systems Lean trees by default
- Inventing a thesaurus of product brands for the same idea

---

## Isolation policy (normative)

| Do | Do not |
|----|--------|
| Implement Systems Lean / Slake work **in this repo** | Treat another tree as the default Systems Lean workplace |
| Read `ref/Idris2` and `ref/lean4` as upstream truth | Edit upstream under `ref/` as product |
| Pin process corrections into `AGENTS.md` / living docs | Rely on chat memory after compaction |
| Escalate off-repo **only** when the human says we are desperate for a specific solution | "Sync with sister tree" as routine process |

---

## Success for early phases

Early success is **honest documentation + agent discoverability + reference layout**, then small correspondence spikes. Compiler body and backends come after the foundation is greppable and residual is honest.
