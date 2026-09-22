/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphModel.
  Short role: named driver for just slake-typecheck-importmodel.
  Ready is HostFrontLiveImportModel parse plus HostKernel.kernelCheck of live
  HostImportGraphModel.lean, not := true, not lake build
  SystemsLean.HostImportGraphModel.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-MODEL,
  SLAKE_TYPECHECK_IMPORT_MODEL_V0, slake-typecheck-importmodel,
  slakeTypecheckImportModelReady, kernelCheckLiveImportModelSource,
  PARSE-LIVE-IMPORT-MODEL, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportModel
  Checkable writer: just slake-typecheck-importmodel (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportModel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_MODEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-MODEL"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphModel. -/
def justRecipeSlakeTypecheckImportModel : String := "slake-typecheck-importmodel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModelRel : String :=
  SystemsLean.HostFrontLiveImportModel.liveImportModelRel

/-- Ready names HostFrontLiveImportModel parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportModelReady, kernelCheckLiveImportModelSource. -/
def slakeTypecheckImportModelReady : Bool :=
  SystemsLean.HostFrontLiveImportModel.hostFrontLiveImportModelReady

/-- Honesty: this command is not lake build of HostImportGraphModel. -/
def slakeTypecheckImportModelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportModelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportModelOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphModel.lean.
    Ready is HostFrontLiveImportModel.hostFrontLiveImportModelReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveImportModel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportModel} =="
  IO.println s!"  host={hostId} file={liveImportModelRel}"
  unless (!slakeTypecheckImportModelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportModelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportModel.main args
