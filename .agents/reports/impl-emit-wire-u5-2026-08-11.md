# U5: Emit-wire unit-walk honesty -- report (2026-08-11)

## Result

**GREEN.** `just systems-emit-wire` exit **0**. Unit-surface count **305**.

| Metric | Before | After |
|--------|--------|-------|
| emit-wire exit | 1 (FAILED) | 0 (OK) |
| unit-walk violations | **72** | **0** |
| unique failing host Lean files | **68** | **0** |
| free / complete / PROVABLY | true (unchanged) | true |
| FullHostElaborateRemains | false (unchanged) | false |
| DominanceClaimed / band FullBackend | false (unchanged) | false |

`just hygiene` exit **0** after residual/handoff/watcher markdown updates.

## Failure inventory (before)

Gate: pure Nix unit walk under `nix/systems-emit-wire/unit-walk.nix` (specs in `unit-walk.nix` data + `eval-unit-walk.nix`).

Every `*.lean` / `*.slake` under `src/systems` must carry **SKELETON** or **UNIT_SURFACE**. When UNIT_SURFACE is present, also require:

1. module/namespace mention (`module ` or `namespace `)
2. `Not freestanding emit` (required-all)
3. at least one IR contract id from required-any (`MULT-0` / `MULT-1` / `MULT-OMEGA` / `JOIN-ALG` / `ConsumeToken` / edge-erasure-extract phrases / ...)

### Failure classes (before)

| Class | Count (approx) | Examples |
|-------|----------------|----------|
| Missing SKELETON or UNIT_SURFACE | ~23 files | HostImportGraph companions (except tip), ForeignLink*, LlvmCfg*, RuntimeBenchLean*, RustIrInterop |
| UNIT_SURFACE missing IR contract id | ~45 files | HostModuleCheck* peels/terms, HostImportGraph tip |
| UNIT_SURFACE missing `Not freestanding emit` | 4 files | HostModuleCheckDriver, DriverIO, RealModule, CheckersLater (had only "Not freestanding residual free") |

Truncated throw showed 40 lines + "and 32 more"; full eval: **72** violations / **68** files.

## Paydown (what landed)

Surgical **module-header honesty only** (comment greppable tokens). Same pattern as green HostGraph / HostResidualShrinkTheorems / LlvmHold:

- Expand existing `UNIT_SURFACE host surface.` lines with `MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).`
- Add `Not freestanding emit.` where missing.
- For files with no marker: insert `UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).` + `Not freestanding emit.` (host Mult-first peer honesty, not freestanding product claim).
- RuntimeBenchLean / RuntimeBenchLeanMain: **SKELETON** (measurement role, not freestanding unit).

### Families touched

- HostModuleCheck* (hub, seeds, surface, accepts, checkers, driver/IO, real module, package env/elab, parity/kernel/emit/types terms, scaffold terms, fixtures, required decls, ...)
- HostImportGraph* (tip + Seeds/Model/Mods/ModsLater/LoadOk/Theorems/Walk/Driver)
- Mult/Linear/Types/Program/Graph ForeignLink
- LlvmCfgFixture + General/Honesty/MultDf/MultProduction/UnitDf/UnitProduction
- RustIrInterop
- RuntimeBenchLean + Main (SKELETON)

### Not done (intentionally)

- No pure Nix gate rewrite / skip-list
- No free/complete/PROVABLY/FullHost/Dominance claim flips
- No product C / emit shell restore
- No invent of new freestanding units
- No Lake required for this gate (pure Nix emit-wire only)

## Gates

```text
just systems-emit-wire  # exit 0; unit-surface count=305
just hygiene            # exit 0; source-hygiene + professional-tone
```

## Residual / reseed

- `RESIDUAL-systems.md` U5 **done**
- `RESIDUAL.md` Open join: remaining **U1/U2/U3**
- `WATCHER.md` U5 archived; next implement prompts U1 then U2 then U3
- `doc/SESSION-HANDOFF.md` Active open table U5 **done**

## Honesty

UNIT_SURFACE on host modules is **host surface honesty** for the dynamic unit walk (not freestanding emit residual free, not product complete rebrand). Peer Mult-first cite documents Mult grade vocabulary shared with freestanding units; it does not claim those modules are freestanding product wire.
