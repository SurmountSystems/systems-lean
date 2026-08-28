# Implement report: W3b ParityEmit TERM-SURFACE (2026-08-11)

## Status: GREEN

W3b lands ParityEmit L2 TERM-SURFACE dual-ok as the fifth post-Kernel named host
unit TERM companion (after ParityMult, ParityLinear, ParityTypes, ParityProgram).
Together with W3a, residual **W3** ParityProgram and ParityEmit TERM-SURFACE is
**closed**. Living tip harness **60 -> 61**.

## What landed

| Surface | Change |
|---------|--------|
| `src/systems/SystemsLean/HostModuleCheckParityEmitTerm.lean` | New companion (401 lines). E-good + PE1..PE4 ILL-TYPED-TERM twins; dialect on stageId / hostParityEmitId / selfHostParityEmitId / emitContractParityOk / emitParityReady / emitParityOk; dualOk + SurfaceOk gate; native_decide theorem. |
| `HostModuleCheckRealModule.lean` | Import + `refineParityEmitWithTermSurface` on `SystemsLean.ParityEmit`. |
| `HostModuleCheckLoadOk.lean` | Import; `hostModuleCheckParityEmitTermSmokeOk`; LoadOk fold SurfaceOk + smoke. |
| `HostModuleCheckDriver.lean` | Import; Driver explicit dual-pin smoke. |
| `HostModuleCheck.lean` / `SystemsLean.lean` | Import + greppable hub list. |
| `HostResidualShrink.lean` | Mirror dualOk / bar / scope; harness list inserts `HostModuleCheckParityEmitTerm`; partition `seed=206+Main=59+harness=61`. |
| `HostResidualShrinkTheorems.lean` | Partition + harness list equality mirror. |
| `just/host.just` | Harness list, partition greps, dualOk + ParityEmit-only scope greps. |
| `nix/systems-host-presence/*` | `host-leans.nix`, `required-files.nix`, `host-specs-compile-path-3.nix` (new ParityEmitTerm presence block + Shrink dualOk tokens + partition 61). |
| Residual / WATCHER / handoff / RESIDUAL.md | W3 **done**; open W1/W2/W5; living tip harness **61**. |

### Dialect (ParityEmit-only, not full elaborator)

Documented L2 subset matching live `ParityEmit.lean`:

- `stageId` body `"SLAKE_SELF_HOST_PARITY_EMIT_V0"`
- `hostParityEmitId` body `"HOST-PARITY-EMIT"`
- `selfHostParityEmitId` body `"SELF-HOST-PARITY-EMIT"`
- `emitContractParityOk` fail-closed:
  `KernelEmit.emitKernelReady && KernelEmit.emitPlanPathReady && KernelEmit.emitApplyPathReady && KernelEmit.emitBodyPathReady && EmitMult.emitMultReady && ParityProgram.programParityReady && productApiSurfaceOk`
- `emitParityReady` = `emitContractParityOk && paritySurfaceOk`
- `emitParityOk` definitional alias of `emitParityReady`

E-bad twins (L0 still accepts when tokens present; L2 rejects `ILL-TYPED-TERM`):

| Id | Mutation |
|----|----------|
| PE1 | wrong stageId string |
| PE2 | `emitParityReady := true` (drops fail-closed) |
| PE3 | `emitParityOk := true` (drops definitional alias) |
| PE4 | `emitContractParityOk := true` (drops Kernel+EmitMult+Program+API compose) |

Gate truth is `hostModuleCheckParityEmitTermSurfaceOk` (not bare dualOk alone).

## Commands and exits

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostModuleCheckParityEmitTerm` | 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems` | 0 |
| `just systems-host` | 0 (274 required paths) |
| `just hygiene` | 0 |
| `just host-residual-shrink` | 0 GREEN |
| `just host-module-check-without-lake` | 0 GREEN |

## Pins (unchanged honesty)

| Pin | Value |
|-----|-------|
| free / complete / PROVABLY | **true** (unchanged) |
| FullHostElaborateRemains | **false** (unchanged) |
| DominanceClaimed / band FullBackend | **false** (unchanged) |
| seed / harness partition | **seed=206+Main=59+harness=61** |
| package-env living band | Mult..ParityTypes (W1 still owns Program/Emit package-env) |
| ParityEmit TERM dual-ok | **true** (new) |
| ParityProgram TERM dual-ok | **true** (W3a; unchanged) |

## Residual

- **W3 closed** (Program + Emit TERM dual-ok; harness 61).
- Open remains: **W1** package-env ParityProgram/Emit bands; **W2** FullHost meet; **W5** completeness polish.
- Out of scope honored: no package-env rewrite, no FullHost flip, no pin forge, no git commit.

## Line counts

| File | Lines |
|------|------:|
| `HostModuleCheckParityEmitTerm.lean` (new) | 401 (Sub-1-KLOC) |
| `HostResidualShrink.lean` | 948 |
| `HostModuleCheckLoadOk.lean` | 1035 (pre-existing over bar; W3a already over; +~20 this slice) |
| `HostModuleCheckDriver.lean` | 1030 (same class) |

LoadOk/Driver Sub-1-KLOC paydown is not this Name; new companion stays under 1000.

## Non-claims

- Not package elaborate / package-env ParityEmit band (that is **W1**).
- Not FullHostElaborateRemains true.
- Not full Lean 4 elaborator typecheck.
- Not freestanding residual free re-open; not PROVABLY rebrand.
- Not mathlib day-one.
