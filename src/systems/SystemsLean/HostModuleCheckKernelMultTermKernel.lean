/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelMultTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelMultTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelMultTerm parse of live HostModuleCheckKernelMultTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELMULTTERM).
  Live HostModuleCheckKernelMultTerm.lean parse is
  SystemsLean.HostFrontLiveKernelMultTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelMultTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelMultTerm-only, checkKernelMultTermKernel,
  hostModuleCheckKernelMultTermKernelOk,
  hostModuleCheckLiveKernelMultTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelMultTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelMultTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelMultTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelMultTerm

/-! ### HostModuleCheckKernelMultTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelMultTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelMultTerm.
    Greppable: checkDepthKernelMultTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def checkDepthKernelMultTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelMultTerm live parse only.
    Greppable: checkDepthKernelMultTermKernelScope,
    HostModuleCheckKernelMultTerm-only, KERNEL-CHECK. -/
def checkDepthKernelMultTermKernelScope : String :=
  "HostModuleCheckKernelMultTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelMultTermKernelOk).
    Greppable: hostModuleCheckKernelMultTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def hostModuleCheckKernelMultTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelMultTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelMultTermParseOk,
    PARSE-LIVE-KERNELMULTTERM. -/
def hostModuleCheckLiveKernelMultTermParseOk : Bool :=
  kernelCheckLiveKernelMultTermSource liveKernelMultTermSource
    && hostFrontLiveKernelMultTermReady

/-- Kernel check entry (live KernelMultTerm parse + HostKernel ready).
    Greppable: checkKernelMultTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELMULTTERM. -/
def checkKernelMultTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelMultTermParseOk

/-- Combined HostModuleCheckKernelMultTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelMultTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def hostModuleCheckKernelMultTermKernelOk : Bool :=
  hostModuleCheckKernelMultTermKernelDualOk
    && (checkDepthKernelMultTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelMultTermKernelScope
      == "HostModuleCheckKernelMultTerm-only")
    && checkKernelMultTermKernel

end SystemsLean.HostModuleCheck
