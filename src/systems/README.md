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
| Process glue (optional Lake + cc probe) | root just: `systems-lake`, `systems-cc-probe` |

Language inventory and freestanding C git policy SSoT: root `AGENTS.md`
(**Three languages only**). Product wire consumers: `out/freestanding-c/README.md`.

## Living tip

Freestanding product self-host **complete** and product residual **free** are
both **true** on the freestanding release path. Host still uses classic Lean
**Lake** (`DependsOnLake` / `StillUsesLake`). Bootstrap **S0+S1+S2+S3** done
(`FirstSurface`; `MultSubsetEmit`; `MultSubsetRebuild` /
`just mult-subset-rebuild`). Ideal ladder **M1** Linear subset emit + rebuild
done (`LinearSubsetEmit` / `just linear-subset-emit`; `LinearSubsetRebuild` /
`just linear-subset-rebuild`). Ideal ladder **M1** Types subset emit + rebuild
done (`TypesSubsetEmit` / `just types-subset-emit`; `TypesSubsetRebuild` /
`just types-subset-rebuild`). Ideal ladder **M1** Program subset emit + rebuild
done (`ProgramSubsetEmit` / `just program-subset-emit`; `ProgramSubsetRebuild` /
`just program-subset-rebuild`). Ideal ladder **M1** Extract subset emit + rebuild
done (`ExtractSubsetEmit` / `just extract-subset-emit`; `ExtractSubsetRebuild` /
`just extract-subset-rebuild`). Ideal ladder **M1** Erasure subset emit + rebuild
done (`ErasureSubsetEmit` / `just erasure-subset-emit`; `ErasureSubsetRebuild` /
`just erasure-subset-rebuild`). Ideal ladder **M1** Graph subset emit + rebuild
done (`GraphSubsetEmit` / `just graph-subset-emit`; `GraphSubsetRebuild` /
`just graph-subset-rebuild`). Ideal ladder **M1** Compose subset emit + rebuild
done (`ComposeSubsetEmit` / `just compose-subset-emit`; `ComposeSubsetRebuild` /
`just compose-subset-rebuild`). M1 unit surfaces
(Linear/Types/Program/Extract/Erasure/Graph/Compose emit+rebuild) **done**.
Open next: ideal **M3** (front-end over defined subset language; design then
implement). M2 Name B full freestanding Mult write **done** (Path A host-cc
`slake-mult-fs-write-cc`; `freestandingDriverComplete` **true**; product Lake
remains). Mult without-Lake **prebuilt driver** (M2 Name A) done
(`just mult-subset-rebuild-without-lake`). Host MultSubsetEmit **Mult SSOT
write path** done (`multFsWritePathReady` true). Surface dual-check greps:
`just mult-subset-freestanding-deepen`. Measured Mult package write:
`just mult-subset-freestanding-write`.
**S4** Lake retire stays deferred (never forge early). Free is not "Lake is
gone," not proof complete, not PROVABLY, not LLVM. Detail and claim pins:
`self-host.md` + `doc/SESSION-HANDOFF.md`.

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
just mult-subset-rebuild-without-lake  # M2 Mult measured re-emit (prebuilt; no lake hot path)
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
just systems-host    # pure Nix host presence
just systems-emit-wire  # pure Nix emit-wire / unit walk
just systems-lake    # optional host lake build (skip if pin missing)
just systems-cc-probe  # freestanding-first cc + behavioral probe (after build)
```

IR design sketch (not residual): `doc/shared-ir-sketch.md`.
