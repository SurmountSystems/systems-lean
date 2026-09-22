/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMainCatchDest.
  Short role: named driver for lean --run of live SlakeHostToolElfMainCatchDest.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMainCatchDest parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMainCatchDest.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMainCatchDest.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. FullBackend stays false.
  Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0, slake-typecheck-slakehosttoolelfmaincatchdest,
  slakeTypecheckSlakeHostToolElfMainCatchDestReady, kernelCheckLiveSlakeHostToolElfMainCatchDestSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMainCatchDest
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST"

/-- Named just recipe string. Root justfile does not import this recipe. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMainCatchDest : String :=
  "slake-typecheck-slakehosttoolelfmaincatchdest"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMainCatchDestRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest.liveSlakeHostToolElfMainCatchDestRel

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMainCatchDest.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest.liveRel

/-- Ready names HostFrontLiveSlakeHostToolElfMainCatchDest parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMainCatchDestReady,
    kernelCheckLiveSlakeHostToolElfMainCatchDestSource. -/
def slakeTypecheckSlakeHostToolElfMainCatchDestReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest.hostFrontLiveSlakeHostToolElfMainCatchDestReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMainCatchDest. -/
def slakeTypecheckSlakeHostToolElfMainCatchDestDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchDestFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchDestOwnsPackageTypecheck : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckSlakeHostToolElfMainCatchDestFullBackend : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMainCatchDest.lean.
    Ready is HostFrontLiveSlakeHostToolElfMainCatchDest.hostFrontLiveSlakeHostToolElfMainCatchDestReady
    (parse plus HostKernel.kernelCheck), not a literal true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMainCatchDest.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMainCatchDest} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMainCatchDestRel} liveRel={liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfMainCatchDestFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMainCatchDestOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMainCatchDestFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest.main args
