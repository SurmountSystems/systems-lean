/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFrontGoldens.
  Short role: named driver for just slake-typecheck-goldens.
  Ready is HostFrontLiveGoldens parse plus kernelCheck of live
  HostFrontGoldens.lean, not := true, not lake build SystemsLean.HostFrontGoldens.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GOLDENS,
  SLAKE_TYPECHECK_GOLDENS_V0, slake-typecheck-goldens, slakeTypecheckGoldensReady,
  kernelCheckLiveGoldensSource, PARSE-LIVE-GOLDENS, SKELETON.
  Module: SystemsLean.SlakeTypecheckGoldens
  Checkable writer: just slake-typecheck-goldens (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveGoldens

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GOLDENS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GOLDENS"

/-- Named just recipe. Not lake build SystemsLean.HostFrontGoldens. -/
def justRecipeSlakeTypecheckGoldens : String := "slake-typecheck-goldens"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGoldensRel : String := SystemsLean.HostFrontLiveGoldens.liveGoldensRel

/-- Ready names HostFrontLiveGoldens parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckGoldensReady, kernelCheckLiveGoldensSource. -/
def slakeTypecheckGoldensReady : Bool :=
  SystemsLean.HostFrontLiveGoldens.hostFrontLiveGoldensReady

/-- Honesty: this command is not lake build of HostFrontGoldens. -/
def slakeTypecheckGoldensDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGoldensFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGoldensOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFrontGoldens.lean.
    Ready is HostFrontLiveGoldens.hostFrontLiveGoldensReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveGoldens.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGoldens} =="
  IO.println s!"  host={hostId} file={liveGoldensRel}"
  unless (!slakeTypecheckGoldensFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGoldensOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGoldens.main args
