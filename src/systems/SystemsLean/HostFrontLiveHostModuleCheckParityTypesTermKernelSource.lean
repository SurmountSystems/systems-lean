/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckParityTypesTermKernel.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckParityTypesTermKernel.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckParityTypesTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PARITY-TYPES-TERM-KERNEL.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckParityTypesTermKernel.lean"

/-- Repo-relative path. The basename is liveRel. -/
def livePath : String := "src/systems/SystemsLean/" ++ liveRel

/-- Pinned live HostModuleCheckParityTypesTermKernel.lean bytes. -/
def liveHostModuleCheckParityTypesTermKernelSource : String :=
r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckParityTypesTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckParityTypesTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveParityTypesTerm parse of live HostModuleCheckParityTypesTerm.lean
    then kernelCheck (PARSE-LIVE-PARITY-TYPES-TERM).
  Live HostModuleCheckParityTypesTerm.lean parse is
  SystemsLean.HostFrontLiveParityTypesTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckParityTypesTermKernel, KERNEL-CHECK,
  HostModuleCheckParityTypesTerm-only, checkParityTypesTermKernel,
  hostModuleCheckParityTypesTermKernelOk,
  hostModuleCheckLiveParityTypesTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckParityTypesTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckParityTypesTermKernel when on surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveParityTypesTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveParityTypesTerm

/-! ### HostModuleCheckParityTypesTerm KERNEL-CHECK pins (live
    HostModuleCheckParityTypesTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckParityTypesTerm.
    Greppable: checkDepthParityTypesTermKernelBar, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def checkDepthParityTypesTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckParityTypesTerm live parse only.
    Greppable: checkDepthParityTypesTermKernelScope,
    HostModuleCheckParityTypesTerm-only, KERNEL-CHECK. -/
def checkDepthParityTypesTermKernelScope : String :=
  "HostModuleCheckParityTypesTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckParityTypesTermKernelOk).
    Greppable: hostModuleCheckParityTypesTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def hostModuleCheckParityTypesTermKernelDualOk : Bool := true

/-- Live HostModuleCheckParityTypesTerm.lean parse kernel-checks. Not the
    HostTerm Mult fixture.
    Greppable: hostModuleCheckLiveParityTypesTermParseOk,
    PARSE-LIVE-PARITY-TYPES-TERM. -/
def hostModuleCheckLiveParityTypesTermParseOk : Bool :=
  kernelCheckLiveParityTypesTermSource liveParityTypesTermSource
    && hostFrontLiveParityTypesTermReady

/-- Kernel check entry (live ParityTypesTerm parse + HostKernel ready).
    Greppable: checkParityTypesTermKernel, KERNEL-CHECK,
    PARSE-LIVE-PARITY-TYPES-TERM. -/
def checkParityTypesTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveParityTypesTermParseOk

/-- Combined HostModuleCheckParityTypesTerm kernel dual-pin.
    Greppable: hostModuleCheckParityTypesTermKernelOk, KERNEL-CHECK,
    HostModuleCheckParityTypesTerm-only. -/
def hostModuleCheckParityTypesTermKernelOk : Bool :=
  hostModuleCheckParityTypesTermKernelDualOk
    && (checkDepthParityTypesTermKernelBar == "KERNEL-CHECK")
    && (checkDepthParityTypesTermKernelScope
      == "HostModuleCheckParityTypesTerm-only")
    && checkParityTypesTermKernel

end SystemsLean.HostModuleCheck
"#
/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckParityTypesTermKernelSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckParityTypesTermKernelSourceReady : Bool :=
  liveRel == "HostModuleCheckParityTypesTermKernel.lean"
    && livePath == "src/systems/SystemsLean/" ++ liveRel
    && kernelCheckLiveHostModuleCheckParityTypesTermKernelSource liveHostModuleCheckParityTypesTermKernelSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / livePath
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckParityTypesTermKernelSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckParityTypesTermKernel.lean")
  match parseLiveLlvmComposeTextMainSource disk with
  | FrontResult.accept m =>
    IO.println s!"accepted={m.commands.length}"
  | FrontResult.reject _ =>
    pure ()
  let k := kernelCheckLiveHostModuleCheckParityTypesTermKernelSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckParityTypesTermKernel parse false")
  unless hostFrontLiveHostModuleCheckParityTypesTermKernelSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource
