/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearForeignLink.
  Short role: named driver for just slake-typecheck-linearforeignlink.
  Ready is HostFrontLiveLinearForeignLink parse plus HostKernel.kernelCheck of live
  LinearForeignLink.lean, not := true, not lake build SystemsLean.LinearForeignLink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LINEAR-FOREIGN-LINK,
  SLAKE_TYPECHECK_LINEAR_FOREIGN_LINK_V0, slake-typecheck-linearforeignlink,
  slakeTypecheckLinearForeignLinkReady, kernelCheckLiveLinearForeignLinkSource,
  PARSE-LIVE-LINEAR-FOREIGN-LINK, LINEAR-FOREIGN-LINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearForeignLink
  Checkable writer: just slake-typecheck-linearforeignlink (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearForeignLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-FOREIGN-LINK"

/-- Named just recipe. Not lake build SystemsLean.LinearForeignLink. -/
def justRecipeSlakeTypecheckLinearForeignLink : String :=
  "slake-typecheck-linearforeignlink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearForeignLinkRel : String :=
  SystemsLean.HostFrontLiveLinearForeignLink.liveLinearForeignLinkRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveLinearForeignLink.liveRel

/-- Ready names HostFrontLiveLinearForeignLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckLinearForeignLinkReady,
    kernelCheckLiveLinearForeignLinkSource. -/
def slakeTypecheckLinearForeignLinkReady : Bool :=
  SystemsLean.HostFrontLiveLinearForeignLink.hostFrontLiveLinearForeignLinkReady

/-- Honesty: this command is not lake build of LinearForeignLink. -/
def slakeTypecheckLinearForeignLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearForeignLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearForeignLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearForeignLink.lean.
    Ready is HostFrontLiveLinearForeignLink.hostFrontLiveLinearForeignLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearForeignLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearForeignLink} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLinearForeignLinkRel}"
  unless (liveRel == "LinearForeignLink.lean") do
    IO.eprintln "error: liveRel must be LinearForeignLink.lean"
    return 1
  unless (!slakeTypecheckLinearForeignLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearForeignLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearForeignLink.main args
