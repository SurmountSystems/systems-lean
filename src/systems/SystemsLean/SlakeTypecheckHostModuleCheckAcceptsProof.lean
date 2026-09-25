/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckAcceptsProof.
  Short role: named driver for lean --run of
  HostModuleCheckAcceptsProof.lean.
  Ready is HostFrontLiveHostModuleCheckAcceptsProof parse plus
  HostKernel.kernelCheck of live HostModuleCheckAcceptsProof.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckAcceptsProof.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckAcceptsProof
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSPROOF
  SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSPROOF_V0
  PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckacceptsproof,
  slakeTypecheckHostModuleCheckAcceptsProofReady,
  kernelCheckLiveHostModuleCheckAcceptsProofSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckAcceptsProof
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSPROOF_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSPROOF"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckAcceptsProof.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckAcceptsProof : String :=
  "slake-typecheck-hostmodulecheckacceptsproof"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof.liveHostModuleCheckAcceptsProofRel

/-- Ready names HostFrontLiveHostModuleCheckAcceptsProof parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckAcceptsProofReady,
    kernelCheckLiveHostModuleCheckAcceptsProofSource. -/
def slakeTypecheckHostModuleCheckAcceptsProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof.hostFrontLiveHostModuleCheckAcceptsProofReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckAcceptsProofDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckAcceptsProofFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckAcceptsProofOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckAcceptsProof.lean.
    Ready is hostFrontLiveHostModuleCheckAcceptsProofReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckAcceptsProof.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckAcceptsProof} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsProofRel}"
  unless (!slakeTypecheckHostModuleCheckAcceptsProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckAcceptsProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckAcceptsProofDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof.main args
