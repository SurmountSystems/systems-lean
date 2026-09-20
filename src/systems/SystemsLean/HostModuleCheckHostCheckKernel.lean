/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for SystemsLean.HostCheck.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostCheck KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveCheck parse of live HostCheck.lean then kernelCheck
    (PARSE-LIVE-HOST-CHECK).
  Live HostCheck.lean parse is SystemsLean.HostFrontLiveCheck, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckHostCheckKernel,
  KERNEL-CHECK, HostCheck-only, checkHostCheckKernel, hostModuleCheckHostCheckKernelOk,
  hostModuleCheckLiveHostCheckParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckHostCheckKernel
  Red/green: just systems-host dest rows later (HostTerm holds nix/systems-host-presence);
  lake build SystemsLean.HostModuleCheckHostCheckKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveCheck

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveCheck

/-! ### HostCheck KERNEL-CHECK pins (live HostCheck.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostCheck. Greppable: checkDepthHostCheckKernelBar,
    KERNEL-CHECK, HostCheck-only. -/
def checkDepthHostCheckKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostCheck live parse only.
    Greppable: checkDepthHostCheckKernelScope, HostCheck-only, KERNEL-CHECK. -/
def checkDepthHostCheckKernelScope : String := "HostCheck-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckHostCheckKernelOk).
    Greppable: hostModuleCheckHostCheckKernelDualOk, KERNEL-CHECK, HostCheck-only. -/
def hostModuleCheckHostCheckKernelDualOk : Bool := true

/-- Live HostCheck.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveHostCheckParseOk, PARSE-LIVE-HOST-CHECK. -/
def hostModuleCheckLiveHostCheckParseOk : Bool :=
  kernelCheckLiveHostCheckSource liveHostCheckSource && hostFrontLiveCheckReady

/-- Kernel check entry (live HostCheck parse + HostKernel ready).
    Greppable: checkHostCheckKernel, KERNEL-CHECK, PARSE-LIVE-HOST-CHECK. -/
def checkHostCheckKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveHostCheckParseOk

/-- Combined HostCheck kernel dual-pin.
    Greppable: hostModuleCheckHostCheckKernelOk, KERNEL-CHECK, HostCheck-only. -/
def hostModuleCheckHostCheckKernelOk : Bool :=
  hostModuleCheckHostCheckKernelDualOk
    && (checkDepthHostCheckKernelBar == "KERNEL-CHECK")
    && (checkDepthHostCheckKernelScope == "HostCheck-only")
    && checkHostCheckKernel

end SystemsLean.HostModuleCheck
