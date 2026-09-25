/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphLoadOkLater.
  Short role: named driver for just slake-typecheck-hostimportgraphloadoklater.
  Ready is HostFrontLiveHostImportGraphLoadOkLater parse plus HostKernel.kernelCheck
  of live HostImportGraphLoadOkLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphLoadOkLater.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not steal HostFrontLiveHostImportGraphLoadOk (liveRel is
  HostImportGraphLoadOk.lean). Do not edit occupancy leftover
  HostFrontLiveImportLoadOkLater. Do not steal mill wrap
  HostFrontLiveHostImportGraphMain.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphLoadOk is not a
  prefix of this driver):
  SlakeTypecheckHostImportGraphLoadOkLater
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-LOADOK-LATER
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_LOADOK_LATER_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK-LATER
  slake-typecheck-hostimportgraphloadoklater
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphloadoklater,
  slakeTypecheckHostImportGraphLoadOkLaterReady,
  kernelCheckLiveHostImportGraphLoadOkLaterSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphLoadOkLater
  Checkable writer: just slake-typecheck-hostimportgraphloadoklater
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphLoadOkLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_LOADOK_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-LOADOK-LATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphLoadOkLater. -/
def justRecipeSlakeTypecheckHostImportGraphLoadOkLater : String :=
  "slake-typecheck-hostimportgraphloadoklater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphLoadOkLaterRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOkLater.liveHostImportGraphLoadOkLaterRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphLoadOkLater.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOkLater.liveRel

/-- Ready names HostFrontLiveHostImportGraphLoadOkLater parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphLoadOkLaterReady,
    kernelCheckLiveHostImportGraphLoadOkLaterSource. -/
def slakeTypecheckHostImportGraphLoadOkLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOkLater.hostFrontLiveHostImportGraphLoadOkLaterReady

/-- Honesty: this command is not lake build of HostImportGraphLoadOkLater. -/
def slakeTypecheckHostImportGraphLoadOkLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphLoadOkLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphLoadOkLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphLoadOkLater.lean.
    Ready is HostFrontLiveHostImportGraphLoadOkLater.hostFrontLiveHostImportGraphLoadOkLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphLoadOkLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphLoadOkLater} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphLoadOkLaterRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphLoadOkLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphLoadOkLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphLoadOkLater.main args
