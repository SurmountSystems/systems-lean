/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphDriver.
  Short role: named driver for just slake-typecheck-hostimportgraphdriver.
  Ready is HostFrontLiveHostImportGraphDriver parse plus HostKernel.kernelCheck
  of live HostImportGraphDriver.lean, not := true, not lake build
  SystemsLean.HostImportGraphDriver.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphDriver is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain):
  SlakeTypecheckHostImportGraphDriver
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-DRIVER
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_DRIVER_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-DRIVER
  slake-typecheck-hostimportgraphdriver
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphdriver,
  slakeTypecheckHostImportGraphDriverReady,
  kernelCheckLiveHostImportGraphDriverSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphDriver
  Checkable writer: just slake-typecheck-hostimportgraphdriver
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphDriver

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_DRIVER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-DRIVER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphDriver. -/
def justRecipeSlakeTypecheckHostImportGraphDriver : String :=
  "slake-typecheck-hostimportgraphdriver"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphDriverRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphDriver.liveHostImportGraphDriverRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphDriver.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphDriver.liveRel

/-- Ready names HostFrontLiveHostImportGraphDriver parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphDriverReady,
    kernelCheckLiveHostImportGraphDriverSource. -/
def slakeTypecheckHostImportGraphDriverReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphDriver.hostFrontLiveHostImportGraphDriverReady

/-- Honesty: this command is not lake build of HostImportGraphDriver. -/
def slakeTypecheckHostImportGraphDriverDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphDriverFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphDriverOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphDriver.lean.
    Ready is HostFrontLiveHostImportGraphDriver.hostFrontLiveHostImportGraphDriverReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphDriver.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphDriver} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphDriverRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphDriverFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphDriverOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphDriver.main args
