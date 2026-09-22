/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CatchReturn.
  Short role: named driver for just slake-typecheck-catchreturn.
  Ready is HostFrontLiveCatchReturn parse plus HostKernel.kernelCheck of live
  CatchReturn.lean, not := true, not lake build SystemsLean.CatchReturn.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CATCH-RETURN,
  SLAKE_TYPECHECK_CATCH_RETURN_V0, slake-typecheck-catchreturn,
  slakeTypecheckCatchReturnReady, kernelCheckLiveCatchReturnSource,
  PARSE-LIVE-CATCH-RETURN, SKELETON.
  Module: SystemsLean.SlakeTypecheckCatchReturn
  Checkable writer: just slake-typecheck-catchreturn (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCatchReturn

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CATCH_RETURN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CATCH-RETURN"

/-- Named just recipe. Not lake build SystemsLean.CatchReturn. -/
def justRecipeSlakeTypecheckCatchReturn : String :=
  "slake-typecheck-catchreturn"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCatchReturnRel : String :=
  SystemsLean.HostFrontLiveCatchReturn.liveCatchReturnRel

/-- Ready names HostFrontLiveCatchReturn parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCatchReturnReady,
    kernelCheckLiveCatchReturnSource. -/
def slakeTypecheckCatchReturnReady : Bool :=
  SystemsLean.HostFrontLiveCatchReturn.hostFrontLiveCatchReturnReady

/-- Honesty: this command is not lake build of CatchReturn. -/
def slakeTypecheckCatchReturnDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCatchReturnFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCatchReturnOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CatchReturn.lean.
    Ready is HostFrontLiveCatchReturn.hostFrontLiveCatchReturnReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCatchReturn.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCatchReturn} =="
  IO.println s!"  host={hostId} file={liveCatchReturnRel}"
  unless (!slakeTypecheckCatchReturnFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCatchReturnOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCatchReturn.main args
