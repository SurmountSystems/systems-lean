/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFrontGoldens.
  Short role: named driver for lean --run of HostFrontGoldens.lean.
  Ready is HostFrontLiveHostFrontGoldens parse plus HostKernel.kernelCheck of
  live HostFrontGoldens.lean, not := true, not lake build
  SystemsLean.HostFrontGoldens.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-FRONT-GOLDENS,
  SLAKE_TYPECHECK_HOST_FRONT_GOLDENS_V0, slake-typecheck-hostfrontgoldens,
  slakeTypecheckHostFrontGoldensReady, kernelCheckLiveHostFrontGoldensSource,
  PARSE-LIVE-HOST-FRONT-GOLDENS.
  Module: SystemsLean.SlakeTypecheckHostFrontGoldens
  Checkable writer: lean --run SlakeTypecheckHostFrontGoldens (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostFrontGoldens

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_FRONT_GOLDENS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-FRONT-GOLDENS"

/-- Named recipe. Not lake build SystemsLean.HostFrontGoldens. -/
def justRecipeSlakeTypecheckHostFrontGoldens : String :=
  "slake-typecheck-hostfrontgoldens"

/-- Live file relative to repo root. -/
def liveHostFrontGoldensRel : String :=
  SystemsLean.HostFrontLiveHostFrontGoldens.liveHostFrontGoldensRel

/-- Ready names HostFrontLiveHostFrontGoldens parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostFrontGoldensReady,
    kernelCheckLiveHostFrontGoldensSource. -/
def slakeTypecheckHostFrontGoldensReady : Bool :=
  SystemsLean.HostFrontLiveHostFrontGoldens.hostFrontLiveHostFrontGoldensReady

/-- Honesty: this command is not lake build of HostFrontGoldens. -/
def slakeTypecheckHostFrontGoldensDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostFrontGoldensFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostFrontGoldensOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFrontGoldens.lean.
    Ready is HostFrontLiveHostFrontGoldens.hostFrontLiveHostFrontGoldensReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostFrontGoldens.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostFrontGoldens} =="
  IO.println s!"  host={hostId} file={liveHostFrontGoldensRel}"
  unless (!slakeTypecheckHostFrontGoldensFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostFrontGoldensOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostFrontGoldens.main args
