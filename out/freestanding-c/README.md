# out/freestanding-c -- runtimeless product C

**Release surface:** freestanding product C (and headers) that others can build with a normal C toolchain **without** a Lean managed runtime, GC (garbage collection), or host elaborator on the link line.

Name emphasizes **runtimeless / freestanding**, not classic AOT (ahead-of-time) that still ships a runtime.

## Generated only (do not hand-author)

- Tracked `*.c` / `*.h` here are **generator outputs** copied from `src/systems/emit/` (Lean `SystemsLean.FreestandingEmit`, stage **SLAKE_EMIT_FREESTANDING_C_V0**).
- Hand-written product C is **forbidden** as Systems Lean implementation. Do not invent features by editing this tree; re-emit will overwrite.
- This directory is **not** a place to author residual progress. Systems Lean lives in Lean under `src/systems/`.
- Lake `.lake/build/ir/*.c` is classic Lean AOT IR with managed runtime -- **not** this freestanding surface; keep it untracked.
- Policy SSoT (source of truth): `AGENTS.md` (**Three languages only**, **Freestanding / ahead-of-time (AOT) C git policy**). Ownership map: `src/systems/emit/host-owned-emit.md`.

## Policy

- Contents come from freestanding emit under `src/systems/` only.
- No host elaborator residual, no `libleanshared` expectation, no product GC.
- Refresh: `just build` (Lean freestanding emit + copy into this tree).
- Honesty: product residual free on this release surface; host elaborator residual remains (Lake still elaborates Systems Lean). Free is not "Lake is gone." Not PROVABLY; not LLVM unlock. Living tip: `doc/SESSION-HANDOFF.md`.

## Release process (minimum)

1. `just build` -- product freestanding wire: regenerate emit under `src/systems/emit/` and populate this tree.
2. `just check` -- full suite green (`just build` first; no second full regenerate). Human stages new `nix/` paths for flake match when needed.
3. Publish **this directory** so consumers need not clone `ref/*` or the full host monorepo.
4. Notes: freestanding bar + Unlicense on novel emit; CompCert (if used) keeps its own license.

### Consumer publish options

**Preferred: git subtree** (long-lived consumer repo, history of the release surface only):

```bash
# From monorepo root after green just build + just check:
git subtree push --prefix=out/freestanding-c <consumer-remote> main
# Or split once to a branch for review:
git subtree split --prefix=out/freestanding-c -b freestanding-c-release
```

**Tarball** (one-shot drop; no git required on the consumer side):

```bash
just export-freestanding-c
# -> .cache/systems-lean-freestanding-c-<UTC>.tar.gz
# Unpack and build with a normal C toolchain (see header comments in slake_freestanding.h).
```

Consumers should treat `*.c` / `*.h` as **generated product wire**. Do not fork residual progress into a second hand-edited C tree.

**Optional later:** stop tracking monorepo dogfood `emit/*.c` after CI always regenerates; default remains tracked dogfood for local red/green.
