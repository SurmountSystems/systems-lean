/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMainCatch.
  Short role: named driver for lean --run of live SlakeHostToolElfMainCatch.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMainCatch parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMainCatch.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMainCatch.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_V0, slake-typecheck-slakehosttoolelfmaincatch,
  slakeTypecheckSlakeHostToolElfMainCatchReady, kernelCheckLiveSlakeHostToolElfMainCatchSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMainCatch
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH"

/-- Named just recipe string. Root justfile does not import this recipe. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMainCatch : String :=
  "slake-typecheck-slakehosttoolelfmaincatch"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMainCatchRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch.liveSlakeHostToolElfMainCatchRel

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMainCatch.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch.liveRel

/-- Ready names HostFrontLiveSlakeHostToolElfMainCatch parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMainCatchReady,
    kernelCheckLiveSlakeHostToolElfMainCatchSource. -/
def slakeTypecheckSlakeHostToolElfMainCatchReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch.hostFrontLiveSlakeHostToolElfMainCatchReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMainCatch. -/
def slakeTypecheckSlakeHostToolElfMainCatchDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMainCatch.lean.
    Ready is HostFrontLiveSlakeHostToolElfMainCatch.hostFrontLiveSlakeHostToolElfMainCatchReady
    (parse plus HostKernel.kernelCheck), not a literal true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMainCatch.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMainCatch} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMainCatchRel} liveRel={liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfMainCatchFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMainCatchOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch.main args
