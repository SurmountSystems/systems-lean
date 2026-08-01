# src/systems/ -- freestanding Systems Lean (Slake host)

**Systems Lean** host and **Slake** compiler synthesis: Lean 4 with minimum
Quantitative Type Theory (QTT) multiplicities **0 / 1 / omega**, linear/affine
ownership, freestanding runtimeless C on the product wire.

**Fork residual:** `RESIDUAL-systems.md`. Paste prompt: `doc/fork-systems.md`.
Coordinator: `doc/fork-guidance-systems.md` (does not race this tree by default).

**Reseed (Systems):** residual + `doc/SESSION-HANDOFF.md` -> this short map ->
companions below. Do **not** dump residual Open/Done, B-ladder history, or
WATCHER implement prompts into this file (policy: root `AGENTS.md`
**Documentation hygiene**).

## What lives here

| Role | Path |
|------|------|
| Lean host (Lake package `SystemsLean`) | `SystemsLean/*.lean`, `lakefile.lean`, `lean-toolchain`, empty `lake-manifest.json` |
| Module inventory + PARTIAL honesty | `host-partial-inventory.md` |
| Self-host acceptance / living claims | `self-host.md` |
| Freestanding C ownership (Lean vs template) | `emit/host-owned-emit.md` |
| Dual / JOIN-ALG map | `join-map.md` |
| Surface inventory prose | `surface-matrix.md` |
| Host emit SSOT fragments | `emit/host_emit_*.ssot.txt` |
| Generated product C (dogfood) | `emit/slake_freestanding.{c,h}` |
| Hosted behavioral probe (not product body) | `smoke/slake_behavioral_probe.c` |
| Release surface (copy of emit) | `../../out/freestanding-c/` |
| Process glue (optional Lake + cc probe) | root just: `systems-lake`, `systems-cc-probe` |

Language inventory and freestanding C git policy SSoT: root `AGENTS.md`
(**Three languages only**). Product wire consumers: `out/freestanding-c/README.md`.

**Lake package:** config is `lakefile.lean` (not TOML). Offline empty
`lake-manifest.json` (`packages = []`). No mathlib / no remote deps. Host
elaborator only -- not freestanding residual free and not product C.

## Living tip

Freestanding product self-host **complete** and product residual **free** are
both **true** on the freestanding release path. Product path
`DependsOnLake` / `StillUsesLake` are **false** after M6 phase 2 (lake
elaborator proof). Host elaborator residual **remains** (classic Lake may still
elaborate SystemsLean for development; free is not host free). Bootstrap
**S0-S3** + ideal ladder **M1-M6** product path **done** (including M6 product
Lake pins flip). FreestandingDriverComplete **true** (Mult-orthogonal). Step 4
PROVABLY/LLVM **held**. Free is not "Lake is gone," not proof complete, not
PROVABLY, not LLVM. Detail and claim pins: `self-host.md` +
`doc/SESSION-HANDOFF.md`.

## Product bar

- **No** runtime garbage collection (GC) on the freestanding product wire.
- **No** Lean managed runtime on that wire (ahead-of-time classic Lean != freestanding).
- Multiplicities: only **MULT-0 / MULT-1 / MULT-OMEGA** -- no multiplicity zoo.
- Default: **no reference counting (RC)** on freestanding product paths. If RC
  appears, prove it unavoidable next to the use; residual must name the hole.

## Product wire (generated only)

Stage **SLAKE_EMIT_FREESTANDING_C_V0**: Lean `SystemsLean.FreestandingEmit` writes
`emit/slake_freestanding.{c,h}`; `just build` installs under `out/freestanding-c/`.
Do **not** hand-author product C. Ownership map: `emit/host-owned-emit.md`.

Map-only frozen wire stage labels (not a residual ladder to grow):
`HOST_COMPOSE_V0`, `EMIT_PLAN_V0`, `EMIT_APPLY_V0`, `EMIT_BODY_V0` (plus earlier
unit/program/graph labels documented in emit headers and pure Nix presence).

## Commands

```bash
just build           # freestanding wire: emit + out/freestanding-c (M4 Name C: no lake hot path)
just check           # full suite (includes build)
just first-surface   # bootstrap S1 Mult unit surface (Lake host)
just mult-subset-emit  # bootstrap S2 Mult subset freestanding package (Lake host)
just mult-subset-rebuild  # bootstrap S3 Mult subset self-application (Lake host)
just mult-subset-rebuild-without-lake  # M2 Mult measured re-emit (prebuilt; no lake hot path)
just freestanding-capable-regenerate-without-lake  # M4 Name A product-wire measured regenerate (prebuilt)
just product-wire-freestanding-write  # M4 Name B Path A host-cc freestanding WRITE+INSTALL
just mult-subset-freestanding-deepen  # M2 Name B greps: freestanding Mult surface dual-check
just mult-subset-freestanding-write  # M2 Name B full: Path A host-cc Mult package write (no lake hot path)
just linear-subset-emit  # ideal M1 Linear subset freestanding package (Lake host)
just linear-subset-rebuild  # M1 Linear subset self-application (Lake host)
just types-subset-emit  # ideal M1 Types subset freestanding package (Lake host)
just types-subset-rebuild  # M1 Types subset self-application (Lake host)
just program-subset-emit  # ideal M1 Program subset freestanding package (Lake host)
just program-subset-rebuild  # M1 Program subset self-application (Lake host)
just extract-subset-emit  # ideal M1 Extract subset freestanding package (Lake host)
just extract-subset-rebuild  # M1 Extract subset self-application (Lake host)
just erasure-subset-emit  # ideal M1 Erasure subset freestanding package (Lake host)
just erasure-subset-rebuild  # M1 Erasure subset self-application (Lake host)
just graph-subset-emit  # ideal M1 Graph subset freestanding package (Lake host)
just graph-subset-rebuild  # M1 Graph subset self-application (Lake host)
just compose-subset-emit  # ideal M1 Compose subset freestanding package (Lake host)
just compose-subset-rebuild  # M1 Compose subset self-application (Lake host)
just subset-packages-rebuild-join  # M5 Name A multi-unit Mult..Compose package rebuild join
just front-mult-package  # M5 Name B SubsetFront G1 accept then Mult package write
just systems-host    # pure Nix host presence
just systems-emit-wire  # pure Nix emit-wire / unit walk
just systems-lake    # optional host lake build (skip if pin missing)
just systems-cc-probe  # freestanding-first cc + behavioral probe (after build)
```

IR design sketch (not residual): `doc/shared-ir-sketch.md`.
