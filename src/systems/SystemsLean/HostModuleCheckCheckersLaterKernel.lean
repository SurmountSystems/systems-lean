/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckCheckersLater.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckCheckersLater KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveCheckersLater parse of live HostModuleCheckCheckersLater.lean
    then kernelCheck (PARSE-LIVE-CHECKERS-LATER).
  Live HostModuleCheckCheckersLater.lean parse is
  SystemsLean.HostFrontLiveCheckersLater, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCheckersLaterKernel, KERNEL-CHECK,
  HostModuleCheckCheckersLater-only, checkCheckersLaterKernel,
  hostModuleCheckCheckersLaterKernelOk,
  hostModuleCheckLiveCheckersLaterParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckCheckersLaterKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckCheckersLaterKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveCheckersLater

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveCheckersLater

/-! ### HostModuleCheckCheckersLater KERNEL-CHECK pins (live
    HostModuleCheckCheckersLater.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckCheckersLater.
    Greppable: checkDepthCheckersLaterKernelBar, KERNEL-CHECK,
    HostModuleCheckCheckersLater-only. -/
def checkDepthCheckersLaterKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckCheckersLater live parse only.
    Greppable: checkDepthCheckersLaterKernelScope,
    HostModuleCheckCheckersLater-only, KERNEL-CHECK. -/
def checkDepthCheckersLaterKernelScope : String :=
  "HostModuleCheckCheckersLater-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckCheckersLaterKernelOk).
    Greppable: hostModuleCheckCheckersLaterKernelDualOk, KERNEL-CHECK,
    HostModuleCheckCheckersLater-only. -/
def hostModuleCheckCheckersLaterKernelDualOk : Bool := true

/-- Live HostModuleCheckCheckersLater.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveCheckersLaterParseOk,
    PARSE-LIVE-CHECKERS-LATER. -/
def hostModuleCheckLiveCheckersLaterParseOk : Bool :=
  kernelCheckLiveCheckersLaterSource liveCheckersLaterSource
    && hostFrontLiveCheckersLaterReady

/-- Kernel check entry (live CheckersLater parse + HostKernel ready).
    Greppable: checkCheckersLaterKernel, KERNEL-CHECK,
    PARSE-LIVE-CHECKERS-LATER. -/
def checkCheckersLaterKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveCheckersLaterParseOk

/-- Combined HostModuleCheckCheckersLater kernel dual-pin.
    Greppable: hostModuleCheckCheckersLaterKernelOk, KERNEL-CHECK,
    HostModuleCheckCheckersLater-only. -/
def hostModuleCheckCheckersLaterKernelOk : Bool :=
  hostModuleCheckCheckersLaterKernelDualOk
    && (checkDepthCheckersLaterKernelBar == "KERNEL-CHECK")
    && (checkDepthCheckersLaterKernelScope
      == "HostModuleCheckCheckersLater-only")
    && checkCheckersLaterKernel

end SystemsLean.HostModuleCheck
