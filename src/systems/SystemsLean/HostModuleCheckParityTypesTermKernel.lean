/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityTypesTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityTypesTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityTypesTerm parse of live HostModuleCheckParityTypesTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-TYPES-TERM).
  Live HostModuleCheckParityTypesTerm.lean parse is
  SystemsLean.HostFrontLiveParityTypesTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityTypesTermKernel, KERNEL-CHECK,
  HostModuleCheckParityTypesTerm-only, checkParityTypesTermKernel,
  hostModuleCheckParityTypesTermKernelOk,
  hostModuleCheckLiveParityTypesTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityTypesTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityTypesTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityTypesTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityTypesTerm

/-! ### HostModuleCheckParityTypesTerm KERNEL-CHECK pins (live
    HostModuleCheckParityTypesTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityTypesTerm.
    Greppable: checkDepthParityTypesTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def checkDepthParityTypesTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityTypesTerm live parse only.
    Greppable: checkDepthParityTypesTermKernelScope,
    HostModuleCheckParityTypesTerm-only, KERNEL-CHECK. -/
def checkDepthParityTypesTermKernelScope : String :=
  "HostModuleCheckParityTypesTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityTypesTermKernelOk).
    Greppable: hostModuleCheckParityTypesTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def hostModuleCheckParityTypesTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityTypesTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityTypesTermParseOk,
    PARSE-LIVE-PARITY-TYPES-TERM. -/
def hostModuleCheckLiveParityTypesTermParseOk : Bool :=
  kernelCheckLiveParityTypesTermSource liveParityTypesTermSource
    && hostFrontLiveParityTypesTermReady

/-- Kernel check entry (live ParityTypesTerm parse + HostKernel ready).
    Greppable: checkParityTypesTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-TYPES-TERM. -/
def checkParityTypesTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityTypesTermParseOk

/-- Combined HostModuleCheckParityTypesTerm kernel dual-pin.
    Greppable: hostModuleCheckParityTypesTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def hostModuleCheckParityTypesTermKernelOk : Bool :=
  hostModuleCheckParityTypesTermKernelDualOk
    && (checkDepthParityTypesTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityTypesTermKernelScope
      == "HostModuleCheckParityTypesTerm-only")
    && checkParityTypesTermKernel

end SystemsLean.HostModuleCheck
