# KernelProgram long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/KernelProgram.lean` before | 508 |
| `SystemsLean/KernelProgram.lean` after | 368 |
| `SystemsLean/KernelProgramTheorems.lean` (new) | 213 |
| Delta parent | -140 |

## Seam

KERNEL-PROGRAM-THEOREM + KERNEL-PROGRAM-SMOKE split into
`KernelProgramTheorems.lean`, same namespace `SystemsLean.KernelProgram`
(pattern: JoinMapTheorems / HostComposeTheorems / SpecProofTheorems).

**Stays in KernelProgram:** stage/map ids, lowerProgramKernel /
programKernelProgram, path Ready bars (program/graph/compose),
programKernelReady / programKernelOk, surface canary, product path cites.

**Moved:** all KERNEL-PROGRAM-THEOREM theorems and KERNEL-PROGRAM-SMOKE
examples.

**Cycle rule:** KernelProgramTheorems imports KernelProgram; parent does
not import Theorems.

## Wire-up

- `SystemsLean.lean` imports `KernelProgramTheorems`
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-kernel-parity.nix`, root import token in `specs.nix`
- README table row + KernelProgramTheorems companion

## Gates

- `lake build SystemsLean.KernelProgram SystemsLean.KernelProgramTheorems` exit 0
- `just systems-host` exit 0
- `just hygiene` exit 0
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims (held)

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

`EmitGraph.lean` **477** (skip tip SelfApplyFs **1888**; skip role scaffolds
scaffolds such as EmitComposeScaffold **590**, HostComposeTheorems **485**;
DualEqWriteApi **496** and EmitBody **480** already split under 500).
Other cold primaries nearby: SurfaceMatrix **475**, EmitTypes **466**,
EmitLinear **462**.
