/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SPEC-PROOF.
  Root for optional lean --run of live SpecProof.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSpecProof.
  Greppable: SystemsLean.HostFrontLiveSpecProofMain, HostFrontLiveSpecProofMain,
  HOST-FRONT-LIVE-SPEC-PROOF, SLAKE_HOST_FRONT_LIVE_SPEC_PROOF_V0,
  PARSE-LIVE-SPEC-PROOF,
  parseLiveSpecProofSource, kernelCheckLiveSpecProofSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSpecProofMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSpecProof

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSpecProof.main args
