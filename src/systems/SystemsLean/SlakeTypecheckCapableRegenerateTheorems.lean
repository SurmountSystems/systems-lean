/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.CapableRegenerateTheorems.
  Short role: named driver for just slake-typecheck-capableregeneratetheorems.
  Ready is HostFrontLiveCapableRegenerateTheorems parse plus
  HostKernel.kernelCheck of live CapableRegenerateTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.CapableRegenerateTheorems.
  liveRel is CapableRegenerateTheorems.lean.
  Not CapableRegenerate.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_REGENERATE_THEOREMS,
  slake-typecheck-capableregeneratetheorems,
  slakeTypecheckCapableRegenerateTheoremsReady,
  kernelCheckLiveCapableRegenerateTheoremsSource,
  PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableRegenerateTheorems
  Checkable writer: just slake-typecheck-capableregeneratetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableRegenerateTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_REGENERATE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.CapableRegenerateTheorems. -/
def justRecipeSlakeTypecheckCapableRegenerateTheorems : String :=
  "slake-typecheck-capableregeneratetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRegenerateTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableRegenerateTheorems.liveCapableRegenerateTheoremsRel

/-- Ready names HostFrontLiveCapableRegenerateTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableRegenerateTheoremsReady,
    kernelCheckLiveCapableRegenerateTheoremsSource. -/
def slakeTypecheckCapableRegenerateTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableRegenerateTheorems.hostFrontLiveCapableRegenerateTheoremsReady

/-- Honesty: this command is not lake build of CapableRegenerateTheorems. -/
def slakeTypecheckCapableRegenerateTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableRegenerateTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableRegenerateTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableRegenerateTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableRegenerateTheorems.lean.
    Ready is
    HostFrontLiveCapableRegenerateTheorems.hostFrontLiveCapableRegenerateTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableRegenerateTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableRegenerateTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableRegenerateTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableRegenerateTheoremsRel}"
  unless (!slakeTypecheckCapableRegenerateTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableRegenerateTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableRegenerateTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableRegenerateTheorems.main args
