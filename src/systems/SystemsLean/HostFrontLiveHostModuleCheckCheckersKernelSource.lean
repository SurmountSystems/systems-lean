/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCheckersKernel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCheckersKernelSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCheckersKernel.lean only. One part.
  Do not steal HostFrontLiveHostModuleCheckCheckers (liveRel is
  HostModuleCheckCheckers.lean).
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCHECKERSKERNEL,
  liveHostModuleCheckCheckersKernelSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERSKERNEL,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCheckersKernelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel

/-- Dual-pinned live HostModuleCheckCheckersKernel.lean bytes.
    One part. Not split. 78 lines will not pass about 780.
    Greppable: liveHostModuleCheckCheckersKernelSource,
    PARSE-LIVE-HOSTMODULECHECKCHECKERSKERNEL. -/
def liveHostModuleCheckCheckersKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckCheckers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckCheckers KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveCheckers parse of live HostModuleCheckCheckers.lean then
    kernelCheck (PARSE-LIVE-CHECKERS).
  Live HostModuleCheckCheckers.lean parse is SystemsLean.HostFrontLiveCheckers,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCheckersKernel, KERNEL-CHECK, HostModuleCheckCheckers-only,
  checkCheckersKernel, hostModuleCheckCheckersKernelOk,
  hostModuleCheckLiveCheckersParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckCheckersKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckCheckersKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveCheckers

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveCheckers

/-! ### HostModuleCheckCheckers KERNEL-CHECK pins (live
    HostModuleCheckCheckers.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckCheckers.
    Greppable: checkDepthCheckersKernelBar, KERNEL-CHECK,
    HostModuleCheckCheckers-only. -/
def checkDepthCheckersKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckCheckers live parse only.
    Greppable: checkDepthCheckersKernelScope, HostModuleCheckCheckers-only,
    KERNEL-CHECK. -/
def checkDepthCheckersKernelScope : String := "HostModuleCheckCheckers-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckCheckersKernelOk).
    Greppable: hostModuleCheckCheckersKernelDualOk, KERNEL-CHECK,
    HostModuleCheckCheckers-only. -/
def hostModuleCheckCheckersKernelDualOk : Bool := true

/-- Live HostModuleCheckCheckers.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveCheckersParseOk, PARSE-LIVE-CHECKERS. -/
def hostModuleCheckLiveCheckersParseOk : Bool :=
  kernelCheckLiveCheckersSource liveCheckersSource
    && hostFrontLiveCheckersReady

/-- Kernel check entry (live Checkers parse + HostKernel ready).
    Greppable: checkCheckersKernel, KERNEL-CHECK, PARSE-LIVE-CHECKERS. -/
def checkCheckersKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveCheckersParseOk

/-- Combined HostModuleCheckCheckers kernel dual-pin.
    Greppable: hostModuleCheckCheckersKernelOk, KERNEL-CHECK,
    HostModuleCheckCheckers-only. -/
def hostModuleCheckCheckersKernelOk : Bool :=
  hostModuleCheckCheckersKernelDualOk
    && (checkDepthCheckersKernelBar == "KERNEL-CHECK")
    && (checkDepthCheckersKernelScope == "HostModuleCheckCheckers-only")
    && checkCheckersKernel

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel
