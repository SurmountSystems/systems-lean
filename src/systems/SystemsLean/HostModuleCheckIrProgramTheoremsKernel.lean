/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for IrProgramTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: IrProgramTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveIrProgramTheorems parse of live IrProgramTheorems.lean then
    kernelCheck (PARSE-LIVE-IR-PROGRAM-THEOREMS).
  Live IrProgramTheorems.lean parse is SystemsLean.HostFrontLiveIrProgramTheorems,
  not the Mult fixture and not HostFrontLiveIrProgram (live IrProgram.lean defs).

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckIrProgramTheoremsKernel,
  KERNEL-CHECK, IrProgramTheorems-only, checkIrProgramTheoremsKernel,
  hostModuleCheckIrProgramTheoremsKernelOk, hostModuleCheckLiveIrProgramTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckIrProgramTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckIrProgramTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveIrProgramTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveIrProgramTheorems

/-! ### IrProgramTheorems KERNEL-CHECK pins (live IrProgramTheorems.lean) -/

/-- Named kernel depth bar for IrProgramTheorems.
    Greppable: checkDepthIrProgramTheoremsKernelBar, KERNEL-CHECK,
    IrProgramTheorems-only. -/
def checkDepthIrProgramTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.IrProgramTheorems live parse only.
    Greppable: checkDepthIrProgramTheoremsKernelScope, IrProgramTheorems-only,
    KERNEL-CHECK. -/
def checkDepthIrProgramTheoremsKernelScope : String := "IrProgramTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckIrProgramTheoremsKernelOk).
    Greppable: hostModuleCheckIrProgramTheoremsKernelDualOk, KERNEL-CHECK,
    IrProgramTheorems-only. -/
def hostModuleCheckIrProgramTheoremsKernelDualOk : Bool := true

/-- Live IrProgramTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveIrProgramTheoremsParseOk,
    PARSE-LIVE-IR-PROGRAM-THEOREMS. -/
def hostModuleCheckLiveIrProgramTheoremsParseOk : Bool :=
  kernelCheckLiveIrProgramTheoremsSource liveIrProgramTheoremsSource
    && hostFrontLiveIrProgramTheoremsReady

/-- Kernel check entry (live IrProgramTheorems parse + HostKernel ready).
    Greppable: checkIrProgramTheoremsKernel, KERNEL-CHECK,
    PARSE-LIVE-IR-PROGRAM-THEOREMS. -/
def checkIrProgramTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveIrProgramTheoremsParseOk

/-- Combined IrProgramTheorems kernel dual-pin.
    Greppable: hostModuleCheckIrProgramTheoremsKernelOk, KERNEL-CHECK,
    IrProgramTheorems-only. -/
def hostModuleCheckIrProgramTheoremsKernelOk : Bool :=
  hostModuleCheckIrProgramTheoremsKernelDualOk
    && (checkDepthIrProgramTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthIrProgramTheoremsKernelScope == "IrProgramTheorems-only")
    && checkIrProgramTheoremsKernel

end SystemsLean.HostModuleCheck
