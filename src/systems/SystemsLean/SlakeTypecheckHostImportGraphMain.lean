/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphMain.
  Short role: named driver for just slake-typecheck-hostimportgraphmain.
  Ready is HostFrontLiveHostImportGraphMain parse plus HostKernel.kernelCheck
  of live HostImportGraphMain.lean, not := true, not lake build
  SystemsLean.HostImportGraphMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphMain is not a prefix):
  SlakeTypecheckHostImportGraphMain
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MAIN
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MAIN_V0
  slake-typecheck-hostimportgraphmain
  PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN
  HOST-IMPORT-GRAPH-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphmain,
  slakeTypecheckHostImportGraphMainReady,
  kernelCheckLiveHostImportGraphMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphMain
  Checkable writer: just slake-typecheck-hostimportgraphmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphMain. -/
def justRecipeSlakeTypecheckHostImportGraphMain : String :=
  "slake-typecheck-hostimportgraphmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphMainRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphMain.liveHostImportGraphMainRel

/-- Ready names HostFrontLiveHostImportGraphMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphMainReady,
    kernelCheckLiveHostImportGraphMainSource. -/
def slakeTypecheckHostImportGraphMainReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphMain.hostFrontLiveHostImportGraphMainReady

/-- Honesty: this command is not lake build of HostImportGraphMain. -/
def slakeTypecheckHostImportGraphMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphMain.lean.
    Ready is HostFrontLiveHostImportGraphMain.hostFrontLiveHostImportGraphMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphMain} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphMainRel}"
  unless (!slakeTypecheckHostImportGraphMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphMain.main args
