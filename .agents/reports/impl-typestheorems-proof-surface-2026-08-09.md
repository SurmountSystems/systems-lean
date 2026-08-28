# Report: TypesTheorems L3 PROOF-SURFACE pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

L3 PROOF-SURFACE dual-ok for `SystemsLean.TypesTheorems` only, same bar as
MultTheorems + LinearTheorems PROOF-SURFACE: documented dialect, E-good accept,
E-bad ILL-TYPED-PROOF while L0 still accept. Gate via SurfaceOk fold not bare
dualOk. Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram
IrProgram-only + IrGraph IrGraph-only + HostCompose HostCompose-only + Erasure
Erasure-only + Extract Extract-only + MultTheorems PROOF MultTheorems-only +
LinearTheorems PROOF LinearTheorems-only unchanged. FullHostElaborateRemains
false. free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/typestheorems-proof-surface-gap-table-2026-08-09.md` (Kind: analysis only) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckTypesProof.lean` (~265 lines) |
| Wire | `refineTypesTheoremsWithProofSurface` on `SystemsLean.TypesTheorems` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckTypesProofSurfaceDualOk` true; **gate** `hostModuleCheckTypesProofSurfaceOk` (E-bad fold); scope TypesTheorems-only; HostResidualShrink mirror |
| Accepts | `hostModuleCheckGoodTypesTheoremsProof` + P1/P2 bad twins via full `checkRealModule` |
| Driver | banner `typesProofSurface=PROOF-SURFACE scope=TypesTheorems-only dualOk=true`; SurfaceOk smoke |
| Harness | seed=206 harness=**39** (added HostModuleCheckTypesProof) |
| Residual lockstep | RESIDUAL-systems Done + Open **Package elaborate L4**; RESIDUAL.md join; WATCHER `/implement` Package elaborate L4; SESSION-HANDOFF living tip; self-host tip |

## TypesTheorems L3 dialect rules

Documented subset (not full Lean 4 tactic elaborator):

1. **ofKindTag?_zero**: statement must contain
   `ofKindTag? 0 = some NodeKind.value` and must not be bare `True`; proof body
   after `:=` exactly `rfl`
2. **isValidKindTag_zero**: statement must contain `isValidKindTag 0 = true` and
   must not be bare `True`; proof body exactly `rfl`

Reject reason: `ILL-TYPED-PROOF` (shared with MultTheorems / LinearTheorems L3).
Other TypesTheorems theorems stay L0/L1 token presence this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L3 |
|------|----------|-------|-----|
| P1 | ofKindTag?_zero statement `True := trivial` | accept | ILL-TYPED-PROOF |
| P2 | ofKindTag?_zero body `by sorry` | accept | ILL-TYPED-PROOF |
| E-good | well-typed TypesTheorems proof fixture | accept | accept |
| Real disk | `TypesTheorems.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before TypesTheorems L3 dialect. Living dual-pin encodes the gap:
`hostModuleCheckTypesProofSurfaceOk` requires dialect reject of P1/P2 while
`hostModuleCheckBadTypesThm*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | **true** (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only | **true** (unchanged) |
| hostModuleCheckErasureTermSurfaceDualOk | Erasure-only | **true** (unchanged) |
| hostModuleCheckExtractTermSurfaceDualOk | Extract-only | **true** (unchanged) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| hostModuleCheckLinearProofSurfaceDualOk | LinearTheorems-only | **true** (unchanged) |
| hostModuleCheckTypesProofSurfaceDualOk | TypesTheorems-only claim pin | **true** |
| hostModuleCheckTypesProofSurfaceOk | TypesTheorems-only **gate** (E-bad) | **true** |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`typesProofSurface=PROOF-SURFACE scope=TypesTheorems-only dualOk=true`
alongside MultTheorems-only + LinearTheorems-only proofSurface and Mult..Extract
TERM-SURFACE lines. Driver folds SurfaceOk, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.TypesTheorems` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; TypesTheorems-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (252 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (TypesProof ~265; CheckersLater **1000**;
Theorems 1000; Accepts 975; Driver 978; HostResidualShrink ~983).

## Next Open

**Package elaborate L4** (first slice): PACKAGE-ELABORATE entry design reseed +
dual-pin scaffold + first dual-ok band. See residual Open Done when (judgments
design L4 / plan-fullhost-gap-close). Not implemented this slice.

## Non-claims

- Not package elaborate L4 implement (Open residual only)
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only
  + IrGraph IrGraph-only + HostCompose HostCompose-only + Erasure Erasure-only +
  Extract Extract-only + MultTheorems PROOF MultTheorems-only + LinearTheorems
  PROOF LinearTheorems-only stay true
