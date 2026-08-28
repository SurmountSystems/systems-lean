# Implement report: C2a KernelMult TERM-SURFACE (2026-08-10)

Kind: implement summary. Not free/complete/PROVABLY/FullHost flips.

## Goal

First progressive host check depth slice under Completeness Package **C2** after
EmitBody: greps-only L2 TERM-SURFACE on `SystemsLean.KernelMult`.

## Done

| Item | Evidence |
|------|----------|
| Companion | `src/systems/SystemsLean/HostModuleCheckKernelMultTerm.lean` (~389 lines) |
| Dialect | stageId / kernelMultId strings; lowerMultKernel fail-closed three-node lower; multKernelReady match; unknownTagRejected `!Mult.isValidTag 3`; kernelOk fold |
| E-bad | KM1..KM4 reject `ILL-TYPED-TERM`; L0 still accepts bad twins |
| Gate | `hostModuleCheckKernelMultTermSurfaceOk` (not bare dualOk alone) |
| Scope | TERM-SURFACE **KernelMult-only** dual-ok |
| Wire | `refineKernelMultWithTermSurface` on `checkRealModule` KernelMult path |
| Mirror | HostResidualShrink dual-ok pins + harness **44 -> 45** (compact TERM pin block for Sub-1-KLOC) |
| L0 good fixture | `hostModuleCheckGoodKernelMultText` bodies updated so refine accepts product-faithful dialect |
| Driver | compact smoke `hostModuleCheckKernelMultTermSmokeOk`; Driver comments trimmed under 1000 |
| Gates | `lake build` family + `slake-host-module-check` GREEN; `just host-module-check-without-lake` GREEN; `just systems-host` GREEN; `just hygiene` GREEN |

## Unchanged honesty

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- tip fullBackend **true** A-light; band FullBackend **false**
- Mult..Extract + EmitPlan/Apply/Body TERM dual-ok **unchanged**
- Mult/Linear/Types PROOF dual-ok **unchanged**
- seed modules **206**

## Next

Open C2 continues: next unit **KernelLinear TERM-SURFACE** (Kernel ladder after
KernelMult). See `WATCHER.md`.

## Paths touched (primary)

- `HostModuleCheckKernelMultTerm.lean` (new)
- `HostModuleCheckRealModule.lean`, `HostModuleCheckAcceptsGoods.lean`,
  `HostModuleCheckLoadOk.lean`, `HostModuleCheckDriver.lean`,
  `HostModuleCheck.lean`, `HostModuleCheckFixtureTexts.lean`,
  `HostModuleCheckSeeds.lean`
- `HostResidualShrink.lean`, `HostResidualShrinkTheorems.lean`
- `SystemsLean.lean`
- `just/host.just`, `just/host-without-lake.just`
- `nix/systems-host-presence/{host-leans,required-files,host-specs-compile-path-3}.nix`
- residual / plan / WATCHER / handoff

## Plain English

The host module checker now does more than list KernelMult defs. For KernelMult
only, it also checks that key def bodies match the product shapes (stage ids,
fail-closed lower of three Mult grades, ready match, unknown-tag reject). Twin
fixtures that keep the def names but break those bodies still pass the shallow
check and fail the term-surface check. That is progressive depth under C2, not
FullHost, and not mathlib.
