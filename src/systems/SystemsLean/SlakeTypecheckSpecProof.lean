/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SpecProof.
  Short role: named driver for just slake-typecheck-specproof.
  Ready is HostFrontLiveSpecProof parse plus HostKernel.kernelCheck of live
  SpecProof.lean, not := true, not lake build SystemsLean.SpecProof.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SPEC-PROOF,
  SLAKE_TYPECHECK_SPEC_PROOF_V0, slake-typecheck-specproof,
  slakeTypecheckSpecProofReady, kernelCheckLiveSpecProofSource,
  PARSE-LIVE-SPEC-PROOF, SKELETON.
  Module: SystemsLean.SlakeTypecheckSpecProof
  Checkable writer: just slake-typecheck-specproof (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSpecProof

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SPEC_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SPEC-PROOF"

/-- Named just recipe. Not lake build SystemsLean.SpecProof. -/
def justRecipeSlakeTypecheckSpecProof : String :=
  "slake-typecheck-specproof"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSpecProofRel : String :=
  SystemsLean.HostFrontLiveSpecProof.liveSpecProofRel

/-- Ready names HostFrontLiveSpecProof parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSpecProofReady,
    kernelCheckLiveSpecProofSource. -/
def slakeTypecheckSpecProofReady : Bool :=
  SystemsLean.HostFrontLiveSpecProof.hostFrontLiveSpecProofReady

/-- Honesty: this command is not lake build of SpecProof. -/
def slakeTypecheckSpecProofDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSpecProofFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSpecProofOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SpecProof.lean.
    Ready is HostFrontLiveSpecProof.hostFrontLiveSpecProofReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSpecProof.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSpecProof} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSpecProof.liveRel}"
  IO.println s!"  host={hostId} file={liveSpecProofRel}"
  unless (!slakeTypecheckSpecProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSpecProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSpecProof.main args
