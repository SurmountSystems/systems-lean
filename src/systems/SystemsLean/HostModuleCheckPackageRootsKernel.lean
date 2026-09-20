/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostPackageRoots.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostPackageRoots KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLivePackageRoots parse of live HostPackageRoots.lean then
    kernelCheck (PARSE-LIVE-PACKAGE-ROOTS).
  Live HostPackageRoots.lean parse is SystemsLean.HostFrontLivePackageRoots,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageRootsKernel, KERNEL-CHECK, HostPackageRoots-only,
  checkPackageRootsKernel, hostModuleCheckPackageRootsKernelOk,
  hostModuleCheckLivePackageRootsParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckPackageRootsKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckPackageRootsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLivePackageRoots

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLivePackageRoots

/-! ### HostPackageRoots KERNEL-CHECK pins (live HostPackageRoots.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostPackageRoots.
    Greppable: checkDepthPackageRootsKernelBar, KERNEL-CHECK,
    HostPackageRoots-only. -/
def checkDepthPackageRootsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostPackageRoots live parse only.
    Greppable: checkDepthPackageRootsKernelScope, HostPackageRoots-only,
    KERNEL-CHECK. -/
def checkDepthPackageRootsKernelScope : String := "HostPackageRoots-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckPackageRootsKernelOk).
    Greppable: hostModuleCheckPackageRootsKernelDualOk, KERNEL-CHECK,
    HostPackageRoots-only. -/
def hostModuleCheckPackageRootsKernelDualOk : Bool := true

/-- Live HostPackageRoots.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLivePackageRootsParseOk, PARSE-LIVE-PACKAGE-ROOTS. -/
def hostModuleCheckLivePackageRootsParseOk : Bool :=
  kernelCheckLivePackageRootsSource livePackageRootsSource
    && hostFrontLivePackageRootsReady

/-- Kernel check entry (live HostPackageRoots parse + HostKernel ready).
    Greppable: checkPackageRootsKernel, KERNEL-CHECK, PARSE-LIVE-PACKAGE-ROOTS. -/
def checkPackageRootsKernel : Bool :=
  hostKernelReady && hostModuleCheckLivePackageRootsParseOk

/-- Combined HostPackageRoots kernel dual-pin.
    Greppable: hostModuleCheckPackageRootsKernelOk, KERNEL-CHECK,
    HostPackageRoots-only. -/
def hostModuleCheckPackageRootsKernelOk : Bool :=
  hostModuleCheckPackageRootsKernelDualOk
    && (checkDepthPackageRootsKernelBar == "KERNEL-CHECK")
    && (checkDepthPackageRootsKernelScope == "HostPackageRoots-only")
    && checkPackageRootsKernel

end SystemsLean.HostModuleCheck
