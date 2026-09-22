/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostCompleteTheorems.
  Short role: named driver for just slake-typecheck-selfhostcompletetheorems.
  Ready is HostFrontLiveSelfHostCompleteTheorems parse plus HostKernel.kernelCheck
  of live SelfHostCompleteTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.SelfHostCompleteTheorems.
  liveRel is SelfHostCompleteTheorems.lean.
  This wrap is SelfHostCompleteTheorems.lean. It is not SelfHostComplete.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE-THEOREMS,
  SLAKE_TYPECHECK_SELF_HOST_COMPLETE_THEOREMS,
  slake-typecheck-selfhostcompletetheorems,
  slakeTypecheckSelfHostCompleteTheoremsReady,
  kernelCheckLiveSelfHostCompleteTheoremsSource,
  PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckSelfHostCompleteTheorems
  Checkable writer: just slake-typecheck-selfhostcompletetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfHostCompleteTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_COMPLETE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SelfHostCompleteTheorems. -/
def justRecipeSlakeTypecheckSelfHostCompleteTheorems : String :=
  "slake-typecheck-selfhostcompletetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostCompleteTheoremsRel : String :=
  SystemsLean.HostFrontLiveSelfHostCompleteTheorems.liveSelfHostCompleteTheoremsRel

/-- Ready names HostFrontLiveSelfHostCompleteTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSelfHostCompleteTheoremsReady,
    kernelCheckLiveSelfHostCompleteTheoremsSource. -/
def slakeTypecheckSelfHostCompleteTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostCompleteTheorems.hostFrontLiveSelfHostCompleteTheoremsReady

/-- Honesty: this command is not lake build of SelfHostCompleteTheorems. -/
def slakeTypecheckSelfHostCompleteTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostCompleteTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSelfHostCompleteTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostCompleteTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostCompleteTheorems.lean.
    Ready is HostFrontLiveSelfHostCompleteTheorems.hostFrontLiveSelfHostCompleteTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSelfHostCompleteTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostCompleteTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSelfHostCompleteTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveSelfHostCompleteTheoremsRel}"
  unless (!slakeTypecheckSelfHostCompleteTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostCompleteTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSelfHostCompleteTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostCompleteTheorems.main args
