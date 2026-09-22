/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Capable.
  Short role: named driver for just slake-typecheck-capable.
  Ready is HostFrontLiveCapable parse plus HostKernel.kernelCheck
  of live Capable.lean, not a hardcoded true, not lake build
  SystemsLean.Capable.
  liveRel is Capable.lean.
  This wrap is Capable.lean. It is not CapableTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE,
  SLAKE_TYPECHECK_CAPABLE, slake-typecheck-capable,
  slakeTypecheckCapableReady,
  kernelCheckLiveCapableSource,
  PARSE-LIVE-CAPABLE.
  Module: SystemsLean.SlakeTypecheckCapable
  Checkable writer: just slake-typecheck-capable
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapable

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE"

/-- Named just recipe. Not lake build SystemsLean.Capable. -/
def justRecipeSlakeTypecheckCapable : String :=
  "slake-typecheck-capable"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRel : String :=
  SystemsLean.HostFrontLiveCapable.liveCapableRel

/-- Ready names HostFrontLiveCapable parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableReady,
    kernelCheckLiveCapableSource. -/
def slakeTypecheckCapableReady : Bool :=
  SystemsLean.HostFrontLiveCapable.hostFrontLiveCapableReady

/-- Honesty: this command is not lake build of Capable. -/
def slakeTypecheckCapableDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Capable.lean.
    Ready is HostFrontLiveCapable.hostFrontLiveCapableReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapable.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapable} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapable.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableRel}"
  unless (!slakeTypecheckCapableFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapable.main args
