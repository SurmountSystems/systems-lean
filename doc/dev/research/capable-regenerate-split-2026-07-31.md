# CapableRegenerate long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

`CapableRegenerateTheorems.lean` -- REGENERATE-THEOREM / HOST-REGENERATE-THEOREM +
REGENERATE-SMOKE / HOST-REGENERATE-SMOKE. Same namespace `SystemsLean.CapableRegenerate`.

Parent keeps stage/host/selfHost ids, claim Bools (AuthorityNotEmit true;
DependsOnLake true; InstallOutOpen false; Full long-name false), ordered
pipeline + API strings, Ok / PartialReady folds, freestandingCapableOrderedRegenerate
IO, filterArgs, main.

## Sizes

| Path | Lines |
|------|------:|
| CapableRegenerate.lean before | 218 |
| CapableRegenerate.lean after | 208 |
| CapableRegenerateTheorems.lean | 228 |
| SelfApplyFs tip | 1908 (import +1) |

## Gates

lake CapableRegenerate + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

ProductPathReadSsot **208** (then next by live wc; skip CompilePath*;
skip already-split including CapableRegenerate **208** and CapableFullBar
**219**).
