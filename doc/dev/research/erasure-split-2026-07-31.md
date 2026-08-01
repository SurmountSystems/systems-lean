# Erasure long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after
| File | Lines |
|------|------:|
| Erasure.lean (before) | 226 |
| Erasure.lean (after) | 110 |
| ErasureTheorems.lean (new) | 177 |

## Seam
ERASURE-THEOREM / HOST-ERASURE-THEOREM block (mark fail-closed, MULT-0 grade
gate, checkFailClosed, markForGrade? composition) extracted to ErasureTheorems
same namespace SystemsLean.Erasure. Core dialect (Erased, mark, isRuntimeAbsent,
isErasureGrade, markForGrade?, checkFailClosed) stays in parent.
Matches ExtractTheorems / TypesTheorems role pattern.

## Non-claims
Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates
lake Erasure + ErasureTheorems; just hygiene; systems-host; systems-emit-wire.
