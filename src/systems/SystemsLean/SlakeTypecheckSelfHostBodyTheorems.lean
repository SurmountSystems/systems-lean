/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostBodyTheorems.
  Short role: named driver for just slake-typecheck-selfhostbodytheorems.
  Ready is HostFrontLiveSelfHostBodyTheorems parse plus HostKernel.kernelCheck
  of live SelfHostBodyTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.SelfHostBodyTheorems.
  liveRel is SelfHostBodyTheorems.lean.
  Not SelfHostBody.lean. Not a claim-bool flip. FullHost stays false.
  FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-HOST-BODY-THEOREMS,
  SLAKE_TYPECHECK_SELF_HOST_BODY_THEOREMS, slake-typecheck-selfhostbodytheorems,
  slakeTypecheckSelfHostBodyTheoremsReady,
  kernelCheckLiveSelfHostBodyTheoremsSource,
  PARSE-LIVE-SELF-HOST-BODY-THEOREMS.
  Module: SystemsLean.SlakeTypecheckSelfHostBodyTheorems
  Checkable writer: just slake-typecheck-selfhostbodytheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfHostBodyTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_BODY_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-BODY-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SelfHostBodyTheorems. -/
def justRecipeSlakeTypecheckSelfHostBodyTheorems : String :=
  "slake-typecheck-selfhostbodytheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostBodyTheoremsRel : String :=
  SystemsLean.HostFrontLiveSelfHostBodyTheorems.liveSelfHostBodyTheoremsRel

/-- Ready names HostFrontLiveSelfHostBodyTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSelfHostBodyTheoremsReady,
    kernelCheckLiveSelfHostBodyTheoremsSource. -/
def slakeTypecheckSelfHostBodyTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostBodyTheorems.hostFrontLiveSelfHostBodyTheoremsReady

/-- Honesty: this command is not lake build of SelfHostBodyTheorems. -/
def slakeTypecheckSelfHostBodyTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostBodyTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSelfHostBodyTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostBodyTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostBodyTheorems.lean.
    Ready is HostFrontLiveSelfHostBodyTheorems.hostFrontLiveSelfHostBodyTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSelfHostBodyTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostBodyTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSelfHostBodyTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveSelfHostBodyTheoremsRel}"
  unless (!slakeTypecheckSelfHostBodyTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostBodyTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSelfHostBodyTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostBodyTheorems.main args
