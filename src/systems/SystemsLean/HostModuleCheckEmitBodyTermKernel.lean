/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckEmitBodyTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckEmitBodyTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveEmitBodyTerm parse of live HostModuleCheckEmitBodyTerm.lean
    then kernelCheck (PARSE-LIVE-EMITBODYTERM).
  Live HostModuleCheckEmitBodyTerm.lean parse is
  SystemsLean.HostFrontLiveEmitBodyTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitBodyTermKernel, KERNEL-CHECK,
  HostModuleCheckEmitBodyTerm-only, checkKernelEmitBodyTermKernel,
  hostModuleCheckEmitBodyTermKernelOk,
  hostModuleCheckLiveEmitBodyTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckEmitBodyTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckEmitBodyTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveEmitBodyTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveEmitBodyTerm

/-! ### HostModuleCheckEmitBodyTerm KERNEL-CHECK pins (live
    HostModuleCheckEmitBodyTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckEmitBodyTerm.
    Greppable: checkDepthEmitBodyTermKernelBar, KERNEL-CHECK,
    HostModuleCheckEmitBodyTerm-only. -/
def checkDepthEmitBodyTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckEmitBodyTerm live parse only.
    Greppable: checkDepthEmitBodyTermKernelScope,
    HostModuleCheckEmitBodyTerm-only, KERNEL-CHECK. -/
def checkDepthEmitBodyTermKernelScope : String :=
  "HostModuleCheckEmitBodyTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckEmitBodyTermKernelOk).
    Greppable: hostModuleCheckEmitBodyTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckEmitBodyTerm-only. -/
def hostModuleCheckEmitBodyTermKernelDualOk : Bool := true

/-- Live HostModuleCheckEmitBodyTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveEmitBodyTermParseOk,
    PARSE-LIVE-EMITBODYTERM. -/
def hostModuleCheckLiveEmitBodyTermParseOk : Bool :=
  kernelCheckLiveEmitBodyTermSource liveEmitBodyTermSource
    && hostFrontLiveEmitBodyTermReady

/-- Kernel check entry (live EmitBodyTerm parse + HostKernel ready).
    Greppable: checkKernelEmitBodyTermKernel, KERNEL-CHECK,
    PARSE-LIVE-EMITBODYTERM. -/
def checkKernelEmitBodyTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveEmitBodyTermParseOk

/-- Combined HostModuleCheckEmitBodyTerm kernel dual-pin.
    Greppable: hostModuleCheckEmitBodyTermKernelOk, KERNEL-CHECK,
    HostModuleCheckEmitBodyTerm-only. -/
def hostModuleCheckEmitBodyTermKernelOk : Bool :=
  hostModuleCheckEmitBodyTermKernelDualOk
    && (checkDepthEmitBodyTermKernelBar == "KERNEL-CHECK")
    && (checkDepthEmitBodyTermKernelScope
      == "HostModuleCheckEmitBodyTerm-only")
    && checkKernelEmitBodyTermKernel

end SystemsLean.HostModuleCheck
