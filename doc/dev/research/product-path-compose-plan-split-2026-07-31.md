# ProductPathComposePlan long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

COMPOSE-PLAN-THEOREM / HOST-COMPOSE-PLAN-THEOREM +
COMPOSE-PLAN-SMOKE / HOST-COMPOSE-PLAN-SMOKE moved to
`SystemsLean.ProductPathComposePlanTheorems` (same namespace
`SystemsLean.ProductPathComposePlan`).

Parent keeps: stage ids, claim Bools (DependsOnLake true /
EntrypointClaimed true), Ok / PartialReady folds, DualSsotSpec helpers,
composePlanApplyBodyAtRoot, filterArgs, main.

## Sizes

| File | Lines |
|------|------:|
| ProductPathComposePlan.lean before | 251 |
| ProductPathComposePlan.lean after | 247 |
| ProductPathComposePlanTheorems.lean | 181 |
| SelfApplyFs tip | 1906 (import +1) |

## Gates

lake ProductPathComposePlan + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

CapableFullBar **231** (then CapableRegenerate **218**, ProductPathReadSsot
**208**; skip CompilePath*; skip already-split including ProductPathComposePlan
**247** and PerformEvidence **233**).
