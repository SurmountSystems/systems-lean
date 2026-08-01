# IrProgram long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| File | Lines |
|------|------:|
| IrProgram.lean (before) | 254 |
| IrProgram.lean (after) | 138 |
| IrProgramTheorems.lean (new) | 179 |

Parent strictly decreased (-116).

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/IrProgram.lean` |
| Role module | `src/systems/SystemsLean/IrProgramTheorems.lean` |
| Namespace | `SystemsLean.IrProgram` (Theorems imports parent; parent does not import Theorems) |
| Moved | IR-PROGRAM-THEOREM / HOST-IR-PROGRAM-THEOREM (all real theorems + private thm fixtures) |
| Stayed | programCap, Program, empty, length, isEmpty, PushResult, push, isWellTyped, foldWellTyped, checkFailClosed |

Matches InventoryCloseTheorems / SelfApplyTheorems / IrGraphTheorems role pattern
(theorems helper module). No smoke block existed on IrProgram (theorems only).

## Non-claims

Not freestanding residual free. Not PROVABLY. Not llvm unlock. Tip SelfApplyFs
untouched. complete stays true; free/llvm/PROVABLY stay false.

## Gates

- `lake build SystemsLean.IrProgram SystemsLean.IrProgramTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Tip / freestanding-self-host-complete not required (tip not touched)

## Wire-up

- `SystemsLean.lean` imports IrProgramTheorems
- `nix/systems-host-presence/` required-files + host-leans + host-specs-core IrProgram + IrProgramTheorems
- `specs.nix` root import token for IrProgramTheorems
- `host-partial-inventory.md` row pair
- `src/systems/README.md` module map

## Next cold primary

KernelMult.lean ~250 (never-split). Then EmitErasure ~233, Erasure ~226.
