/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for HostFrontGoldens.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Goldens KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveGoldens parse of live HostFrontGoldens.lean then kernelCheck
    (PARSE-LIVE-GOLDENS).
  Live HostFrontGoldens.lean parse is SystemsLean.HostFrontLiveGoldens, not the
  Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckGoldensKernel,
  KERNEL-CHECK, Goldens-only, checkGoldensKernel,
  hostModuleCheckGoldensKernelOk, hostModuleCheckLiveGoldensParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckGoldensKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckGoldensKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveGoldens

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveGoldens

/-! ### Goldens KERNEL-CHECK pins (live HostFrontGoldens.lean, not Mult fixture) -/

/-- Named kernel depth bar for Goldens. Greppable: checkDepthGoldensKernelBar,
    KERNEL-CHECK, Goldens-only. -/
def checkDepthGoldensKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostFrontGoldens live parse only.
    Greppable: checkDepthGoldensKernelScope, Goldens-only, KERNEL-CHECK. -/
def checkDepthGoldensKernelScope : String := "Goldens-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckGoldensKernelOk).
    Greppable: hostModuleCheckGoldensKernelDualOk, KERNEL-CHECK, Goldens-only. -/
def hostModuleCheckGoldensKernelDualOk : Bool := true

/-- Live HostFrontGoldens.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveGoldensParseOk, PARSE-LIVE-GOLDENS. -/
def hostModuleCheckLiveGoldensParseOk : Bool :=
  kernelCheckLiveGoldensSource liveGoldensSource
    && hostFrontLiveGoldensReady

/-- Kernel check entry (live Goldens parse + HostKernel ready).
    Greppable: checkGoldensKernel, KERNEL-CHECK, PARSE-LIVE-GOLDENS. -/
def checkGoldensKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveGoldensParseOk

/-- Combined Goldens kernel dual-pin.
    Greppable: hostModuleCheckGoldensKernelOk, KERNEL-CHECK, Goldens-only. -/
def hostModuleCheckGoldensKernelOk : Bool :=
  hostModuleCheckGoldensKernelDualOk
    && (checkDepthGoldensKernelBar == "KERNEL-CHECK")
    && (checkDepthGoldensKernelScope == "Goldens-only")
    && checkGoldensKernel

end SystemsLean.HostModuleCheck
