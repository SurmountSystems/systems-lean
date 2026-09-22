/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphLoadOk.
  Short role: named driver for just slake-typecheck-hostimportgraphloadok.
  Ready is HostFrontLiveHostImportGraphLoadOk parse plus HostKernel.kernelCheck
  of live HostImportGraphLoadOk.lean, not := true, not lake build
  SystemsLean.HostImportGraphLoadOk.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Do not steal HostImportGraphTheorems wrap. Do not steal ImportLoadOkLater.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphLoadOk is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain):
  SlakeTypecheckHostImportGraphLoadOk
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-LOADOK
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_LOADOK_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK
  slake-typecheck-hostimportgraphloadok
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphloadok,
  slakeTypecheckHostImportGraphLoadOkReady,
  kernelCheckLiveHostImportGraphLoadOkSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphLoadOk
  Checkable writer: just slake-typecheck-hostimportgraphloadok
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphLoadOk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_LOADOK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-LOADOK"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphLoadOk. -/
def justRecipeSlakeTypecheckHostImportGraphLoadOk : String :=
  "slake-typecheck-hostimportgraphloadok"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphLoadOkRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOk.liveHostImportGraphLoadOkRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphLoadOk.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOk.liveRel

/-- Ready names HostFrontLiveHostImportGraphLoadOk parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphLoadOkReady,
    kernelCheckLiveHostImportGraphLoadOkSource. -/
def slakeTypecheckHostImportGraphLoadOkReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOk.hostFrontLiveHostImportGraphLoadOkReady

/-- Honesty: this command is not lake build of HostImportGraphLoadOk. -/
def slakeTypecheckHostImportGraphLoadOkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphLoadOkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphLoadOkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphLoadOk.lean.
    Ready is HostFrontLiveHostImportGraphLoadOk.hostFrontLiveHostImportGraphLoadOkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphLoadOk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphLoadOk} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphLoadOkRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphLoadOkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphLoadOkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphLoadOk.main args
