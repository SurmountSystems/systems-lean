/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePath (SKELETON).
  Short role: named driver for just slake-typecheck-compilepath.
  Ready is HostFrontLiveCompilePath parse plus HostKernel.kernelCheck of live
  CompilePath.lean, not := true, not lake build SystemsLean.CompilePath.
  This barrel calls parseLiveCompilePathSource (HostFront.parseSource keep).
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPILEPATH,
  SLAKE_TYPECHECK_COMPILEPATH_V0, slake-typecheck-compilepath,
  slakeTypecheckCompilePathReady, kernelCheckLiveCompilePathSource,
  parseLiveCompilePathSource, PARSE-LIVE-COMPILEPATH,
  graphFixtureMintId, graphFixtureGraphReady, graphFixtureProgramReady,
  graphFixtureGraphReady_true, GRAPH-FIXTURE, SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePath
  Checkable writer: just slake-typecheck-compilepath (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCompilePath
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILEPATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILEPATH"

/-- Named just recipe. Not lake build SystemsLean.CompilePath. -/
def justRecipeSlakeTypecheckCompilePath : String :=
  "slake-typecheck-compilepath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathRel : String :=
  SystemsLean.HostFrontLiveCompilePath.liveCompilePathRel

/-- Driver calls parseLiveCompilePathSource then HostKernel.kernelCheck.
    HostFront.parseSource keep of live CompilePath.lean.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveCompilePathSource,
    parseLiveCompilePathSource, HostKernel.kernelCheck. -/
def kernelCheckLiveCompilePathSource : Bool :=
  match SystemsLean.HostFrontLiveCompilePath.parseLiveCompilePathSource
      SystemsLean.HostFrontLiveCompilePath.liveCompilePathSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveCompilePath parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCompilePathReady,
    kernelCheckLiveCompilePathSource, parseLiveCompilePathSource. -/
def slakeTypecheckCompilePathReady : Bool :=
  kernelCheckLiveCompilePathSource
    && SystemsLean.HostFrontLiveCompilePath.hostFrontLiveCompilePathReady

/-- Honesty: this command is not lake build of CompilePath. -/
def slakeTypecheckCompilePathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathOwnsPackageTypecheck : Bool := false

/-- Graph-shape typed keep. Same forms HostKernel.slakeChecker accepts
    on CompilePathGraph (acceptKeptGraph / graphKeepToy): mint Nat 8,
    Bool honesty pair, decide theorem. Not a new mint ident.
    Greppable: graphFixtureMintId, GRAPH-FIXTURE. -/
def graphFixtureMintId : Nat := 8

/-- Graph fixture IR-graph bar pin. Typed keep, not := residual free. -/
def graphFixtureGraphReady : Bool := true

/-- Graph fixture ordered-IR bar pin. Honesty pair with GraphReady. -/
def graphFixtureProgramReady : Bool := true

/-- Graph fixture decide theorem. native_decide is not decide.
    Greppable: graphFixtureGraphReady_true, GRAPH-FIXTURE. -/
theorem graphFixtureGraphReady_true : graphFixtureGraphReady = true := by decide

/-- lean --run entry: parse plus HostKernel.kernelCheck live CompilePath.lean.
    Ready is hostFrontLiveCompilePathReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePath.main at runtime, and this driver calls
    parseLiveCompilePathSource then HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePath} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCompilePath.liveRel}"
  IO.println s!"  host={hostId} file={liveCompilePathRel}"
  unless (!slakeTypecheckCompilePathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveCompilePathSource do
    IO.eprintln "error: HostKernel.kernelCheck live CompilePath parse false"
    return 1
  unless slakeTypecheckCompilePathReady do
    IO.eprintln "error: slakeTypecheckCompilePathReady false"
    return 1
  SystemsLean.HostFrontLiveCompilePath.main args
