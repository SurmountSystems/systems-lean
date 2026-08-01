# CapableStepContract long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

STEP-CONTRACT-THEOREM / HOST-STEP-CONTRACT-THEOREM + STEP-CONTRACT-SMOKE /
HOST-STEP-CONTRACT-SMOKE moved to `SystemsLean.CapableStepContractTheorems`
(same namespace `SystemsLean.CapableStepContract`).

Parent keeps: stage ids, contract step/gap/blocker strings, claim Bools
(AuthorityNotEmit / Read/Compose/WriteHc satisfied / Full false), Ok /
PartialReady folds, printStepContract, main.

## Sizes

| File | Lines |
|------|------:|
| CapableStepContract.lean before | 286 |
| CapableStepContract.lean after | 262 |
| CapableStepContractTheorems.lean | 280 |
| SelfApplyFs tip | 1901 (import +1) |

## Gates

lake CapableStepContract + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

InstallOut **279** (skip CompilePath*; skip already-split).
