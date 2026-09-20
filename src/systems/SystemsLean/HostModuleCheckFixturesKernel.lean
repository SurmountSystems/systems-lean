/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckFixtures.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckFixtures KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveFixtures parse of live HostModuleCheckFixtures.lean then
    kernelCheck (PARSE-LIVE-FIXTURES).
  Live HostModuleCheckFixtures.lean parse is SystemsLean.HostFrontLiveFixtures,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckFixturesKernel, KERNEL-CHECK, HostModuleCheckFixtures-only,
  checkFixturesKernel, hostModuleCheckFixturesKernelOk,
  hostModuleCheckLiveFixturesParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckFixturesKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckFixturesKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveFixtures

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveFixtures

/-! ### HostModuleCheckFixtures KERNEL-CHECK pins (live
    HostModuleCheckFixtures.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckFixtures.
    Greppable: checkDepthFixturesKernelBar, KERNEL-CHECK,
    HostModuleCheckFixtures-only. -/
def checkDepthFixturesKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckFixtures live parse only.
    Greppable: checkDepthFixturesKernelScope, HostModuleCheckFixtures-only,
    KERNEL-CHECK. -/
def checkDepthFixturesKernelScope : String := "HostModuleCheckFixtures-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckFixturesKernelOk).
    Greppable: hostModuleCheckFixturesKernelDualOk, KERNEL-CHECK,
    HostModuleCheckFixtures-only. -/
def hostModuleCheckFixturesKernelDualOk : Bool := true

/-- Live HostModuleCheckFixtures.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveFixturesParseOk, PARSE-LIVE-FIXTURES. -/
def hostModuleCheckLiveFixturesParseOk : Bool :=
  kernelCheckLiveFixturesSource liveFixturesSource
    && hostFrontLiveFixturesReady

/-- Kernel check entry (live Fixtures parse + HostKernel ready).
    Greppable: checkFixturesKernel, KERNEL-CHECK, PARSE-LIVE-FIXTURES. -/
def checkFixturesKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveFixturesParseOk

/-- Combined HostModuleCheckFixtures kernel dual-pin.
    Greppable: hostModuleCheckFixturesKernelOk, KERNEL-CHECK,
    HostModuleCheckFixtures-only. -/
def hostModuleCheckFixturesKernelOk : Bool :=
  hostModuleCheckFixturesKernelDualOk
    && (checkDepthFixturesKernelBar == "KERNEL-CHECK")
    && (checkDepthFixturesKernelScope == "HostModuleCheckFixtures-only")
    && checkFixturesKernel

end SystemsLean.HostModuleCheck
