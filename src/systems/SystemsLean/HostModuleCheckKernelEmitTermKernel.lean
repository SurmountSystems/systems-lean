/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelEmitTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelEmitTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelEmitTerm parse of live HostModuleCheckKernelEmitTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELEMITTERM).
  Live HostModuleCheckKernelEmitTerm.lean parse is
  SystemsLean.HostFrontLiveKernelEmitTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelEmitTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelEmitTerm-only, checkKernelEmitTermKernel,
  hostModuleCheckKernelEmitTermKernelOk,
  hostModuleCheckLiveKernelEmitTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelEmitTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelEmitTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelEmitTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelEmitTerm

/-! ### HostModuleCheckKernelEmitTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelEmitTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelEmitTerm.
    Greppable: checkDepthKernelEmitTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelEmitTerm-only. -/
def checkDepthKernelEmitTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelEmitTerm live parse only.
    Greppable: checkDepthKernelEmitTermKernelScope,
    HostModuleCheckKernelEmitTerm-only, KERNEL-CHECK. -/
def checkDepthKernelEmitTermKernelScope : String :=
  "HostModuleCheckKernelEmitTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelEmitTermKernelOk).
    Greppable: hostModuleCheckKernelEmitTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelEmitTerm-only. -/
def hostModuleCheckKernelEmitTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelEmitTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelEmitTermParseOk,
    PARSE-LIVE-KERNELEMITTERM. -/
def hostModuleCheckLiveKernelEmitTermParseOk : Bool :=
  kernelCheckLiveKernelEmitTermSource liveKernelEmitTermSource
    && hostFrontLiveKernelEmitTermReady

/-- Kernel check entry (live KernelEmitTerm parse + HostKernel ready).
    Greppable: checkKernelEmitTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELEMITTERM. -/
def checkKernelEmitTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelEmitTermParseOk

/-- Combined HostModuleCheckKernelEmitTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelEmitTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelEmitTerm-only. -/
def hostModuleCheckKernelEmitTermKernelOk : Bool :=
  hostModuleCheckKernelEmitTermKernelDualOk
    && (checkDepthKernelEmitTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelEmitTermKernelScope
      == "HostModuleCheckKernelEmitTerm-only")
    && checkKernelEmitTermKernel

end SystemsLean.HostModuleCheck
