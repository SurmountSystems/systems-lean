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
| Lean host (Lake package `SystemsLean`) | `SystemsLean/*.lean`, `lakefile.toml`, `lean-toolchain` |
| Module inventory + PARTIAL honesty | `host-partial-inventory.md` |
| Self-host acceptance / living claims | `self-host.md` |
| Freestanding C ownership (Lean vs template) | `emit/host-owned-emit.md` |
| Dual / JOIN-ALG map | `join-map.md` |
| Surface inventory prose | `surface-matrix.md` |
| Host emit SSOT fragments | `emit/host_emit_*.ssot.txt` |
| Generated product C (dogfood) | `emit/slake_freestanding.{c,h}` |
| Hosted behavioral probe (not product body) | `smoke/slake_behavioral_probe.c` |
| Release surface (copy of emit) | `../../out/freestanding-c/` |
| Process glue (optional Lake + build + cc) | `check.sh` |

Language inventory and freestanding C git policy SSoT: root `AGENTS.md`
(**Three languages only**). Product wire consumers: `out/freestanding-c/README.md`.

## Living tip

Freestanding product self-host **complete** and product residual **free** are
both **true** on the freestanding release path. Host still uses classic Lean
**Lake** (`DependsOnLake` / `StillUsesLake`). Bootstrap **S0+S1+S2+S3** done
(`FirstSurface`; `MultSubsetEmit`; `MultSubsetRebuild` /
`just mult-subset-rebuild`). Ideal ladder **M1** Linear subset emit + rebuild
done (`LinearSubsetEmit` / `just linear-subset-emit`; `LinearSubsetRebuild` /
`just linear-subset-rebuild`). **S4** Lake retire stays deferred (never forge
early). Free is not "Lake is gone," not proof complete, not PROVABLY, not LLVM.
Detail and claim pins: `self-host.md` + `doc/SESSION-HANDOFF.md`.

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
just build           # freestanding wire: emit + out/freestanding-c
just check           # full suite (includes build)
just first-surface   # bootstrap S1 Mult unit surface (Lake host)
just mult-subset-emit  # bootstrap S2 Mult subset freestanding package (Lake host)
just mult-subset-rebuild  # bootstrap S3 Mult subset self-application (Lake host)
just linear-subset-emit  # ideal M1 Linear subset freestanding package (Lake host)
just linear-subset-rebuild  # M1 Linear subset self-application (Lake host)
just systems-host    # pure Nix host presence
just systems-emit-wire  # pure Nix emit-wire / unit walk
./src/systems/check.sh  # optional Lake + build + probe (incomplete alone)
```

IR design sketch (not residual): `doc/shared-ir-sketch.md`.
