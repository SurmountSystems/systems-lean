/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfCompleteOk.
  Short role: named driver for lean --run of live SlakeHostToolElfCompleteOk.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfCompleteOk parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfCompleteOk.lean, not := true, not lake build SystemsLean.SlakeHostToolElfCompleteOk.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0, slake-typecheck-slakehosttoolelfcompleteok,
  slakeTypecheckSlakeHostToolElfCompleteOkReady,
  kernelCheckLiveSlakeHostToolElfCompleteOkSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfCompleteOk
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-COMPLETE-OK"

/-- Named just recipe string. Dest just module is locked; not written here. -/
def justRecipeSlakeTypecheckSlakeHostToolElfCompleteOk : String :=
  "slake-typecheck-slakehosttoolelfcompleteok"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfCompleteOkRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.liveSlakeHostToolElfCompleteOkRel

/-- Ready names HostFrontLiveSlakeHostToolElfCompleteOk parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfCompleteOkReady,
    kernelCheckLiveSlakeHostToolElfCompleteOkSource. -/
def slakeTypecheckSlakeHostToolElfCompleteOkReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.hostFrontLiveSlakeHostToolElfCompleteOkReady

/-- Honesty: this command is not lake build of SlakeHostToolElfCompleteOk. -/
def slakeTypecheckSlakeHostToolElfCompleteOkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfCompleteOkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfCompleteOkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfCompleteOk.lean.
    Ready is HostFrontLiveSlakeHostToolElfCompleteOk.hostFrontLiveSlakeHostToolElfCompleteOkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfCompleteOk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfCompleteOk} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfCompleteOkRel}"
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfCompleteOkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfCompleteOkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckSlakeHostToolElfCompleteOkDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.main args
