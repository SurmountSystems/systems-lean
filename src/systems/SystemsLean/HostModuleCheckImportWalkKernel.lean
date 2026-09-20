/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphWalk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphWalk KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportWalk parse of live HostImportGraphWalk.lean then
    kernelCheck (PARSE-LIVE-IMPORT-WALK).
  Live HostImportGraphWalk.lean parse is SystemsLean.HostFrontLiveImportWalk,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportWalkKernel, KERNEL-CHECK, HostImportGraphWalk-only,
  checkImportWalkKernel, hostModuleCheckImportWalkKernelOk,
  hostModuleCheckLiveImportWalkParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportWalkKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportWalkKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportWalk

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportWalk

/-! ### HostImportGraphWalk KERNEL-CHECK pins (live HostImportGraphWalk.lean,
    not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphWalk.
    Greppable: checkDepthImportWalkKernelBar, KERNEL-CHECK,
    HostImportGraphWalk-only. -/
def checkDepthImportWalkKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphWalk live parse only.
    Greppable: checkDepthImportWalkKernelScope, HostImportGraphWalk-only,
    KERNEL-CHECK. -/
def checkDepthImportWalkKernelScope : String := "HostImportGraphWalk-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportWalkKernelOk).
    Greppable: hostModuleCheckImportWalkKernelDualOk, KERNEL-CHECK,
    HostImportGraphWalk-only. -/
def hostModuleCheckImportWalkKernelDualOk : Bool := true

/-- Live HostImportGraphWalk.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveImportWalkParseOk, PARSE-LIVE-IMPORT-WALK. -/
def hostModuleCheckLiveImportWalkParseOk : Bool :=
  kernelCheckLiveImportWalkSource liveImportWalkSource
    && hostFrontLiveImportWalkReady

/-- Kernel check entry (live ImportWalk parse + HostKernel ready).
    Greppable: checkImportWalkKernel, KERNEL-CHECK, PARSE-LIVE-IMPORT-WALK. -/
def checkImportWalkKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportWalkParseOk

/-- Combined HostImportGraphWalk kernel dual-pin.
    Greppable: hostModuleCheckImportWalkKernelOk, KERNEL-CHECK,
    HostImportGraphWalk-only. -/
def hostModuleCheckImportWalkKernelOk : Bool :=
  hostModuleCheckImportWalkKernelDualOk
    && (checkDepthImportWalkKernelBar == "KERNEL-CHECK")
    && (checkDepthImportWalkKernelScope == "HostImportGraphWalk-only")
    && checkImportWalkKernel

end SystemsLean.HostModuleCheck
