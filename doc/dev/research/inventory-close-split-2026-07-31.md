# InventoryClose long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| File | Lines |
|------|------:|
| InventoryClose.lean (before) | 262 |
| InventoryClose.lean (after) | 193 |
| InventoryCloseTheorems.lean (new) | 135 |

Parent strictly decreased (-69).

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/InventoryClose.lean` |
| Role module | `src/systems/SystemsLean/InventoryCloseTheorems.lean` |
| Namespace | `SystemsLean.InventoryClose` (Theorems imports parent; parent does not import Theorems) |
| Moved | INVENTORY-CLOSE-THEOREM / HOST-INVENTORY-CLOSE-THEOREM + INVENTORY-CLOSE-SMOKE / HOST-INVENTORY-CLOSE-SMOKE (all real theorems + behavioral examples) |
| Stayed | stage/map ids, path cites, residualFreeClaimed, productSelfHostCompleteClaimed, inventoryCloseSurfaceOk, inventoryPartialCarryHonest, inventoryCloseReady, inventoryCloseDoesNotMeanResidualFree, inventoryCloseOk |

Matches ProbeWireTheorems / ExtractTheorems role pattern (theorems + smoke).

## Non-claims

Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates

- `lake build SystemsLean.InventoryClose SystemsLean.InventoryCloseTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green (UNIT_SURFACE IR contract ids + Not freestanding emit on Theorems)
- Tip / freestanding-self-host-complete not required (tip not touched)

## Wire-up

- `SystemsLean.lean` imports InventoryCloseTheorems
- `nix/systems-host-presence/` required-files + host-leans + host-specs-hold-close InventoryClose + InventoryCloseTheorems
- `specs.nix` root import token for InventoryCloseTheorems
- `host-partial-inventory.md` row pair

## Next cold primary

SelfApply.lean ~255 (never-split; not SelfApplyFs tip). Then IrProgram ~254,
KernelMult ~250, EmitErasure ~233.
