# KernelTypes long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/KernelTypes.lean` before | 345 |
| `SystemsLean/KernelTypes.lean` after | 214 |
| `SystemsLean/KernelTypesTheorems.lean` (new) | 201 |
| Delta parent | -131 |

## Seam

KERNEL-TYPES-THEOREM + KERNEL-TYPES-SMOKE split into
`KernelTypesTheorems.lean`, same namespace `SystemsLean.KernelTypes`
(pattern: KernelProgramTheorems / PerformClaimedTheorems).

**Stays in KernelTypes:** stage/map ids, mkTypedNode / pushNode /
lowerTypesKernel / typesKernelProgram, typesProgramPathReady,
unknownKindRejected / kindMultMismatchRejected, typesSurfaceOk,
typesKernelReady / typesKernelOk, product path cites.

**Moved:** all KERNEL-TYPES-THEOREM theorems and KERNEL-TYPES-SMOKE
examples.

**Cycle rule:** KernelTypesTheorems imports KernelTypes; parent does
not import Theorems.

## Wire-up

- `SystemsLean.lean` imports `KernelTypesTheorems`
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-kernel-parity.nix`
- `host-partial-inventory.md` KernelTypes + KernelTypesTheorems rows
- lakefile comment lists KernelTypesTheorems

## Gates

- `lake build SystemsLean.KernelTypes SystemsLean.KernelTypesTheorems` exit 0
- `lake build SystemsLean.SelfApply SystemsLean.ParityTypes` exit 0
- `just systems-host` exit 0
- `just systems-emit-wire` exit 0
- `just hygiene` exit 0
- Tip SelfApplyFs not primary (package root import only); freestanding-self-host-complete not required

## Claims (held)

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

`Extract.lean` **344** (skip tip SelfApplyFs **1895**; skip role scaffolds
scaffolds *Scaffold/*Theorems/*Load/*Bars/*Main; skip already-split-once
including KernelTypes **214**). Other never-split cold primaries nearby:
KernelLinear **343**, SelfHost **342**.
