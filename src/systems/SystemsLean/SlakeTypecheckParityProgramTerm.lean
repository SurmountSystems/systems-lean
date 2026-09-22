/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityProgramTerm.
  Short role: named driver for just slake-typecheck-parityprogramterm.
  Ready is HostFrontLiveParityProgramTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckParityProgramTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckParityProgramTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITYPROGRAMTERM,
  SLAKE_TYPECHECK_PARITYPROGRAMTERM_V0, slake-typecheck-parityprogramterm,
  slakeTypecheckParityProgramTermReady, kernelCheckLiveParityProgramTermSource,
  PARSE-LIVE-PARITY-PROGRAM-TERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckParityProgramTerm
  Checkable writer: just slake-typecheck-parityprogramterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityProgramTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITYPROGRAMTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITYPROGRAMTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckParityProgramTerm. -/
def justRecipeSlakeTypecheckParityProgramTerm : String :=
  "slake-typecheck-parityprogramterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityProgramTermRel : String :=
  SystemsLean.HostFrontLiveParityProgramTerm.liveParityProgramTermRel

/-- Ready names HostFrontLiveParityProgramTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckParityProgramTermReady,
    kernelCheckLiveParityProgramTermSource. -/
def slakeTypecheckParityProgramTermReady : Bool :=
  SystemsLean.HostFrontLiveParityProgramTerm.hostFrontLiveParityProgramTermReady

/-- Honesty: this command is not lake build of HostModuleCheckParityProgramTerm. -/
def slakeTypecheckParityProgramTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityProgramTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityProgramTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckParityProgramTerm.lean.
    Ready is HostFrontLiveParityProgramTerm.hostFrontLiveParityProgramTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveParityProgramTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityProgramTerm} =="
  IO.println s!"  host={hostId} file={liveParityProgramTermRel}"
  unless (!slakeTypecheckParityProgramTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityProgramTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityProgramTerm.main args
