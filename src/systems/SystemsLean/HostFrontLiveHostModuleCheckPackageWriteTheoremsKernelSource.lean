/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckPackageWriteTheoremsKernel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageWriteTheoremsKernelSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckPackageWriteTheoremsKernel.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckPackageWriteTheoremsKernelSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel

/-- Dual-pinned live HostModuleCheckPackageWriteTheoremsKernel.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckPackageWriteTheoremsKernelSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL. -/
def liveHostModuleCheckPackageWriteTheoremsKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  HostPackageWriteTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostPackageWriteTheorems KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLivePackageWriteTheorems parse of live HostPackageWriteTheorems.lean
    then kernelCheck (PARSE-LIVE-PACKAGEWRITE-THEOREMS).
  Live HostPackageWriteTheorems.lean parse is
  SystemsLean.HostFrontLivePackageWriteTheorems, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageWriteTheoremsKernel, KERNEL-CHECK,
  HostPackageWriteTheorems-only, checkPackageWriteTheoremsKernel,
  hostModuleCheckPackageWriteTheoremsKernelOk,
  hostModuleCheckLivePackageWriteTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckPackageWriteTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckPackageWriteTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLivePackageWriteTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLivePackageWriteTheorems

/-! ### HostPackageWriteTheorems KERNEL-CHECK pins (live HostPackageWriteTheorems.lean) -/

/-- Named kernel depth bar for HostPackageWriteTheorems.
    Greppable: checkDepthPackageWriteTheoremsKernelBar, KERNEL-CHECK,
    HostPackageWriteTheorems-only. -/
def checkDepthPackageWriteTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostPackageWriteTheorems live parse only.
    Greppable: checkDepthPackageWriteTheoremsKernelScope,
    HostPackageWriteTheorems-only, KERNEL-CHECK. -/
def checkDepthPackageWriteTheoremsKernelScope : String :=
  "HostPackageWriteTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckPackageWriteTheoremsKernelOk).
    Greppable: hostModuleCheckPackageWriteTheoremsKernelDualOk, KERNEL-CHECK,
    HostPackageWriteTheorems-only. -/
def hostModuleCheckPackageWriteTheoremsKernelDualOk : Bool := true

/-- Live HostPackageWriteTheorems.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLivePackageWriteTheoremsParseOk,
    PARSE-LIVE-PACKAGEWRITE-THEOREMS. -/
def hostModuleCheckLivePackageWriteTheoremsParseOk : Bool :=
  kernelCheckLivePackageWriteTheoremsSource livePackageWriteTheoremsSource
    && hostFrontLivePackageWriteTheoremsReady

/-- Kernel check entry (live HostPackageWriteTheorems parse + HostKernel ready).
    Greppable: checkPackageWriteTheoremsKernel, KERNEL-CHECK,
    PARSE-LIVE-PACKAGEWRITE-THEOREMS. -/
def checkPackageWriteTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLivePackageWriteTheoremsParseOk

/-- Combined HostPackageWriteTheorems kernel dual-pin.
    Greppable: hostModuleCheckPackageWriteTheoremsKernelOk, KERNEL-CHECK,
    HostPackageWriteTheorems-only. -/
def hostModuleCheckPackageWriteTheoremsKernelOk : Bool :=
  hostModuleCheckPackageWriteTheoremsKernelDualOk
    && (checkDepthPackageWriteTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthPackageWriteTheoremsKernelScope ==
      "HostPackageWriteTheorems-only")
    && checkPackageWriteTheoremsKernel

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel
