# Erasure L2 term-surface gap table

Kind: analysis only. Not residual.

Date: 2026-08-09. Living SSOT product module:
`src/systems/SystemsLean/Erasure.lean`.

## Goal of this table

Document L0/L1 structural tokens vs real Erasure def shapes, and name
ill-typed twins that L0 still accepts so L2 TERM-SURFACE can reject them.
Pilot scope: **Erasure.lean only** (not ErasureTheorems L3).

## L0/L1 required decls (erasureRequiredDecls)

| Token | Role |
|-------|------|
| structure:Erased | zero-payload marked handle |
| def:unmarked | fail-closed unmarked handle |
| def:mark | mark erased (ERASE-NO-RUNTIME) |
| def:isRuntimeAbsent | true only when marked |
| def:erasureIsRuntimeAbsent | map-name honesty alias |
| def:isErasureGrade | MULT-0 only (ERASE-RULE-MULT-0) |
| def:markForGrade? | mark only when grade MULT-0 |
| def:checkFailClosed | MULT-0 grade and marked |

L0/L1 do **not** check def bodies. Stub `isErasureGrade` / `checkFailClosed`
bodies that always return `true` still accept when tokens are present.
The living L0 good fixture used exactly that soft shape before this pilot.

## Real def shapes (Erasure.lean)

Documented L2 dialect subset (not full Lean 4 elaborator):

1. **unmarked** -- collapsed body exact `{ marked := false }`
   (nested `:=` kept; Mult-style first-split would truncate).
2. **mark** -- collapsed body exact `{ marked := true }`
3. **isRuntimeAbsent** -- collapsed body exact `e.marked`
4. **erasureIsRuntimeAbsent** -- collapsed body exact `isRuntimeAbsent e`
5. **isErasureGrade** -- match arms: Mult.mult0 => true;
   Mult.mult1 => false; Mult.multOmega => false
6. **markForGrade?** -- multi-line collapsed exact
   `if isErasureGrade m then some (mark e) else none`
7. **checkFailClosed** -- collapsed body exact
   `isErasureGrade m && isRuntimeAbsent e`

Structure Erased stays L0 token presence this pilot.

## Twins (ET1..ET4)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| ET1 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| ET2 | isErasureGrade always `true` | accept | ILL-TYPED-TERM |
| ET3 | markForGrade? always `some (mark e)` | accept | ILL-TYPED-TERM |
| ET4 | isRuntimeAbsent body `true` | accept | ILL-TYPED-TERM |
| E-good | well-typed Erasure term fixture | accept | accept |
| Real disk | `Erasure.lean` | accept | accept |

## RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts. Living dual-pin encodes the gap:
`hostModuleCheckErasureTermSurfaceOk` requires dialect reject of ET1..ET4 while
`hostModuleCheckBadErasure*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (planned)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckErasureTermSurfaceDualOk | Erasure-only claim | true |
| hostModuleCheckErasureTermSurfaceOk | Erasure-only **gate** (E-bad) | true |
| Prior Mult..HostCompose TERM-SURFACE dual-ok | unit-only each | unchanged true |
| MultTheorems PROOF MultTheorems-only | MultTheorems | unchanged true |
| FullHostElaborateRemains | package | false |
| free / complete / PROVABLY | product | unchanged |

## Non-claims

- Not ErasureTheorems L3 proof-surface
- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity
- Not free/complete/PROVABLY flip
