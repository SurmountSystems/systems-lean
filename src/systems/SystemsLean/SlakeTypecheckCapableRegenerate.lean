/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableRegenerate.
  Short role: named driver for just slake-typecheck-capableregenerate.
  Ready is HostFrontLiveCapableRegenerate parse plus HostKernel.kernelCheck
  of live CapableRegenerate.lean, not a hardcoded true, not lake build
  SystemsLean.CapableRegenerate.
  liveRel is CapableRegenerate.lean.
  This wrap is CapableRegenerate.lean. It is not CapableRegenerateTheorems.lean.
  It is not CapableRegenerateMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE,
  SLAKE_TYPECHECK_CAPABLE_REGENERATE, slake-typecheck-capableregenerate,
  slakeTypecheckCapableRegenerateReady,
  kernelCheckLiveCapableRegenerateSource,
  PARSE-LIVE-CAPABLE-REGENERATE.
  Module: SystemsLean.SlakeTypecheckCapableRegenerate
  Checkable writer: just slake-typecheck-capableregenerate
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableRegenerate

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_REGENERATE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE"

/-- Named just recipe. Not lake build SystemsLean.CapableRegenerate. -/
def justRecipeSlakeTypecheckCapableRegenerate : String :=
  "slake-typecheck-capableregenerate"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRegenerateRel : String :=
  SystemsLean.HostFrontLiveCapableRegenerate.liveCapableRegenerateRel

/-- Ready names HostFrontLiveCapableRegenerate parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableRegenerateReady,
    kernelCheckLiveCapableRegenerateSource. -/
def slakeTypecheckCapableRegenerateReady : Bool :=
  SystemsLean.HostFrontLiveCapableRegenerate.hostFrontLiveCapableRegenerateReady

/-- Honesty: this command is not lake build of CapableRegenerate. -/
def slakeTypecheckCapableRegenerateDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableRegenerateFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableRegenerateFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableRegenerateOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableRegenerate.lean.
    Ready is HostFrontLiveCapableRegenerate.hostFrontLiveCapableRegenerateReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableRegenerate.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableRegenerate} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableRegenerate.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableRegenerateRel}"
  unless (!slakeTypecheckCapableRegenerateFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableRegenerateFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableRegenerateOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableRegenerate.main args
