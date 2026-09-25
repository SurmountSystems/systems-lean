/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckParityLinearTermKernel.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckParityLinearTermKernel.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckParityLinearTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PARITY-LINEAR-TERM-KERNEL.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckParityLinearTermKernel.lean"

/-- Pinned live HostModuleCheckParityLinearTermKernel.lean bytes. -/
def liveHostModuleCheckParityLinearTermKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityLinearTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityLinearTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityLinearTerm parse of live HostModuleCheckParityLinearTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-LINEAR-TERM).
  Live HostModuleCheckParityLinearTerm.lean parse is
  SystemsLean.HostFrontLiveParityLinearTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityLinearTermKernel, KERNEL-CHECK,
  HostModuleCheckParityLinearTerm-only, checkParityLinearTermKernel,
  hostModuleCheckParityLinearTermKernelOk,
  hostModuleCheckLiveParityLinearTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityLinearTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityLinearTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityLinearTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityLinearTerm

/-! ### HostModuleCheckParityLinearTerm KERNEL-CHECK pins (live
    HostModuleCheckParityLinearTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityLinearTerm.
    Greppable: checkDepthParityLinearTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def checkDepthParityLinearTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityLinearTerm live parse only.
    Greppable: checkDepthParityLinearTermKernelScope,
    HostModuleCheckParityLinearTerm-only, KERNEL-CHECK. -/
def checkDepthParityLinearTermKernelScope : String :=
  "HostModuleCheckParityLinearTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityLinearTermKernelOk).
    Greppable: hostModuleCheckParityLinearTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def hostModuleCheckParityLinearTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityLinearTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityLinearTermParseOk,
    PARSE-LIVE-PARITY-LINEAR-TERM. -/
def hostModuleCheckLiveParityLinearTermParseOk : Bool :=
  kernelCheckLiveParityLinearTermSource liveParityLinearTermSource
    && hostFrontLiveParityLinearTermReady

/-- Kernel check entry (live ParityLinearTerm parse + HostKernel ready).
    Greppable: checkParityLinearTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-LINEAR-TERM. -/
def checkParityLinearTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityLinearTermParseOk

/-- Combined HostModuleCheckParityLinearTerm kernel dual-pin.
    Greppable: hostModuleCheckParityLinearTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityLinearTerm-only. -/
def hostModuleCheckParityLinearTermKernelOk : Bool :=
  hostModuleCheckParityLinearTermKernelDualOk
    && (checkDepthParityLinearTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityLinearTermKernelScope
      == "HostModuleCheckParityLinearTerm-only")
    && checkParityLinearTermKernel

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckParityLinearTermKernelSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckParityLinearTermKernelSourceReady : Bool :=
  liveRel == "HostModuleCheckParityLinearTermKernel.lean"
    && kernelCheckLiveHostModuleCheckParityLinearTermKernelSource liveHostModuleCheckParityLinearTermKernelSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckParityLinearTermKernelSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckParityLinearTermKernel.lean")
  let k := kernelCheckLiveHostModuleCheckParityLinearTermKernelSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckParityLinearTermKernel parse false")
  unless hostFrontLiveHostModuleCheckParityLinearTermKernelSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource
