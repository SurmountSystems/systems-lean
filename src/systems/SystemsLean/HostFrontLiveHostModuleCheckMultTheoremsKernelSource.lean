/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckMultTheoremsKernel.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckMultTheoremsKernel.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckMultTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-MULT-THEOREMS-KERNEL.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckMultTheoremsKernel.lean"

/-- Pinned live HostModuleCheckMultTheoremsKernel.lean bytes. -/
def liveHostModuleCheckMultTheoremsKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for MultTheorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultTheorems KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveMultTheorems parse of live MultTheorems.lean then
    kernelCheck (PARSE-LIVE-MULT-THEOREMS).
  Live MultTheorems.lean parse is SystemsLean.HostFrontLiveMultTheorems,
  not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckMultTheoremsKernel,
  KERNEL-CHECK, MultTheorems-only, checkMultTheoremsKernel,
  hostModuleCheckMultTheoremsKernelOk, hostModuleCheckLiveMultTheoremsParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckMultTheoremsKernel
  Red/green: just systems-host; lake build
  SystemsLean.HostModuleCheckMultTheoremsKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveMultTheorems

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMultTheorems

/-! ### MultTheorems KERNEL-CHECK pins (live MultTheorems.lean) -/

/-- Named kernel depth bar for MultTheorems.
    Greppable: checkDepthMultTheoremsKernelBar, KERNEL-CHECK,
    MultTheorems-only. -/
def checkDepthMultTheoremsKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.MultTheorems live parse only.
    Greppable: checkDepthMultTheoremsKernelScope, MultTheorems-only,
    KERNEL-CHECK. -/
def checkDepthMultTheoremsKernelScope : String := "MultTheorems-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckMultTheoremsKernelOk).
    Greppable: hostModuleCheckMultTheoremsKernelDualOk, KERNEL-CHECK,
    MultTheorems-only. -/
def hostModuleCheckMultTheoremsKernelDualOk : Bool := true

/-- Live MultTheorems.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveMultTheoremsParseOk, PARSE-LIVE-MULT-THEOREMS. -/
def hostModuleCheckLiveMultTheoremsParseOk : Bool :=
  kernelCheckLiveMultTheoremsSource liveMultTheoremsSource
    && hostFrontLiveMultTheoremsReady

/-- Kernel check entry (live MultTheorems parse + HostKernel ready).
    Greppable: checkMultTheoremsKernel, KERNEL-CHECK, PARSE-LIVE-MULT-THEOREMS. -/
def checkMultTheoremsKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveMultTheoremsParseOk

/-- Combined MultTheorems kernel dual-pin.
    Greppable: hostModuleCheckMultTheoremsKernelOk, KERNEL-CHECK,
    MultTheorems-only. -/
def hostModuleCheckMultTheoremsKernelOk : Bool :=
  hostModuleCheckMultTheoremsKernelDualOk
    && (checkDepthMultTheoremsKernelBar == "KERNEL-CHECK")
    && (checkDepthMultTheoremsKernelScope == "MultTheorems-only")
    && checkMultTheoremsKernel

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckMultTheoremsKernelSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckMultTheoremsKernelSourceReady : Bool :=
  liveRel == "HostModuleCheckMultTheoremsKernel.lean"
    && kernelCheckLiveHostModuleCheckMultTheoremsKernelSource liveHostModuleCheckMultTheoremsKernelSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckMultTheoremsKernelSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckMultTheoremsKernel.lean")
  let k := kernelCheckLiveHostModuleCheckMultTheoremsKernelSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckMultTheoremsKernel parse false")
  unless hostFrontLiveHostModuleCheckMultTheoremsKernelSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource
