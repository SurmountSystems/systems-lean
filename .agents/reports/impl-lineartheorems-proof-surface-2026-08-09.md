# Report: LinearTheorems L3 PROOF-SURFACE pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

L3 PROOF-SURFACE dual-ok for `SystemsLean.LinearTheorems` only, same bar as
MultTheorems PROOF-SURFACE: documented dialect, E-good accept, E-bad
ILL-TYPED-PROOF while L0 still accept. Gate via SurfaceOk fold not bare dualOk.
Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only
+ IrGraph IrGraph-only + HostCompose HostCompose-only + Erasure Erasure-only +
Extract Extract-only + MultTheorems PROOF MultTheorems-only unchanged.
FullHostElaborateRemains false. free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/lineartheorems-proof-surface-gap-table-2026-08-09.md` (Kind: analysis only) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckLinearProof.lean` (~260 lines) |
| Wire | `refineLinearTheoremsWithProofSurface` on `SystemsLean.LinearTheorems` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckLinearProofSurfaceDualOk` true; **gate** `hostModuleCheckLinearProofSurfaceOk` (E-bad fold); scope LinearTheorems-only; HostResidualShrink mirror |
| Accepts | `hostModuleCheckGoodLinearTheoremsProof` + P1/P2 bad twins via full `checkRealModule` |
| Driver | banner `linearProofSurface=PROOF-SURFACE scope=LinearTheorems-only dualOk=true`; SurfaceOk smoke |
| Harness | seed=206 harness=**38** (added HostModuleCheckLinearProof) |
| Residual lockstep | RESIDUAL-systems Done + Open **TypesTheorems L3 PROOF-SURFACE pilot**; RESIDUAL.md join; WATCHER `/implement` TypesTheorems L3; SESSION-HANDOFF living tip; self-host tip |

## LinearTheorems L3 dialect rules

Documented subset (not full Lean 4 tactic elaborator):

1. **shareNat_zero**: statement must contain `shareNat 0 = 0` and must not be bare `True`; proof body after `:=` exactly `rfl`
2. **mult0ClassId_eq**: statement cites `mult0ClassId` and `MULT-0` (not bare `True`); proof body exactly `rfl`

Reject reason: `ILL-TYPED-PROOF` (shared with MultTheorems L3).
Other LinearTheorems theorems stay L0/L1 token presence this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L3 |
|------|----------|-------|-----|
| P1 | shareNat_zero statement `True := trivial` | accept | ILL-TYPED-PROOF |
| P2 | shareNat_zero body `by sorry` | accept | ILL-TYPED-PROOF |
| E-good | well-typed LinearTheorems proof fixture | accept | accept |
| Real disk | `LinearTheorems.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before LinearTheorems L3 dialect. Living dual-pin encodes the gap:
`hostModuleCheckLinearProofSurfaceOk` requires dialect reject of P1/P2 while
`hostModuleCheckBadLinearThm*L0Accept` stays true. GREEN is lake + without-lake +
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
| hostModuleCheckLinearProofSurfaceDualOk | LinearTheorems-only claim pin | **true** |
| hostModuleCheckLinearProofSurfaceOk | LinearTheorems-only **gate** (E-bad) | **true** |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`linearProofSurface=PROOF-SURFACE scope=LinearTheorems-only dualOk=true`
alongside MultTheorems-only proofSurface and Mult..Extract TERM-SURFACE lines.
Driver folds SurfaceOk, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.LinearTheorems` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; LinearTheorems-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (251 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (LinearProof ~260; Theorems 1000;
CheckersLater 1000; Accepts 954; Driver 963; HostResidualShrink ~967).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not TypesTheorems L3 (next Open)
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + HostCompose HostCompose-only + Erasure Erasure-only + Extract Extract-only + MultTheorems PROOF MultTheorems-only stay true
