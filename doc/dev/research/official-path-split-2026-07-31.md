# OfficialPath long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

OFFICIAL-PATH-THEOREM / HOST-OFFICIAL-PATH-THEOREM + OFFICIAL-PATH-SMOKE /
HOST-OFFICIAL-PATH-SMOKE moved to `SystemsLean.OfficialPathTheorems`
(same namespace `SystemsLean.OfficialPath`).

Parent keeps: stage ids, claim Bools (GapMeasured / perform claimed false /
StillUses FreestandingEmit true / StillUses Lake true / retire required true /
DependsOnLake true / B31 evidence claimed true / Full long-name false), Ok /
PartialReady folds, printOfficialPathGapMeasure, main.

## Sizes

| File | Lines |
|------|------:|
| OfficialPath.lean before | 256 |
| OfficialPath.lean after | 245 |
| OfficialPathTheorems.lean | 286 |
| SelfApplyFs tip | 1904 (import +1) |

## Gates

lake OfficialPath + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

PerformEvidence **255** (then ProductPathComposePlan **251**, CapableFullBar
**231**; skip CompilePath*; skip already-split including OfficialPath **245**
and DualEqWriteApi via DualEqWriteLoad).
