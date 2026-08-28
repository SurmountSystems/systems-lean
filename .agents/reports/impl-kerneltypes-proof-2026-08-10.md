# KernelTypes deeper proof-layer checker (2026-08-10)

## Name
**KernelTypes deeper proof-layer checker**

## Goal
Add a deeper host checker layer for `SystemsLean.KernelTypesTheorems` (PROOF / L3), matching Mult / Linear / Types / KernelMult / KernelLinear PROOF companions. KernelTypes already had TERM; this slice adds PROOF depth only.

## Status
10->**GREEN.** harness **51 -> 52**. seed stays **206**.

## What landed

### New companion (Sub-1-KLOC)
- `src/systems/SystemsLean/HostModuleCheckKernelTypesProof.lean` (275 lines)
  - Scope pin: `KernelTypesTheorems-only`
  - Bar: `PROOF-SURFACE`
  - Claim pin: `hostModuleCheckKernelTypesProofSurfaceDualOk = true`
  - Gate truth: `hostModuleCheckKernelTypesProofSurfaceOk` (E-good dialect + P1/P2 rejects + L0Accept), not bare dualOk
  - Dialect: `stageId_eq` statement + `rfl` body; `kernelTypesId_eq` statement + `rfl` body
  - Reject reason: shared `reasonIllTypedProof` / `ILL-TYPED-PROOF` (from MultProof)
  - Refine: `refineKernelTypesTheoremsWithProofSurface`
  - Compact `native_decide` theorem for SurfaceOk

### RealModule / LoadOk / Accepts / Driver
- `HostModuleCheckRealModule.lean`: `SystemsLean.KernelTypesTheorems` path uses L3 refine (was L0/L1 surface only)
- `HostModuleCheckLoadOk.lean`: folds `hostModuleCheckKernelTypesProofSurfaceOk`
- `HostModuleCheckAcceptsGoods.lean`: full `checkRealModule` good/bad twins + `hostModuleCheckKernelTypesProofSmokeOk`
- `HostModuleCheckDriver.lean`: prints KernelTypes PROOF dual-ok; runs compact smoke fold
- `HostModuleCheck.lean` hub import + greppable header cite
- `HostModuleCheckFixtureTexts.lean`: L0 good KernelTypesTheorems fixture upgraded so `stageId_eq` / `kernelTypesId_eq` match the dialect

### HostResidualShrink (harness 51 -> 52)
- dualOk pin: `hostModuleCheckKernelTypesProofSurfaceDualOk`
- measured bar/scope: `PROOF-SURFACE` / `KernelTypesTheorems-only`
- `measuredHostLibraryOutOfScopeHarness` inserts `HostModuleCheckKernelTypesProof`
- `measuredHostLibraryDiskPartition` = `seed=206+Main=59+harness=52`
- Theorems + smoke examples updated in `HostResidualShrinkTheorems.lean`

### just / pure Nix
- `just/host.just`: harness list, partition 52, dualOk + KernelTypesTheorems-only greps
- `just/host-without-lake.just`: family module path + greppable token set
- `nix/systems-host-presence/host-leans.nix`, `required-files.nix`: new lean path
- `nix/systems-host-presence/host-specs-compile-path-3.nix`: companion tokens, harness 52, dualOk

## Pins UNCHANGED (honesty)
| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | **false** |
| Mult / Linear / Types PROOF dual-ok | true (unchanged) |
| KernelMult PROOF dual-ok | true (unchanged) |
| KernelLinear PROOF dual-ok | true (unchanged) |
| KernelTypes TERM dual-ok | true (unchanged) |
| product seed | 206 |

## Out of scope (held; not this slice)
- KernelProgram / KernelEmit PROOF
- Package env Types expand implement
- FullHost true
- Re-open Mult / Kernel Mult..Linear PROOF foundation as treadmill
- mathlib; product C/shell

## Gates (all exit 0)
| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckKernelTypesProof` | GREEN |
| `lake build SystemsLean.HostModuleCheck` (+ RealModule, LoadOk, Driver, AcceptsGoods) | GREEN |
| `lake build SystemsLean.HostResidualShrink` / Theorems / HostModuleCheckTheorems | GREEN |
| `slake-host-module-check` / `just host-module-check` | GREEN |
| `just host-module-check-without-lake` | GREEN |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Residual lockstep
- Closed **KernelTypes deeper proof-layer checker** in `RESIDUAL-systems.md` Done archive
- Open next: **KernelProgram deeper proof-layer checker** (one unit)
- Parallel Open **Package env Types expand** left intact
- `RESIDUAL.md` join + `WATCHER.md` + `doc/SESSION-HANDOFF.md` living tip updated
- harness tip **52**

## Why this shape
- Mult PROOF checks MultTheorems. KernelTypes PROOF checks KernelTypesTheorems (not KernelTypes TERM defs).
- SurfaceOk is the gate truth; dualOk is the named claim pin only.
- L0 good fixture must satisfy the dialect after RealModule refine, or LoadOk/ready collapse.
- Wrappers live in AcceptsGoods so Accepts / Driver stay under Sub-1-KLOC.

## Next residual Name
**KernelProgram deeper proof-layer checker**
