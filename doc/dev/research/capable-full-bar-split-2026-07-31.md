# CapableFullBar long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

`CapableFullBarTheorems.lean` -- FULL-BAR-THEOREM / HOST-FULL-BAR-THEOREM +
FULL-BAR-SMOKE / HOST-FULL-BAR-SMOKE. Same namespace `SystemsLean.CapableFullBar`.

Parent keeps stage/host/selfHost ids, claim Bools (closed substrate true;
DependsOnLake true; Full long-name false), Full-bar req strings, Ok /
PartialReady folds, printFullBarMeasure, main.

## Sizes

| Path | Lines |
|------|------:|
| CapableFullBar.lean before | 231 |
| CapableFullBar.lean after | 219 |
| CapableFullBarTheorems.lean | 293 |
| SelfApplyFs tip | 1907 (import +1) |

## Gates

lake CapableFullBar + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

CapableRegenerate **218** (then ProductPathReadSsot **208**; skip CompilePath*;
skip already-split including CapableFullBar **219** and ProductPathComposePlan
**247**).
