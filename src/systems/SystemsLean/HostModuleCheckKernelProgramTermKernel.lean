/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelProgramTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelProgramTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelProgramTerm parse of live HostModuleCheckKernelProgramTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELPROGRAMTERM).
  Live HostModuleCheckKernelProgramTerm.lean parse is
  SystemsLean.HostFrontLiveKernelProgramTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelProgramTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelProgramTerm-only, checkKernelProgramTermKernel,
  hostModuleCheckKernelProgramTermKernelOk,
  hostModuleCheckLiveKernelProgramTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelProgramTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelProgramTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelProgramTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelProgramTerm

/-! ### HostModuleCheckKernelProgramTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelProgramTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelProgramTerm.
    Greppable: checkDepthKernelProgramTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelProgramTerm-only. -/
def checkDepthKernelProgramTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelProgramTerm live parse only.
    Greppable: checkDepthKernelProgramTermKernelScope,
    HostModuleCheckKernelProgramTerm-only, KERNEL-CHECK. -/
def checkDepthKernelProgramTermKernelScope : String :=
  "HostModuleCheckKernelProgramTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelProgramTermKernelOk).
    Greppable: hostModuleCheckKernelProgramTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelProgramTerm-only. -/
def hostModuleCheckKernelProgramTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelProgramTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelProgramTermParseOk,
    PARSE-LIVE-KERNELPROGRAMTERM. -/
def hostModuleCheckLiveKernelProgramTermParseOk : Bool :=
  kernelCheckLiveKernelProgramTermSource liveKernelProgramTermSource
    && hostFrontLiveKernelProgramTermReady

/-- Kernel check entry (live KernelProgramTerm parse + HostKernel ready).
    Greppable: checkKernelProgramTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELPROGRAMTERM. -/
def checkKernelProgramTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelProgramTermParseOk

/-- Combined HostModuleCheckKernelProgramTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelProgramTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelProgramTerm-only. -/
def hostModuleCheckKernelProgramTermKernelOk : Bool :=
  hostModuleCheckKernelProgramTermKernelDualOk
    && (checkDepthKernelProgramTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelProgramTermKernelScope
      == "HostModuleCheckKernelProgramTerm-only")
    && checkKernelProgramTermKernel

end SystemsLean.HostModuleCheck
