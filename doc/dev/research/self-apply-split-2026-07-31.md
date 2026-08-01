# SelfApply long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| File | Lines |
|------|------:|
| SelfApply.lean (before) | 255 |
| SelfApply.lean (after) | 187 |
| SelfApplyTheorems.lean (new) | 137 |

Parent strictly decreased (-68).

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/SelfApply.lean` |
| Role module | `src/systems/SystemsLean/SelfApplyTheorems.lean` |
| Namespace | `SystemsLean.SelfApply` (Theorems imports parent; parent does not import Theorems) |
| Moved | SELF-APPLY-THEOREM / HOST-SELF-APPLY-THEOREM + SELF-APPLY-SMOKE / HOST-SELF-APPLY-SMOKE (all real theorems + behavioral examples) |
| Stayed | stage/map ids, path cites, kernel side Bools, kernelRebuildsKernel, selfApplySurfaceOk, selfApplyReady, selfApplyOk |

Matches InventoryCloseTheorems / ProbeWireTheorems role pattern (theorems + smoke).
SelfApply is SH5 structural host self-apply -- not SelfApplyFs living tip.

## Non-claims

Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates

- `lake build SystemsLean.SelfApply SystemsLean.SelfApplyTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Tip / freestanding-self-host-complete not required (tip not touched)

## Wire-up

- `SystemsLean.lean` imports SelfApplyTheorems
- `nix/systems-host-presence/` required-files + host-leans + specs.nix SelfApply + SelfApplyTheorems
- `specs.nix` root import token for SelfApplyTheorems
- `host-partial-inventory.md` row pair

## Next cold primary

IrProgram.lean ~254 (never-split). Then KernelMult ~250, EmitErasure ~233.
