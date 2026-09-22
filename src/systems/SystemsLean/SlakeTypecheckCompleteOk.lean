/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompleteOk.
  Short role: named driver for just slake-typecheck-completeok.
  Ready is HostFrontLiveCompleteOk parse plus HostKernel.kernelCheck of live
  CompleteOk.lean, not := true, not lake build SystemsLean.CompleteOk.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPLETEOK,
  SLAKE_TYPECHECK_COMPLETEOK_V0, slake-typecheck-completeok,
  slakeTypecheckCompleteOkReady, kernelCheckLiveCompleteOkSource,
  PARSE-LIVE-COMPLETEOK, SKELETON.
  Module: SystemsLean.SlakeTypecheckCompleteOk
  Checkable writer: just slake-typecheck-completeok (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCompleteOk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPLETEOK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPLETEOK"

/-- Named just recipe. Not lake build SystemsLean.CompleteOk. -/
def justRecipeSlakeTypecheckCompleteOk : String :=
  "slake-typecheck-completeok"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompleteOkRel : String :=
  SystemsLean.HostFrontLiveCompleteOk.liveCompleteOkRel

/-- Ready names HostFrontLiveCompleteOk parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCompleteOkReady,
    kernelCheckLiveCompleteOkSource. -/
def slakeTypecheckCompleteOkReady : Bool :=
  SystemsLean.HostFrontLiveCompleteOk.hostFrontLiveCompleteOkReady

/-- Honesty: this command is not lake build of CompleteOk. -/
def slakeTypecheckCompleteOkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompleteOkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompleteOkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompleteOk.lean.
    Ready is HostFrontLiveCompleteOk.hostFrontLiveCompleteOkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompleteOk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompleteOk} =="
  IO.println s!"  host={hostId} file={liveCompleteOkRel}"
  unless (!slakeTypecheckCompleteOkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompleteOkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompleteOk.main args
