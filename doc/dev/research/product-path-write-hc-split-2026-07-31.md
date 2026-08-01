# ProductPathWriteHc long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

WRITE-HC-THEOREM / HOST-WRITE-HC-THEOREM +
WRITE-HC-SMOKE / HOST-WRITE-HC-SMOKE moved to
`SystemsLean.ProductPathWriteHcTheorems` (same namespace
`SystemsLean.ProductPathWriteHc`).

Parent keeps: stage ids, claim Bools (DependsOnLake true /
EntrypointClaimed true), Ok / PartialReady folds,
writeFreestandingHcAtRoot, filterArgs, main.

## Sizes

| File | Lines |
|------|------:|
| ProductPathWriteHc.lean before | 194 |
| ProductPathWriteHc.lean after | 181 |
| ProductPathWriteHcTheorems.lean | 187 |
| SelfApplyFs tip | 1910 (import +1) |

## Gates

lake ProductPathWriteHc + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

Mult **184** (then ProductPathWriterPathExec **169**; skip CompilePath*;
skip already-split including ProductPathWriteHc **181** and ProductPathReadSsot
**197** and DualEqWriteApi via DualEqWriteLoad).
