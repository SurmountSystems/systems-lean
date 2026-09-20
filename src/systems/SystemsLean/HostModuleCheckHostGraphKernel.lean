/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.HostGraph.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostGraph KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveGraph parse of live HostGraph.lean then kernelCheck
    (PARSE-LIVE-HOST-GRAPH).
  Live HostGraph.lean parse is SystemsLean.HostFrontLiveGraph, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckHostGraphKernel,
  KERNEL-CHECK, HostGraph-only, checkHostGraphKernel, hostModuleCheckHostGraphKernelOk,
  hostModuleCheckLiveHostGraphParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckHostGraphKernel
  Red/green: just systems-host dest rows later;
  lake build SystemsLean.HostModuleCheckHostGraphKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveGraph

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveGraph

/-! ### HostGraph KERNEL-CHECK pins (live HostGraph.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostGraph. Greppable: checkDepthHostGraphKernelBar,
    KERNEL-CHECK, HostGraph-only. -/
def checkDepthHostGraphKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostGraph live parse only.
    Greppable: checkDepthHostGraphKernelScope, HostGraph-only, KERNEL-CHECK. -/
def checkDepthHostGraphKernelScope : String := "HostGraph-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckHostGraphKernelOk).
    Greppable: hostModuleCheckHostGraphKernelDualOk, KERNEL-CHECK, HostGraph-only. -/
def hostModuleCheckHostGraphKernelDualOk : Bool := true

/-- Live HostGraph.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveHostGraphParseOk, PARSE-LIVE-HOST-GRAPH. -/
def hostModuleCheckLiveHostGraphParseOk : Bool :=
  kernelCheckLiveHostGraphSource liveHostGraphSource && hostFrontLiveGraphReady

/-- Kernel check entry (live HostGraph parse + HostKernel ready).
    Greppable: checkHostGraphKernel, KERNEL-CHECK, PARSE-LIVE-HOST-GRAPH. -/
def checkHostGraphKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveHostGraphParseOk

/-- Combined HostGraph kernel dual-pin.
    Greppable: hostModuleCheckHostGraphKernelOk, KERNEL-CHECK, HostGraph-only. -/
def hostModuleCheckHostGraphKernelOk : Bool :=
  hostModuleCheckHostGraphKernelDualOk
    && (checkDepthHostGraphKernelBar == "KERNEL-CHECK")
    && (checkDepthHostGraphKernelScope == "HostGraph-only")
    && checkHostGraphKernel

end SystemsLean.HostModuleCheck
