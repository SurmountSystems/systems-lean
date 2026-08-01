# EmitErasure long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after
| File | Lines |
|------|------:|
| EmitErasure.lean (before) | 233 |
| EmitErasure.lean (after) | 63 |
| EmitErasureScaffold.lean (new) | 236 |

## Seam
Product Erasure freestanding C scaffolding (HOST-EMIT-ERASURE fragments, stage ids,
honesty, emitErasureReady, smokes) extracted to EmitErasureScaffold same namespace.
Matches EmitMultScaffold / EmitLinearScaffold / EmitBannerScaffold role pattern.

## Non-claims
Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates
lake EmitErasure; just hygiene; systems-host; systems-emit-wire.
