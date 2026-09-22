/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityMultTerm.
  Short role: named driver for just slake-typecheck-paritymultterm.
  Ready is HostFrontLiveParityMultTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckParityMultTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckParityMultTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITYMULTTERM,
  SLAKE_TYPECHECK_PARITYMULTTERM_V0, slake-typecheck-paritymultterm,
  slakeTypecheckParityMultTermReady, kernelCheckLiveParityMultTermSource,
  PARSE-LIVE-PARITY-MULT-TERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckParityMultTerm
  Checkable writer: just slake-typecheck-paritymultterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityMultTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITYMULTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITYMULTTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckParityMultTerm. -/
def justRecipeSlakeTypecheckParityMultTerm : String :=
  "slake-typecheck-paritymultterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityMultTermRel : String :=
  SystemsLean.HostFrontLiveParityMultTerm.liveParityMultTermRel

/-- Ready names HostFrontLiveParityMultTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckParityMultTermReady,
    kernelCheckLiveParityMultTermSource. -/
def slakeTypecheckParityMultTermReady : Bool :=
  SystemsLean.HostFrontLiveParityMultTerm.hostFrontLiveParityMultTermReady

/-- Honesty: this command is not lake build of HostModuleCheckParityMultTerm. -/
def slakeTypecheckParityMultTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityMultTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityMultTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckParityMultTerm.lean.
    Ready is HostFrontLiveParityMultTerm.hostFrontLiveParityMultTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveParityMultTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityMultTerm} =="
  IO.println s!"  host={hostId} file={liveParityMultTermRel}"
  unless (!slakeTypecheckParityMultTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityMultTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityMultTerm.main args
