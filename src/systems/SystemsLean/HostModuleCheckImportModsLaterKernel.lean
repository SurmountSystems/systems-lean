/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphModsLater.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphModsLater KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportModsLater parse of live HostImportGraphModsLater.lean
    then kernelCheck (PARSE-LIVE-IMPORT-MODS-LATER).
  Live HostImportGraphModsLater.lean parse is
  SystemsLean.HostFrontLiveImportModsLater, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportModsLaterKernel, KERNEL-CHECK,
  HostImportGraphModsLater-only, checkImportModsLaterKernel,
  hostModuleCheckImportModsLaterKernelOk,
  hostModuleCheckLiveImportModsLaterParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportModsLaterKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportModsLaterKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportModsLater

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportModsLater

/-! ### HostImportGraphModsLater KERNEL-CHECK pins (live
    HostImportGraphModsLater.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphModsLater.
    Greppable: checkDepthImportModsLaterKernelBar, KERNEL-CHECK,
    HostImportGraphModsLater-only. -/
def checkDepthImportModsLaterKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphModsLater live parse only.
    Greppable: checkDepthImportModsLaterKernelScope,
    HostImportGraphModsLater-only, KERNEL-CHECK. -/
def checkDepthImportModsLaterKernelScope : String :=
  "HostImportGraphModsLater-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportModsLaterKernelOk).
    Greppable: hostModuleCheckImportModsLaterKernelDualOk, KERNEL-CHECK,
    HostImportGraphModsLater-only. -/
def hostModuleCheckImportModsLaterKernelDualOk : Bool := true

/-- Live HostImportGraphModsLater.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveImportModsLaterParseOk,
    PARSE-LIVE-IMPORT-MODS-LATER. -/
def hostModuleCheckLiveImportModsLaterParseOk : Bool :=
  kernelCheckLiveImportModsLaterSource liveImportModsLaterSource
    && hostFrontLiveImportModsLaterReady

/-- Kernel check entry (live ImportModsLater parse + HostKernel ready).
    Greppable: checkImportModsLaterKernel, KERNEL-CHECK,
    PARSE-LIVE-IMPORT-MODS-LATER. -/
def checkImportModsLaterKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportModsLaterParseOk

/-- Combined HostImportGraphModsLater kernel dual-pin.
    Greppable: hostModuleCheckImportModsLaterKernelOk, KERNEL-CHECK,
    HostImportGraphModsLater-only. -/
def hostModuleCheckImportModsLaterKernelOk : Bool :=
  hostModuleCheckImportModsLaterKernelDualOk
    && (checkDepthImportModsLaterKernelBar == "KERNEL-CHECK")
    && (checkDepthImportModsLaterKernelScope == "HostImportGraphModsLater-only")
    && checkImportModsLaterKernel

end SystemsLean.HostModuleCheck
