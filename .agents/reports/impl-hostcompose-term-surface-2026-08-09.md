# Report: HostCompose term-surface pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult / Linear / Types / IrProgram / IrGraph TERM-SURFACE pilots for
**HostCompose.lean**: reject named ill-typed HostCompose twins that L0/L1 still
accept; dual-ok **TERM-SURFACE HostCompose-only** with E-bad evidence. Gate
dual-ok via SurfaceOk fold not bare dualOk. Mult Mult-only + Linear Linear-only +
Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + MultTheorems
PROOF MultTheorems-only unchanged. FullHostElaborateRemains false.
free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/hostcompose-term-surface-gap-table-2026-08-09.md` (Kind: analysis only; GT1..GT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckHostComposeTerm.lean` (~526 lines) |
| Nested `:=` lesson | `hostComposeBodyAfterAssign` re-joins after first `:=`; bare open brace `{` on header seeds multi-line collect for real `empty` structure |
| Wire | `refineHostComposeWithTermSurface` on `SystemsLean.HostCompose` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckHostComposeTermSurfaceDualOk` true; **gate** `hostModuleCheckHostComposeTermSurfaceOk` (E-bad fold); scope HostCompose-only; HostResidualShrink mirror |
| L0 good fixture | `hostModuleCheckGoodHostComposeText` upgraded to L2 shapes (seed L0 path still accepts under refine) |
| Harness | seed=206 harness=**35** (added HostModuleCheckHostComposeTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open **Erasure term-surface pilot**; RESIDUAL.md join; WATCHER `/implement` Erasure; SESSION-HANDOFF living tip; self-host / inventory tips |

## HostCompose L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **empty**: multi-line collapsed exact
   `{ graph := IrGraph.empty linear := LinearHost.empty erased := Erasure.unmarked }`
2. **mint**: multi-line collapsed contains `MintResult.badId`,
   `MintResult.alreadyLive`, `MintResult.ok`
3. **consume**: multi-line collapsed contains `ConsumeResult.notLive`,
   `ConsumeResult.ok`
4. **pushHostNode**: multi-line collapsed contains `HostPushNodeResult.badNode`,
   `HostPushNodeResult.full`, `HostPushNodeResult.ok`, `IrGraph.pushNode`
5. **checkFailClosed**: body exact `hostIsWellTyped hc && multPreScan hc`
6. **extractOkFs**: body exact `extractOk hc RuntimeClaim.runtimeFs`

Reject reason: `ILL-TYPED-TERM` (shared with Mult..IrGraph L2).
markErased / addHostEdge / multPreScan / hostIsWellTyped / extractOk stay L0
token only this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| GT1 | empty drops graph/erased fields | accept | ILL-TYPED-TERM |
| GT2 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| GT3 | mint always `MintResult.ok hc` | accept | ILL-TYPED-TERM |
| GT4 | pushHostNode always `HostPushNodeResult.ok hc` | accept | ILL-TYPED-TERM |
| E-good | well-typed HostCompose term fixture | accept | accept |
| Real disk | `HostCompose.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before HostCompose L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckHostComposeTermSurfaceOk` requires dialect reject of GT1..GT4 while
`hostModuleCheckBadHostCompose*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | **true** (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only claim pin | **true** |
| hostModuleCheckHostComposeTermSurfaceOk | HostCompose-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`hostComposeTermSurface=TERM-SURFACE scope=HostCompose-only dualOk=true` alongside
Mult-only, Linear-only, Types-only, IrProgram-only, IrGraph-only. LoadOk + Driver fold
**SurfaceOk**, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostCompose` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; HostCompose-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (248 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (HostComposeTerm ~526; Theorems 1000;
CheckersLater 999; FixtureTexts 999; Accepts 863; Driver 906; LoadOk 882).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not HostComposeTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + MultTheorems PROOF MultTheorems-only stay true
