/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckMultProof.
  Short role: named driver for lean --run of the
  HostModuleCheckMultProof.lean wrap.
  Ready is HostFrontLiveHostModuleCheckMultProof parse plus
  HostKernel.kernelCheck of live HostModuleCheckMultProof.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckMultProof.
  liveRel is HostModuleCheckMultProof.lean.
  This wrap is HostModuleCheckMultProof.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKMULTPROOF,
  SLAKE_TYPECHECK_HOSTMODULECHECKMULTPROOF,
  slake-typecheck-hostmodulecheckmultproof,
  slakeTypecheckHostModuleCheckMultProofReady,
  kernelCheckLiveHostModuleCheckMultProofSource,
  PARSE-LIVE-HOSTMODULECHECKMULTPROOF.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultProof
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckMultProof.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultProof

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKMULTPROOF"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKMULTPROOF"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckMultProof : String :=
  "slake-typecheck-hostmodulecheckmultproof"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckMultProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultProof.liveHostModuleCheckMultProofRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckMultProofReady,
    kernelCheckLiveHostModuleCheckMultProofSource. -/
def slakeTypecheckHostModuleCheckMultProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultProof.hostFrontLiveHostModuleCheckMultProofReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckMultProofDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultProofFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckMultProofFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultProofOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckMultProof.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckMultProofReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckMultProof.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckMultProof} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultProof.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultProofRel}"
  unless (!slakeTypecheckHostModuleCheckMultProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultProofFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckMultProofDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultProof.main args
