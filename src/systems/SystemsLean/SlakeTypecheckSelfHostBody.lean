/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostBody.
  Short role: named driver for just slake-typecheck-selfhostbody.
  Ready is HostFrontLiveSelfHostBody parse plus HostKernel.kernelCheck
  of live SelfHostBody.lean, not := true, not lake build
  SystemsLean.SelfHostBody.
  Stage ids SLAKE_SELF_HOST_BODY_V0, HOST-SELF-HOST-BODY, and
  SELF-HOST-BODY are not changed.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a self-host claim.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-HOST-BODY,
  SLAKE_TYPECHECK_SELF_HOST_BODY_V0, slake-typecheck-selfhostbody,
  slakeTypecheckSelfHostBodyReady,
  kernelCheckLiveSelfHostBodySource,
  PARSE-LIVE-SELFHOSTBODY, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfHostBody
  Checkable writer: just slake-typecheck-selfhostbody
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfHostBody

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_BODY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-BODY"

/-- Named just recipe. Not lake build SystemsLean.SelfHostBody. -/
def justRecipeSlakeTypecheckSelfHostBody : String :=
  "slake-typecheck-selfhostbody"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostBodyRel : String :=
  SystemsLean.HostFrontLiveSelfHostBody.liveRel

/-- Ready names HostFrontLiveSelfHostBody parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfHostBodyReady,
    kernelCheckLiveSelfHostBodySource. -/
def slakeTypecheckSelfHostBodyReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostBody.hostFrontLiveSelfHostBodyReady

/-- Honesty: this command is not lake build of SelfHostBody. -/
def slakeTypecheckSelfHostBodyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostBodyFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostBodyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostBody.lean.
    Ready is HostFrontLiveSelfHostBody.hostFrontLiveSelfHostBodyReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfHostBody.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostBody} =="
  IO.println s!"  host={hostId} file={liveSelfHostBodyRel}"
  unless (!slakeTypecheckSelfHostBodyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostBodyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostBody.main args
