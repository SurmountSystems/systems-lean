/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphModel.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphModel KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportModel parse of live HostImportGraphModel.lean then
    kernelCheck (PARSE-LIVE-IMPORT-MODEL).
  Live HostImportGraphModel.lean parse is SystemsLean.HostFrontLiveImportModel,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportModelKernel, KERNEL-CHECK, HostImportGraphModel-only,
  checkImportModelKernel, hostModuleCheckImportModelKernelOk,
  hostModuleCheckLiveImportModelParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportModelKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportModelKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportModel

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportModel

/-! ### HostImportGraphModel KERNEL-CHECK pins (live HostImportGraphModel.lean,
    not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphModel.
    Greppable: checkDepthImportModelKernelBar, KERNEL-CHECK,
    HostImportGraphModel-only. -/
def checkDepthImportModelKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphModel live parse only.
    Greppable: checkDepthImportModelKernelScope, HostImportGraphModel-only,
    KERNEL-CHECK. -/
def checkDepthImportModelKernelScope : String := "HostImportGraphModel-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportModelKernelOk).
    Greppable: hostModuleCheckImportModelKernelDualOk, KERNEL-CHECK,
    HostImportGraphModel-only. -/
def hostModuleCheckImportModelKernelDualOk : Bool := true

/-- Live HostImportGraphModel.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveImportModelParseOk, PARSE-LIVE-IMPORT-MODEL. -/
def hostModuleCheckLiveImportModelParseOk : Bool :=
  kernelCheckLiveImportModelSource liveImportModelSource
    && hostFrontLiveImportModelReady

/-- Kernel check entry (live ImportModel parse + HostKernel ready).
    Greppable: checkImportModelKernel, KERNEL-CHECK, PARSE-LIVE-IMPORT-MODEL. -/
def checkImportModelKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportModelParseOk

/-- Combined HostImportGraphModel kernel dual-pin.
    Greppable: hostModuleCheckImportModelKernelOk, KERNEL-CHECK,
    HostImportGraphModel-only. -/
def hostModuleCheckImportModelKernelOk : Bool :=
  hostModuleCheckImportModelKernelDualOk
    && (checkDepthImportModelKernelBar == "KERNEL-CHECK")
    && (checkDepthImportModelKernelScope == "HostImportGraphModel-only")
    && checkImportModelKernel

end SystemsLean.HostModuleCheck
