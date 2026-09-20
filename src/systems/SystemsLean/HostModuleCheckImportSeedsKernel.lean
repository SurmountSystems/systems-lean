/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphSeeds.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphSeeds KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportSeeds parse of live HostImportGraphSeeds.lean then
    kernelCheck (PARSE-LIVE-IMPORT-SEEDS).
  Live HostImportGraphSeeds.lean parse is SystemsLean.HostFrontLiveImportSeeds,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportSeedsKernel, KERNEL-CHECK, HostImportGraphSeeds-only,
  checkImportSeedsKernel, hostModuleCheckImportSeedsKernelOk,
  hostModuleCheckLiveImportSeedsParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportSeedsKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportSeedsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportSeeds

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportSeeds

/-! ### HostImportGraphSeeds KERNEL-CHECK pins (live HostImportGraphSeeds.lean,
    not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphSeeds.
    Greppable: checkDepthImportSeedsKernelBar, KERNEL-CHECK,
    HostImportGraphSeeds-only. -/
def checkDepthImportSeedsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphSeeds live parse only.
    Greppable: checkDepthImportSeedsKernelScope, HostImportGraphSeeds-only,
    KERNEL-CHECK. -/
def checkDepthImportSeedsKernelScope : String := "HostImportGraphSeeds-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportSeedsKernelOk).
    Greppable: hostModuleCheckImportSeedsKernelDualOk, KERNEL-CHECK,
    HostImportGraphSeeds-only. -/
def hostModuleCheckImportSeedsKernelDualOk : Bool := true

/-- Live HostImportGraphSeeds.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveImportSeedsParseOk, PARSE-LIVE-IMPORT-SEEDS. -/
def hostModuleCheckLiveImportSeedsParseOk : Bool :=
  kernelCheckLiveImportSeedsSource liveImportSeedsSource
    && hostFrontLiveImportSeedsReady

/-- Kernel check entry (live ImportSeeds parse + HostKernel ready).
    Greppable: checkImportSeedsKernel, KERNEL-CHECK, PARSE-LIVE-IMPORT-SEEDS. -/
def checkImportSeedsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportSeedsParseOk

/-- Combined HostImportGraphSeeds kernel dual-pin.
    Greppable: hostModuleCheckImportSeedsKernelOk, KERNEL-CHECK,
    HostImportGraphSeeds-only. -/
def hostModuleCheckImportSeedsKernelOk : Bool :=
  hostModuleCheckImportSeedsKernelDualOk
    && (checkDepthImportSeedsKernelBar == "KERNEL-CHECK")
    && (checkDepthImportSeedsKernelScope == "HostImportGraphSeeds-only")
    && checkImportSeedsKernel

end SystemsLean.HostModuleCheck
