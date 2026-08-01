# EmitMult long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after
| File | Lines |
|------|------:|
| EmitMult.lean (before) | 277 |
| EmitMult.lean (after) | 60 |
| EmitMultScaffold.lean (new) | 283 |

## Seam
Product Mult freestanding C scaffolding (HOST-EMIT-MULT fragments, stage ids,
honesty, emitMultReady, smokes) extracted to EmitMultScaffold same namespace.
Matches EmitBannerScaffold / EmitLinearScaffold role pattern.

## Non-claims
Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates
lake EmitMult; just hygiene; systems-host; systems-emit-wire (ParityTypesTheorems
MULT-* unit-walk cite fix for prior split).
