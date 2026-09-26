# Systems Lean

**Systems Lean** is the project and language: Lean 4 with linear/affine ownership and Quantitative Type Theory (QTT) multiplicities **0 / 1 / omega**, aimed at freestanding systems products, reached by a meet-in-the-middle bridge between **Idris 2** and **Lean 4**.

**Slake** is the freestanding compiler written in Systems Lean. Focus: runtimeless C under `out/freestanding-c` with memory safety from **linear types**, **no garbage collection** on the product wire, and only those minimum multiplicities.

## Names (do not confuse)

| Name | What it is |
|------|------------|
| **Systems Lean** | This project and its language. Use this in prose. |
| **Slake** | The compiler product (host synthesis under `src/systems/`, freestanding emit) |
| **SystemsLean** | **Internal** Lake package id for the host under `src/systems/`. Not a product name. |
| **SystemsLeanLean4** | **Internal** Lake package id for classic Lean dual examples under `src/lean4/`. Not a product name. |
| **Iso** | **Internal** root Lake umbrella id only. Historical checkout-directory nickname from when this tree first started. **Not** the project name. |

## Why

This entire project is inspired by (not endorsed by and not owned by) Keags's
essay
[Formal Vibefication](https://proofofkeags.com/research/2026-05-12-formal-vibefication.html)
(accessed: 2026-08-09): AI re-prices writability, literacy, and
performance-correctness. Our product answer is freestanding runtimeless C with
linear / QTT ownership, dual Lean / Idris host work, and CompCert-oriented
validation. Detail: [doc/goals.md](doc/goals.md) (**Origin / Formal Vibefication**);
planning map: [.agents/plans/plan-full-readiness-2026-08-09.md](.agents/plans/plan-full-readiness-2026-08-09.md).

## Living tip

Already on the product path:

- **Freestanding product C** under `out/freestanding-c/`: memory safety from linear types, **no garbage collection**, no Lean managed runtime. Product residual **free** and freestanding self-host **complete** are **true**. `just build` does **not** need Lake on that step.
- **PROVABLY true.** CompCert product matrix is in `just check` (research / non-commercial `ccomp` by default; commercial CompCert needs AbsInt, see [LICENSES.md](LICENSES.md)). PROVABLY is **wire correctness**, not speed.
- **Host day-to-day tools without Lake on the step.** That is **not** "Lake is gone." Cold Lake still elaborates for bootstrap and claim proof.
- **LLVM unlocked and partial**, not a full backend.
- **Idris 2 and Lean 4 dual map present**, not a full isomorphism. Map: [src/systems/join-map.md](src/systems/join-map.md).
- **Runtime speed** (not PROVABLY): mint-class about **28.2x faster** than Boehm GC and **11.2x faster** than Lean managed; mint vs heap about **1.0x**; compose did **not** beat heap. Detail: [doc/BENCH-RUNTIME-latest.md](doc/BENCH-RUNTIME-latest.md) (`just bench-runtime`).

Still false: **Slake does not typecheck this package.** Full host package elaborate remains **false**. Not a full LLVM backend. Not full Lean 4 / mathlib parity. Freestanding product affine ABI remains held.

**Prove it:** `just check`. Claim board: [RESIDUAL-systems.md](RESIDUAL-systems.md). Reseed: [doc/SESSION-HANDOFF.md](doc/SESSION-HANDOFF.md). Living compiler map: [doc/compiler-map.md](doc/compiler-map.md) (not [TECH.md](TECH.md)).

**Three languages only** for novel work: **Idris 2**, **Lean 4** (including Systems Lean / Slake), and **pure Nix flakes**. No project Python. Freestanding C is **generated product wire**, not a fourth source language. Policy: [AGENTS.md](AGENTS.md). Terms: [doc/vocabulary.md](doc/vocabulary.md). Goals: [doc/goals.md](doc/goals.md).

## Try path

### (a) Freestanding C consumer only

Take the release tree [out/freestanding-c/](out/freestanding-c/) (or a subtree / tarball publish of it). Build with a normal C toolchain. No Lean, Lake, or GC on the link line. Consumer notes: [out/freestanding-c/README.md](out/freestanding-c/README.md).

### (b) Full monorepo (host + emit)

```bash
git clone <this-repo> && cd <checkout>   # directory may be named iso; project is Systems Lean
git submodule update --init --recursive  # ref/* and skills/* as needed
nix develop                              # elan, idris2, just, and friends when using the flake shell
elan toolchain install "$(tr -d '[:space:]' < src/systems/lean-toolchain)"   # once; pin leanprover/lean4:v4.34.1
just build                               # regenerate freestanding emit + install out/freestanding-c
just check                               # full suite (hygiene, host/emit gates, CompCert matrix when ccomp is on PATH)
```

Lake package map (Iso / SystemsLean / SystemsLeanLean4): [doc/lake-package.md](doc/lake-package.md).

### (c) What CI proves

CI runs the same surface as `just check`: pure Nix hygiene and presence gates, product freestanding wire fresh from `just build`, hosted behavioral probe paths, and the fail-closed CompCert product matrix when `ccomp` is available. CI does **not** prove full LLVM backend, full elaborator parity, or commercial CompCert rights.

## Read first

| Doc | Purpose |
|-----|---------|
| [doc/goals.md](doc/goals.md) | Full goals, non-goals, honesty ladder |
| [doc/vocabulary.md](doc/vocabulary.md) | Stable terms (project = Systems Lean; Slake = **compiler**; tooling terms) |
| [doc/architecture.md](doc/architecture.md) | Meet-in-the-middle sketch |
| [doc/divergence.md](doc/divergence.md) | Honest differences and trusted computing bases |
| [AGENTS.md](AGENTS.md) | Agent hygiene, isolation, **project skills**, pure Nix tooling, language inventory (SSoT, single source of truth) |
| [RESIDUAL.md](RESIDUAL.md) | Living open work for **this** project |
| [`.agents/skills/`](.agents/skills/) | Project skill discovery (symlinks; hosts walk this path) |

## References (read-only)

| Path | Upstream | Role |
|------|----------|------|
| `ref/Idris2` | [Idris2](https://github.com/idris-lang/Idris2) | QTT / linear side |
| `ref/lean4` | [Lean 4](https://github.com/leanprover/lean4) | Kernel / elaborator / proof side |
| `ref/CompCert` | [AbsInt CompCert](https://github.com/AbsInt/CompCert) | `ccomp` source for CompCert-oriented C path |
| `ref/rust` | [rust-lang/rust](https://github.com/rust-lang/rust) | Type layout / ABI + LLVM codegen reference (not llvm-project alone) |

Do not treat `ref/` as product source. Systems Lean language work and the Slake compiler live in this repository.

Entry maps: `doc/idris-entry.md`, `doc/lean-entry.md`, `doc/compcert-entry.md`, `doc/rust-entry.md`.

## Project agent skills

Lean 4 coding-agent workflows ship as a **project skill** (no global install required for discovery):

| Skill | Discovery path | Body (submodule) |
|-------|----------------|------------------|
| **lean4** | `.agents/skills/lean4` | `skills/lean4-skills` ([cameronfreer/lean4-skills](https://github.com/cameronfreer/lean4-skills)) |

After clone: `git submodule update --init --recursive skills/lean4-skills`. Policy, overrides, and **when to use** for residual/plans: [AGENTS.md](AGENTS.md) (**Project agent skills**). Inventory: [skills/README.md](skills/README.md). Lean entry map: [doc/lean-entry.md](doc/lean-entry.md).

## Isolation

Work **here**. This repository **is** Systems Lean. Do not default to other trees for residual or implementation. Escalate off-repo only when a human is explicitly desperate for a specific solution.

## Repository structure

```
.
+-- src/                 # Novel product work (not upstream)
|   +-- idris2/          # Idris side -- isomorphism / QTT (Quantitative Type Theory) side
|   +-- lean4/           # Lean 4 side -- kernel/elaborator-facing novel work
|   +-- systems/         # Freestanding Systems Lean + Slake host (min 0/1/omega; no product GC)
+-- out/
|   +-- freestanding-c/  # Generated freestanding product wire (release; not hand-authored)
|   +-- llvm-ir/         # LLVM IR for Rust-native link (deferred post self-host)
+-- ref/                 # Language/compiler upstream (Idris2, lean4, CompCert, rust)
+-- skills/              # Agent skill pack submodules (lean4-skills; not product)
+-- .agents/skills/      # Project skill discovery (symlinks into skills/)
+-- doc/                 # Goals, vocabulary, architecture, entry maps
+-- nix/                 # Pure Nix tooling modules (hygiene, progress, host/emit gates)
+-- script/              # Process glue only (optional git-hooks/pre-commit -> just check); no mills
+-- justfile             # thin orchestration: check | build (product wire; default: list)
+-- flake.nix            # Thin wire-up: checks / packages / devShell (no shell-farm apps)
+-- AGENTS.md            # Agent policy + skills + tree map + language inventory (SSoT)
+-- RESIDUAL.md          # Living open work
```

Full evolving map: [AGENTS.md](AGENTS.md). Product code never under `ref/` or `skills/`.
Language inventory and freestanding C git policy: [AGENTS.md](AGENTS.md) (**Three languages only**, single source of truth; do not fork a second inventory here). Terms: [doc/vocabulary.md](doc/vocabulary.md).
Forks: [doc/fork-idris.md](doc/fork-idris.md), [doc/fork-lean.md](doc/fork-lean.md). Coordinator: [doc/fork-coordinator.md](doc/fork-coordinator.md).
Agent residual loop (not a product map): [WATCHER.md](WATCHER.md).

## Tooling

Meters, hygiene, and host/emit gates are **pure Nix** under `nix/` (not project Python; no shell-farm flake apps). Thin `just` only orchestrates.

```bash
nix develop       # elan (Lean/Lake pin manager) + idris2 + just + rg + scc
just              # list
just check        # CI-identical full suite
just progress     # pure Nix meters -> doc/PROGRESS.md
just watch        # every 300s: progress-scc + hygiene (just loop)
just build        # product freestanding wire (emit + out/freestanding-c)
```

LLVM unit text recipes live in [just/README.md](just/README.md) (unlocked, not a full backend).

Lean elaborator pin is `leanprover/lean4:v4.34.1` (`src/systems/lean-toolchain`, `src/lean4/lean-toolchain`).
In the dev shell: `elan toolchain install "$(tr -d '[:space:]' < src/systems/lean-toolchain)"` once.
Workspace checks skip Lake when the pin is not installed (no surprise network download).

**Lake packages (internal ids):** root umbrella **Iso**, product host **SystemsLean** (`src/systems/`), dual-side **SystemsLeanLean4** (`src/lean4/`). Those three names are tooling only. How to build, offline pins, freestanding C vs classic Lake ahead-of-time C, and safe imports: [doc/lake-package.md](doc/lake-package.md).

Side residuals: `RESIDUAL-idris.md`, `RESIDUAL-lean.md`. Coordinator: `RESIDUAL.md`.
ASCII map: [doc/ascii-symbol-map.md](doc/ascii-symbol-map.md). Policy and language inventory: [AGENTS.md](AGENTS.md).

## License

- **Our work** (everything we commit outside `ref/` and `skills/`): [The Unlicense](UNLICENSE.md), public domain dedication. See [LICENSES.md](LICENSES.md).
- **Author:** Hunter "cryptoquick" Beast.
- **SPDX for our crates / modules / packages:** `Unlicense` (Cargo, Lake, Idris, Nix metadata, optional file headers). Details in [LICENSES.md](LICENSES.md).
- **Submodules under `ref/` and `skills/`:** keep their own licenses (Idris 2 BSD-style, Lean 4 Apache-2.0, CompCert non-commercial/AbsInt, Rust Apache-2.0 OR MIT, lean4-skills MIT, ...). Tracked in [LICENSES.md](LICENSES.md).

## Status

Active residual and living tip live in [doc/SESSION-HANDOFF.md](doc/SESSION-HANDOFF.md) and [RESIDUAL.md](RESIDUAL.md). Slake does not typecheck this package.
