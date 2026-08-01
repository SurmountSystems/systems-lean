# KernelMult long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| File | Lines |
|------|------:|
| KernelMult.lean (before) | 250 |
| KernelMult.lean (after) | 160 |
| KernelMultTheorems.lean (new) | 166 |

Parent strictly decreased (-90).

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/KernelMult.lean` |
| Role module | `src/systems/SystemsLean/KernelMultTheorems.lean` |
| Namespace | `SystemsLean.KernelMult` (Theorems imports parent; parent does not import Theorems) |
| Moved | KERNEL-MULT-THEOREM / HOST-KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE (all real theorems + behavioral examples) |
| Stayed | stageId, kernelMultId, path cites, tags, mkGradeNode, pushNode, lowerMultKernel, multKernelProgram, multKernelReady, unknownTagRejected, kernelSurfaceOk, kernelOk |

Matches SelfApplyTheorems / IrProgramTheorems / InventoryCloseTheorems role pattern
(theorems helper module).

## Non-claims

Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates

- `lake build SystemsLean.KernelMult SystemsLean.KernelMultTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Tip / freestanding-self-host-complete not required (tip not touched)

## Wire-up

- `SystemsLean.lean` imports KernelMultTheorems
- `nix/systems-host-presence/` required-files + host-leans + host-specs-kernel-parity KernelMult + KernelMultTheorems
- `specs.nix` root import token for KernelMultTheorems
- `host-partial-inventory.md` row pair
- `src/systems/README.md` module map

## Next cold primary

EmitErasure.lean ~233 (never-split). Then Erasure ~226.
