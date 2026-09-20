/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityLinearTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityLinearTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityLinearTerm parse of live HostModuleCheckParityLinearTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-LINEAR-TERM).
  Live HostModuleCheckParityLinearTerm.lean parse is
  SystemsLean.HostFrontLiveParityLinearTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityLinearTermKernel, KERNEL-CHECK,
  HostModuleCheckParityLinearTerm-only, checkParityLinearTermKernel,
  hostModuleCheckParityLinearTermKernelOk,
  hostModuleCheckLiveParityLinearTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityLinearTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityLinearTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityLinearTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityLinearTerm

/-! ### HostModuleCheckParityLinearTerm KERNEL-CHECK pins (live
    HostModuleCheckParityLinearTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityLinearTerm.
    Greppable: checkDepthParityLinearTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def checkDepthParityLinearTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityLinearTerm live parse only.
    Greppable: checkDepthParityLinearTermKernelScope,
    HostModuleCheckParityLinearTerm-only, KERNEL-CHECK. -/
def checkDepthParityLinearTermKernelScope : String :=
  "HostModuleCheckParityLinearTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityLinearTermKernelOk).
    Greppable: hostModuleCheckParityLinearTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def hostModuleCheckParityLinearTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityLinearTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityLinearTermParseOk,
    PARSE-LIVE-PARITY-LINEAR-TERM. -/
def hostModuleCheckLiveParityLinearTermParseOk : Bool :=
  kernelCheckLiveParityLinearTermSource liveParityLinearTermSource
    && hostFrontLiveParityLinearTermReady

/-- Kernel check entry (live ParityLinearTerm parse + HostKernel ready).
    Greppable: checkParityLinearTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-LINEAR-TERM. -/
def checkParityLinearTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityLinearTermParseOk

/-- Combined HostModuleCheckParityLinearTerm kernel dual-pin.
    Greppable: hostModuleCheckParityLinearTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def hostModuleCheckParityLinearTermKernelOk : Bool :=
  hostModuleCheckParityLinearTermKernelDualOk
    && (checkDepthParityLinearTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityLinearTermKernelScope
      == "HostModuleCheckParityLinearTerm-only")
    && checkParityLinearTermKernel

end SystemsLean.HostModuleCheck
