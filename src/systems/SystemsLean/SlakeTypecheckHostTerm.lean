/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostTerm.
  Short role: named driver for just slake-typecheck-hostterm.
  Ready is HostFrontLiveHostTerm parse plus HostKernel.kernelCheck of live
  HostTerm.lean, not := true, not lake build SystemsLean.HostTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOSTTERM,
  SLAKE_TYPECHECK_HOSTTERM_V0, slake-typecheck-hostterm, slakeTypecheckHostTermReady,
  kernelCheckLiveHostTermSource, PARSE-LIVE-HOSTTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckHostTerm
  Checkable writer: just slake-typecheck-hostterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTTERM"

/-- Named just recipe. Not lake build SystemsLean.HostTerm. -/
def justRecipeSlakeTypecheckHostTerm : String := "slake-typecheck-hostterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostTermRel : String := SystemsLean.HostFrontLiveHostTerm.liveHostTermRel

/-- Ready names HostFrontLiveHostTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostTermReady, kernelCheckLiveHostTermSource. -/
def slakeTypecheckHostTermReady : Bool :=
  SystemsLean.HostFrontLiveHostTerm.hostFrontLiveHostTermReady

/-- Honesty: this command is not lake build of HostTerm. -/
def slakeTypecheckHostTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostTerm.lean.
    Ready is HostFrontLiveHostTerm.hostFrontLiveHostTermReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveHostTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostTerm} =="
  IO.println s!"  host={hostId} file={liveHostTermRel}"
  unless (!slakeTypecheckHostTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostTerm.main args
