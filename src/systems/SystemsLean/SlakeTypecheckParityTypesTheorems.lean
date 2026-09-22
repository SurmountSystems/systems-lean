/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityTypesTheorems.
  Short role: named driver for just slake-typecheck-paritytypestheorems.
  Ready is HostFrontLiveParityTypesTheorems parse plus HostKernel.kernelCheck
  of live ParityTypesTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.ParityTypesTheorems.
  liveRel is ParityTypesTheorems.lean.
  This wrap is ParityTypesTheorems.lean. It is not ParityTypes.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-TYPES-THEOREMS,
  SLAKE_TYPECHECK_PARITY_TYPES_THEOREMS, slake-typecheck-paritytypestheorems,
  slakeTypecheckParityTypesTheoremsReady,
  kernelCheckLiveParityTypesTheoremsSource,
  PARSE-LIVE-PARITY-TYPES-THEOREMS.
  Module: SystemsLean.SlakeTypecheckParityTypesTheorems
  Checkable writer: just slake-typecheck-paritytypestheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityTypesTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_TYPES_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-TYPES-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ParityTypesTheorems. -/
def justRecipeSlakeTypecheckParityTypesTheorems : String :=
  "slake-typecheck-paritytypestheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityTypesTheoremsRel : String :=
  SystemsLean.HostFrontLiveParityTypesTheorems.liveParityTypesTheoremsRel

/-- Ready names HostFrontLiveParityTypesTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityTypesTheoremsReady,
    kernelCheckLiveParityTypesTheoremsSource. -/
def slakeTypecheckParityTypesTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveParityTypesTheorems.hostFrontLiveParityTypesTheoremsReady

/-- Honesty: this command is not lake build of ParityTypesTheorems. -/
def slakeTypecheckParityTypesTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityTypesTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityTypesTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityTypesTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityTypesTheorems.lean.
    Ready is HostFrontLiveParityTypesTheorems.hostFrontLiveParityTypesTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityTypesTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityTypesTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityTypesTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveParityTypesTheoremsRel}"
  unless (!slakeTypecheckParityTypesTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityTypesTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityTypesTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityTypesTheorems.main args
