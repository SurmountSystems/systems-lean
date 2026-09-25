/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphModel.
  Short role: named driver for just slake-typecheck-hostimportgraphmodel.
  Ready is HostFrontLiveHostImportGraphModel parse plus HostKernel.kernelCheck
  of live HostImportGraphModel.lean, not := true, not lake build
  SystemsLean.HostImportGraphModel.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not steal HostFrontLiveHostImportGraphLoadOk (liveRel is
  HostImportGraphLoadOk.lean). Do not edit occupancy leftover
  HostFrontLiveImportLoadOkLater. Do not steal mill wrap
  HostFrontLiveHostImportGraphMain.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphLoadOk is not a
  prefix of this driver):
  SlakeTypecheckHostImportGraphModel
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODEL
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODEL_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODEL
  slake-typecheck-hostimportgraphmodel
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphmodel,
  slakeTypecheckHostImportGraphModelReady,
  kernelCheckLiveHostImportGraphModelSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphModel
  Checkable writer: just slake-typecheck-hostimportgraphmodel
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphModel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODEL"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphModel. -/
def justRecipeSlakeTypecheckHostImportGraphModel : String :=
  "slake-typecheck-hostimportgraphmodel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphModelRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphModel.liveHostImportGraphModelRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphModel.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphModel.liveRel

/-- Ready names HostFrontLiveHostImportGraphModel parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphModelReady,
    kernelCheckLiveHostImportGraphModelSource. -/
def slakeTypecheckHostImportGraphModelReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphModel.hostFrontLiveHostImportGraphModelReady

/-- Honesty: this command is not lake build of HostImportGraphModel. -/
def slakeTypecheckHostImportGraphModelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphModelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphModelOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphModel.lean.
    Ready is HostFrontLiveHostImportGraphModel.hostFrontLiveHostImportGraphModelReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphModel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphModel} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphModelRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphModelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphModelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphModel.main args
