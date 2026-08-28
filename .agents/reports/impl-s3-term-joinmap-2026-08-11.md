# Report: S3 TERM JoinMap (2026-08-11)

## Verdict

**GREEN.** Landed HostModuleCheck TERM dual-ok for real L0 module `JoinMap`
(dual-to-Slake join map product module). TERM dual-ok **+1** from pre-slice tip
(**32** -> living tip **34** with concurrent S2 CompilePath). Harness partition
living tip **seed=206+Main=59+harness=85** (S1 tip 83 + CompilePathTerm +
JoinMapTerm). free / complete / PROVABLY **true**; FullHostElaborateRemains
**false**; DominanceClaimed **false**. Not dual formal map complete.

## Done when checklist

| # | Requirement | Status |
|---|-------------|--------|
| 1 | JoinMap TERM dual-ok true | **yes** (`hostModuleCheckJoinMapTermSurfaceDualOk`) |
| 2 | HostModuleCheckJoinMapTerm + dualOk + harness + LoadOk | **yes** |
| 3 | Harness +1 from pre-slice tip (S1=83; living 85 with S2) | **yes** |
| 4 | without-Lake or focused lake green | **yes** (both) |
| 5 | Residual S3 done | **yes** |
| 6 | Reports on disk | **yes** (this path + /tmp summary) |
| 7 | free/complete/PROVABLY true; FullHost/Dominance false | **yes** (no claim flips) |
| 8 | Not dual formal complete | **honored** |

## Pattern (mirror U1 / ProductOutKernelTerm)

Companion `SystemsLean/HostModuleCheckJoinMapTerm.lean` (**235** lines):

| Piece | Detail |
|-------|--------|
| Scope | TERM-SURFACE **JoinMap-only** |
| Dialect | stageId `SLAKE_JOIN_MAP_V0`; hostJoinMapId `HOST-JOIN-MAP`; joinMapId `JOIN-MAP`; joinAlgId `JOIN-ALG`; joinAlgUseId `JOIN-ALG-USE` |
| E-good | `hostModuleCheckGoodJoinMapTermText` |
| ILL twins | bad stage / host / map / alg id (L0 still accepts; dialect rejects ILL-TYPED-TERM) |
| Gate | `hostModuleCheckJoinMapTermSurfaceOk` (not bare dualOk alone) |
| RealModule | `refineJoinMapWithTermSurface` on `SystemsLean.JoinMap` |
| LoadOk | SurfaceOk fold |
| dualOk mirror | `HostResidualShrinkTermOk` JoinMap-only |

## Wire-up

| Surface | Change |
|---------|--------|
| `HostModuleCheckJoinMapTerm.lean` | new companion |
| `HostModuleCheckRealModule.lean` | import + JoinMap refine (also imported CompilePathTerm for concurrent S2 refine) |
| `HostModuleCheckLoadOk.lean` | SurfaceOk fold |
| `HostModuleCheck.lean` / `SystemsLean.lean` | hub imports |
| `HostResidualShrink` / TermOk / Theorems | dualOk + harness list + partition **85** |
| `just/host.just` | JoinMap dualOk greps; harness=85 list |
| `just/host-without-lake.just` | family_mods JoinMapTerm |
| `nix/systems-host-presence/` | host-leans, required-files, host-specs-compile-path-3 |

**Race note:** S2 CompilePathTerm landed concurrently on the same dualOk / harness
strings. JoinMap dualOk added surgically; CompilePath dualOk left to S2. Living
tip includes both companions (**85** harness modules).

## Pins (unchanged claim story)

| Pin | Value |
|-----|-------|
| free / residualFreeClaimed | **true** |
| complete / freestandingProductSelfHostComplete | **true** |
| PROVABLY / provablyUnlocked | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / Main / harness | **206** / **59** / **85** |
| TERM dual-ok | **34** |
| dual formal map | present-partial (not complete) |

## Verify

| Path | Command | Result |
|------|---------|--------|
| Lake family | `lake build SystemsLean.HostModuleCheckJoinMapTerm` + RealModule + LoadOk + HostResidualShrink* + HostModuleCheck | **GREEN** (exit 0) |
| Without Lake | `just host-module-check-without-lake` | **GREEN** modules=206 PARTIAL-STRUCTURAL |
| Residual shrink | `just host-residual-shrink` | **GREEN** |
| Host presence | `just systems-host` | **GREEN** (300 required paths) |
| Hygiene | `just hygiene` | **GREEN** |

## Residual / WATCHER

- `RESIDUAL-systems.md`: S3 **done**
- `RESIDUAL.md` join: S3 **done**; TERM dual-ok **34**; harness **85**
- `WATCHER.md`: next implement **S4** SelfHost+SurfaceMatrix
- `doc/SESSION-HANDOFF.md`: living tip lockstep

## Out of scope (honored)

- FullHost flip
- Invent dual algorithms / freestanding affine ABI
- Dual formal map complete claim
- Product C / shell
- S4-S8 product work in this slice
