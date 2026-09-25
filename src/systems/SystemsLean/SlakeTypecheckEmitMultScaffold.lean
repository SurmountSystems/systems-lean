/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitMultScaffold.
  Short role: named driver for just slake-typecheck-emitmultscaffold.
  Ready is HostFrontLiveEmitMultScaffold parse plus HostKernel.kernelCheck
  of live EmitMultScaffold.lean, not := true, not lake build
  SystemsLean.EmitMultScaffold.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other Emit* drivers are not prefix hits):
  SlakeTypecheckEmitMultScaffold
  HOST-SLAKE-TYPECHECK-EMIT-MULT-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_MULT_SCAFFOLD_V0
  PARSE-LIVE-EMIT-MULT-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitmultscaffold,
  slakeTypecheckEmitMultScaffoldReady,
  kernelCheckLiveEmitMultScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitMultScaffold
  Checkable writer: just slake-typecheck-emitmultscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitMultScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_MULT_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-MULT-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitMultScaffold. -/
def justRecipeSlakeTypecheckEmitMultScaffold : String :=
  "slake-typecheck-emitmultscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitMultScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitMultScaffold.liveEmitMultScaffoldRel

/-- Ready names HostFrontLiveEmitMultScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitMultScaffoldReady,
    kernelCheckLiveEmitMultScaffoldSource. -/
def slakeTypecheckEmitMultScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitMultScaffold.hostFrontLiveEmitMultScaffoldReady

/-- Honesty: this command is not lake build of EmitMultScaffold. -/
def slakeTypecheckEmitMultScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitMultScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitMultScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitMultScaffold.lean.
    Ready is HostFrontLiveEmitMultScaffold.hostFrontLiveEmitMultScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitMultScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitMultScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitMultScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitMultScaffoldRel}"
  unless (!slakeTypecheckEmitMultScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitMultScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitMultScaffold.main args
