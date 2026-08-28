# Wave 1 Track A -- KernelMult proof-layer checker (2026-08-10)

## Name
**KernelMult proof-layer checker**

## Goal
Add a deeper host checker layer for `SystemsLean.KernelMultTheorems` (PROOF / L3), matching Mult / Linear / Types PROOF companions. KernelMult already had TERM; this slice adds PROOF depth only.

## What landed

### New companion (Sub-1-KLOC)
- `src/systems/SystemsLean/HostModuleCheckKernelMultProof.lean` (~271 lines)
  - Scope pin: `KernelMultTheorems-only`
  - Bar: `PROOF-SURFACE`
  - Claim pin: `hostModuleCheckKernelMultProofSurfaceDualOk = true`
  - Gate truth: `hostModuleCheckKernelMultProofSurfaceOk` (E-good dialect + P1/P2 rejects + L0Accept), not bare dualOk
  - Dialect: `stageId_eq` statement + `rfl` body; `kernelMultId_eq` statement + `rfl` body
  - Reject reason: shared `reasonIllTypedProof` / `ILL-TYPED-PROOF` (from MultProof)
  - Refine: `refineKernelMultTheoremsWithProofSurface`
  - Compact `native_decide` theorem for SurfaceOk (HostModuleCheckTheorems stays at limit)

### RealModule / LoadOk / Accepts / Driver
- `HostModuleCheckRealModule.lean`: `SystemsLean.KernelMultTheorems` path uses L3 refine (was L0/L1 surface only)
- `HostModuleCheckLoadOk.lean`: folds `hostModuleCheckKernelMultProofSurfaceOk`
- `HostModuleCheckAcceptsGoods.lean`: full `checkRealModule` good/bad twins + `hostModuleCheckKernelMultProofSmokeOk`
- `HostModuleCheckDriver.lean`: prints KernelMult PROOF dual-ok; runs compact smoke fold
- `HostModuleCheck.lean` hub import + greppable header cite
- `HostModuleCheckFixtureTexts.lean`: L0 good KernelMultTheorems fixture upgraded so `stageId_eq` / `kernelMultId_eq` match the dialect (same pattern as MultTheorems good fixture when Mult PROOF landed)

### HostResidualShrink (harness 49 -> 50)
- dualOk pin: `hostModuleCheckKernelMultProofSurfaceDualOk`
- measured bar/scope: `PROOF-SURFACE` / `KernelMultTheorems-only`
- `measuredHostLibraryOutOfScopeHarness` inserts `HostModuleCheckKernelMultProof`
- `measuredHostLibraryDiskPartition` = `seed=206+Main=59+harness=50`
- Theorems + smoke examples updated in `HostResidualShrinkTheorems.lean`

### just / pure Nix
- `just/host.just`: harness list, partition 50, dualOk + KernelMultTheorems-only greps
- `just/host-without-lake.just`: family module path + greppable token set
- `nix/systems-host-presence/host-leans.nix`, `required-files.nix`: new lean path
- `nix/systems-host-presence/host-specs-compile-path-3.nix`: companion tokens, refine cite, harness 50, dualOk

## Pins UNCHANGED (honesty)
| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (unchanged) |
| FullHostElaborateRemains | **false** |
| Mult / Linear / Types PROOF dual-ok | true (unchanged) |
| KernelMult TERM dual-ok | true (unchanged) |
| product seed | 206 |

## Out of scope (held; not this slice)
- KernelLinear / KernelTypes / KernelProgram / KernelEmit PROOF
- FullHost true
- Re-open Mult PROOF foundation as treadmill
- AffineDrop dual; FullHost bar docs
- Residual Open lockstep for all three Wave 1 Names (closeout mop owns shared residual; Track A done recorded here only)

## Gates (all exit 0)
| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckKernelMultProof` | GREEN |
| `lake build SystemsLean.HostModuleCheck` (+ RealModule, LoadOk, Driver, AcceptsGoods) | GREEN |
| `lake build SystemsLean.HostResidualShrink` / Theorems / HostModuleCheckTheorems | GREEN |
| `slake-host-module-check` / `just host-module-check` | GREEN |
| `just host-module-check-without-lake` | GREEN |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Why this shape
- Mult PROOF checks MultTheorems (not Mult defs). KernelMult PROOF checks KernelMultTheorems (not KernelMult TERM defs).
- SurfaceOk is the gate truth; dualOk is the named claim pin only.
- L0 good fixture must satisfy the dialect after RealModule refine, or LoadOk/ready collapse (caught red, then fixed fixture text).
- Wrappers live in AcceptsGoods so Accepts / Driver stay under Sub-1-KLOC.

## Track A status
**Done.** Residual Open closeout for the three Wave 1 Names is for the shared mop; this report is the Track A completion record.
