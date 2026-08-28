# KernelEmit deeper proof-layer checker (2026-08-10)

## Name
**KernelEmit deeper proof-layer checker**

## Goal
Add a deeper host checker layer for `SystemsLean.KernelEmitTheorems` (PROOF / L3), matching Mult / Linear / Types / KernelMult / KernelLinear / KernelTypes / KernelProgram PROOF companions. KernelEmit already had TERM; this slice adds PROOF depth only.

## Status
**GREEN.** harness **53 -> 54**. seed stays **206**.

## What landed

### New companion (Sub-1-KLOC)
- `src/systems/SystemsLean/HostModuleCheckKernelEmitProof.lean` (276 lines)
  - Scope pin: `KernelEmitTheorems-only`
  - Bar: `PROOF-SURFACE`
  - Claim pin: `hostModuleCheckKernelEmitProofSurfaceDualOk = true`
  - Gate truth: `hostModuleCheckKernelEmitProofSurfaceOk` (E-good dialect + P1/P2 rejects + L0Accept), not bare dualOk
  - Dialect: `stageId_eq` statement + `rfl` body; `kernelEmitId_eq` statement + `rfl` body
  - Reject reason: shared `reasonIllTypedProof` / `ILL-TYPED-PROOF` (from MultProof)
  - Refine: `refineKernelEmitTheoremsWithProofSurface`
  - Compact `native_decide` theorem for SurfaceOk

### RealModule / LoadOk / Accepts / Driver
- `HostModuleCheckRealModule.lean`: `SystemsLean.KernelEmitTheorems` path uses L3 refine (was L0/L1 surface only)
- `HostModuleCheckLoadOk.lean`: folds `hostModuleCheckKernelEmitProofSurfaceOk`
- `HostModuleCheckAcceptsGoods.lean`: full `checkRealModule` good/bad twins + `hostModuleCheckKernelEmitProofSmokeOk`
- `HostModuleCheckDriver.lean`: prints KernelEmit PROOF dual-ok; runs compact smoke fold
- `HostModuleCheck.lean` hub import + greppable header cite
- `HostModuleCheckFixtureTextsLater.lean`: L0 good KernelEmitTheorems fixture upgraded so `stageId_eq` / `kernelEmitId_eq` match the dialect

### HostResidualShrink (harness 53 -> 54)
- dualOk pin: `hostModuleCheckKernelEmitProofSurfaceDualOk`
- measured bar/scope: `PROOF-SURFACE` / `KernelEmitTheorems-only`
- `measuredHostLibraryOutOfScopeHarness` inserts `HostModuleCheckKernelEmitProof`
- `measuredHostLibraryDiskPartition` = `seed=206+Main=59+harness=54`
- Theorems + smoke examples updated in `HostResidualShrinkTheorems.lean`

### just / pure Nix
- `just/host.just`: harness list, partition 54, dualOk + KernelEmitTheorems-only greps
- `just/host-without-lake.just`: family module path + greppable token set
- `nix/systems-host-presence/host-leans.nix`, `required-files.nix`: new lean path
- `nix/systems-host-presence/host-specs-compile-path-3.nix`: companion tokens, harness 54, dualOk

## Pins UNCHANGED (honesty)
| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | **false** |
| Mult / Linear / Types PROOF dual-ok | true (unchanged) |
| KernelMult PROOF dual-ok | true (unchanged) |
| KernelLinear PROOF dual-ok | true (unchanged) |
| KernelTypes PROOF dual-ok | true (unchanged) |
| KernelProgram PROOF dual-ok | true (unchanged) |
| KernelEmit TERM dual-ok | true (unchanged) |
| product seed | 206 |

## Out of scope (held; not this slice)
- Package env Types expand implement
- FullHost true
- Re-open Mult / Kernel Mult..Program PROOF foundation as treadmill
- mathlib; product C/shell

## Gates (all exit 0)
| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckKernelEmitProof` | GREEN |
| `lake build SystemsLean.HostModuleCheck` (+ RealModule, LoadOk, Driver, AcceptsGoods) | GREEN |
| `lake build SystemsLean.HostResidualShrink` / Theorems / HostModuleCheckTheorems | GREEN |
| `slake-host-module-check` / `just host-module-check` | GREEN |
| `just host-module-check-without-lake` | GREEN |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Residual lockstep
- Closed **KernelEmit deeper proof-layer checker** in `RESIDUAL-systems.md` Done archive
- Open next (WATCHER primary): **Package env Types expand** (FullHost meet H2)
- Package env Types expand kept Open with full Done when
- `RESIDUAL.md` join + `WATCHER.md` + `doc/SESSION-HANDOFF.md` living tip updated
- harness tip **54**

## Why this shape
- Mult PROOF checks MultTheorems. KernelEmit PROOF checks KernelEmitTheorems (not KernelEmit TERM defs).
- SurfaceOk is the gate truth; dualOk is the named claim pin only.
- L0 good fixture must satisfy the dialect after RealModule refine, or LoadOk/ready collapse.
- Wrappers live in AcceptsGoods so Accepts / Driver stay thinner.

## Next residual Name
**Package env Types expand**
