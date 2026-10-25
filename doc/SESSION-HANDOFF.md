# Session handoff

Reseed after compaction or a new chat. Read in order with `AGENTS.md`.
Living leftover lives in `RESIDUAL-systems.md` Open. Do not write `WATCHER.md`.

## Status

Systems Lean / Slake. Living leftover is **Lean 4.35 leftover** in
`RESIDUAL-systems.md` Open. Independently reviewed ELF
`/nix/store/97p32bdbdw6v79yxydi1y4s4s39ksp8j-slake-bootstrap`
(149467016 bytes). Lean 4.35, linear types, Idris 2, Slake compiling Slake,
and a later Mathlib test (OBJECTIVE spelling Matlib) remain leftover-not-done.
Do not claim Slake-from-Slake done. Do not mint a dest.

Held false: slakeOwnsPackageTypecheck stays false. FullHost stays false.
Occupancy stays 49. Mills 55 through 69 stay built. HostKernel.lean 779 closed.

The gate `nix/lean-string-slice-copy` exists and still fail-closes a
Slice-without-`.copy` miss. Edmonton owns that eval. Do not re-eval.

`WATCHER.md` is absent. Do not recreate it. Repeated miss: append instead of
replace.

## Next

Keep the remembered destination as leftover-not-done. Point at residual Open
and `/home/hunter/.agents/reports/remaining-2026-10-17-prove-honesty.md`.
Do not emit a next implement prompt.

## Decisions and discovery

| Decision | Status |
|----------|--------|
| Living leftover | Lean 4.35 leftover, not done. Do not mint a dest |
| Independently reviewed ELF | `/nix/store/97p32bdbdw6v79yxydi1y4s4s39ksp8j-slake-bootstrap` (149467016 bytes) |
| Slice-without-copy gate | `nix/lean-string-slice-copy` exists. Edmonton owns the eval |
| WATCHER.md | deleted. Living leftover is residual Open |
| Dual clocks | specimen keep versus standing Lean 4 10.0 days / 40.0m and mathlib 5.0 days / 20.0m; do not add those clocks |
| Occupancy / mills / FullHost | occupancy 49; mills 55 through 69; FullHost false |

## Role (separate sessions. Ask once if unclear)

| Session | How to reseed | Owns |
|---------|---------------|------|
| **Systems / Slake** | Paste `doc/fork-systems.md` PROMPT | `src/systems/`, `RESIDUAL-systems.md` |
| **Idris side** | Paste `doc/fork-idris.md` PROMPT | `src/idris2/`, `RESIDUAL-idris.md` |
| **Lean side** | Paste `doc/fork-lean.md` PROMPT | `src/lean4/`, `RESIDUAL-lean.md` |
| **Coordinator** | `doc/fork-coordinator.md` | `RESIDUAL.md` join board, fork guidance |
| **Research** | Analysis under `doc/research/` | Inventory / correspondence notes only |

The watcher session that auto-continued from a root watcher file is retired.
If role is unclear after compaction: **ask once**.

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

No project Python. Do not grow shell. Novel workspace `check.sh` **deleted** (process glue is just elaborator/cc recipes + optional pre-commit). Plan `.agents/plans/plan-paydown-shell-c-surfaces.md`. Freestanding C under `out/` is **product wire** (emit output), not a source language for the project. Do not accumulate labeled debt when Lean/Nix ports are available.

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
| `RESIDUAL-systems.md` Open | Living leftover (do not write `WATCHER.md`) |
| `doc/compiler-map.md` | Living compiler map (not root `TECH.md`, which is host persist) |
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
| `.agents/plans/plan-close-six-claims.md` | **Product program:** six claims A-F, tracks, lean4 skill, first Types slice |
| `.agents/plans/plan-unambiguous-residual-work.md` | Residual schema (plain Names, short loops) |
| `.agents/plans/plan-paydown-shell-c-surfaces.md` | Shell/C paydown waves 0-E (largely met) |
| `doc/idris-entry.md` | Idris map |
| `doc/lean-entry.md` | Lean map (+ lean4 skill pointer) |
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
