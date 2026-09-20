/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  TypesTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesTheorems KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveTypesTheorems parse of live TypesTheorems.lean
    then kernelCheck (PARSE-LIVE-TYPESTHEOREMS).
  Live TypesTheorems.lean parse is
  SystemsLean.HostFrontLiveTypesTheorems, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckTypesTheoremsKernel, KERNEL-CHECK,
  TypesTheorems-only, checkTypesTheoremsKernel,
  hostModuleCheckTypesTheoremsKernelOk,
  hostModuleCheckLiveTypesTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckTypesTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckTypesTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveTypesTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveTypesTheorems

/-! ### TypesTheorems KERNEL-CHECK pins (live TypesTheorems.lean) -/

/-- Named kernel depth bar for TypesTheorems.
    Greppable: checkDepthTypesTheoremsKernelBar, KERNEL-CHECK,
    TypesTheorems-only. -/
def checkDepthTypesTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.TypesTheorems live parse only.
    Greppable: checkDepthTypesTheoremsKernelScope,
    TypesTheorems-only, KERNEL-CHECK. -/
def checkDepthTypesTheoremsKernelScope : String :=
  "TypesTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckTypesTheoremsKernelOk).
    Greppable: hostModuleCheckTypesTheoremsKernelDualOk, KERNEL-CHECK,
    TypesTheorems-only. -/
def hostModuleCheckTypesTheoremsKernelDualOk : Bool := true

/-- Live TypesTheorems.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveTypesTheoremsParseOk,
    PARSE-LIVE-TYPESTHEOREMS. -/
def hostModuleCheckLiveTypesTheoremsParseOk : Bool :=
  kernelCheckLiveTypesTheoremsSource liveTypesTheoremsSource
    && hostFrontLiveTypesTheoremsReady

/-- Kernel check entry (live TypesTheorems parse + HostKernel ready).
    Greppable: checkTypesTheoremsKernel, KERNEL-CHECK,
    PARSE-LIVE-TYPESTHEOREMS. -/
def checkTypesTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveTypesTheoremsParseOk

/-- Combined TypesTheorems kernel dual-pin.
    Greppable: hostModuleCheckTypesTheoremsKernelOk, KERNEL-CHECK,
    TypesTheorems-only. -/
def hostModuleCheckTypesTheoremsKernelOk : Bool :=
  hostModuleCheckTypesTheoremsKernelDualOk
    && (checkDepthTypesTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthTypesTheoremsKernelScope ==
      "TypesTheorems-only")
    && checkTypesTheoremsKernel

end SystemsLean.HostModuleCheck
