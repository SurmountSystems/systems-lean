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
| **LLVM / Rust path** | Real design bar, but **deferred** until self-hosted Systems Lean / Slake (`out/llvm-ir`) |

Bridge sides (`src/idris2/`, `src/lean4/`) exist to feed an honest map into Slake -- not as a substitute for freestanding product work.

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
6. **Host finish line: Slake does everything Lake does.** For Systems Lean host develop under `src/systems/`, Slake must own every job classic Lake does today: load the package, follow imports, elaborate and check modules (including theorems), and build the host tools we currently build with Lake. Until that checklist is met with evidence, the **host** side of the project is not finished -- even when freestanding product free, freestanding product self-host complete, and product path without Lake on the normal step are already true. **Living status:** claim **false**; **living work program true**. Program: `.agents/plans/plan-slake-replaces-lake.md`. Primary Open remain: **Host library seed expand continue** (beyond modules=81 Mult..Compose+Erasure/Extract+CompilePath/Kernel+Kernel *Theorems+JoinMap/SelfHost+SurfaceMatrix+Emit scaffolds+KernelSelfApply+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems; next coherent band; SelfApplyFs still held on remaining ProductPath/Capable). DualResidual host residual remains; host free claimed false -- do not flip early.
7. **Full goal chain (keep linked).** Host Lake-job ownership is layer 1. The project story also keeps (2) Systems Lean with linear/affine types (no product GC), (3) runtimeless freestanding C on the product wire, and (4) CompCert `ccomp` validation honesty. Agents must not treat "replace Lake" as an isolated tooling slogan that drops layers 2-4.
8. **Six-unit Mult / Linear / Types / Program / Graph / Compose path is foundation only.** Host checkers and package writers for those six units (plus recipes that avoid Lake on those steps) are a measured regression harness and early elaborator foundation. They are **not** the finish line for "Slake does everything Lake does" and **not** enough alone to claim host develop no longer needs Lake day to day.
9. **CompCert path.** C sealable with CompCert when PROVABLY is earned with a real resolved `ccomp`. Living tip: PROVABLY claimed true with product matrix evidence; keep validating; do not forge weaker dogfood as a new PROVABLY.
10. **LLVM / Rust path (later).** After self-host; layout-compatible link without classic foreign-function glue as the design bar -- not claimed early. Living tip: llvm unlocked with evidence; not full backend / not Rust-native link.
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

**Bootstrap Slake** with classic Lean **Lake** as the temporary host elaborator:

| Stage | Meaning |
|-------|---------|
| **S0** (done) | Host foundation: free product wire + claim B writer path under Lake |
| **S1** (next) | First named compiler surface (defined Mult unit input, checkable path) |
| **S2-S3** | Emit subset; measured freestanding self-application of that subset |
| **S4** | Retire Lake from product path only with evidence (never forge early) |

Missing freestanding binary does **not** block bootstrap -- that is how bootstrap
starts. Free and complete are foundation, not "Slake bootstrapped." Held tracks
(PROVABLY, LLVM) do not auto-start. Plan:
`.agents/plans/plan-residual-free-freestanding.md` Step 5; inventory
`doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`.

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
| Rust interop without classic FFI | Concrete ABI/embed design + tests |
| Superset of Idris 2 and Lean 4 | Explicit surface matrix + progressive gates |

Do not claim mathematical "isomorphism finished" until the correspondence is stated, imperfect edges documented, and progressive gates exist.

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
