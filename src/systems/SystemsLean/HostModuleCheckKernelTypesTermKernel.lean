/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelTypesTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelTypesTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelTypesTerm parse of live HostModuleCheckKernelTypesTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELTYPESTERM).
  Live HostModuleCheckKernelTypesTerm.lean parse is
  SystemsLean.HostFrontLiveKernelTypesTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelTypesTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelTypesTerm-only, checkKernelTypesTermKernel,
  hostModuleCheckKernelTypesTermKernelOk,
  hostModuleCheckLiveKernelTypesTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelTypesTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelTypesTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelTypesTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelTypesTerm

/-! ### HostModuleCheckKernelTypesTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelTypesTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelTypesTerm.
    Greppable: checkDepthKernelTypesTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelTypesTerm-only. -/
def checkDepthKernelTypesTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelTypesTerm live parse only.
    Greppable: checkDepthKernelTypesTermKernelScope,
    HostModuleCheckKernelTypesTerm-only, KERNEL-CHECK. -/
def checkDepthKernelTypesTermKernelScope : String :=
  "HostModuleCheckKernelTypesTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelTypesTermKernelOk).
    Greppable: hostModuleCheckKernelTypesTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelTypesTerm-only. -/
def hostModuleCheckKernelTypesTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelTypesTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelTypesTermParseOk,
    PARSE-LIVE-KERNELTYPESTERM. -/
def hostModuleCheckLiveKernelTypesTermParseOk : Bool :=
  kernelCheckLiveKernelTypesTermSource liveKernelTypesTermSource
    && hostFrontLiveKernelTypesTermReady

/-- Kernel check entry (live KernelTypesTerm parse + HostKernel ready).
    Greppable: checkKernelTypesTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELTYPESTERM. -/
def checkKernelTypesTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelTypesTermParseOk

/-- Combined HostModuleCheckKernelTypesTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelTypesTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelTypesTerm-only. -/
def hostModuleCheckKernelTypesTermKernelOk : Bool :=
  hostModuleCheckKernelTypesTermKernelDualOk
    && (checkDepthKernelTypesTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelTypesTermKernelScope
      == "HostModuleCheckKernelTypesTerm-only")
    && checkKernelTypesTermKernel

end SystemsLean.HostModuleCheck
