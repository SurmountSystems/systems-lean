/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.HostFront.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Front KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveFront parse of live HostFront.lean then kernelCheck (PARSE-LIVE-FRONT).
  Live HostFront.lean parse is SystemsLean.HostFrontLiveFront, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckFrontKernel,
  KERNEL-CHECK, Front-only, checkFrontKernel, hostModuleCheckFrontKernelOk,
  hostModuleCheckLiveFrontParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckFrontKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckFrontKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveFront

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveFront

/-! ### Front KERNEL-CHECK pins (live HostFront.lean, not Mult fixture) -/

/-- Named kernel depth bar for Front. Greppable: checkDepthFrontKernelBar,
    KERNEL-CHECK, Front-only. -/
def checkDepthFrontKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostFront live parse only.
    Greppable: checkDepthFrontKernelScope, Front-only, KERNEL-CHECK. -/
def checkDepthFrontKernelScope : String := "Front-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckFrontKernelOk).
    Greppable: hostModuleCheckFrontKernelDualOk, KERNEL-CHECK, Front-only. -/
def hostModuleCheckFrontKernelDualOk : Bool := true

/-- Live HostFront.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveFrontParseOk, PARSE-LIVE-FRONT. -/
def hostModuleCheckLiveFrontParseOk : Bool :=
  kernelCheckLiveFrontSource liveFrontSource && hostFrontLiveFrontReady

/-- Kernel check entry (live Front parse + HostKernel ready).
    Greppable: checkFrontKernel, KERNEL-CHECK, PARSE-LIVE-FRONT. -/
def checkFrontKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveFrontParseOk

/-- Combined Front kernel dual-pin.
    Greppable: hostModuleCheckFrontKernelOk, KERNEL-CHECK, Front-only. -/
def hostModuleCheckFrontKernelOk : Bool :=
  hostModuleCheckFrontKernelDualOk
    && (checkDepthFrontKernelBar == "KERNEL-CHECK")
    && (checkDepthFrontKernelScope == "Front-only")
    && checkFrontKernel

end SystemsLean.HostModuleCheck
