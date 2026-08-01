# CapableRead long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

READ-THEOREM / HOST-READ-THEOREM + READ-SMOKE / HOST-READ-SMOKE moved to
`SystemsLean.CapableReadTheorems` (same namespace `SystemsLean.CapableRead`).

Parent keeps: stage ids, dual SSOT IO (`freestandingCapableReadDualSsot`),
Ok / PartialReady folds, main.

## Sizes

| File | Lines |
|------|------:|
| CapableRead.lean before | 297 |
| CapableRead.lean after | 288 |
| CapableReadTheorems.lean | 191 |
| SelfApplyFs tip | 1900 (import +1) |

## Gates

lake CapableRead + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

CapableStepContract **286** (skip CompilePath*; skip already-split).
