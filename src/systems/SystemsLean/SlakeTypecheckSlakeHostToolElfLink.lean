/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfLink.
  Short role: named driver for lean --run of live SlakeHostToolElfLink.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfLink parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfLink.lean, not := true, not lake build SystemsLean.SlakeHostToolElfLink.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-LINK,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_LINK_V0, slake-typecheck-slakehosttoolelflink,
  slakeTypecheckSlakeHostToolElfLinkReady, kernelCheckLiveSlakeHostToolElfLinkSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-LINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfLink
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-LINK"

/-- Named just recipe string. Dest just module is locked; not written here. -/
def justRecipeSlakeTypecheckSlakeHostToolElfLink : String :=
  "slake-typecheck-slakehosttoolelflink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfLinkRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfLink.liveSlakeHostToolElfLinkRel

/-- Ready names HostFrontLiveSlakeHostToolElfLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfLinkReady,
    kernelCheckLiveSlakeHostToolElfLinkSource. -/
def slakeTypecheckSlakeHostToolElfLinkReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfLink.hostFrontLiveSlakeHostToolElfLinkReady

/-- Honesty: this command is not lake build of SlakeHostToolElfLink. -/
def slakeTypecheckSlakeHostToolElfLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfLink.lean.
    Ready is HostFrontLiveSlakeHostToolElfLink.hostFrontLiveSlakeHostToolElfLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfLink} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfLink.liveRel}"
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfLinkRel}"
  unless (!slakeTypecheckSlakeHostToolElfLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfLink.main args
