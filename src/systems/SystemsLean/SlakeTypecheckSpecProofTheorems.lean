/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SpecProofTheorems.
  Short role: named driver for just slake-typecheck-specprooftheorems.
  Ready is HostFrontLiveSpecProofTheorems parse plus HostKernel.kernelCheck
  of live SpecProofTheorems.lean, not := true, not lake build
  SystemsLean.SpecProofTheorems.
  file= prints the bare liveRel SpecProofTheorems.lean.
  Product ids SPEC-PROOF-THEOREM and SPEC-PROOF-SMOKE are not changed.
  proofCompleteClaimed stays as it is. Not mill. Not occupancy name 50.
  Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SPEC-PROOF-THEOREMS,
  SLAKE_TYPECHECK_SPEC_PROOF_THEOREMS_V0, slake-typecheck-specprooftheorems,
  slakeTypecheckSpecProofTheoremsReady,
  kernelCheckLiveSpecProofTheoremsSource,
  PARSE-LIVE-SPECPROOFTHEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckSpecProofTheorems
  Checkable writer: just slake-typecheck-specprooftheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSpecProofTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SPEC_PROOF_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SPEC-PROOF-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SpecProofTheorems. -/
def justRecipeSlakeTypecheckSpecProofTheorems : String :=
  "slake-typecheck-specprooftheorems"

/-- Live file basename. Dual-pin name. Bare SpecProofTheorems.lean. -/
def liveSpecProofTheoremsRel : String :=
  SystemsLean.HostFrontLiveSpecProofTheorems.liveRel

/-- Ready names HostFrontLiveSpecProofTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSpecProofTheoremsReady,
    kernelCheckLiveSpecProofTheoremsSource. -/
def slakeTypecheckSpecProofTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSpecProofTheorems.hostFrontLiveSpecProofTheoremsReady

/-- Honesty: this command is not lake build of SpecProofTheorems. -/
def slakeTypecheckSpecProofTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSpecProofTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSpecProofTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SpecProofTheorems.lean.
    Ready is HostFrontLiveSpecProofTheorems.hostFrontLiveSpecProofTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSpecProofTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSpecProofTheorems} =="
  IO.println s!"  host={hostId} file={liveSpecProofTheoremsRel}"
  unless (!slakeTypecheckSpecProofTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSpecProofTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (liveSpecProofTheoremsRel == "SpecProofTheorems.lean") do
    IO.eprintln "error: liveRel must be the bare name SpecProofTheorems.lean"
    return 1
  SystemsLean.HostFrontLiveSpecProofTheorems.main args
