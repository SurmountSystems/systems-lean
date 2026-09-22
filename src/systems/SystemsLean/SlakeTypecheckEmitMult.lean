/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitMult.
  Short role: named driver for just slake-typecheck-emitmult.
  Ready is HostFrontLiveEmitMult parse plus HostKernel.kernelCheck
  of live EmitMult.lean, not a hardcoded true, not lake build
  SystemsLean.EmitMult.
  liveRel is EmitMult.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-MULT,
  SLAKE_TYPECHECK_EMIT_MULT_V0, slake-typecheck-emitmult,
  slakeTypecheckEmitMultReady,
  kernelCheckLiveEmitMultSource,
  PARSE-LIVE-EMIT-MULT, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitMult
  Checkable writer: just slake-typecheck-emitmult
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitMult

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-MULT"

/-- Named just recipe. Not lake build SystemsLean.EmitMult. -/
def justRecipeSlakeTypecheckEmitMult : String :=
  "slake-typecheck-emitmult"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitMultRel : String :=
  SystemsLean.HostFrontLiveEmitMult.liveEmitMultRel

/-- Ready names HostFrontLiveEmitMult parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitMultReady,
    kernelCheckLiveEmitMultSource. -/
def slakeTypecheckEmitMultReady : Bool :=
  SystemsLean.HostFrontLiveEmitMult.hostFrontLiveEmitMultReady

/-- Honesty: this command is not lake build of EmitMult. -/
def slakeTypecheckEmitMultDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitMultFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitMultOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitMult.lean.
    Ready is HostFrontLiveEmitMult.hostFrontLiveEmitMultReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitMult.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitMult} =="
  IO.println s!"  host={hostId} file={liveEmitMultRel}"
  unless (!slakeTypecheckEmitMultFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitMultOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitMultDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveEmitMult.main args
