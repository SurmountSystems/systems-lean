/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElf.
  Short role: named driver for lean --run of live SlakeHostToolElf.lean parse.
  Ready is HostFrontLiveSlakeHostToolElf parse plus HostKernel.kernelCheck of live
  SlakeHostToolElf.lean, not := true, not lake build SystemsLean.SlakeHostToolElf.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_V0, slake-typecheck-slakehosttoolelf,
  slakeTypecheckSlakeHostToolElfReady, kernelCheckLiveSlakeHostToolElfSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElf
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF"

/-- Named just recipe string. Dest just module is locked; not written here. -/
def justRecipeSlakeTypecheckSlakeHostToolElf : String :=
  "slake-typecheck-slakehosttoolelf"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElf.liveSlakeHostToolElfRel

/-- Ready names HostFrontLiveSlakeHostToolElf parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfReady,
    kernelCheckLiveSlakeHostToolElfSource. -/
def slakeTypecheckSlakeHostToolElfReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElf.hostFrontLiveSlakeHostToolElfReady

/-- Honesty: this command is not lake build of SlakeHostToolElf. -/
def slakeTypecheckSlakeHostToolElfDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElf.lean.
    Ready is HostFrontLiveSlakeHostToolElf.hostFrontLiveSlakeHostToolElfReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElf.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElf} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfRel}"
  unless (!slakeTypecheckSlakeHostToolElfFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElf.main args
