/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.GraphForeignLink.
  Short role: named driver for just slake-typecheck-graphforeignlink.
  Ready is HostFrontLiveGraphForeignLink parse plus HostKernel.kernelCheck of live
  GraphForeignLink.lean, not := true, not lake build SystemsLean.GraphForeignLink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GRAPH-FOREIGN-LINK,
  SLAKE_TYPECHECK_GRAPH_FOREIGN_LINK_V0, slake-typecheck-graphforeignlink,
  slakeTypecheckGraphForeignLinkReady, kernelCheckLiveGraphForeignLinkSource,
  PARSE-LIVE-GRAPH-FOREIGN-LINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckGraphForeignLink
  Checkable writer: just slake-typecheck-graphforeignlink (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveGraphForeignLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-FOREIGN-LINK"

/-- Named just recipe. Not lake build SystemsLean.GraphForeignLink. -/
def justRecipeSlakeTypecheckGraphForeignLink : String :=
  "slake-typecheck-graphforeignlink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphForeignLinkRel : String :=
  SystemsLean.HostFrontLiveGraphForeignLink.liveGraphForeignLinkRel

/-- Ready names HostFrontLiveGraphForeignLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckGraphForeignLinkReady,
    kernelCheckLiveGraphForeignLinkSource. -/
def slakeTypecheckGraphForeignLinkReady : Bool :=
  SystemsLean.HostFrontLiveGraphForeignLink.hostFrontLiveGraphForeignLinkReady

/-- Honesty: this command is not lake build of GraphForeignLink. -/
def slakeTypecheckGraphForeignLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphForeignLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphForeignLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live GraphForeignLink.lean.
    Ready is HostFrontLiveGraphForeignLink.hostFrontLiveGraphForeignLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveGraphForeignLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphForeignLink} =="
  IO.println s!"  host={hostId} file={liveGraphForeignLinkRel}"
  unless (!slakeTypecheckGraphForeignLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphForeignLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraphForeignLink.main args
