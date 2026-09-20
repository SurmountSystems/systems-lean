/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for ExtractTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ExtractTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveExtractTheorems parse of live ExtractTheorems.lean then
    kernelCheck (PARSE-LIVE-EXTRACT-THEOREMS).
  Live ExtractTheorems.lean parse is SystemsLean.HostFrontLiveExtractTheorems,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckExtractTheoremsKernel,
  KERNEL-CHECK, ExtractTheorems-only, checkExtractTheoremsKernel,
  hostModuleCheckExtractTheoremsKernelOk, hostModuleCheckLiveExtractTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckExtractTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckExtractTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveExtractTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveExtractTheorems

/-! ### ExtractTheorems KERNEL-CHECK pins (live ExtractTheorems.lean) -/

/-- Named kernel depth bar for ExtractTheorems.
    Greppable: checkDepthExtractTheoremsKernelBar, KERNEL-CHECK,
    ExtractTheorems-only. -/
def checkDepthExtractTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.ExtractTheorems live parse only.
    Greppable: checkDepthExtractTheoremsKernelScope, ExtractTheorems-only,
    KERNEL-CHECK. -/
def checkDepthExtractTheoremsKernelScope : String := "ExtractTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckExtractTheoremsKernelOk).
    Greppable: hostModuleCheckExtractTheoremsKernelDualOk, KERNEL-CHECK,
    ExtractTheorems-only. -/
def hostModuleCheckExtractTheoremsKernelDualOk : Bool := true

/-- Live ExtractTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveExtractTheoremsParseOk, PARSE-LIVE-EXTRACT-THEOREMS. -/
def hostModuleCheckLiveExtractTheoremsParseOk : Bool :=
  kernelCheckLiveExtractTheoremsSource liveExtractTheoremsSource
    && hostFrontLiveExtractTheoremsReady

/-- Kernel check entry (live ExtractTheorems parse + HostKernel ready).
    Greppable: checkExtractTheoremsKernel, KERNEL-CHECK, PARSE-LIVE-EXTRACT-THEOREMS. -/
def checkExtractTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveExtractTheoremsParseOk

/-- Combined ExtractTheorems kernel dual-pin.
    Greppable: hostModuleCheckExtractTheoremsKernelOk, KERNEL-CHECK,
    ExtractTheorems-only. -/
def hostModuleCheckExtractTheoremsKernelOk : Bool :=
  hostModuleCheckExtractTheoremsKernelDualOk
    && (checkDepthExtractTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthExtractTheoremsKernelScope == "ExtractTheorems-only")
    && checkExtractTheoremsKernel

end SystemsLean.HostModuleCheck
