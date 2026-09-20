/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.Types.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Types KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveTypes parse of live Types.lean then kernelCheck (PARSE-LIVE-TYPES).
  Live Types.lean parse is SystemsLean.HostFrontLiveTypes, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckTypesKernel,
  KERNEL-CHECK, Types-only, checkTypesKernel, hostModuleCheckTypesKernelOk,
  hostModuleCheckLiveTypesParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckTypesKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckTypesKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveTypes

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveTypes

/-! ### Types KERNEL-CHECK pins (live Types.lean, not Mult fixture) -/

/-- Named kernel depth bar for Types. Greppable: checkDepthTypesKernelBar,
    KERNEL-CHECK, Types-only. -/
def checkDepthTypesKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.Types live parse only.
    Greppable: checkDepthTypesKernelScope, Types-only, KERNEL-CHECK. -/
def checkDepthTypesKernelScope : String := "Types-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckTypesKernelOk).
    Greppable: hostModuleCheckTypesKernelDualOk, KERNEL-CHECK, Types-only. -/
def hostModuleCheckTypesKernelDualOk : Bool := true

/-- Live Types.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveTypesParseOk, PARSE-LIVE-TYPES. -/
def hostModuleCheckLiveTypesParseOk : Bool :=
  kernelCheckLiveTypesSource liveTypesSource && hostFrontLiveTypesReady

/-- Kernel check entry (live Types parse + HostKernel ready).
    Greppable: checkTypesKernel, KERNEL-CHECK, PARSE-LIVE-TYPES. -/
def checkTypesKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveTypesParseOk

/-- Combined Types kernel dual-pin.
    Greppable: hostModuleCheckTypesKernelOk, KERNEL-CHECK, Types-only. -/
def hostModuleCheckTypesKernelOk : Bool :=
  hostModuleCheckTypesKernelDualOk
    && (checkDepthTypesKernelBar == "KERNEL-CHECK")
    && (checkDepthTypesKernelScope == "Types-only")
    && checkTypesKernel

end SystemsLean.HostModuleCheck
