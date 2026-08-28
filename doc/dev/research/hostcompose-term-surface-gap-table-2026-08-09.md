# HostCompose L2 term-surface gap table

Kind: analysis only. Not residual.

Date: 2026-08-09. Living SSOT product module:
`src/systems/SystemsLean/HostCompose.lean`.

## Goal of this table

Document L0/L1 structural tokens vs real HostCompose def shapes, and name
ill-typed twins that L0 still accepts so L2 TERM-SURFACE can reject them.
Pilot scope: **HostCompose.lean only** (not HostComposeTheorems L3).

## L0/L1 required decls (hostComposeRequiredDecls)

| Token | Role |
|-------|------|
| structure:LinearHost | live/id handle |
| structure:Host | graph + linear + erased |
| def:empty | empty compose |
| def:mint | MULT-1 mint fail-closed |
| def:consume | MULT-1 consume fail-closed |
| def:markErased | erasure mark |
| def:pushHostNode | graph push call-through |
| def:addHostEdge | graph edge call-through |
| def:multPreScan | MULT-0/1/OMEGA pre-scan |
| def:checkFailClosed | graph well-typed + multPreScan |
| def:extractOk | RUNTIME-FS extract bar |
| def:extractOkFs | extract under runtimeFs |

L0/L1 do **not** check def bodies. Stub mint/consume/checkFailClosed bodies that
return identity or `true` still accept when tokens are present.

## Real def shapes (HostCompose.lean)

Documented L2 dialect subset (not full Lean 4 elaborator):

1. **empty** -- multi-line structure after `:=` with nested `:=` fields kept:
   collapsed body exact
   `{ graph := IrGraph.empty linear := LinearHost.empty erased := Erasure.unmarked }`
2. **mint** -- multi-line fail-closed: body contains `MintResult.badId`,
   `MintResult.alreadyLive`, `MintResult.ok`
3. **consume** -- multi-line fail-closed: body contains `ConsumeResult.notLive`,
   `ConsumeResult.ok`
4. **pushHostNode** -- match call-through: body contains
   `HostPushNodeResult.badNode`, `HostPushNodeResult.full`,
   `HostPushNodeResult.ok`, `IrGraph.pushNode`
5. **checkFailClosed** -- collapsed body exact
   `hostIsWellTyped hc && multPreScan hc`
6. **extractOkFs** -- collapsed body exact
   `extractOk hc RuntimeClaim.runtimeFs`

markErased / addHostEdge / multPreScan / hostIsWellTyped / extractOk / nodeMultOk
stay L0 token presence this pilot (or soft contains when needed later).

Parser note: empty puts `{` on the same line as `:=`; body collector must re-join
nested `:=` and continue when the same-line remainder is only `{`.

## Twins (GT1..GT4)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| GT1 | empty body drops graph/erased fields | accept | ILL-TYPED-TERM |
| GT2 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| GT3 | mint always `MintResult.ok hc` | accept | ILL-TYPED-TERM |
| GT4 | pushHostNode always `HostPushNodeResult.ok hc` | accept | ILL-TYPED-TERM |
| E-good | well-typed HostCompose term fixture | accept | accept |
| Real disk | `HostCompose.lean` | accept | accept |

## RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts. Living dual-pin encodes the gap:
`hostModuleCheckHostComposeTermSurfaceOk` requires dialect reject of GT1..GT4 while
`hostModuleCheckBadHostCompose*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (planned)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | true (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | true (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | true (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | true (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | true (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only claim | **true** (this pilot) |
| hostModuleCheckHostComposeTermSurfaceOk | HostCompose-only **gate** | **true** (E-bad) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | true (unchanged) |
| FullHostElaborateRemains | package | false |

## Pilot deliverables

| Item | Path / note |
|------|-------------|
| Companion | `SystemsLean.HostModuleCheckHostComposeTerm` |
| Wire | `refineHostComposeWithTermSurface` on HostCompose path |
| Gate | LoadOk + Driver fold `hostModuleCheckHostComposeTermSurfaceOk` |
| Harness | seed=206 harness=**35** (HostModuleCheckHostComposeTerm added) |

Reject reason: `ILL-TYPED-TERM` (shared with Mult..IrGraph L2).
