/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphWalkLater.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphWalkLater KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportWalkLater parse of live HostImportGraphWalkLater.lean
    then kernelCheck (PARSE-LIVE-IMPORT-WALK-LATER).
  Live HostImportGraphWalkLater.lean parse is
  SystemsLean.HostFrontLiveImportWalkLater, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportWalkLaterKernel, KERNEL-CHECK,
  HostImportGraphWalkLater-only, checkImportWalkLaterKernel,
  hostModuleCheckImportWalkLaterKernelOk,
  hostModuleCheckLiveImportWalkLaterParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportWalkLaterKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportWalkLaterKernel when on
  surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportWalkLater

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportWalkLater

/-! ### HostImportGraphWalkLater KERNEL-CHECK pins (live
    HostImportGraphWalkLater.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphWalkLater.
    Greppable: checkDepthImportWalkLaterKernelBar, KERNEL-CHECK,
    HostImportGraphWalkLater-only. -/
def checkDepthImportWalkLaterKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphWalkLater live parse only.
    Greppable: checkDepthImportWalkLaterKernelScope,
    HostImportGraphWalkLater-only, KERNEL-CHECK. -/
def checkDepthImportWalkLaterKernelScope : String :=
  "HostImportGraphWalkLater-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportWalkLaterKernelOk).
    Greppable: hostModuleCheckImportWalkLaterKernelDualOk, KERNEL-CHECK,
    HostImportGraphWalkLater-only. -/
def hostModuleCheckImportWalkLaterKernelDualOk : Bool := true

/-- Live HostImportGraphWalkLater.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveImportWalkLaterParseOk,
    PARSE-LIVE-IMPORT-WALK-LATER. -/
def hostModuleCheckLiveImportWalkLaterParseOk : Bool :=
  kernelCheckLiveImportWalkLaterSource liveImportWalkLaterSource
    && hostFrontLiveImportWalkLaterReady

/-- Kernel check entry (live ImportWalkLater parse + HostKernel ready).
    Greppable: checkImportWalkLaterKernel, KERNEL-CHECK,
    PARSE-LIVE-IMPORT-WALK-LATER. -/
def checkImportWalkLaterKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportWalkLaterParseOk

/-- Combined HostImportGraphWalkLater kernel dual-pin.
    Greppable: hostModuleCheckImportWalkLaterKernelOk, KERNEL-CHECK,
    HostImportGraphWalkLater-only. -/
def hostModuleCheckImportWalkLaterKernelOk : Bool :=
  hostModuleCheckImportWalkLaterKernelDualOk
    && (checkDepthImportWalkLaterKernelBar == "KERNEL-CHECK")
    && (checkDepthImportWalkLaterKernelScope
      == "HostImportGraphWalkLater-only")
    && checkImportWalkLaterKernel

end SystemsLean.HostModuleCheck
