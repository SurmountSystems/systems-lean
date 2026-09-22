/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultForeignLink.
  Short role: named driver for just slake-typecheck-multforeignlink.
  Ready is HostFrontLiveMultForeignLink parse plus HostKernel.kernelCheck of live
  MultForeignLink.lean, not := true, not lake build SystemsLean.MultForeignLink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-FOREIGN-LINK,
  SLAKE_TYPECHECK_MULT_FOREIGN_LINK_V0, slake-typecheck-multforeignlink,
  slakeTypecheckMultForeignLinkReady, kernelCheckLiveMultForeignLinkSource,
  PARSE-LIVE-MULT-FOREIGN-LINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckMultForeignLink
  Checkable writer: just slake-typecheck-multforeignlink (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultForeignLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FOREIGN-LINK"

/-- Named just recipe. Not lake build SystemsLean.MultForeignLink. -/
def justRecipeSlakeTypecheckMultForeignLink : String :=
  "slake-typecheck-multforeignlink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultForeignLinkRel : String :=
  SystemsLean.HostFrontLiveMultForeignLink.liveMultForeignLinkRel

/-- Ready names HostFrontLiveMultForeignLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckMultForeignLinkReady,
    kernelCheckLiveMultForeignLinkSource. -/
def slakeTypecheckMultForeignLinkReady : Bool :=
  SystemsLean.HostFrontLiveMultForeignLink.hostFrontLiveMultForeignLinkReady

/-- Honesty: this command is not lake build of MultForeignLink. -/
def slakeTypecheckMultForeignLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultForeignLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultForeignLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultForeignLink.lean.
    Ready is HostFrontLiveMultForeignLink.hostFrontLiveMultForeignLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultForeignLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultForeignLink} =="
  IO.println s!"  host={hostId} file={liveMultForeignLinkRel}"
  unless (!slakeTypecheckMultForeignLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultForeignLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultForeignLink.main args
