/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for MultTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveMultTheorems parse of live MultTheorems.lean then
    kernelCheck (PARSE-LIVE-MULT-THEOREMS).
  Live MultTheorems.lean parse is SystemsLean.HostFrontLiveMultTheorems,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckMultTheoremsKernel,
  KERNEL-CHECK, MultTheorems-only, checkMultTheoremsKernel,
  hostModuleCheckMultTheoremsKernelOk, hostModuleCheckLiveMultTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckMultTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckMultTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveMultTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMultTheorems

/-! ### MultTheorems KERNEL-CHECK pins (live MultTheorems.lean) -/

/-- Named kernel depth bar for MultTheorems.
    Greppable: checkDepthMultTheoremsKernelBar, KERNEL-CHECK,
    MultTheorems-only. -/
def checkDepthMultTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.MultTheorems live parse only.
    Greppable: checkDepthMultTheoremsKernelScope, MultTheorems-only,
    KERNEL-CHECK. -/
def checkDepthMultTheoremsKernelScope : String := "MultTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckMultTheoremsKernelOk).
    Greppable: hostModuleCheckMultTheoremsKernelDualOk, KERNEL-CHECK,
    MultTheorems-only. -/
def hostModuleCheckMultTheoremsKernelDualOk : Bool := true

/-- Live MultTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveMultTheoremsParseOk, PARSE-LIVE-MULT-THEOREMS. -/
def hostModuleCheckLiveMultTheoremsParseOk : Bool :=
  kernelCheckLiveMultTheoremsSource liveMultTheoremsSource
    && hostFrontLiveMultTheoremsReady

/-- Kernel check entry (live MultTheorems parse + HostKernel ready).
    Greppable: checkMultTheoremsKernel, KERNEL-CHECK, PARSE-LIVE-MULT-THEOREMS. -/
def checkMultTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveMultTheoremsParseOk

/-- Combined MultTheorems kernel dual-pin.
    Greppable: hostModuleCheckMultTheoremsKernelOk, KERNEL-CHECK,
    MultTheorems-only. -/
def hostModuleCheckMultTheoremsKernelOk : Bool :=
  hostModuleCheckMultTheoremsKernelDualOk
    && (checkDepthMultTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthMultTheoremsKernelScope == "MultTheorems-only")
    && checkMultTheoremsKernel

end SystemsLean.HostModuleCheck
