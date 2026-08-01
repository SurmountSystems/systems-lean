# KernelLinear long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/KernelLinear.lean` |
| Role module | `src/systems/SystemsLean/KernelLinearTheorems.lean` |
| Namespace | `SystemsLean.KernelLinear` (Theorems imports parent; parent does not import Theorems) |
| Moved | KERNEL-LINEAR-THEOREM / HOST-KERNEL-LINEAR-THEOREM block + KERNEL-LINEAR-SMOKE examples |
| Stayed | stage ids, lowerLinearKernel, linearHostPathReady, linearKernelReady, linearKernelOk, dialect defs |

## Line counts

| File | Before | After |
|------|--------|-------|
| KernelLinear.lean | 343 | 229 |
| KernelLinearTheorems.lean | (new) | 184 |

Parent strictly decreased (-114).

## Gates

- `lake build SystemsLean.KernelLinear SystemsLean.KernelLinearTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Tip / freestanding-self-host-complete not required (tip not touched)
- Claims: complete true; free/llvm/PROVABLY false (untouched)

## Wire-up

- `SystemsLean.lean` imports KernelLinearTheorems
- `nix/systems-host-presence/` required-files + host-leans + host-specs-kernel-parity KernelLinear + KernelLinearTheorems
- `specs.nix` root import token for KernelLinearTheorems
- `host-partial-inventory.md` row pair

## Next cold primary

SelfHost.lean ~342 (never-split).
