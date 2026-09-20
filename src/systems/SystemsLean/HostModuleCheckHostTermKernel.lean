/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.HostTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostTerm KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveHostTerm parse of live HostTerm.lean then kernelCheck
    (PARSE-LIVE-HOSTTERM).
  Live HostTerm.lean parse is SystemsLean.HostFrontLiveHostTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckHostTermKernel,
  KERNEL-CHECK, HostTerm-only, checkHostTermKernel, hostModuleCheckHostTermKernelOk,
  hostModuleCheckLiveHostTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckHostTermKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckHostTermKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveHostTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveHostTerm

/-! ### HostTerm KERNEL-CHECK pins (live HostTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostTerm. Greppable: checkDepthHostTermKernelBar,
    KERNEL-CHECK, HostTerm-only. -/
def checkDepthHostTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostTerm live parse only.
    Greppable: checkDepthHostTermKernelScope, HostTerm-only, KERNEL-CHECK. -/
def checkDepthHostTermKernelScope : String := "HostTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckHostTermKernelOk).
    Greppable: hostModuleCheckHostTermKernelDualOk, KERNEL-CHECK, HostTerm-only. -/
def hostModuleCheckHostTermKernelDualOk : Bool := true

/-- Live HostTerm.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveHostTermParseOk, PARSE-LIVE-HOSTTERM. -/
def hostModuleCheckLiveHostTermParseOk : Bool :=
  kernelCheckLiveHostTermSource liveHostTermSource && hostFrontLiveHostTermReady

/-- Kernel check entry (live HostTerm parse + HostKernel ready).
    Greppable: checkHostTermKernel, KERNEL-CHECK, PARSE-LIVE-HOSTTERM. -/
def checkHostTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveHostTermParseOk

/-- Combined HostTerm kernel dual-pin.
    Greppable: hostModuleCheckHostTermKernelOk, KERNEL-CHECK, HostTerm-only. -/
def hostModuleCheckHostTermKernelOk : Bool :=
  hostModuleCheckHostTermKernelDualOk
    && (checkDepthHostTermKernelBar == "KERNEL-CHECK")
    && (checkDepthHostTermKernelScope == "HostTerm-only")
    && checkHostTermKernel

end SystemsLean.HostModuleCheck
