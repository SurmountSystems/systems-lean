/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitTypesScaffold.
  Short role: named driver for just slake-typecheck-emittypesscaffold.
  Ready is HostFrontLiveEmitTypesScaffold parse plus HostKernel.kernelCheck
  of live EmitTypesScaffold.lean, not := true, not lake build
  SystemsLean.EmitTypesScaffold.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckEmitTypes is not a prefix):
  SlakeTypecheckEmitTypesScaffold
  HOST-SLAKE-TYPECHECK-EMIT-TYPES-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_TYPES_SCAFFOLD_V0
  PARSE-LIVE-EMIT-TYPES-SCAFFOLD
  slake-typecheck-emittypesscaffold
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emittypesscaffold,
  slakeTypecheckEmitTypesScaffoldReady,
  kernelCheckLiveEmitTypesScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitTypesScaffold
  Checkable writer: just slake-typecheck-emittypesscaffold
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveEmitTypesScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_TYPES_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-TYPES-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitTypesScaffold. -/
def justRecipeSlakeTypecheckEmitTypesScaffold : String :=
  "slake-typecheck-emittypesscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitTypesScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitTypesScaffold.liveEmitTypesScaffoldRel

/-- Ready names HostFrontLiveEmitTypesScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitTypesScaffoldReady,
    kernelCheckLiveEmitTypesScaffoldSource. -/
def slakeTypecheckEmitTypesScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitTypesScaffold.hostFrontLiveEmitTypesScaffoldReady

/-- Honesty: this command is not lake build of EmitTypesScaffold. -/
def slakeTypecheckEmitTypesScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitTypesScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitTypesScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitTypesScaffold.lean.
    Ready is HostFrontLiveEmitTypesScaffold.hostFrontLiveEmitTypesScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitTypesScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitTypesScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitTypesScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitTypesScaffoldRel}"
  unless (!slakeTypecheckEmitTypesScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitTypesScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitTypesScaffold.main args
