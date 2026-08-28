# Implement report: C2 KernelLinear TERM-SURFACE (2026-08-10)

Kind: implement summary. Not free/complete/PROVABLY/FullHost flips.

## Goal

Progressive host check depth under Completeness Package **C2** after KernelMult:
greps-only L2 TERM-SURFACE on `SystemsLean.KernelLinear`.

## Done

| Item | Evidence |
|------|----------|
| Companion | `src/systems/SystemsLean/HostModuleCheckKernelLinearTerm.lean` (~384 lines) |
| Dialect | stageId / kernelLinearId strings; lowerLinearKernel fail-closed one-node lower; linearKernelReady match; linearMismatchRejected dual mkNode? isNone; linearKernelOk fold |
| E-bad | KL1..KL4 reject `ILL-TYPED-TERM`; L0 still accepts bad twins |
| Gate | `hostModuleCheckKernelLinearTermSurfaceOk` (not bare dualOk alone) |
| Scope | TERM-SURFACE **KernelLinear-only** dual-ok |
| Wire | `refineKernelLinearWithTermSurface` on `checkRealModule` KernelLinear path |
| Good path | `hostModuleCheckGoodKernelLinear` uses TermText (no FixtureTexts growth) |
| Mirror | HostResidualShrink dual-ok pins + harness **45 -> 46** |
| Driver | compact smoke `hostModuleCheckKernelLinearTermSmokeOk`; Driver **992** lines (under 1000) |
| Gates | see command table below |

## Gates (exit codes)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckKernelLinearTerm` | 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 |
| `just systems-host` | 0 |
| `just host-residual-shrink` | 0 |
| `just hygiene` | 0 |

## Unchanged honesty

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- tip fullBackend **true** A-light; band FullBackend **false**
- Mult..Extract + EmitPlan/Apply/Body + KernelMult TERM dual-ok **unchanged**
- Mult/Linear/Types PROOF dual-ok **unchanged**
- seed modules **206**

## Next

Open C2 continues: next unit **KernelTypes TERM-SURFACE** (Kernel ladder after
KernelLinear). See `WATCHER.md`.

## Paths touched (primary)

- `HostModuleCheckKernelLinearTerm.lean` (new)
- `HostModuleCheckRealModule.lean`, `HostModuleCheckAcceptsGoods.lean`,
  `HostModuleCheckLoadOk.lean`, `HostModuleCheckDriver.lean`,
  `HostModuleCheck.lean`
- `HostResidualShrink.lean`, `HostResidualShrinkTheorems.lean`
- `SystemsLean.lean`
- `just/host.just`, `just/host-without-lake.just`
- `nix/systems-host-presence/{host-leans,required-files,host-specs-compile-path-3}.nix`
- residual / plan / WATCHER / handoff

## Plain English

The host module checker now does more than list KernelLinear defs. For KernelLinear
only, it also checks that key def bodies match the product shapes (stage ids,
fail-closed one-node lower of a MULT-1 linear node, ready match, kind/mult mismatch
reject). Twin fixtures that keep the def names but break those bodies still pass the
shallow check and fail the term-surface check. That is progressive depth under C2,
not FullHost, and not mathlib.
