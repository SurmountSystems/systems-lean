/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Erasure.
  Short role: named driver for just slake-typecheck-erasure.
  Ready is HostFrontLiveErasure parse plus HostKernel.kernelCheck of live
  Erasure.lean, not := true, not lake build SystemsLean.Erasure.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-ERASURE,
  SLAKE_TYPECHECK_ERASURE_V0, slake-typecheck-erasure, slakeTypecheckErasureReady,
  kernelCheckLiveErasureSource, PARSE-LIVE-ERASURE, SKELETON.
  Module: SystemsLean.SlakeTypecheckErasure
  Checkable writer: just slake-typecheck-erasure (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveErasure

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE"

/-- Named just recipe. Not lake build SystemsLean.Erasure. -/
def justRecipeSlakeTypecheckErasure : String := "slake-typecheck-erasure"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureRel : String := SystemsLean.HostFrontLiveErasure.liveErasureRel

/-- Ready names HostFrontLiveErasure parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckErasureReady, kernelCheckLiveErasureSource. -/
def slakeTypecheckErasureReady : Bool :=
  SystemsLean.HostFrontLiveErasure.hostFrontLiveErasureReady

/-- Honesty: this command is not lake build of Erasure. -/
def slakeTypecheckErasureDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Erasure.lean.
    Prints liveRel from that def (Erasure.lean), then the HostFrontLive main.
    Ready is HostFrontLiveErasure.hostFrontLiveErasureReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveErasure.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasure} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveErasure.liveRel}"
  IO.println s!"  host={hostId} file={liveErasureRel}"
  unless (!slakeTypecheckErasureFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasure.main args
