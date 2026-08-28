# Report: Types term-surface pilot (IMPL b1c88216)

Date: 2026-08-08. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult TERM-SURFACE Mult-only and Linear TERM-SURFACE Linear-only for
**Types.lean**: reject named ill-typed Types twins that L0/L1 still accept;
dual-ok **TERM-SURFACE Types-only** only with E-bad evidence. Gate dual-ok via
**SurfaceOk** fold not bare dualOk. Mult Mult-only + Linear Linear-only +
MultTheorems PROOF MultTheorems-only unchanged. FullHostElaborateRemains false.
free dual-ok / free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/types-term-surface-gap-table-2026-08-08.md` (Kind: analysis + pilot; TT1..TT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckTypesTerm.lean` (441 lines after mop) |
| Process mop OPEN-1 | multi-line `kindMultOk` disk body: `typesDefBodyCollapsed` (same-line or next line) used by kinds/isValid/isWellTyped body checks; without-lake green on real Types seed |
| Wire | `refineTypesWithTermSurface` on `SystemsLean.Types` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckTypesTermSurfaceDualOk` true; **gate** `hostModuleCheckTypesTermSurfaceOk` (E-bad fold); scope Types-only; HostResidualShrink mirror |
| Harness | seed=206 harness=**32** (added HostModuleCheckTypesTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open empty; RESIDUAL.md join; WATCHER DONE-FOR-NOW; SESSION-HANDOFF living tip; self-host host-finish tip |

## Types L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **NodeKind.name**: match arms RHS include `"VALUE"`, `"LINEAR"`, `"ERASED"`
2. **NodeKind.expectedMult**: arms include Mult.multOmega / Mult.mult1 / Mult.mult0
3. **kindMultOk**: body exactly `decide (k.expectedMult = m)` (same-line or multi-line via `typesDefBodyCollapsed`)
4. **ofKindTag?**: arms include some NodeKind.value/linear/erased and none
5. **isValidKindTag**: body exactly `(ofKindTag? n).isSome` (collapsed body)
6. **IrNode.isWellTyped**: body exactly `kindMultOk n.kind n.mult` (collapsed body)

Reject reason: `ILL-TYPED-TERM` (shared with Mult/Linear L2).

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| TT1 | name value arm `"WRONG"` | accept | ILL-TYPED-TERM |
| TT2 | expectedMult value => Mult.mult0 | accept | ILL-TYPED-TERM |
| TT3 | kindMultOk body `true` | accept | ILL-TYPED-TERM |
| TT4 | ofKindTag? 0 => some NodeKind.linear | accept | ILL-TYPED-TERM |
| E-good | well-typed Types term fixture | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before Types L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckTypesTermSurfaceOk` requires dialect reject of TT1..TT4 while
`hostModuleCheckBadTypes*L0Accept` stays true. Standalone theorems `*_l0Accept`
and `*_illTyped` prove both sides. GREEN is lake + without-lake + SurfaceOk true
(not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only claim pin | **true** |
| hostModuleCheckTypesTermSurfaceOk | Types-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`typesTermSurface=TERM-SURFACE scope=Types-only dualOk=true` alongside Mult-only
and Linear-only. LoadOk + Driver fold **SurfaceOk**, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.Types` + HostModuleCheck family + HostResidualShrink (+Theorems) | **0** |
| `lake build slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; Types-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (245 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (TypesTerm 441; Theorems 976; Accepts 764;
Driver 840; CheckersLater ~994). FixtureTextsLater ~996 unchanged.

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not TypesTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + MultTheorems PROOF MultTheorems-only stay true
