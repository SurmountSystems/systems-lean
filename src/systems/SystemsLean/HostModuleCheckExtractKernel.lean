/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.Extract.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Extract KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveExtract parse of live Extract.lean then kernelCheck (PARSE-LIVE-EXTRACT).
  Live Extract.lean parse is SystemsLean.HostFrontLiveExtract, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckExtractKernel,
  KERNEL-CHECK, Extract-only, checkExtractKernel, hostModuleCheckExtractKernelOk,
  hostModuleCheckLiveExtractParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckExtractKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckExtractKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveExtract

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveExtract

/-! ### Extract KERNEL-CHECK pins (live Extract.lean, not Mult fixture) -/

/-- Named kernel depth bar for Extract. Greppable: checkDepthExtractKernelBar,
    KERNEL-CHECK, Extract-only. -/
def checkDepthExtractKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.Extract live parse only.
    Greppable: checkDepthExtractKernelScope, Extract-only, KERNEL-CHECK. -/
def checkDepthExtractKernelScope : String := "Extract-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckExtractKernelOk).
    Greppable: hostModuleCheckExtractKernelDualOk, KERNEL-CHECK, Extract-only. -/
def hostModuleCheckExtractKernelDualOk : Bool := true

/-- Live Extract.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveExtractParseOk, PARSE-LIVE-EXTRACT. -/
def hostModuleCheckLiveExtractParseOk : Bool :=
  kernelCheckLiveExtractSource liveExtractSource && hostFrontLiveExtractReady

/-- Kernel check entry (live Extract parse + HostKernel ready).
    Greppable: checkExtractKernel, KERNEL-CHECK, PARSE-LIVE-EXTRACT. -/
def checkExtractKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveExtractParseOk

/-- Combined Extract kernel dual-pin.
    Greppable: hostModuleCheckExtractKernelOk, KERNEL-CHECK, Extract-only. -/
def hostModuleCheckExtractKernelOk : Bool :=
  hostModuleCheckExtractKernelDualOk
    && (checkDepthExtractKernelBar == "KERNEL-CHECK")
    && (checkDepthExtractKernelScope == "Extract-only")
    && checkExtractKernel

end SystemsLean.HostModuleCheck
