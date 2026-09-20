/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for ErasureTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ErasureTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveErasureTheorems parse of live ErasureTheorems.lean then
    kernelCheck (PARSE-LIVE-ERASURE-THEOREMS).
  Live ErasureTheorems.lean parse is SystemsLean.HostFrontLiveErasureTheorems,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckErasureTheoremsKernel,
  KERNEL-CHECK, ErasureTheorems-only, checkErasureTheoremsKernel,
  hostModuleCheckErasureTheoremsKernelOk, hostModuleCheckLiveErasureTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckErasureTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckErasureTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveErasureTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveErasureTheorems

/-! ### ErasureTheorems KERNEL-CHECK pins (live ErasureTheorems.lean) -/

/-- Named kernel depth bar for ErasureTheorems.
    Greppable: checkDepthErasureTheoremsKernelBar, KERNEL-CHECK,
    ErasureTheorems-only. -/
def checkDepthErasureTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.ErasureTheorems live parse only.
    Greppable: checkDepthErasureTheoremsKernelScope, ErasureTheorems-only,
    KERNEL-CHECK. -/
def checkDepthErasureTheoremsKernelScope : String := "ErasureTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckErasureTheoremsKernelOk).
    Greppable: hostModuleCheckErasureTheoremsKernelDualOk, KERNEL-CHECK,
    ErasureTheorems-only. -/
def hostModuleCheckErasureTheoremsKernelDualOk : Bool := true

/-- Live ErasureTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveErasureTheoremsParseOk, PARSE-LIVE-ERASURE-THEOREMS. -/
def hostModuleCheckLiveErasureTheoremsParseOk : Bool :=
  kernelCheckLiveErasureTheoremsSource liveErasureTheoremsSource
    && hostFrontLiveErasureTheoremsReady

/-- Kernel check entry (live ErasureTheorems parse + HostKernel ready).
    Greppable: checkErasureTheoremsKernel, KERNEL-CHECK, PARSE-LIVE-ERASURE-THEOREMS. -/
def checkErasureTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveErasureTheoremsParseOk

/-- Combined ErasureTheorems kernel dual-pin.
    Greppable: hostModuleCheckErasureTheoremsKernelOk, KERNEL-CHECK,
    ErasureTheorems-only. -/
def hostModuleCheckErasureTheoremsKernelOk : Bool :=
  hostModuleCheckErasureTheoremsKernelDualOk
    && (checkDepthErasureTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthErasureTheoremsKernelScope == "ErasureTheorems-only")
    && checkErasureTheoremsKernel

end SystemsLean.HostModuleCheck
