# Implement report: C2 KernelProgram TERM-SURFACE (2026-08-10)

Kind: implement summary. Not free/complete/PROVABLY/FullHost flips.

## Goal

Progressive host check depth under Completeness Package **C2** after KernelTypes:
greps-only L2 TERM-SURFACE on `SystemsLean.KernelProgram`.

## Done

| Item | Evidence |
|------|----------|
| Companion | `src/systems/SystemsLean/HostModuleCheckKernelProgramTerm.lean` (~411 lines) |
| Dialect | stageId / kernelProgramId strings; lowerProgramKernel fail-closed three-node lower; programKernelReady match; programKernelOk = programKernelReady |
| E-bad | KP1..KP4 reject `ILL-TYPED-TERM`; L0 still accepts bad twins |
| Gate | `hostModuleCheckKernelProgramTermSurfaceOk` (not bare dualOk alone) |
| Scope | TERM-SURFACE **KernelProgram-only** dual-ok |
| Wire | `refineKernelProgramWithTermSurface` on `checkRealModule` KernelProgram path |
| Good path | `hostModuleCheckGoodKernelProgram` uses TermText (no FixtureTexts growth) |
| Mirror | HostResidualShrink dual-ok pins + harness **47 -> 48** |
| Driver long-file split | Emit*+Kernel* smokes folded to `hostModuleCheckEmitKernelTermSmokeAllOk`; Driver **985** lines (under 1000) |
| Gates | see command table below |

## Gates (exit codes)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckKernelProgramTerm` | 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 |
| `just systems-host` | 0 |
| `just host-residual-shrink` | 0 |
| `just hygiene` | 0 |

## Unchanged honesty

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- tip fullBackend **true** A-light; band FullBackend **false**
- Mult..Extract + EmitPlan/Apply/Body + KernelMult + KernelLinear + KernelTypes TERM dual-ok **unchanged**
- Mult/Linear/Types PROOF dual-ok **unchanged**
- seed modules **206**

## Next

Open C2 continues: next unit **KernelEmit TERM-SURFACE** (Kernel ladder after
KernelProgram). See `WATCHER.md`.

## Paths touched (primary)

- `HostModuleCheckKernelProgramTerm.lean` (new)
- `HostModuleCheckRealModule.lean`, `HostModuleCheckAcceptsGoods.lean`,
  `HostModuleCheckLoadOk.lean`, `HostModuleCheckDriver.lean`,
  `HostModuleCheck.lean`
- `HostResidualShrink.lean`, `HostResidualShrinkTheorems.lean`
- `SystemsLean.lean`
- `just/host.just`, `just/host-without-lake.just`
- `nix/systems-host-presence/{host-leans,required-files,host-specs-compile-path-3}.nix`
- residual / plan / WATCHER / handoff

## Plain English

The host module checker now does more than list KernelProgram defs. For
KernelProgram only, it also checks that key def bodies match the product shapes
(stage ids, fail-closed three-node lower of erased/linear/value program nodes,
ready match over path/graph/compose readiness, ok fold). Twin fixtures that keep
the def names but break those bodies still pass the shallow check and fail the
term-surface check. That is progressive depth under C2, not FullHost, and not
mathlib. Driver stayed under 1000 lines by folding Emit* and Kernel* term smokes
into one compact bool.
