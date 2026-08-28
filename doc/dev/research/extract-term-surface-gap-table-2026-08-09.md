# Extract L2 term-surface gap table

Kind: analysis only. Not residual.

Date: 2026-08-09. Living SSOT product module:
`src/systems/SystemsLean/Extract.lean`.

## Goal of this table

Document L0/L1 structural tokens vs real Extract def shapes, and name
ill-typed twins that L0 still accepts so L2 TERM-SURFACE can reject them.
Pilot scope: **Extract.lean only** (not ExtractTheorems L3).
Last Mult..Extract foundation unit before Emit/L3 band.

## L0/L1 required decls (extractRequiredDecls)

| Token | Role |
|-------|------|
| inductive:RuntimeClaim | runtimeFs / runtimeClassic / edgeRuntime |
| def:RuntimeClaim.name | greppable RUNTIME-FS / CLASSIC / EDGE-RUNTIME |
| def:isFreestandingGoal | true only for runtimeFs |
| def:ofRuntimeTag? | 0/1/2 decode; unknown none |
| def:isValidRuntimeTag | (ofRuntimeTag? n).isSome |
| def:checkFailClosed | freestanding + MULT-0 erasure / mult1+omega true |
| def:extractOk | same bar as checkFailClosed |
| def:extractOkFromTags? | raw-tag path; unknown none |

L0/L1 do **not** check def bodies. Stub `isFreestandingGoal` / `checkFailClosed`
/ `extractOk` bodies that always return `true` still accept when tokens are
present. The living L0 good fixture used exactly that soft shape before this
pilot.

## Real def shapes (Extract.lean)

Documented L2 dialect subset (not full Lean 4 elaborator):

1. **RuntimeClaim.name** -- match arms (RHS collapsed):
   `"RUNTIME-FS"`, `"RUNTIME-CLASSIC"`, `"EDGE-RUNTIME"` (all three present).
2. **isFreestandingGoal** -- match arms: one `true` + at least two `false`
   (real table: runtimeFs true; classic/edge false).
3. **ofRuntimeTag?** -- equation arms: `some RuntimeClaim.runtimeFs`,
   `some RuntimeClaim.runtimeClassic`, `some RuntimeClaim.edgeRuntime`,
   `none` (exactly four arms; fail-closed unknown).
4. **isValidRuntimeTag** -- collapsed body exact `(ofRuntimeTag? n).isSome`.
5. **checkFailClosed** -- multi-line collapsed exact
   `if !isFreestandingGoal claim then false else match m with | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e | Mult.mult1 => true | Mult.multOmega => true`
6. **extractOk** -- collapsed body exact `checkFailClosed m e claim`.
7. **extractOkFromTags?** -- multi-line collapsed exact
   `match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with | some m, some claim => some (extractOk m { marked := erasedMarked } claim) | _, _ => none`
   (nested `:=` inside structure literal must not truncate).

Inductive RuntimeClaim stays L0 token presence this pilot.

## Twins (XT1..XT4)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| XT1 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| XT2 | isFreestandingGoal always `true` | accept | ILL-TYPED-TERM |
| XT3 | extractOk always `true` | accept | ILL-TYPED-TERM |
| XT4 | isValidRuntimeTag body `true` | accept | ILL-TYPED-TERM |
| E-good | well-typed Extract term fixture | accept | accept |
| Real disk | `Extract.lean` | accept | accept |

## RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts. Living dual-pin encodes the gap:
`hostModuleCheckExtractTermSurfaceOk` requires dialect reject of XT1..XT4 while
`hostModuleCheckBadExtract*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (planned)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckExtractTermSurfaceDualOk | Extract-only claim | true |
| hostModuleCheckExtractTermSurfaceOk | Extract-only **gate** (E-bad) | true |
| Prior Mult..Erasure TERM-SURFACE dual-ok | unit-only each | unchanged true |
| MultTheorems PROOF MultTheorems-only | MultTheorems | unchanged true |
| FullHostElaborateRemains | package | false |
| free / complete / PROVABLY | product | unchanged |

## Non-claims

- Not ExtractTheorems L3 proof-surface
- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity
- Not free/complete/PROVABLY flip
- Not EmitPlan term-surface in this slice
