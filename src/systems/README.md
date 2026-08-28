# src/systems/ -- freestanding Systems Lean (Slake host)

**Systems Lean** host and **Slake** compiler synthesis: Lean 4 with minimum
Quantitative Type Theory (QTT) multiplicities **0 / 1 / omega**, linear/affine
ownership, and freestanding runtimeless C on the product wire.

**Fork residual:** `RESIDUAL-systems.md`. Paste prompt: `doc/fork-systems.md`.
**Reseed:** residual + `doc/SESSION-HANDOFF.md`. Do not dump Open/Done lists
or implement prompts into this file.

## What lives here

| Role | Path |
|------|------|
| Lean host (Lake package `SystemsLean`) | `SystemsLean/*.lean`, `lakefile.lean`, `lean-toolchain` |
| Module inventory | `host-partial-inventory.md` |
| Self-host claims | `self-host.md` (archives beside it) |
| Freestanding C ownership | `emit/host-owned-emit.md` |
| Dual / JOIN-ALG map | `join-map.md` |
| Generated product C | `emit/slake_freestanding.{c,h}` |
| Hosted behavioral probe | `smoke/slake_behavioral_probe.c` |
| Release surface | `../../out/freestanding-c/` |

Language inventory: root `AGENTS.md` (**Three languages only**). Consumer notes:
`out/freestanding-c/README.md`. Lake package map: `doc/lake-package.md`.

## Living tip

Freestanding product residual **free** and self-host **complete** are **true**
on the release path. `just build` does **not** need Lake on that step. Host
residual free is **claimed** for day-to-day tools; that is **not** "Lake is
gone." Full host package elaborate remains **false**. Slake does **not**
typecheck this package. Lake still typechecks imported modules and builds the
host tools. **PROVABLY** is **true** (CompCert matrix in `just check`). LLVM is
unlocked and partial, not a full backend. Detail: `self-host.md`,
`doc/SESSION-HANDOFF.md`, `RESIDUAL-systems.md`.

## Product bar

- **No** runtime garbage collection (GC) on the freestanding product wire.
- **No** Lean managed runtime on that wire (classic Lean ahead-of-time is not
  freestanding).
- Multiplicities: only **MULT-0 / MULT-1 / MULT-OMEGA**.
- Default: **no** reference counting on freestanding product paths.

## Product wire

Lean `SystemsLean.FreestandingEmit` writes `emit/slake_freestanding.{c,h}`.
`just build` installs `out/freestanding-c/`. Do **not** hand-author product C.
Ownership map: `emit/host-owned-emit.md`.

## Commands

```bash
just build              # freestanding emit + out/freestanding-c
just check              # full suite (includes build)
just systems-host       # pure Nix host presence
just systems-emit-wire  # pure Nix emit-wire / unit walk
just systems-lake       # optional host lake build
just systems-cc-probe   # freestanding cc + behavioral probe
```

Day-to-day host tools have without-Lake recipes; cold Lake is bootstrap and
claim proof only. Recipe map: `just/README.md`. IR sketch (not residual):
`doc/shared-ir-sketch.md`.
