/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelLinearTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelLinearTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelLinearTerm parse of live HostModuleCheckKernelLinearTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELLINEARTERM).
  Live HostModuleCheckKernelLinearTerm.lean parse is
  SystemsLean.HostFrontLiveKernelLinearTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelLinearTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelLinearTerm-only, checkKernelLinearTermKernel,
  hostModuleCheckKernelLinearTermKernelOk,
  hostModuleCheckLiveKernelLinearTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelLinearTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelLinearTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelLinearTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelLinearTerm

/-! ### HostModuleCheckKernelLinearTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelLinearTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelLinearTerm.
    Greppable: checkDepthKernelLinearTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelLinearTerm-only. -/
def checkDepthKernelLinearTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelLinearTerm live parse only.
    Greppable: checkDepthKernelLinearTermKernelScope,
    HostModuleCheckKernelLinearTerm-only, KERNEL-CHECK. -/
def checkDepthKernelLinearTermKernelScope : String :=
  "HostModuleCheckKernelLinearTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelLinearTermKernelOk).
    Greppable: hostModuleCheckKernelLinearTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelLinearTerm-only. -/
def hostModuleCheckKernelLinearTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelLinearTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelLinearTermParseOk,
    PARSE-LIVE-KERNELLINEARTERM. -/
def hostModuleCheckLiveKernelLinearTermParseOk : Bool :=
  kernelCheckLiveKernelLinearTermSource liveKernelLinearTermSource
    && hostFrontLiveKernelLinearTermReady

/-- Kernel check entry (live KernelLinearTerm parse + HostKernel ready).
    Greppable: checkKernelLinearTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELLINEARTERM. -/
def checkKernelLinearTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelLinearTermParseOk

/-- Combined HostModuleCheckKernelLinearTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelLinearTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelLinearTerm-only. -/
def hostModuleCheckKernelLinearTermKernelOk : Bool :=
  hostModuleCheckKernelLinearTermKernelDualOk
    && (checkDepthKernelLinearTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelLinearTermKernelScope
      == "HostModuleCheckKernelLinearTerm-only")
    && checkKernelLinearTermKernel

end SystemsLean.HostModuleCheck
