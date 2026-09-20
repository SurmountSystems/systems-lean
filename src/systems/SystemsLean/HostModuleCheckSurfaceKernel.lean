/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckSurface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckSurface KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveSurface parse of live HostModuleCheckSurface.lean then
    kernelCheck (PARSE-LIVE-SURFACE).
  Live HostModuleCheckSurface.lean parse is SystemsLean.HostFrontLiveSurface,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSurfaceKernel, KERNEL-CHECK, HostModuleCheckSurface-only,
  checkSurfaceKernel, hostModuleCheckSurfaceKernelOk,
  hostModuleCheckLiveSurfaceParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckSurfaceKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckSurfaceKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveSurface

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveSurface

/-! ### HostModuleCheckSurface KERNEL-CHECK pins (live HostModuleCheckSurface.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckSurface.
    Greppable: checkDepthSurfaceKernelBar, KERNEL-CHECK,
    HostModuleCheckSurface-only. -/
def checkDepthSurfaceKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckSurface live parse only.
    Greppable: checkDepthSurfaceKernelScope, HostModuleCheckSurface-only,
    KERNEL-CHECK. -/
def checkDepthSurfaceKernelScope : String := "HostModuleCheckSurface-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckSurfaceKernelOk).
    Greppable: hostModuleCheckSurfaceKernelDualOk, KERNEL-CHECK,
    HostModuleCheckSurface-only. -/
def hostModuleCheckSurfaceKernelDualOk : Bool := true

/-- Live HostModuleCheckSurface.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveSurfaceParseOk, PARSE-LIVE-SURFACE. -/
def hostModuleCheckLiveSurfaceParseOk : Bool :=
  kernelCheckLiveSurfaceSource liveSurfaceSource
    && hostFrontLiveSurfaceReady

/-- Kernel check entry (live HostModuleCheckSurface parse + HostKernel ready).
    Greppable: checkSurfaceKernel, KERNEL-CHECK, PARSE-LIVE-SURFACE. -/
def checkSurfaceKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveSurfaceParseOk

/-- Combined HostModuleCheckSurface kernel dual-pin.
    Greppable: hostModuleCheckSurfaceKernelOk, KERNEL-CHECK,
    HostModuleCheckSurface-only. -/
def hostModuleCheckSurfaceKernelOk : Bool :=
  hostModuleCheckSurfaceKernelDualOk
    && (checkDepthSurfaceKernelBar == "KERNEL-CHECK")
    && (checkDepthSurfaceKernelScope == "HostModuleCheckSurface-only")
    && checkSurfaceKernel

end SystemsLean.HostModuleCheck
