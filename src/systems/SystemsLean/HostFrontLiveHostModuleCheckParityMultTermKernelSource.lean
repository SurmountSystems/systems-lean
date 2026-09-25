/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckParityMultTermKernel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckParityMultTermKernelSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckParityMultTermKernel.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckParityMultTermKernelSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel

/-- Dual-pinned live HostModuleCheckParityMultTermKernel.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckParityMultTermKernelSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL. -/
def liveHostModuleCheckParityMultTermKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityMultTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityMultTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityMultTerm parse of live HostModuleCheckParityMultTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-MULT-TERM).
  Live HostModuleCheckParityMultTerm.lean parse is
  SystemsLean.HostFrontLiveParityMultTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityMultTermKernel, KERNEL-CHECK,
  HostModuleCheckParityMultTerm-only, checkParityMultTermKernel,
  hostModuleCheckParityMultTermKernelOk,
  hostModuleCheckLiveParityMultTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityMultTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityMultTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityMultTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityMultTerm

/-! ### HostModuleCheckParityMultTerm KERNEL-CHECK pins (live
    HostModuleCheckParityMultTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityMultTerm.
    Greppable: checkDepthParityMultTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityMultTerm-only. -/
def checkDepthParityMultTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityMultTerm live parse only.
    Greppable: checkDepthParityMultTermKernelScope,
    HostModuleCheckParityMultTerm-only, KERNEL-CHECK. -/
def checkDepthParityMultTermKernelScope : String :=
  "HostModuleCheckParityMultTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityMultTermKernelOk).
    Greppable: hostModuleCheckParityMultTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityMultTerm-only. -/
def hostModuleCheckParityMultTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityMultTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityMultTermParseOk,
    PARSE-LIVE-PARITY-MULT-TERM. -/
def hostModuleCheckLiveParityMultTermParseOk : Bool :=
  kernelCheckLiveParityMultTermSource liveParityMultTermSource
    && hostFrontLiveParityMultTermReady

/-- Kernel check entry (live ParityMultTerm parse + HostKernel ready).
    Greppable: checkParityMultTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-MULT-TERM. -/
def checkParityMultTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityMultTermParseOk

/-- Combined HostModuleCheckParityMultTerm kernel dual-pin.
    Greppable: hostModuleCheckParityMultTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityMultTerm-only. -/
def hostModuleCheckParityMultTermKernelOk : Bool :=
  hostModuleCheckParityMultTermKernelDualOk
    && (checkDepthParityMultTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityMultTermKernelScope
      == "HostModuleCheckParityMultTerm-only")
    && checkParityMultTermKernel

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel
