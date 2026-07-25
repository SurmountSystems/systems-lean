# Session handoff

Reseed after compaction or a new chat. Read in order with `AGENTS.md`.

---

## Role (separate sessions -- ask once if unclear)

| Session | How to reseed | Owns |
|---------|---------------|------|
| **Watcher** | Separate session; contract in root `WATCHER.md` | Auto-continue residual from `WATCHER_BEGIN` / `WATCHER_END` |
| **Systems / Slake** | Paste `doc/fork-systems.md` PROMPT | `src/systems/`, `RESIDUAL-systems.md` |
| **Idris side** | Paste `doc/fork-idris.md` PROMPT | `src/idris2/`, `RESIDUAL-idris.md` |
| **Lean side** | Paste `doc/fork-lean.md` PROMPT | `src/lean4/`, `RESIDUAL-lean.md` |
| **Coordinator** | `doc/fork-coordinator.md` | `RESIDUAL.md` join board, fork guidance |
| **Research** | Analysis under `doc/research/` | Inventory / correspondence notes only |

**Do not confuse:** the **watcher session** (reads `WATCHER.md`) is not the **Systems / Slake session**.
`just watch` is only a progress-meter loop (any session may run it).

If role is unclear after compaction: **ask once**. Do not assume coordinator or watcher.

**Status:** foundation + dual depth (algorithm ids ConsumeToken, ErasedIndex,
UnrestrictedShare) + IR sketch + systems skeleton + unit surface + compile path
+ **frozen** freestanding emit product wire (through emit body) +
**SYSTEMS_LEAN_HOST partial** (Lake + Mult..SelfHostBody under `src/systems/`;
37 host modules including EmitLinear + EmitErasure + SelfHostBody). Self-host body defined
(acceptance + gated emit path). Still **not residual free**. Progress meter
100% is evidence-weighted milestones, not freestanding residual free.

**Active product residual:** freestanding **Slake** bootstrap under
`src/systems/` (Lean host + freestanding emit). Living Open queue: **empty**
(done-for-now after **Host owns freestanding erasure C**). Done (archive):
**Host owns freestanding erasure C**; **Self-host body**;
**Dual algorithms into Slake** -- stated map `src/systems/join-map.md`;
`JoinMap.joinAlgUseOk` host use pins (ConsumeToken / ErasedIndex /
UnrestrictedShare); dual trees read-only; **Thin process glue** -- shell
ownership note in `src/systems/README.md`; compile-path stamp only (no static
greps); freestandingProductSelfHostComplete and residual free stay false.
Detail: **`RESIDUAL-systems.md`**. Join board: **`RESIDUAL.md`**. Watcher:
**`WATCHER.md`**. Plan: `.agents/plans/plan-unambiguous-residual-work.md`.
Still **not** residual free, **not** freestanding product self-host complete,
**not** PROVABLY, **not** proof complete; llvm deferred. Product wire / host
model jargon: `doc/vocabulary.md`.

**Next:** Open queue empty. Do not invent Open Names. Human names next residual
when ready. Do not forge residual free / proof complete / llvm unlock.

### Decisions and discovery (survive compaction)

Read this block after status. Detail lives in the linked paths -- do not re-derive
from chat.

| Topic | Decision / fact | Where documented |
|-------|-----------------|------------------|
| Goal | Systems Lean + Slake; freestanding runtimeless C primary product wire; isolation | `doc/goals.md`, this file North star |
| Open residual | Empty (done-for-now). Agents do **not** invent Open Names | `RESIDUAL-systems.md`, `WATCHER.md` |
| Host-owned freestanding C text | Mult, Linear/ConsumeToken, Erasure, EMIT_BODY dialect are Lean SSOT + FreestandingEmit embed; bulk Types/IR/compose/emit plan-apply still **template-owned** | `src/systems/emit/host-owned-emit.md` (**ownership SSoT**) |
| HOST-EMIT-ERASURE | Erasure on freestanding C is **mult-0 absence honesty** (`slake_erased` + mark / is_marked / is_runtime_absent) -- **not** a type system in C; not elaborator Types on the product wire | `EmitErasure.lean`, `host_emit_erasure.ssot.txt`, ownership map, README C emit bullets |
| Self-host body readiness | `selfHostBodyReady` folds `emitMultReady` && `emitLinearReady` && `emitErasureReady` + freestanding emit stage; complete/free stay false | `SelfHostBody.lean`, `self-host.md` |
| Dual ErasedIndex product cite | Freestanding path via **HOST-EMIT-ERASURE** (not "frozen wire only") | `join-map.md` |
| Process glue | Remaining novel shell is process glue only; static presence pure Nix; compile-path stamp only | `src/systems/README.md` Shell ownership |
| Still false | residual free; freestanding product self-host complete; proof complete; PROVABLY; llvm / CompCert seal | residual files, SelfApplyFs / LlvmHold / SpecProof |

**Systems reseed after compaction:** `RESIDUAL-systems.md` -> `src/systems/README.md` ->
`emit/host-owned-emit.md` -> `self-host.md` -> module headers. Gates:
`just systems-host`, `just systems-emit-wire`, `just hygiene`, `./src/systems/check.sh`.

---

## North star (one line)

**Systems Lean** is this project (language + freestanding systems goals). **Slake** is its compiler: meet-in-the-middle Idris 2 <-> Lean 4 (QTT + Curry-Howard), freestanding products to CompCert-oriented C and LLVM IR, Rust interop without classic FFI as the design bar -- work **here, in isolation**.

---

## Residual and progress

- Coordinator: `RESIDUAL.md`
- Forks: `RESIDUAL-idris.md`, `RESIDUAL-lean.md`, `RESIDUAL-systems.md`
- Meter: `doc/PROGRESS.md` via `just progress` (pure Nix under `nix/progress/`); `just watch` loops every 300s
- Hygiene: `just hygiene` (pure Nix ASCII under `nix/source-hygiene.nix` + professional-tone under `nix/professional-tone.nix` on novel `*.md`) -- not Python, not bash-in-Nix; focused tone gate: `just professional-tone`
- Host presence: `just systems-host` (pure Nix under `nix/systems-host-presence/`; live impure eval)
- Emit-wire presence: `just systems-emit-wire` (pure Nix under `nix/systems-emit-wire/`; live impure eval)
- Flake vs live: new `nix/` (and related flake paths) need **human** stage before `nix flake check` matches live `just` gates; stage paths from the flake error / `git status` (no fixed laundry list); agents never stage to silence WARN (see `AGENTS.md` Nix tooling + Git)
- Plan approval: full plan text in chat; freeform Approve / revise / abandon only -- no quiz UI
- Git: agents do not push local unpushed work-in-progress (WIP) unless the human asks; hands-off git otherwise
- Steering: `doc/fork-guidance-idris.md`, `doc/fork-guidance-lean.md`, `doc/fork-guidance-systems.md`

## Three languages only (reseed after compaction)

Novel work uses **only**:

1. **Idris 2** -- `src/idris2/`
2. **Lean 4** -- `src/lean4/` and `src/systems/` (Systems Lean / **Slake**)
3. **Pure Nix flakes** -- small modules under `nix/` (not bash-in-Nix, not kitchen-sink files; layout for large language model attention and compaction)

No project Python. Do not grow shell. Large residual `.sh` under `script/` and fat workspace `check.sh` bodies are **scheduled deletion** (pay down; plan `.agents/plans/plan-paydown-shell-c-surfaces.md`), not a template. Freestanding C under `out/` is **product wire** (emit output), not a source language for the project. Do not accumulate labeled debt when Lean/Nix ports are available.

Read `AGENTS.md` (**Three languages only** + **Nix tooling**) and `doc/vocabulary.md` before adding any tool or gate.

---

## Key paths

| Path | Why |
|------|-----|
| `AGENTS.md` | Agent policy + isolation + Nix tooling + **document slices for compaction** |
| `doc/goals.md` | Canonical goals |
| `doc/vocabulary.md` | Stable product terms + tooling terms |
| `doc/architecture.md` | Meet-in-middle sketch |
| `doc/divergence.md` | Honest differences / trusted computing base |
| `RESIDUAL.md` | Coordinator join board; Hold vs Open |
| `RESIDUAL-systems.md` | Systems / Slake living residual (Open Names + Done archive) |
| `WATCHER.md` | Next implement action only (fenced block) |
| `src/systems/emit/host-owned-emit.md` | **SSoT:** which freestanding C text Lean owns vs template |
| `src/systems/self-host.md` | Self-host acceptance + body path |
| `src/systems/host-partial-inventory.md` | Host module inventory + intentional PARTIAL |
| `nix/` | Pure flake tooling modules (hygiene, professional-tone, progress, systems-host-presence, systems-emit-wire, novel-source filter) |
| `flake.nix` | Thin flake wire-up only (not a shell-script dump) |
| `justfile` | Task runner: check / progress / hygiene / professional-tone / watch / build / emit |
| `ref/Idris2/` | Upstream Idris 2 (read-only) |
| `ref/lean4/` | Upstream Lean 4 (read-only) |
| `ref/CompCert/` | AbsInt CompCert (read-only; `ccomp` source) |
| `ref/rust/` | rustc layout/ABI + codegen_llvm (read-only) |
| `src/idris2/` `src/lean4/` `src/systems/` | Novel workspaces |
| `out/freestanding-c/` | Release freestanding ahead-of-time C (no managed runtime on the wire) |
| `script/` | Residual product build/emit shells only (scheduled deletion / process glue) |
| `.agents/plans/plan-paydown-shell-c-surfaces.md` | Approved shell/C paydown waves 0-E |
| `doc/idris-entry.md` | Idris map |
| `doc/lean-entry.md` | Lean map |
| `doc/compcert-entry.md` | CompCert map |
| `doc/rust-entry.md` | Rust layout / LLVM interop map |
| `.agents/plans/plan-iso-goals-and-agent-hygiene.md` | Approved plan + isolation amendment |

---

## Isolation (do not forget)

Do **not** go work residual in other trees by default. This repo is Systems Lean. Escalate off-repo only when the human says we are desperate for a specific solution.

---

## Why `ref/rust` and not `ref/llvm` alone

Rust **type layout and ABI** live in rustc. LLVM IR is the wire shape; layout-compatible interop needs rustc's rules. Nested LLVM under rust is optional and large -- do not recursive-init unless asked. See `doc/rust-entry.md`.

---

## Verify (foundation)

```bash
cd /home/hunter/Projects/ai/iso
test -f AGENTS.md && test -f README.md && test -f RESIDUAL.md
test -f doc/goals.md && test -f doc/vocabulary.md
test -f doc/architecture.md && test -f doc/divergence.md
test -f doc/SESSION-HANDOFF.md
test -f doc/idris-entry.md && test -f doc/lean-entry.md
test -f doc/compcert-entry.md && test -f doc/rust-entry.md
test -f doc/research/README.md
test -f doc/ascii-symbol-map.md
test -f flake.nix
test -f ref/Idris2/README.md && test -f ref/lean4/README.md
test -f ref/CompCert/README.md && test -f ref/rust/README.md
just check
```

Foundation only; held residual needs a claimed role. Policy SSoT: `AGENTS.md`.
