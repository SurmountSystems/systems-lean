# Vocabulary

Stable terms for **Systems Lean**. Prefer plain English. Do not invent fashion names, wave codes, or ephemeral labels as permanent product language.

**Agents:** natural precise prose; avoid jargon soup; expand short forms on use (see `AGENTS.md` -- Language).

**Systems Lean** is the **project name** and the **language** (see below).
**Slake**, in this repository, means the **compiler** unless explicitly qualified.

---

## Product terms

| Term | Meaning |
|------|---------|
| **Systems Lean** | **This project.** Also the language: Lean 4 with linear/affine ownership and QTT multiplicities **0 / 1 / omega**, aimed at freestanding systems products. Implemented **in this repository**, in isolation |
| **Slake** | The **compiler** product of Systems Lean: usable superset surface of Idris 2 and Lean 4 cores; freestanding backends |
| **Meet-in-the-middle** | Build correspondence from Idris 2 and Lean 4 toward a shared core, then consummate it in the Slake compiler -- not a third mystery language full of brands |
| **Idris side / Lean side** | The two ends of the bridge: novel work under `src/idris2/` and `src/lean4/`. Prefer this wording; do not say "pole" |
| **Curry-Howard** | Programs and proofs inhabit a typed universe; extract makes that correspondence pay rent as systems software. Extract correctness remains a separate claim |
| **QTT** | Quantitative Type Theory: binder multiplicities **0** (erased), **1** (use once), **omega** (unrestricted) |
| **Linear / affine** | Exact-once or at-most-once resource discipline on product-relevant values |
| **Freestanding** | Closed subset + fail-closed codegen + **no** managed Lean object runtime on the product wire (see **wire** below) |
| **Host** | Full Lean-style toolchain (tactics, proofs, managed runtime) used for proofs and tooling only |
| **Wire / product wire** | The freestanding C **dialect** Slake emits for consumers. **Out-first:** the named **product / release surface** is `out/freestanding-c/`; `src/systems/emit/` is the **host freestanding workspace** (SSOT + templates + generator dogfood), not a peer product home. Not electrical jargon; not "network wire." When we say contracts on the wire, we mean the emitted product, not the host elaborator. Distinct from **flake wire-up** (connecting Nix modules in `flake.nix`) |
| **Out (release) / product Out** | Consumer install surface under `out/freestanding-c/` (generated freestanding C + consumer README). Prefer this path in residual evidence and publish (subtree / tarball). Distinct from residual emit stage **Out** (Body / `EMIT_BODY_V0`) |
| **Host freestanding workspace** | `src/systems/emit/`: durable `host_emit_*.ssot.txt`, templates, and generator-written dogfood `slake_freestanding.{h,c}`. FreestandingEmit writes here only; `just build` copies to product Out |
| **Model (host / formal)** | A **structural or formal representation** of grades, IR, checks, or contracts in Lean (or in docs). **Not** a machine-learning or AI model. Prefer "host representation," "contract surface," or "structural model" when ambiguity is possible |
| **Dual residual honesty** | Product residual and host elaborator residual are independent; never forge either; never conflate them. Living tip: product residual free may be **true** while host elaborator residual **remains** (Lake still elaborates Systems Lean) |
| **Product residual free (claim A)** | Freestanding release under `out/freestanding-c` has no managed Lean / GC residual **and** DualResidual / wire honesty agree residual is gone. Not host elaborator free; not proof complete; not PROVABLY; not LLVM unlock |
| **Freestanding product self-host complete (claim B)** | Writer-path self-host evidence bar closed (Full / ownership / perform / dual-eq write). Not residual free alone; not Lake gone |
| **Bootstrap (Slake)** | Grow Slake from Lake-hosted host foundation toward freestanding self-application. Missing freestanding binary is **start**, not a blocker |
| **Bootstrap S0** | Host foundation: Lake elaborates Systems Lean; product residual free; claim B writer path true. **Done** as of 2026-08-01 |
| **Bootstrap S1** | First named Slake compiler surface: defined tiny input (Mult unit), checkable translate/check path -- not only regenerate freestanding C API dialect. **Done** (`FirstSurface` / `just first-surface`) |
| **Bootstrap S2** | Slake emits freestanding C (or unit package) for that subset with residual free still honest. **Done** (`MultSubsetEmit` / `just mult-subset-emit`) |
| **Bootstrap S3** | Measured rebuild / self-application of named freestanding Mult subset (Lake-hosted bar). **Done** (`MultSubsetRebuild` / `just mult-subset-rebuild`) |
| **Mult without-Lake (M2 Name A)** | Measured Mult package re-emit without `lake` on the hot path via prebuilt Mult rebuild binary. **Done** (`just mult-subset-rebuild-without-lake`; product StillUsesLake remains until M6) |
| **Product-wire without-Lake (M4 Name A)** | Measured freestanding product-wire regenerate (READ+COMPOSE+WRITE-HC+INSTALL) without `lake` on the hot path via prebuilt CapableRegenerate binary. **Done** (`just freestanding-capable-regenerate-without-lake`; product StillUsesLake remains until M6) |
| **Product-wire freestanding writer (M4 Name B)** | Measured freestanding dialect dual-eq WRITE + INSTALL via Lean-native ProductWireWriteTool / CapableRegenerate (`freestandingCapableWriteFreestandingHc` + Install Out; P1 host-cc C print from Lean retired). **Done** (`just product-wire-freestanding-write`; `productWireFsWriterFinishedClaimed` true; freestandingDriverComplete Mult-orthogonal; product StillUsesLake remains until M6) |
| **Official build without-Lake (M4 Name C)** | Official `just build` product freestanding wire path without `lake` on the hot path: prefer Name B host-cc writer, else Name A prebuilt regenerate; fail closed if both missing. **Done** (product StillUsesLake remains until M6; free/complete unchanged) |
| **Mult freestanding surface dual-check (M2 Name B greps)** | Mult unit package dialect dual-checked (greps + Lean pins) against freestanding Mult product surface without lake or Mult rebuild prebuilt as measured greps driver. **Done** (`MultFsDeepen` / `just mult-subset-freestanding-deepen`; freestandingDeepenPartial true) |
| **MultSubsetEmit freestanding Mult SSOT write path (host)** | Mult unit package write via MultSubsetEmit freestanding Mult SSOT; Mult rebuild ELF not the package writer. **Host path done** (`multFsWritePathReady` true; product StillUsesLake remains until M6) |
| **Name B full freestanding Mult write (M2)** | Measured Mult package re-emit uses Lean-native MultSubsetEmit / MultFsWriteTool (`IO.FS.writeFile`; P1 host-cc C print from Lean retired), not Mult rebuild ELF. **Done** (`just mult-subset-freestanding-write`; freestandingDriverComplete true; multFsDeepenDriverReady true; product StillUsesLake remains until M6) |
| **Ideal M1 Linear rebuild** | Measured rebuild / self-application of Linear unit package under Lake (parallel Mult S3). **Done** (`LinearSubsetRebuild` / `just linear-subset-rebuild`). Without-Lake finished deepen still later |
| **Ideal M1 Types emit** | Host-built Types unit freestanding package under Lake. **Done** (`TypesSubsetEmit` / `just types-subset-emit`) |
| **Ideal M1 Types rebuild** | Measured rebuild / self-application of Types unit package under Lake. **Done** (`TypesSubsetRebuild` / `just types-subset-rebuild`). Without-Lake finished deepen still later |
| **Bootstrap S4** | Retire Lake from product path: DependsOnLake / StillUsesLake false only with elaborator proof -- never forge early. **Deferred** after S3 |
| **First compiler surface** | S1 product name: short modules prefer `FirstSurface` / `SlakeCompile`; not kitchen-sink ProductPath* basenames |
| **CompCert path** | Emit C suitable for CompCert (`ccomp`) when PROVABLY is earned with a real resolved compiler |
| **LLVM path** | Emit LLVM IR for efficient embed and Rust-ecosystem interop |
| **Rust without classic FFI** | **Measured happy path (completeness C1 end announce):** for Mult through Graph layout and the foreign dual-map consumer path we document, you do **not** need classic foreign-function interface (FFI) ceremony as the happy path. Evidence: Mult..Graph foreign band-local success + `rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed` + `just rust-ir-interop-partial` / `just rust-ir-interop-full`. Dual map is **measured under named bars** (partial + multi-band full true): size/align parity and band-local foreign success for Mult..Graph i32 contracts. **Not** a full isomorphism of Systems Lean with all of Rust; **not** "no FFI ever"; **not** formalized all of rustc; **not** tip fullBackend synonym; **not** product Rust under `src/`. Classic freestanding **C** product wire (`out/freestanding-c/`) remains a permanent valid emit path |
| **ref/** | Read-only **language/compiler** upstream submodules (`ref/Idris2`, `ref/lean4`, `ref/CompCert`, `ref/rust`) -- not product source |
| **skills/** | Read-only **agent skill pack** submodules (e.g. `skills/lean4-skills`) -- not product source; not under `ref/` |
| **Project skill / `.agents/skills/`** | Discovery root hosts walk for project-local skills. Symlinks into `skills/<pack>/...`. Policy and **when to use** map: `AGENTS.md` (**Project agent skills**). Example: `lean4` skill for prove/formalize/review on host Lean residual -- not for inventing residual, Nix mills, or hand-authored freestanding C |
| **CompCert / ccomp** | Verified C compiler reference; product C path may target it; PROVABLY only with real resolved evidence |
| **Rust layout reference** | `ref/rust` (rustc_abi / codegen) defines layout-compatible interop; LLVM IR alone is not enough |
| **iso / Iso** | **Internal only.** Historical checkout-directory nickname from when this tree first started, and the root Lake umbrella package id. Not the project name. Prefer **Systems Lean** in prose |
| **SystemsLean** | **Internal** Lake package id for the host under `src/systems/`. Not a second language name. Prose: **Systems Lean** / **Slake** |
| **SystemsLeanLean4** | **Internal** Lake package id for classic Lean dual examples under `src/lean4/`. Not a product name |
| **src/idris2/** | Novel Idris-side workspace (isomorphism); not `ref/Idris2` |
| **src/lean4/** | Novel Lean-side workspace; not `ref/lean4` |
| **src/systems/** | Freestanding Systems Lean + Slake host; min 0/1/omega; no product GC (garbage collection) |
| **out/freestanding-c/** | Runtimeless freestanding product C for external consumers. Tracked files are **generator outputs** (not hand-authored). Prefer **subtree release** (or tarball) after green build + emit + check |
| **out/llvm-ir/** | LLVM IR surface for layout-compatible Rust-ecosystem interop. Unlocked with Mult..Graph unit/compose/SSA partial + foreign dual map + progressive CFG path B. Happy path for Mult..Graph layout / foreign dual map does **not** require classic FFI ceremony (see **Rust without classic FFI**). Not full production opt / machine-code backend alone; freestanding C remains primary product wire |
| **RC necessity** | Freestanding RC (reference counting) only if proven unavoidable vs linear/affine/arena design |
| **Host-owned freestanding emit** | Lean modules + durable `emit/host_emit_*.ssot.txt` own selected freestanding C product text; `FreestandingEmit` embeds into templates. Ownership map SSoT: `src/systems/emit/host-owned-emit.md`. Stage ids `HOST-EMIT-*` only -- do not mint residual C ladders (`EMIT_MULT_V0`, `EMIT_ERASURE_V0`, ...) as freestanding residual progress |
| **HOST-EMIT-ERASURE** | Host-owned mult-0 **absence honesty** on freestanding C (`slake_erased` + mark / is_marked / is_runtime_absent). **Not** elaborator types or a type system written in C. Pair: `EmitErasure.lean` + `host_emit_erasure.ssot.txt` |
| **Out** (emit stage residual name) | Residual / plan short name for the last Mult..* freestanding emit stage (CAP-256 buffer scaffolding after Plan/Apply). Maps to frozen product wire **`EMIT_BODY_V0`** / host `EmitBody` / HOST-EMIT-BODY -- **not** the whole product and **not** product Out (release). Distinct from **Out (release)**. Not residual schema **Out of scope**. Detail: `emit/host-owned-emit.md` naming map |
| **Out stage vs product Out** | **Out stage** = emit residual name for Body/`EMIT_BODY_V0`. **Product Out** = release under `out/freestanding-c/`. Do not mash these |
| **Defined freestanding compile step** | Host pin that Mult..Out host-owned emit readiness + freestanding emit stage path exist and are gated (`SelfHostBody` / `selfHostBodyReady` historically). Prefer this prose over bare "self-host body." **Not** freestanding product self-host complete (claim B) |
| **Self-host step readiness** | Same as defined freestanding compile step: readiness fold only. Complete and residual free are separate claim bars (both may be true while Lake host remains) |
| **MULT-0 / erased** | Quantitative Type Theory (QTT) grade 0: compile-time only; no runtime payload. Product wire may carry a zero-payload **marker** that claims runtime absence after mark -- that is erasure honesty, not "types live in freestanding C" |
| **Open Name** | Living residual work item title in `RESIDUAL-systems.md` (plain English, 2-6 words). Agents do not invent Open Names when neither Open nor a durable plan names a checkable next residual. Clear plan defaults **are** residual work: open the planned Name (do not park waiting for a human "Open") |
| **Compile-path bench** | Wall-clock comparison via `just bench` (living report `doc/BENCH-latest.md`): Systems Lean freestanding product path vs classic Lake host elaborate. **Not** PROVABLY and **not** runtime-fastest-C. CompCert PROVABLY stays a correctness seal, not a speed claim. |

---

## Three languages only (novel work)

Full policy: `AGENTS.md` section **Three languages only**.

| Language | Where | For |
|----------|-------|-----|
| **Idris 2** | `src/idris2/` | Idris-side bridge work |
| **Lean 4** | `src/lean4/`, `src/systems/` | Lean-side bridge + Systems Lean / Slake product |
| **Nix (flakes)** | `nix/`, thin `flake.nix` | Pure project tooling (gates, meters, checks) |

**Not novel implementation languages:** Python; shell/bash (except scheduled deletion or thin process glue); bash/shell/Python embedded inside Nix; freestanding C (that is **emit output** / product wire, not a source language for the project); Markdown (prose only).

**justfile:** thin task runner only -- orchestration, not a fourth product language.

**Non-product surfaces:** shell, emit C, behavioral-test C, Lake config, CI YAML, host emit SSOT text, and similar may appear in `scc` counts. Classify as **scheduled deletion**, **permanent role** (product wire / behavioral tests / process glue), tool config, or prose -- not a fourth product language. Inventory SSoT: `AGENTS.md` (**Pay down, do not accumulate** + **Scheduled deletion** + **Permanent roles**).

---

## Tooling terms (repo infrastructure -- not product language)

Policy and mistake history: `AGENTS.md` (Three languages only + Nix tooling).

| Term | Meaning |
|------|---------|
| **Nix** | Language for reproducible builds and pure project tooling in this repo |
| **Flake** | Nix project entrypoint (`flake.nix` + lock); exports named checks, packages, shells |
| **Pure Nix tooling** | Tool logic as Nix that evaluates to a result (text, pass/fail). Not a shell or Python program living inside the flake |
| **Bash-in-Nix** (also shell-in-Nix, Python-in-Nix) | Anti-pattern: long scripts embedded via `writeShellApplication` / `runCommand` (or similar), sold as flake tooling. Forbidden |
| **Project Python** | Anti-pattern: novel `*.py` in this repo. Forbidden |
| **Scheduled deletion** | A removable surface (usually large shell) with an owner language and exit criterion. Must leave the tree or shrink to process glue. Plan: `.agents/plans/plan-paydown-shell-c-surfaces.md`. Inventory: `AGENTS.md` |
| **Process glue** | Thin orchestration that must invoke external binaries (`lake`, `cc`, `just` hooks). Not algorithms. Keep tiny |
| **Behavioral tests** | Hosted product-contract C under `src/systems/smoke/` (e.g. `slake_behavioral_probe.c`). Not freestanding product source and not residual "progress" to grow. Prefer role name over "smoke debt" |
| **Emit SSOT / host emit SSOT fragment** | Lean-owned plain-text fragments under `src/systems/emit/host_emit_*.ssot.txt` (and matching Lean modules) that define emit dialect/product C text. Bash emit driver (while it exists) is **NON-SSOT**: it must embed these, not invent a second dialect |
| **Subtree release surface** (freestanding subtree release) | Publish `out/freestanding-c/` to consumers via **git subtree** (or tarball) after green `just build` + `just check`. Tracked C there is generator output, not hand-authored product. See `out/freestanding-c/README.md` and `AGENTS.md` freestanding / ahead-of-time (AOT) C git policy |
| **Non-product surface** | Any scc-visible language path that is not Idris / Lean / pure Nix novel work: scheduled deletion, permanent role, tool config, or prose. Full table: `AGENTS.md` |
| **just / justfile** | Thin task runner (`just check`, `just progress`). Orchestration only |
| **Orchestration** | Gluing steps: write `doc/PROGRESS.md`, sleep between watch cycles, invoke remaining process-glue scripts |
| **elan** | Lean toolchain manager in the flake **devShell**. Install the pin from `src/systems/lean-toolchain` / `src/lean4/lean-toolchain` (`leanprover/lean4:v4.32.0`). Do not default to lagged `pkgs.lean4` as the elaborator. Workspace checks skip Lake when the pin is not installed (no surprise network download). |
| **Lake (bootstrap elaborator)** | Classic Lean **Lake** package tool. On the **product path**, Lake is already not required on the normal freestanding step (product StillUsesLake / DependsOnLake false with proof). On the **host path**, Lake still elaborates Systems Lean under `src/systems/` for day-to-day develop until Slake owns those jobs. Claim-flip recipes may require lake on PATH as **host verification during bootstrap**. Product goal remains freestanding Slake + runtimeless C (`out/freestanding-c`). Policy: `AGENTS.md` (Product Lean edits and claim-bool proof). |
| **Peer elaborator (historical Mult-first path)** | Earlier residual program (`plan-peer-elaborator.md`) that built small host checkers and package writers for Mult, then Linear, Types, Program, Graph, and Compose, plus recipes that run those steps without calling Lake. **Foundation only.** Not the same as "Slake does everything Lake does for this package." Do not sell six-unit dual success as host free. |
| **Slake does Lake's host jobs (finish line)** | Slake owns every job Lake does today for Systems Lean host develop under `src/systems/`: load the package, follow imports, elaborate and check modules (including theorems), and build the host tools we currently build with Lake. Living program: `.agents/plans/plan-slake-replaces-lake.md`. Distinct from freestanding product free and from product path without Lake. |
| **Host develop free of Lake (checklist)** | Day-to-day host develop for the full SystemsLean package no longer needs Lake for the stated checklist. Default scope: **full host develop** (retire cold full `lake build` from day-to-day develop), not Mult..Compose six units only. Theorem modules are in the long checklist unless a later written carve-out says otherwise. "Lake binary never exists on disk" is **not** the slogan -- free means day-to-day develop no longer needs Lake for that checklist. |
| **Six-unit Mult..Compose foundation** | HostFront / HostCheck / HostGraph / HostPackageWrite path covering Mult, Linear, Types, Program, Graph, and Compose units. Measured regression harness and early elaborator foundation. **Not** the host finish line. |
| **idris2 (devShell)** | Idris 2 elaborator package in the flake **devShell** for bridge-side checks. `just idris-elaborate` skips when the binary is absent. |
| **ripgrep (`rg`)** | Default code search in the flake **devShell**. Agents and humans search with `rg`. Pure Nix checks must not shell out to ripgrep for policy algorithms. |
| **Source hygiene** | Gate: novel text ASCII-clean (allowlist exceptions), no trailing whitespace. Pure Nix: `nix/source-hygiene.nix` |
| **Professional tone** | Gate: novel `*.md` only (v1) -- short banned-token list (profanity / demeaning slurs); case-insensitive whole-token match. Pure Nix: `nix/professional-tone.nix`. Live `just professional-tone` or folded into `just hygiene`; flake check `professional-tone` after human stages. Does not scan Lean / C / shell in v1. Keep the concrete token list out of markdown so the glossary does not self-fail. |
| **Progress meters** | Evidence-weighted report `doc/PROGRESS.md` from pure Nix `nix/progress/` |
| **Novel source** | Our editable tree -- excludes upstream `ref/`, agent skill submodules `skills/`, git metadata, caches |
| **scc** | External line-count tool for optional appendix (`just progress-scc`). Honest novel counts exclude `ref/`, `skills/`, `.lake/`, `.cache/` (and `.git/`) so classic Lean ahead-of-time intermediate representation and vendored skill packs do not inflate freestanding C |
| **LLM-friendly modules** | Small, single-concern files with stable names so large language model agents stay within attention limits after compaction |

---

## Three runtime stories (never conflate)

| Path | What is still in the trust base |
|------|----------------------------------|
| Idris **RefC** | Generated C **plus** a reference-counting runtime |
| Classic Lean **AOT** | Native code that still expects the managed Lean runtime |
| **Freestanding** (Systems Lean product goal) | **No** Lean managed runtime on the product wire; product residual free may be claimed while host tools still use classic Lake elaborator residual |

---

## Naming hygiene

### Ephemeral (plans, research, chat only)

- Wave numbers, session labels, plan phase ids (`plan:draft`, `impl:...`)
- `REQ-*` matrix tokens, temporary branch nicknames
- Fashion code names for "the next residual pack"

### Stable (source, permanent docs, CLI)

- Module paths, gate names, greppable honesty tokens
- **Systems Lean**, **Slake**, **freestanding**, **QTT**, submodule paths
- Upstream symbols when citing refs (`Core.TT`, Lean kernel names)

### Slake disambiguation

Elsewhere, "Slake" has also been used for a **Lake twin build driver**. That usage is **out of scope** for this repository.

| Phrase | Meaning here |
|--------|----------------|
| **Slake** | The Systems Lean **compiler** (default) |
| **Lake twin / build driver** | Not this project's product; do not divert residual work to that story |

---

## Isolation

Work on **Systems Lean** and **Slake** **in this repository**, against `ref/*` as read-only references.

Do **not** treat other trees as the default workplace for Systems Lean residual unless the human is **absolutely desperate** for a specific solution and says so. Isolation is the default. This repo **is** the project.

## Encoding

This file may use Unicode. Most other novel paths must be ASCII (map: `doc/ascii-symbol-map.md`). See `AGENTS.md`.

| Prefer full phrase | Avoid bare short form |
|--------------------|------------------------|
| trusted computing base | TCB |
| Quantitative Type Theory | QTT without expansion on first use |
| garbage collection | GC without expansion on first use |
