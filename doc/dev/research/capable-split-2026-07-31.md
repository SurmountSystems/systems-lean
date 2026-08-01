# Capable long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

CAPABLE-GAP-THEOREM / HOST-CAPABLE-GAP-THEOREM + CAPABLE-GAP-SMOKE /
HOST-CAPABLE-GAP-SMOKE moved to `SystemsLean.CapableTheorems`
(same namespace `SystemsLean.Capable`).

Parent keeps: stage ids, claim Bools (InstallOnly / Read / Compose /
WriteHc true; FullPerform false), gap tokens, Lake-free recipes, Ok /
PartialReady folds, printGapMeasure, main.

## Sizes

| File | Lines |
|------|------:|
| Capable.lean before | 258 |
| Capable.lean after | 233 |
| CapableTheorems.lean | 279 |
| SelfApplyFs tip | 1903 (import +1) |

## Gates

lake Capable + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

OfficialPath **256** (then PerformEvidence **255**;
skip CompilePath*; skip already-split).
