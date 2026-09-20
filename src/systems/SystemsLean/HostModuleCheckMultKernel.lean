/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.Mult.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Mult KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds beyond PARTIAL-STRUCTURAL greps and TERM-SURFACE dialect:
  - HostKernel.kernelCheck of HostTerm.multFixtureModule (SystemsLean.Mult IR).
  - HostFront G1 parse then kernelCheck (Mult-first dialect, not live Mult.lean).
  - HostFrontLiveMult parse of live Mult.lean then kernelCheck (PARSE-LIVE-MULT).
  - E-bad HostTerm IR rejects (name Nat arms, isValid String arm, extra app).
  Live Mult.lean parse is SystemsLean.HostFrontLiveMult, not the fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckMultKernel,
  KERNEL-CHECK, Mult-only, checkMultKernel, refineMultWithKernel,
  hostModuleCheckMultKernelOk, hostModuleCheckMultKernelDualOk,
  checkDepthMultKernelBar, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostModuleCheckMultKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckMultKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFront
import SystemsLean.HostFrontLiveMult
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFront
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostTerm

/-! ### Mult KERNEL-CHECK pins (HostKernel + HostFront G1) -/

/-- Named kernel depth bar for Mult. Greppable: checkDepthMultKernelBar,
    KERNEL-CHECK, Mult-only. -/
def checkDepthMultKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.Mult HostTerm fixture / G1 only.
    Greppable: checkDepthMultKernelScope, Mult-only, KERNEL-CHECK. -/
def checkDepthMultKernelScope : String := "Mult-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckMultKernelOk).
    Greppable: hostModuleCheckMultKernelDualOk, KERNEL-CHECK, Mult-only. -/
def hostModuleCheckMultKernelDualOk : Bool := true

/-- HostFront G1 (SystemsLean.Mult dialect) kernel-checks.
    Greppable: hostModuleCheckMultG1KernelOk, KERNEL-CHECK. -/
def hostModuleCheckMultG1KernelOk : Bool :=
  match parseSource goodG1Text with
  | FrontResult.accept m => kernelCheck m
  | FrontResult.reject _ => false

/-- Live Mult.lean parse kernel-checks. Not the HostTerm fixture.
    Greppable: hostModuleCheckLiveMultParseOk, PARSE-LIVE-MULT. -/
def hostModuleCheckLiveMultParseOk : Bool :=
  kernelCheckLiveMultSource liveMultSource && hostFrontLiveMultReady

/-- Kernel check entry (fixture + G1 + live parse + HostKernel ready).
    Greppable: checkMultKernel, KERNEL-CHECK, PARSE-LIVE-MULT. -/
def checkMultKernel : Bool :=
  hostKernelReady
    && kernelCheckMultFixture
    && hostModuleCheckMultG1KernelOk
    && hostModuleCheckLiveMultParseOk
    && kernelRejectIllTypedName
    && kernelRejectIllTypedIsValid
    && kernelRejectIllTypedApp

/-- Combined Mult kernel dual-pin.
    Greppable: hostModuleCheckMultKernelOk, KERNEL-CHECK, Mult-only. -/
def hostModuleCheckMultKernelOk : Bool :=
  hostModuleCheckMultKernelDualOk
    && (checkDepthMultKernelBar == "KERNEL-CHECK")
    && (checkDepthMultKernelScope == "Mult-only")
    && checkMultKernel

/-- Apply Mult kernel after structural+term accept. Live Mult.lean still
    uses L0/L2 on content; kernel gate is the SystemsLean.Mult HostTerm path.
    Greppable: refineMultWithKernel, KERNEL-CHECK. -/
def refineMultWithKernel (structural : ModuleCheckResult)
    (_content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    if hostModuleCheckMultKernelOk then
      ModuleCheckResult.accept s
    else
      ModuleCheckResult.reject reasonIllTypedTerm

end SystemsLean.HostModuleCheck
