/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for HostPackageWrite.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: PackageWrite KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLivePackageWrite parse of live HostPackageWrite.lean then kernelCheck
    (PARSE-LIVE-PACKAGEWRITE).
  Live HostPackageWrite.lean parse is SystemsLean.HostFrontLivePackageWrite, not
  the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckPackageWriteKernel,
  KERNEL-CHECK, PackageWrite-only, checkPackageWriteKernel,
  hostModuleCheckPackageWriteKernelOk, hostModuleCheckLivePackageWriteParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckPackageWriteKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckPackageWriteKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLivePackageWrite

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLivePackageWrite

/-! ### PackageWrite KERNEL-CHECK pins (live HostPackageWrite.lean, not Mult fixture) -/

/-- Named kernel depth bar for PackageWrite. Greppable: checkDepthPackageWriteKernelBar,
    KERNEL-CHECK, PackageWrite-only. -/
def checkDepthPackageWriteKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostPackageWrite live parse only.
    Greppable: checkDepthPackageWriteKernelScope, PackageWrite-only, KERNEL-CHECK. -/
def checkDepthPackageWriteKernelScope : String := "PackageWrite-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckPackageWriteKernelOk).
    Greppable: hostModuleCheckPackageWriteKernelDualOk, KERNEL-CHECK,
    PackageWrite-only. -/
def hostModuleCheckPackageWriteKernelDualOk : Bool := true

/-- Live HostPackageWrite.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLivePackageWriteParseOk, PARSE-LIVE-PACKAGEWRITE. -/
def hostModuleCheckLivePackageWriteParseOk : Bool :=
  kernelCheckLivePackageWriteSource livePackageWriteSource
    && hostFrontLivePackageWriteReady

/-- Kernel check entry (live PackageWrite parse + HostKernel ready).
    Greppable: checkPackageWriteKernel, KERNEL-CHECK, PARSE-LIVE-PACKAGEWRITE. -/
def checkPackageWriteKernel : Bool :=
  hostKernelReady && hostModuleCheckLivePackageWriteParseOk

/-- Combined PackageWrite kernel dual-pin.
    Greppable: hostModuleCheckPackageWriteKernelOk, KERNEL-CHECK, PackageWrite-only. -/
def hostModuleCheckPackageWriteKernelOk : Bool :=
  hostModuleCheckPackageWriteKernelDualOk
    && (checkDepthPackageWriteKernelBar == "KERNEL-CHECK")
    && (checkDepthPackageWriteKernelScope == "PackageWrite-only")
    && checkPackageWriteKernel

end SystemsLean.HostModuleCheck
