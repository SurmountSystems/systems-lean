# Report: S8 CompilePath unit modules TERM (2026-08-11)

## Verdict

**GREEN (done, full eight units).** Landed HostModuleCheck TERM dual-ok for all
eight existing CompilePath unit modules on disk:

| Unit module | Term companion | Scope |
|-------------|----------------|-------|
| `SystemsLean.CompilePathMult` | `HostModuleCheckCompilePathMultTerm` | CompilePathMult-only |
| `SystemsLean.CompilePathLinear` | `HostModuleCheckCompilePathLinearTerm` | CompilePathLinear-only |
| `SystemsLean.CompilePathTypes` | `HostModuleCheckCompilePathTypesTerm` | CompilePathTypes-only |
| `SystemsLean.CompilePathProgram` | `HostModuleCheckCompilePathProgramTerm` | CompilePathProgram-only |
| `SystemsLean.CompilePathGraph` | `HostModuleCheckCompilePathGraphTerm` | CompilePathGraph-only |
| `SystemsLean.CompilePathCompose` | `HostModuleCheckCompilePathComposeTerm` | CompilePathCompose-only |
| `SystemsLean.CompilePathErasure` | `HostModuleCheckCompilePathErasureTerm` | CompilePathErasure-only |
| `SystemsLean.CompilePathExtract` | `HostModuleCheckCompilePathExtractTerm` | CompilePathExtract-only |

**Skipped / not invented:** CompilePathPlan, CompilePathApply, CompilePathBody
(exist as unit modules but S8 Done when names Mult..Extract only; left L0 structural).

Living tip: seed=**206**+Main=**59**+harness=**99**; TERM dual-ok **46**
(pre-S8 **38** + 8 unit companions). free / complete / PROVABLY **true**;
FullHostElaborateRemains **false**; DominanceClaimed **false**; band FullBackend
**false**. Package-env still Mult..ParityEmit+U2+S5 (no PE expand this slice).

## Inventory (existing unit modules)

All eight S8 target modules already present under `src/systems/SystemsLean/`:

- CompilePathMult.lean (254), CompilePathLinear.lean (271), CompilePathTypes.lean (290)
- CompilePathProgram.lean (279), CompilePathGraph.lean (382), CompilePathCompose.lean (360)
- CompilePathErasure.lean (269), CompilePathExtract.lean (249)

## Done when checklist

| # | Requirement | Status |
|---|-------------|--------|
| 1 | Inventory existing CompilePath* unit modules | **yes** (8/8) |
| 2 | TERM for each existing checkable unit (maximize) | **yes** (8/8 Mult..Extract) |
| 3 | dual-ok climb honest | **yes** 38 -> **46** |
| 4 | Sub-1-KLOC care Accepts/Fixtures/LoadOk | **yes** LoadOk **995**; Accepts **977**; aggregate role companion LoadOkCompilePathUnits |
| 5 | free/complete/PROVABLY true; FullHost false | **yes** unchanged |
| 6 | Gates green | **yes** (table below) |
| 7 | Report on disk | **yes** (this path) |
| 8 | Residual / WATCHER lockstep | **yes** |

## Pattern (mirror S2 CompilePathTerm / S6)

Each companion (~208-218 lines):

| Piece | Detail |
|-------|--------|
| Dialect | emit/path gate body; residual-free **false**; product-complete **false** (Extract: twin gates); compile-path / extract-gate ready compose matching product |
| E-good | Term text with required decls + dialect bodies |
| ILL twins | residual / emit / ready / complete flip (L0 accept + dialect reject) |
| Gate | `hostModuleCheck*TermSurfaceOk` (not bare dualOk) |
| RealModule | `refine*WithTermSurface` on unit modName |
| LoadOk | aggregate `hostModuleCheckCompilePathUnitsTermSurfaceOk` |
| dualOk mirror | `HostResidualShrinkTermOk` per unit scope |

## Wire-up

| Surface | Change |
|---------|--------|
| 8x `HostModuleCheckCompilePath*Term.lean` | new companions |
| `HostModuleCheckLoadOkCompilePathUnits.lean` | aggregate SurfaceOk fold (Sub-1-KLOC) |
| `HostModuleCheckRealModule.lean` | refine Mult..Extract units |
| `HostModuleCheckAccepts.lean` | goods use Term texts |
| `HostModuleCheckLoadOk.lean` | fold aggregate |
| `HostResidualShrink` / TermOk / Theorems | dualOk + harness list + partition **99** |
| `HostModuleCheck.lean` / `SystemsLean.lean` | hub imports |
| `just/host.just` | dualOk greps + harness list |
| `just/host-without-lake.just` | family_mods |
| `nix/systems-host-presence/` | host-leans, required-files, host-specs |

## Pins (unchanged claim story)

| Pin | Value |
|-----|--------|
| free / residualFreeClaimed | **true** |
| complete / freestandingProductSelfHostComplete | **true** |
| PROVABLY / provablyUnlocked | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / Main / harness | **206** / **59** / **99** |
| package-env | Mult..ParityEmit+U2+S5 (unchanged) |
| TERM dual-ok | **46** |

## Verify

| Path | Command | Result |
|------|---------|--------|
| Lake Term family | `lake build` 8x CompilePath*Term | **exit 0** |
| Lake wire-up | Accepts, RealModule, LoadOk, LoadOkCompilePathUnits, ResidualShrink*, HostModuleCheck, Smoke | **exit 0** |
| Without Lake | `just host-module-check-without-lake` | **GREEN** modules=206 PARTIAL-STRUCTURAL |
| Residual shrink | `just host-residual-shrink` | **GREEN** |
| Host presence | `just systems-host` | **GREEN** (314 required paths) |
| Hygiene | `just hygiene` | **GREEN** |

## Residual / WATCHER

- `RESIDUAL-systems.md`: S8 **done** (full eight units)
- `RESIDUAL.md` join board: S8 done; Open empty done-for-now (S1-S8 wave complete)
- `WATCHER.md`: process mop / review optional; empty product Open
- `doc/SESSION-HANDOFF.md`: living tip harness 99; TERM dual-ok 46; S8 done

## Out of scope (honored)

Invent unit modules; FullHost flip; seed-wide H2 claim; package-env PE for
S8 units (optional later); git commit/add/push; CompilePathPlan/Apply/Body TERM
(not in S8 Named list).
