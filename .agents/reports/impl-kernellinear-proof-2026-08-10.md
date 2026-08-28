# KernelLinear deeper proof-layer checker (2026-08-10)

## Name
**KernelLinear deeper proof-layer checker**

## Goal
Add a deeper host checker layer for `SystemsLean.KernelLinearTheorems` (PROOF / L3), matching Mult / Linear / Types / KernelMult PROOF companions. KernelLinear already had TERM; this slice adds PROOF depth only.

## Status
**GREEN.** harness **50 -> 51**. seed stays **206**.

## What landed

### New companion (Sub-1-KLOC)
- `src/systems/SystemsLean/HostModuleCheckKernelLinearProof.lean` (275 lines)
  - Scope pin: `KernelLinearTheorems-only`
  - Bar: `PROOF-SURFACE`
  - Claim pin: `hostModuleCheckKernelLinearProofSurfaceDualOk = true`
  - Gate truth: `hostModuleCheckKernelLinearProofSurfaceOk` (E-good dialect + P1/P2 rejects + L0Accept), not bare dualOk
  - Dialect: `stageId_eq` statement + `rfl` body; `kernelLinearId_eq` statement + `rfl` body
  - Reject reason: shared `reasonIllTypedProof` / `ILL-TYPED-PROOF` (from MultProof)
  - Refine: `refineKernelLinearTheoremsWithProofSurface`
  - Compact `native_decide` theorem for SurfaceOk

### RealModule / LoadOk / Accepts / Driver
- `HostModuleCheckRealModule.lean`: `SystemsLean.KernelLinearTheorems` path uses L3 refine (was L0/L1 surface only)
- `HostModuleCheckLoadOk.lean`: folds `hostModuleCheckKernelLinearProofSurfaceOk`
- `HostModuleCheckAcceptsGoods.lean`: full `checkRealModule` good/bad twins + `hostModuleCheckKernelLinearProofSmokeOk`
- `HostModuleCheckDriver.lean`: prints KernelLinear PROOF dual-ok; runs compact smoke fold
- `HostModuleCheck.lean` hub import + greppable header cite
- `HostModuleCheckFixtureTexts.lean`: L0 good KernelLinearTheorems fixture upgraded so `stageId_eq` / `kernelLinearId_eq` match the dialect

### HostResidualShrink (harness 50 -> 51)
- dualOk pin: `hostModuleCheckKernelLinearProofSurfaceDualOk`
- measured bar/scope: `PROOF-SURFACE` / `KernelLinearTheorems-only`
- `measuredHostLibraryOutOfScopeHarness` inserts `HostModuleCheckKernelLinearProof`
- `measuredHostLibraryDiskPartition` = `seed=206+Main=59+harness=51`
- Theorems + smoke examples updated in `HostResidualShrinkTheorems.lean`

### just / pure Nix
- `just/host.just`: harness list, partition 51, dualOk + KernelLinearTheorems-only greps
- `just/host-without-lake.just`: family module path + greppable token set
- `nix/systems-host-presence/host-leans.nix`, `required-files.nix`: new lean path
- `nix/systems-host-presence/host-specs-compile-path-3.nix`: companion tokens, harness 51, dualOk

## Pins UNCHANGED (honesty)
| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | **false** |
| Mult / Linear / Types PROOF dual-ok | true (unchanged) |
| KernelMult PROOF dual-ok | true (unchanged) |
| KernelLinear TERM dual-ok | true (unchanged) |
| product seed | 206 |

## Out of scope (held; not this slice)
- KernelTypes / KernelProgram / KernelEmit PROOF
- FullHost true
- Re-open Mult / KernelMult PROOF foundation as treadmill
- mathlib; product C/shell

## Gates (all exit 0)
| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckKernelLinearProof` | GREEN |
| `lake build SystemsLean.HostModuleCheck` (+ RealModule, LoadOk, Driver, AcceptsGoods) | GREEN |
| `lake build SystemsLean.HostResidualShrink` / Theorems / HostModuleCheckTheorems | GREEN |
| `slake-host-module-check` / `just host-module-check` | GREEN |
| `just host-module-check-without-lake` | GREEN |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Residual lockstep
- Closed **KernelLinear deeper proof-layer checker** in `RESIDUAL-systems.md` Done archive
- Open next: **KernelTypes deeper proof-layer checker** (one unit)
- `RESIDUAL.md` join + `WATCHER.md` + `doc/SESSION-HANDOFF.md` living tip updated
- harness tip **51**

## Why this shape
- Mult PROOF checks MultTheorems. KernelMult PROOF checks KernelMultTheorems. KernelLinear PROOF checks KernelLinearTheorems (not KernelLinear TERM defs).
- SurfaceOk is the gate truth; dualOk is the named claim pin only.
- L0 good fixture must satisfy the dialect after RealModule refine, or LoadOk/ready collapse.
- Wrappers live in AcceptsGoods so Accepts / Driver stay under Sub-1-KLOC.

## Next residual Name
**KernelTypes deeper proof-layer checker**
