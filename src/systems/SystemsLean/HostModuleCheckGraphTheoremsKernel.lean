/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for HostGraphTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostGraphTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveGraphTheorems parse of live HostGraphTheorems.lean then
    kernelCheck (PARSE-LIVE-GRAPH-THEOREMS).
  Live HostGraphTheorems.lean parse is SystemsLean.HostFrontLiveGraphTheorems,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckGraphTheoremsKernel,
  KERNEL-CHECK, HostGraphTheorems-only, checkGraphTheoremsKernel,
  hostModuleCheckGraphTheoremsKernelOk, hostModuleCheckLiveGraphTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckGraphTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckGraphTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveGraphTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveGraphTheorems

/-! ### HostGraphTheorems KERNEL-CHECK pins (live HostGraphTheorems.lean) -/

/-- Named kernel depth bar for HostGraphTheorems.
    Greppable: checkDepthGraphTheoremsKernelBar, KERNEL-CHECK,
    HostGraphTheorems-only. -/
def checkDepthGraphTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostGraphTheorems live parse only.
    Greppable: checkDepthGraphTheoremsKernelScope, HostGraphTheorems-only,
    KERNEL-CHECK. -/
def checkDepthGraphTheoremsKernelScope : String := "HostGraphTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckGraphTheoremsKernelOk).
    Greppable: hostModuleCheckGraphTheoremsKernelDualOk, KERNEL-CHECK,
    HostGraphTheorems-only. -/
def hostModuleCheckGraphTheoremsKernelDualOk : Bool := true

/-- Live HostGraphTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveGraphTheoremsParseOk, PARSE-LIVE-GRAPH-THEOREMS. -/
def hostModuleCheckLiveGraphTheoremsParseOk : Bool :=
  kernelCheckLiveGraphTheoremsSource liveGraphTheoremsSource
    && hostFrontLiveGraphTheoremsReady

/-- Kernel check entry (live HostGraphTheorems parse + HostKernel ready).
    Greppable: checkGraphTheoremsKernel, KERNEL-CHECK, PARSE-LIVE-GRAPH-THEOREMS. -/
def checkGraphTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveGraphTheoremsParseOk

/-- Combined HostGraphTheorems kernel dual-pin.
    Greppable: hostModuleCheckGraphTheoremsKernelOk, KERNEL-CHECK,
    HostGraphTheorems-only. -/
def hostModuleCheckGraphTheoremsKernelOk : Bool :=
  hostModuleCheckGraphTheoremsKernelDualOk
    && (checkDepthGraphTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthGraphTheoremsKernelScope == "HostGraphTheorems-only")
    && checkGraphTheoremsKernel

end SystemsLean.HostModuleCheck
