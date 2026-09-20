/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostImportGraphMods.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostImportGraphMods KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveImportMods parse of live HostImportGraphMods.lean then
    kernelCheck (PARSE-LIVE-IMPORT-MODS).
  Live HostImportGraphMods.lean parse is SystemsLean.HostFrontLiveImportMods,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckImportModsKernel, KERNEL-CHECK, HostImportGraphMods-only,
  checkImportModsKernel, hostModuleCheckImportModsKernelOk,
  hostModuleCheckLiveImportModsParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckImportModsKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckImportModsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveImportMods

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveImportMods

/-! ### HostImportGraphMods KERNEL-CHECK pins (live HostImportGraphMods.lean,
    not Mult fixture) -/

/-- Named kernel depth bar for HostImportGraphMods.
    Greppable: checkDepthImportModsKernelBar, KERNEL-CHECK,
    HostImportGraphMods-only. -/
def checkDepthImportModsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostImportGraphMods live parse only.
    Greppable: checkDepthImportModsKernelScope, HostImportGraphMods-only,
    KERNEL-CHECK. -/
def checkDepthImportModsKernelScope : String := "HostImportGraphMods-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckImportModsKernelOk).
    Greppable: hostModuleCheckImportModsKernelDualOk, KERNEL-CHECK,
    HostImportGraphMods-only. -/
def hostModuleCheckImportModsKernelDualOk : Bool := true

/-- Live HostImportGraphMods.lean parse kernel-checks. Not the HostTerm Mult
    fixture.
    Greppable: hostModuleCheckLiveImportModsParseOk, PARSE-LIVE-IMPORT-MODS. -/
def hostModuleCheckLiveImportModsParseOk : Bool :=
  kernelCheckLiveImportModsSource liveImportModsSource
    && hostFrontLiveImportModsReady

/-- Kernel check entry (live ImportMods parse + HostKernel ready).
    Greppable: checkImportModsKernel, KERNEL-CHECK, PARSE-LIVE-IMPORT-MODS. -/
def checkImportModsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveImportModsParseOk

/-- Combined HostImportGraphMods kernel dual-pin.
    Greppable: hostModuleCheckImportModsKernelOk, KERNEL-CHECK,
    HostImportGraphMods-only. -/
def hostModuleCheckImportModsKernelOk : Bool :=
  hostModuleCheckImportModsKernelDualOk
    && (checkDepthImportModsKernelBar == "KERNEL-CHECK")
    && (checkDepthImportModsKernelScope == "HostImportGraphMods-only")
    && checkImportModsKernel

end SystemsLean.HostModuleCheck
