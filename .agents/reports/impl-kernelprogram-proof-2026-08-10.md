# KernelProgram deeper proof-layer checker (2026-08-10)

## Name
**KernelProgram deeper proof-layer checker**

## Goal
Add a deeper host checker layer for `SystemsLean.KernelProgramTheorems` (PROOF / L3), matching Mult / Linear / Types / KernelMult / KernelLinear / KernelTypes PROOF companions. KernelProgram already had TERM; this slice adds PROOF depth only.

## Status
**GREEN.** harness **52 -> 53**. seed stays **206**.

## What landed

### New companion (Sub-1-KLOC)
- `src/systems/SystemsLean/HostModuleCheckKernelProgramProof.lean` (276 lines)
  - Scope pin: `KernelProgramTheorems-only`
  - Bar: `PROOF-SURFACE`
  - Claim pin: `hostModuleCheckKernelProgramProofSurfaceDualOk = true`
  - Gate truth: `hostModuleCheckKernelProgramProofSurfaceOk` (E-good dialect + P1/P2 rejects + L0Accept), not bare dualOk
  - Dialect: `stageId_eq` statement + `rfl` body; `kernelProgramId_eq` statement + `rfl` body
  - Reject reason: shared `reasonIllTypedProof` / `ILL-TYPED-PROOF` (from MultProof)
  - Refine: `refineKernelProgramTheoremsWithProofSurface`
  - Compact `native_decide` theorem for SurfaceOk

### RealModule / LoadOk / Accepts / Driver
- `HostModuleCheckRealModule.lean`: `SystemsLean.KernelProgramTheorems` path uses L3 refine (was L0/L1 surface only)
- `HostModuleCheckLoadOk.lean`: folds `hostModuleCheckKernelProgramProofSurfaceOk`
- `HostModuleCheckAcceptsGoods.lean`: full `checkRealModule` good/bad twins + `hostModuleCheckKernelProgramProofSmokeOk`
- `HostModuleCheckDriver.lean`: prints KernelProgram PROOF dual-ok; runs compact smoke fold
- `HostModuleCheck.lean` hub import + greppable header cite
- `HostModuleCheckFixtureTexts.lean`: L0 good KernelProgramTheorems fixture upgraded so `stageId_eq` / `kernelProgramId_eq` match the dialect

### HostResidualShrink (harness 52 -> 53)
- dualOk pin: `hostModuleCheckKernelProgramProofSurfaceDualOk`
- measured bar/scope: `PROOF-SURFACE` / `KernelProgramTheorems-only`
- `measuredHostLibraryOutOfScopeHarness` inserts `HostModuleCheckKernelProgramProof`
- `measuredHostLibraryDiskPartition` = `seed=206+Main=59+harness=53`
- Theorems + smoke examples updated in `HostResidualShrinkTheorems.lean`

### just / pure Nix
- `just/host.just`: harness list, partition 53, dualOk + KernelProgramTheorems-only greps
- `just/host-without-lake.just`: family module path + greppable token set
- `nix/systems-host-presence/host-leans.nix`, `required-files.nix`: new lean path
- `nix/systems-host-presence/host-specs-compile-path-3.nix`: companion tokens, harness 53, dualOk

## Pins UNCHANGED (honesty)
| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | **false** |
| Mult / Linear / Types PROOF dual-ok | true (unchanged) |
| KernelMult PROOF dual-ok | true (unchanged) |
| KernelLinear PROOF dual-ok | true (unchanged) |
| KernelTypes PROOF dual-ok | true (unchanged) |
| KernelProgram TERM dual-ok | true (unchanged) |
| product seed | 206 |

## Out of scope (held; not this slice)
- KernelEmit PROOF implement
- Package env Types expand implement
- FullHost true
- Re-open Mult / Kernel Mult..Types PROOF foundation as treadmill
- mathlib; product C/shell

## Gates (all exit 0)
| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckKernelProgramProof` | GREEN |
| `lake build SystemsLean.HostModuleCheck` (+ RealModule, LoadOk, Driver, AcceptsGoods) | GREEN |
| `lake build SystemsLean.HostResidualShrink` / Theorems / HostModuleCheckTheorems | GREEN |
| `slake-host-module-check` / `just host-module-check` | GREEN |
| `just host-module-check-without-lake` | GREEN |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Residual lockstep
- Closed **KernelProgram deeper proof-layer checker** in `RESIDUAL-systems.md` Done archive
- Open next: **KernelEmit deeper proof-layer checker** (one unit)
- Parallel Open **Package env Types expand** left intact
- `RESIDUAL.md` join + `WATCHER.md` + `doc/SESSION-HANDOFF.md` living tip updated
- harness tip **53**

## Why this shape
- Mult PROOF checks MultTheorems. KernelProgram PROOF checks KernelProgramTheorems (not KernelProgram TERM defs).
- SurfaceOk is the gate truth; dualOk is the named claim pin only.
- L0 good fixture must satisfy the dialect after RealModule refine, or LoadOk/ready collapse.
- Wrappers live in AcceptsGoods so Accepts / Driver stay under Sub-1-KLOC.

## Next residual Name
**KernelEmit deeper proof-layer checker**
