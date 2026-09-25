/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesForeignLink.
  Short role: named driver for just slake-typecheck-typesforeignlink.
  Ready is HostFrontLiveTypesForeignLink parse plus HostKernel.kernelCheck of live
  TypesForeignLink.lean, not := true, not lake build SystemsLean.TypesForeignLink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TYPESFOREIGNLINK,
  SLAKE_TYPECHECK_TYPESFOREIGNLINK_V0, slake-typecheck-typesforeignlink,
  slakeTypecheckTypesForeignLinkReady, kernelCheckLiveTypesForeignLinkSource,
  PARSE-LIVE-TYPESFOREIGNLINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckTypesForeignLink
  Checkable writer: just slake-typecheck-typesforeignlink (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveTypesForeignLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPESFOREIGNLINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPESFOREIGNLINK"

/-- Named just recipe. Not lake build SystemsLean.TypesForeignLink. -/
def justRecipeSlakeTypecheckTypesForeignLink : String :=
  "slake-typecheck-typesforeignlink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesForeignLinkRel : String :=
  SystemsLean.HostFrontLiveTypesForeignLink.liveTypesForeignLinkRel

/-- Ready names HostFrontLiveTypesForeignLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckTypesForeignLinkReady,
    kernelCheckLiveTypesForeignLinkSource. -/
def slakeTypecheckTypesForeignLinkReady : Bool :=
  SystemsLean.HostFrontLiveTypesForeignLink.hostFrontLiveTypesForeignLinkReady

/-- Honesty: this command is not lake build of TypesForeignLink. -/
def slakeTypecheckTypesForeignLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesForeignLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesForeignLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesForeignLink.lean.
    Ready is HostFrontLiveTypesForeignLink.hostFrontLiveTypesForeignLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveTypesForeignLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesForeignLink} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTypesForeignLink.liveRel}"
  IO.println s!"  host={hostId} file={liveTypesForeignLinkRel}"
  unless (!slakeTypecheckTypesForeignLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesForeignLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypesForeignLink.main args
