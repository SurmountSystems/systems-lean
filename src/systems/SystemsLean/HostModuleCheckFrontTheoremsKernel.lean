/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostFrontTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: FrontTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveFrontTheorems parse of live HostFrontTheorems.lean then
    kernelCheck (PARSE-LIVE-FRONT-THEOREMS).
  Live HostFrontTheorems.lean parse is SystemsLean.HostFrontLiveFrontTheorems,
  not the Mult fixture and not the HostFront.lean live parse.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckFrontTheoremsKernel, KERNEL-CHECK, FrontTheorems-only,
  checkFrontTheoremsKernel, hostModuleCheckFrontTheoremsKernelOk,
  hostModuleCheckLiveFrontTheoremsParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckFrontTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckFrontTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveFrontTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveFrontTheorems

/-! ### FrontTheorems KERNEL-CHECK pins (live HostFrontTheorems.lean) -/

/-- Named kernel depth bar for FrontTheorems. Greppable:
    checkDepthFrontTheoremsKernelBar, KERNEL-CHECK, FrontTheorems-only. -/
def checkDepthFrontTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostFrontTheorems live parse only.
    Greppable: checkDepthFrontTheoremsKernelScope, FrontTheorems-only,
    KERNEL-CHECK. -/
def checkDepthFrontTheoremsKernelScope : String := "FrontTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckFrontTheoremsKernelOk).
    Greppable: hostModuleCheckFrontTheoremsKernelDualOk, KERNEL-CHECK,
    FrontTheorems-only. -/
def hostModuleCheckFrontTheoremsKernelDualOk : Bool := true

/-- Live HostFrontTheorems.lean parse kernel-checks. Not the HostTerm Mult
    fixture. Greppable: hostModuleCheckLiveFrontTheoremsParseOk,
    PARSE-LIVE-FRONT-THEOREMS. -/
def hostModuleCheckLiveFrontTheoremsParseOk : Bool :=
  kernelCheckLiveFrontTheoremsSource liveFrontTheoremsSource
    && hostFrontLiveFrontTheoremsReady

/-- Kernel check entry (live FrontTheorems parse + HostKernel ready).
    Greppable: checkFrontTheoremsKernel, KERNEL-CHECK,
    PARSE-LIVE-FRONT-THEOREMS. -/
def checkFrontTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveFrontTheoremsParseOk

/-- Combined FrontTheorems kernel dual-pin.
    Greppable: hostModuleCheckFrontTheoremsKernelOk, KERNEL-CHECK,
    FrontTheorems-only. -/
def hostModuleCheckFrontTheoremsKernelOk : Bool :=
  hostModuleCheckFrontTheoremsKernelDualOk
    && (checkDepthFrontTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthFrontTheoremsKernelScope == "FrontTheorems-only")
    && checkFrontTheoremsKernel

end SystemsLean.HostModuleCheck
