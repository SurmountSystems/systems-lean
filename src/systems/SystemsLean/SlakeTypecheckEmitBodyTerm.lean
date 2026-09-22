/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckEmitBodyTerm.
  Short role: named driver for just slake-typecheck-emitbodyterm.
  Ready is HostFrontLiveEmitBodyTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckEmitBodyTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckEmitBodyTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMITBODYTERM,
  SLAKE_TYPECHECK_EMITBODYTERM_V0, slake-typecheck-emitbodyterm,
  slakeTypecheckEmitBodyTermReady, kernelCheckLiveEmitBodyTermSource,
  PARSE-LIVE-EMITBODYTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitBodyTerm
  Checkable writer: just slake-typecheck-emitbodyterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitBodyTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMITBODYTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMITBODYTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckEmitBodyTerm. -/
def justRecipeSlakeTypecheckEmitBodyTerm : String :=
  "slake-typecheck-emitbodyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBodyTermRel : String :=
  SystemsLean.HostFrontLiveEmitBodyTerm.liveEmitBodyTermRel

/-- Ready names HostFrontLiveEmitBodyTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckEmitBodyTermReady,
    kernelCheckLiveEmitBodyTermSource. -/
def slakeTypecheckEmitBodyTermReady : Bool :=
  SystemsLean.HostFrontLiveEmitBodyTerm.hostFrontLiveEmitBodyTermReady

/-- Honesty: this command is not lake build of HostModuleCheckEmitBodyTerm. -/
def slakeTypecheckEmitBodyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitBodyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitBodyTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckEmitBodyTerm.lean.
    Ready is HostFrontLiveEmitBodyTerm.hostFrontLiveEmitBodyTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitBodyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitBodyTerm} =="
  IO.println s!"  host={hostId} file={liveEmitBodyTermRel}"
  unless (!slakeTypecheckEmitBodyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitBodyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitBodyTerm.main args
