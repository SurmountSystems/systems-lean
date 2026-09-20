/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.IrProgram.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: IrProgram KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveIrProgram parse of live IrProgram.lean then kernelCheck
    (PARSE-LIVE-IR-PROGRAM).
  Live IrProgram.lean parse is SystemsLean.HostFrontLiveIrProgram, not the
  Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckIrProgramKernel,
  KERNEL-CHECK, IrProgram-only, checkIrProgramKernel,
  hostModuleCheckIrProgramKernelOk, hostModuleCheckLiveIrProgramParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckIrProgramKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckIrProgramKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveIrProgram

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveIrProgram

/-! ### IrProgram KERNEL-CHECK pins (live IrProgram.lean, not Mult fixture) -/

/-- Named kernel depth bar for IrProgram. Greppable: checkDepthIrProgramKernelBar,
    KERNEL-CHECK, IrProgram-only. -/
def checkDepthIrProgramKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.IrProgram live parse only.
    Greppable: checkDepthIrProgramKernelScope, IrProgram-only, KERNEL-CHECK. -/
def checkDepthIrProgramKernelScope : String := "IrProgram-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckIrProgramKernelOk).
    Greppable: hostModuleCheckIrProgramKernelDualOk, KERNEL-CHECK, IrProgram-only. -/
def hostModuleCheckIrProgramKernelDualOk : Bool := true

/-- Live IrProgram.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveIrProgramParseOk, PARSE-LIVE-IR-PROGRAM. -/
def hostModuleCheckLiveIrProgramParseOk : Bool :=
  kernelCheckLiveIrProgramSource liveIrProgramSource
    && hostFrontLiveIrProgramReady

/-- Kernel check entry (live IrProgram parse + HostKernel ready).
    Greppable: checkIrProgramKernel, KERNEL-CHECK, PARSE-LIVE-IR-PROGRAM. -/
def checkIrProgramKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveIrProgramParseOk

/-- Combined IrProgram kernel dual-pin.
    Greppable: hostModuleCheckIrProgramKernelOk, KERNEL-CHECK, IrProgram-only. -/
def hostModuleCheckIrProgramKernelOk : Bool :=
  hostModuleCheckIrProgramKernelDualOk
    && (checkDepthIrProgramKernelBar == "KERNEL-CHECK")
    && (checkDepthIrProgramKernelScope == "IrProgram-only")
    && checkIrProgramKernel

end SystemsLean.HostModuleCheck
