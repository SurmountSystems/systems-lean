/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityProgramTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityProgramTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityProgramTerm parse of live HostModuleCheckParityProgramTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-PROGRAM-TERM).
  Live HostModuleCheckParityProgramTerm.lean parse is
  SystemsLean.HostFrontLiveParityProgramTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityProgramTermKernel, KERNEL-CHECK,
  HostModuleCheckParityProgramTerm-only, checkParityProgramTermKernel,
  hostModuleCheckParityProgramTermKernelOk,
  hostModuleCheckLiveParityProgramTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityProgramTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityProgramTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityProgramTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityProgramTerm

/-! ### HostModuleCheckParityProgramTerm KERNEL-CHECK pins (live
    HostModuleCheckParityProgramTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityProgramTerm.
    Greppable: checkDepthParityProgramTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityProgramTerm-only. -/
def checkDepthParityProgramTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityProgramTerm live parse only.
    Greppable: checkDepthParityProgramTermKernelScope,
    HostModuleCheckParityProgramTerm-only, KERNEL-CHECK. -/
def checkDepthParityProgramTermKernelScope : String :=
  "HostModuleCheckParityProgramTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityProgramTermKernelOk).
    Greppable: hostModuleCheckParityProgramTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityProgramTerm-only. -/
def hostModuleCheckParityProgramTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityProgramTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityProgramTermParseOk,
    PARSE-LIVE-PARITY-PROGRAM-TERM. -/
def hostModuleCheckLiveParityProgramTermParseOk : Bool :=
  kernelCheckLiveParityProgramTermSource liveParityProgramTermSource
    && hostFrontLiveParityProgramTermReady

/-- Kernel check entry (live ParityProgramTerm parse + HostKernel ready).
    Greppable: checkParityProgramTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-PROGRAM-TERM. -/
def checkParityProgramTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityProgramTermParseOk

/-- Combined HostModuleCheckParityProgramTerm kernel dual-pin.
    Greppable: hostModuleCheckParityProgramTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityProgramTerm-only. -/
def hostModuleCheckParityProgramTermKernelOk : Bool :=
  hostModuleCheckParityProgramTermKernelDualOk
    && (checkDepthParityProgramTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityProgramTermKernelScope
      == "HostModuleCheckParityProgramTerm-only")
    && checkParityProgramTermKernel

end SystemsLean.HostModuleCheck
