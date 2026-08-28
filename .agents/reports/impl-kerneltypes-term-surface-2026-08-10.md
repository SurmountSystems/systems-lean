# Implement report: C2 KernelTypes TERM-SURFACE (2026-08-10)

Kind: implement summary. Not free/complete/PROVABLY/FullHost flips.

## Goal

Progressive host check depth under Completeness Package **C2** after KernelLinear:
greps-only L2 TERM-SURFACE on `SystemsLean.KernelTypes`.

## Done

| Item | Evidence |
|------|----------|
| Companion | `src/systems/SystemsLean/HostModuleCheckKernelTypesTerm.lean` (~414 lines) |
| Dialect | stageId / kernelTypesId strings; lowerTypesKernel fail-closed three-node lower; typesKernelReady match; unknownKindRejected !Types.isValidKindTag 3; typesKernelOk = typesKernelReady |
| E-bad | KT1..KT4 reject `ILL-TYPED-TERM`; L0 still accepts bad twins |
| Gate | `hostModuleCheckKernelTypesTermSurfaceOk` (not bare dualOk alone) |
| Scope | TERM-SURFACE **KernelTypes-only** dual-ok |
| Wire | `refineKernelTypesWithTermSurface` on `checkRealModule` KernelTypes path |
| Good path | `hostModuleCheckGoodKernelTypes` uses TermText (no FixtureTexts growth) |
| Mirror | HostResidualShrink dual-ok pins + harness **46 -> 47** |
| Driver | compact smoke `hostModuleCheckKernelTypesTermSmokeOk`; Driver **997** lines (under 1000) |
| Gates | see command table below |

## Gates (exit codes)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckKernelTypesTerm` | 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 |
| `just systems-host` | 0 |
| `just host-residual-shrink` | 0 |
| `just hygiene` | 0 |

## Unchanged honesty

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- tip fullBackend **true** A-light; band FullBackend **false**
- Mult..Extract + EmitPlan/Apply/Body + KernelMult + KernelLinear TERM dual-ok **unchanged**
- Mult/Linear/Types PROOF dual-ok **unchanged**
- seed modules **206**

## Next

Open C2 continues: next unit **KernelProgram TERM-SURFACE** (Kernel ladder after
KernelTypes). See `WATCHER.md`.

## Paths touched (primary)

- `HostModuleCheckKernelTypesTerm.lean` (new)
- `HostModuleCheckRealModule.lean`, `HostModuleCheckAcceptsGoods.lean`,
  `HostModuleCheckLoadOk.lean`, `HostModuleCheckDriver.lean`,
  `HostModuleCheck.lean`
- `HostResidualShrink.lean`, `HostResidualShrinkTheorems.lean`
- `SystemsLean.lean`
- `just/host.just`, `just/host-without-lake.just`
- `nix/systems-host-presence/{host-leans,required-files,host-specs-compile-path-3}.nix`
- residual / plan / WATCHER / handoff / README

## Plain English

The host module checker now does more than list KernelTypes defs. For KernelTypes
only, it also checks that key def bodies match the product shapes (stage ids,
fail-closed three-node lower of erased/linear/value typed nodes, ready match,
unknown-kind reject, ok fold). Twin fixtures that keep the def names but break
those bodies still pass the shallow check and fail the term-surface check. That
is progressive depth under C2, not FullHost, and not mathlib.
