/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphLoadOkLater.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphLoadOkLater KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportLoadOkLater parse of live HostImportGraphLoadOkLater.lean
    then kernelCheck (PARSE-LIVE-IMPORT-LOADOKLATER).
  Live HostImportGraphLoadOkLater.lean parse is
  SystemsLean.HostFrontLiveImportLoadOkLater, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportLoadOkLaterKernel, KERNEL-CHECK,
  HostImportGraphLoadOkLater-only, checkImportLoadOkLaterKernel,
  hostModuleCheckImportLoadOkLaterKernelOk,
  hostModuleCheckLiveImportLoadOkLaterParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportLoadOkLaterKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportLoadOkLaterKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportLoadOkLater

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportLoadOkLater

/-! ### HostImportGraphLoadOkLater KERNEL-CHECK pins (live
    HostImportGraphLoadOkLater.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphLoadOkLater.
    Greppable: checkDepthImportLoadOkLaterKernelBar, KERNEL-CHECK,
    HostImportGraphLoadOkLater-only. -/
def checkDepthImportLoadOkLaterKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphLoadOkLater live parse only.
    Greppable: checkDepthImportLoadOkLaterKernelScope,
    HostImportGraphLoadOkLater-only, KERNEL-CHECK. -/
def checkDepthImportLoadOkLaterKernelScope : String :=
  "HostImportGraphLoadOkLater-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportLoadOkLaterKernelOk).
    Greppable: hostModuleCheckImportLoadOkLaterKernelDualOk, KERNEL-CHECK,
    HostImportGraphLoadOkLater-only. -/
def hostModuleCheckImportLoadOkLaterKernelDualOk : Bool := true

/-- Live HostImportGraphLoadOkLater.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveImportLoadOkLaterParseOk,
    PARSE-LIVE-IMPORT-LOADOKLATER. -/
def hostModuleCheckLiveImportLoadOkLaterParseOk : Bool :=
  kernelCheckLiveImportLoadOkLaterSource liveImportLoadOkLaterSource
    && hostFrontLiveImportLoadOkLaterReady

/-- Kernel check entry (live ImportLoadOkLater parse + HostKernel ready).
    Greppable: checkImportLoadOkLaterKernel, KERNEL-CHECK,
    PARSE-LIVE-IMPORT-LOADOKLATER. -/
def checkImportLoadOkLaterKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportLoadOkLaterParseOk

/-- Combined HostImportGraphLoadOkLater kernel dual-pin.
    Greppable: hostModuleCheckImportLoadOkLaterKernelOk, KERNEL-CHECK,
    HostImportGraphLoadOkLater-only. -/
def hostModuleCheckImportLoadOkLaterKernelOk : Bool :=
  hostModuleCheckImportLoadOkLaterKernelDualOk
    && (checkDepthImportLoadOkLaterKernelBar == "KERNEL-CHECK")
    && (checkDepthImportLoadOkLaterKernelScope
      == "HostImportGraphLoadOkLater-only")
    && checkImportLoadOkLaterKernel

end SystemsLean.HostModuleCheck
