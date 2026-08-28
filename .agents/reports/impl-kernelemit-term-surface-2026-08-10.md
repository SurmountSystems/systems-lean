# Implement report: C2 KernelEmit TERM-SURFACE (2026-08-10)

Kind: implement summary. Not free/complete/PROVABLY/FullHost flips.

## Goal

Progressive host check depth under Completeness Package **C2** after KernelProgram:
greps-only L2 TERM-SURFACE on `SystemsLean.KernelEmit`.

## Done

| Item | Evidence |
|------|----------|
| Companion | `src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean` (~393 lines) |
| Dialect | stageId / kernelEmitId strings; lowerEmitCompose fail-closed mark+mint; emitKernelReady path fold; emitKernelOk = emitKernelReady |
| E-bad | KE1..KE4 reject `ILL-TYPED-TERM`; L0 still accepts bad twins |
| Gate | `hostModuleCheckKernelEmitTermSurfaceOk` (not bare dualOk alone) |
| Scope | TERM-SURFACE **KernelEmit-only** dual-ok |
| Wire | `refineKernelEmitWithTermSurface` on `checkRealModule` KernelEmit path |
| Good path | `hostModuleCheckGoodKernelEmit` uses TermText (no FixtureTexts growth) |
| Mirror | HostResidualShrink dual-ok pins + harness **48 -> 49** |
| AcceptsGoods fold | Kernel Mult..Emit full-path smokes compact inline (AcceptsGoods **897** lines) |
| Driver | Emit*+Kernel* smokes still one fold; Kernel dualOk print folded; Driver **984** |
| Gates | see command table below |

## Gates (exit codes)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckKernelEmitTerm` | 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 |
| `just systems-host` | 0 |
| `just host-residual-shrink` | 0 |
| `just hygiene` | 0 |

## Unchanged honesty

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- tip fullBackend **true** A-light; band FullBackend **false**
- Mult..Extract + EmitPlan/Apply/Body + KernelMult + KernelLinear + KernelTypes + KernelProgram TERM dual-ok **unchanged**
- Mult/Linear/Types PROOF dual-ok **unchanged**
- seed modules **206**

## Next

Open C2 continues: **P5 honest stop** (Kernel Mult..Emit TERM ladder closed;
document FullHost gap; FullHost stays false). See `WATCHER.md`.

## Paths touched (primary)

- `HostModuleCheckKernelEmitTerm.lean` (new)
- `HostModuleCheckRealModule.lean`, `HostModuleCheckAcceptsGoods.lean`,
  `HostModuleCheckLoadOk.lean`, `HostModuleCheckDriver.lean`,
  `SystemsLean.lean`
- `HostResidualShrink.lean`, `HostResidualShrinkTheorems.lean`
- `just/host.just`, `just/host-without-lake.just`
- `nix/systems-host-presence/{host-leans,required-files,host-specs-compile-path-3}.nix`
- residual / plan / WATCHER / handoff

## Plain English

The host module checker now does more than list KernelEmit defs. For KernelEmit
only, it also checks that key def bodies match the product shapes (stage ids,
fail-closed lower of program compose with mark+mint, ready fold over plan/apply
/body/mult/surface paths, ok fold). Twin fixtures that keep the def names but
break those bodies still pass the shallow check and fail the term-surface check.
That is progressive depth under C2, not FullHost, and not mathlib. Kernel Mult
through Emit TERM dual-ok are all true; harness is 49. AcceptsGoods stayed under
1000 lines by compacting Kernel twin smokes to inline checkRealModule calls.
