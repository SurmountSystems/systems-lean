# PerformEvidence long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

PERFORM-EVIDENCE-THEOREM / HOST-PERFORM-EVIDENCE-THEOREM +
PERFORM-EVIDENCE-SMOKE / HOST-PERFORM-EVIDENCE-SMOKE moved to
`SystemsLean.PerformEvidenceTheorems` (same namespace
`SystemsLean.PerformEvidence`).

Parent keeps: stage ids, claim Bools (evidence claimed true / perform claimed
false / DependsOnLake true / Full long-name false), perform evidence step
tokens, freestanding-capable API cites, Lake-free recipes, Ok / PartialReady
folds, printPerformEvidenceMeasure, main.

## Sizes

| File | Lines |
|------|------:|
| PerformEvidence.lean before | 255 |
| PerformEvidence.lean after | 233 |
| PerformEvidenceTheorems.lean | 284 |
| SelfApplyFs tip | 1905 (import +1) |

## Gates

lake PerformEvidence + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

ProductPathComposePlan **251** (then CapableFullBar **231**, CapableRegenerate
**218**; skip CompilePath*; skip already-split including PerformEvidence
**233** and OfficialPath **245**).
