/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckLoadOkCompilePathUnits.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckLoadOkCompilePathUnits.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckLoadOkCompilePathUnitsSource,
  PARSE-LIVE-HOST-MODULE-CHECK-LOAD-OK-COMPILE-PATH-UNITS.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLoadOkCompilePathUnitsSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckLoadOkCompilePathUnitsSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckLoadOkCompilePathUnits.lean"

/-- Pinned live HostModuleCheckLoadOkCompilePathUnits.lean bytes. -/
def liveHostModuleCheckLoadOkCompilePathUnitsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LoadOk fold for S8 CompilePath unit TERM SurfaceOk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: aggregate dual-ok gates for CompilePathMult..Extract
  plus Plan/Apply/Body TERM companions so HostModuleCheckLoadOk stays under
  Sub-1-KLOC.
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only. Not FullHost re-true. Not package elaborate.
  - Mult..DualResidual prior TERM dual-ok unchanged.
  - Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLoadOkCompilePathUnits, hostModuleCheckCompilePathUnitsTermSurfaceOk,
  TERM-SURFACE, CompilePathMult-only, CompilePathLinear-only, CompilePathTypes-only,
  CompilePathProgram-only, CompilePathGraph-only, CompilePathCompose-only,
  CompilePathErasure-only, CompilePathExtract-only,
  CompilePathPlan-only, CompilePathApply-only, CompilePathBody-only,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLoadOkCompilePathUnits
  Red/green: lake build SystemsLean.HostModuleCheckLoadOkCompilePathUnits;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckCompilePathMultTerm
import SystemsLean.HostModuleCheckCompilePathLinearTerm
import SystemsLean.HostModuleCheckCompilePathTypesTerm
import SystemsLean.HostModuleCheckCompilePathProgramTerm
import SystemsLean.HostModuleCheckCompilePathGraphTerm
import SystemsLean.HostModuleCheckCompilePathComposeTerm
import SystemsLean.HostModuleCheckCompilePathErasureTerm
import SystemsLean.HostModuleCheckCompilePathExtractTerm
import SystemsLean.HostModuleCheckCompilePathPlanTerm
import SystemsLean.HostModuleCheckCompilePathApplyTerm
import SystemsLean.HostModuleCheckCompilePathBodyTerm

namespace SystemsLean.HostModuleCheck

/-- S8 CompilePath unit modules TERM SurfaceOk aggregate (LoadOk fold).
    Greppable: hostModuleCheckCompilePathUnitsTermSurfaceOk, TERM-SURFACE. -/
def hostModuleCheckCompilePathUnitsTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathMultTermSurfaceOk
    && hostModuleCheckCompilePathLinearTermSurfaceOk
    && hostModuleCheckCompilePathTypesTermSurfaceOk
    && hostModuleCheckCompilePathProgramTermSurfaceOk
    && hostModuleCheckCompilePathGraphTermSurfaceOk
    && hostModuleCheckCompilePathComposeTermSurfaceOk
    && hostModuleCheckCompilePathErasureTermSurfaceOk
    && hostModuleCheckCompilePathExtractTermSurfaceOk
    && hostModuleCheckCompilePathPlanTermSurfaceOk
    && hostModuleCheckCompilePathApplyTermSurfaceOk
    && hostModuleCheckCompilePathBodyTermSurfaceOk

theorem hostModuleCheckCompilePathUnitsTermSurfaceOk_true :
    hostModuleCheckCompilePathUnitsTermSurfaceOk = true := by native_decide

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckLoadOkCompilePathUnitsSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckLoadOkCompilePathUnitsSourceReady : Bool :=
  liveRel == "HostModuleCheckLoadOkCompilePathUnits.lean"
    && kernelCheckLiveHostModuleCheckLoadOkCompilePathUnitsSource liveHostModuleCheckLoadOkCompilePathUnitsSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckLoadOkCompilePathUnitsSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckLoadOkCompilePathUnits.lean")
  let k := kernelCheckLiveHostModuleCheckLoadOkCompilePathUnitsSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckLoadOkCompilePathUnits parse false")
  unless hostFrontLiveHostModuleCheckLoadOkCompilePathUnitsSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckLoadOkCompilePathUnitsSource
