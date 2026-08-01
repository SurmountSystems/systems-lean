# LlvmHold long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after
| File | Lines |
|------|------:|
| LlvmHold.lean (before) | 211 |
| LlvmHold.lean (after) | 144 |
| LlvmHoldTheorems.lean (new) | 124 |

## Seam
LLVM-HOLD-THEOREM / HOST-LLVM-HOLD-THEOREM + LLVM-HOLD-SMOKE block
extracted to LlvmHoldTheorems same namespace SystemsLean.LlvmHold. Core hold
Bools (llvmUnlocked / provablyUnlocked / freestandingProductSelfHostComplete
stay false; llvmHoldReady / sh6HoldReady / holdHonestyOk) stay in parent.
Matches ErasureTheorems / InventoryCloseTheorems role pattern.

## Non-claims
Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false. Unlock flags
proved false on Theorems module; defs remain := false on parent.

## Gates
lake LlvmHold + LlvmHoldTheorems; just hygiene; systems-host; systems-emit-wire.
