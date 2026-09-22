/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostComposeTheorems.
  Short role: named driver for just slake-typecheck-hostcomposetheorems.
  Ready is HostFrontLiveHostComposeTheorems parse plus HostKernel.kernelCheck
  of live HostComposeTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.HostComposeTheorems.
  liveRel is HostComposeTheorems.lean.
  Not LlvmHold.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-COMPOSE-THEOREMS,
  SLAKE_TYPECHECK_HOST_COMPOSE_THEOREMS, slake-typecheck-hostcomposetheorems,
  slakeTypecheckHostComposeTheoremsReady,
  kernelCheckLiveHostComposeTheoremsSource,
  PARSE-LIVE-HOST-COMPOSE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckHostComposeTheorems
  Checkable writer: just slake-typecheck-hostcomposetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostComposeTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_COMPOSE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-COMPOSE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostComposeTheorems. -/
def justRecipeSlakeTypecheckHostComposeTheorems : String :=
  "slake-typecheck-hostcomposetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostComposeTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostComposeTheorems.liveHostComposeTheoremsRel

/-- Ready names HostFrontLiveHostComposeTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostComposeTheoremsReady,
    kernelCheckLiveHostComposeTheoremsSource. -/
def slakeTypecheckHostComposeTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostComposeTheorems.hostFrontLiveHostComposeTheoremsReady

/-- Honesty: this command is not lake build of HostComposeTheorems. -/
def slakeTypecheckHostComposeTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostComposeTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostComposeTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostComposeTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostComposeTheorems.lean.
    Ready is HostFrontLiveHostComposeTheorems.hostFrontLiveHostComposeTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostComposeTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostComposeTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostComposeTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveHostComposeTheoremsRel}"
  unless (!slakeTypecheckHostComposeTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostComposeTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostComposeTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostComposeTheorems.main args
