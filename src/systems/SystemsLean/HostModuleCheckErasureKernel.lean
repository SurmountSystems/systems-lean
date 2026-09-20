/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.Erasure.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Erasure KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveErasure parse of live Erasure.lean then kernelCheck (PARSE-LIVE-ERASURE).
  Live Erasure.lean parse is SystemsLean.HostFrontLiveErasure, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckErasureKernel,
  KERNEL-CHECK, Erasure-only, checkErasureKernel, hostModuleCheckErasureKernelOk,
  hostModuleCheckLiveErasureParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckErasureKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckErasureKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveErasure

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveErasure

/-! ### Erasure KERNEL-CHECK pins (live Erasure.lean, not Mult fixture) -/

/-- Named kernel depth bar for Erasure. Greppable: checkDepthErasureKernelBar,
    KERNEL-CHECK, Erasure-only. -/
def checkDepthErasureKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.Erasure live parse only.
    Greppable: checkDepthErasureKernelScope, Erasure-only, KERNEL-CHECK. -/
def checkDepthErasureKernelScope : String := "Erasure-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckErasureKernelOk).
    Greppable: hostModuleCheckErasureKernelDualOk, KERNEL-CHECK, Erasure-only. -/
def hostModuleCheckErasureKernelDualOk : Bool := true

/-- Live Erasure.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveErasureParseOk, PARSE-LIVE-ERASURE. -/
def hostModuleCheckLiveErasureParseOk : Bool :=
  kernelCheckLiveErasureSource liveErasureSource && hostFrontLiveErasureReady

/-- Kernel check entry (live Erasure parse + HostKernel ready).
    Greppable: checkErasureKernel, KERNEL-CHECK, PARSE-LIVE-ERASURE. -/
def checkErasureKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveErasureParseOk

/-- Combined Erasure kernel dual-pin.
    Greppable: hostModuleCheckErasureKernelOk, KERNEL-CHECK, Erasure-only. -/
def hostModuleCheckErasureKernelOk : Bool :=
  hostModuleCheckErasureKernelDualOk
    && (checkDepthErasureKernelBar == "KERNEL-CHECK")
    && (checkDepthErasureKernelScope == "Erasure-only")
    && checkErasureKernel

end SystemsLean.HostModuleCheck
