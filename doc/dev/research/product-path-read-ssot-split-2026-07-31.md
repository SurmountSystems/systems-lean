# ProductPathReadSsot long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

READ-SSOT-THEOREM / HOST-READ-SSOT-THEOREM +
READ-SSOT-SMOKE / HOST-READ-SSOT-SMOKE moved to
`SystemsLean.ProductPathReadSsotTheorems` (same namespace
`SystemsLean.ProductPathReadSsot`).

Parent keeps: stage ids, claim Bools (DependsOnLake true /
EntrypointClaimed true), Ok / PartialReady folds, DualSsotSpec helpers,
readDualSsotAtRoot, filterArgs, main.

## Sizes

| File | Lines |
|------|------:|
| ProductPathReadSsot.lean before | 208 |
| ProductPathReadSsot.lean after | 197 |
| ProductPathReadSsotTheorems.lean | 171 |
| SelfApplyFs tip | 1909 (import +1) |

## Gates

lake ProductPathReadSsot + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

ProductPathWriteHc **194** (then Mult **184**, ProductPathWriterPathExec
**169**; skip CompilePath*; skip already-split including ProductPathReadSsot
**197** and CapableRegenerate **208**).
