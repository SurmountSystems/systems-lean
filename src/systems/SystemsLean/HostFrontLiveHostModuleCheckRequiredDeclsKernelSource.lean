/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckRequiredDeclsKernel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckRequiredDeclsKernelSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckRequiredDeclsKernel.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckRequiredDeclsKernelSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel

/-- Dual-pinned live HostModuleCheckRequiredDeclsKernel.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckRequiredDeclsKernelSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL. -/
def liveHostModuleCheckRequiredDeclsKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckRequiredDecls.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckRequiredDecls KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveRequiredDecls parse of live HostModuleCheckRequiredDecls.lean
    then kernelCheck (PARSE-LIVE-REQUIRED-DECLS).
  Live HostModuleCheckRequiredDecls.lean parse is
  SystemsLean.HostFrontLiveRequiredDecls, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckRequiredDeclsKernel, KERNEL-CHECK,
  HostModuleCheckRequiredDecls-only, checkRequiredDeclsKernel,
  hostModuleCheckRequiredDeclsKernelOk,
  hostModuleCheckLiveRequiredDeclsParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckRequiredDeclsKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckRequiredDeclsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveRequiredDecls

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveRequiredDecls

/-! ### HostModuleCheckRequiredDecls KERNEL-CHECK pins (live
    HostModuleCheckRequiredDecls.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckRequiredDecls.
    Greppable: checkDepthRequiredDeclsKernelBar, KERNEL-CHECK,
    HostModuleCheckRequiredDecls-only. -/
def checkDepthRequiredDeclsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckRequiredDecls live parse only.
    Greppable: checkDepthRequiredDeclsKernelScope,
    HostModuleCheckRequiredDecls-only, KERNEL-CHECK. -/
def checkDepthRequiredDeclsKernelScope : String :=
  "HostModuleCheckRequiredDecls-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckRequiredDeclsKernelOk).
    Greppable: hostModuleCheckRequiredDeclsKernelDualOk, KERNEL-CHECK,
    HostModuleCheckRequiredDecls-only. -/
def hostModuleCheckRequiredDeclsKernelDualOk : Bool := true

/-- Live HostModuleCheckRequiredDecls.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveRequiredDeclsParseOk,
    PARSE-LIVE-REQUIRED-DECLS. -/
def hostModuleCheckLiveRequiredDeclsParseOk : Bool :=
  kernelCheckLiveRequiredDeclsSource liveRequiredDeclsSource
    && hostFrontLiveRequiredDeclsReady

/-- Kernel check entry (live RequiredDecls parse + HostKernel ready).
    Greppable: checkRequiredDeclsKernel, KERNEL-CHECK,
    PARSE-LIVE-REQUIRED-DECLS. -/
def checkRequiredDeclsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveRequiredDeclsParseOk

/-- Combined HostModuleCheckRequiredDecls kernel dual-pin.
    Greppable: hostModuleCheckRequiredDeclsKernelOk, KERNEL-CHECK,
    HostModuleCheckRequiredDecls-only. -/
def hostModuleCheckRequiredDeclsKernelOk : Bool :=
  hostModuleCheckRequiredDeclsKernelDualOk
    && (checkDepthRequiredDeclsKernelBar == "KERNEL-CHECK")
    && (checkDepthRequiredDeclsKernelScope
      == "HostModuleCheckRequiredDecls-only")
    && checkRequiredDeclsKernel

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel
