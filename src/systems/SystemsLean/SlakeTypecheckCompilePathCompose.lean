/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathCompose.
  Short role: named driver for just slake-typecheck-compilepathcompose.
  Ready is HostFrontLiveCompilePathCompose parse plus HostKernel.kernelCheck
  of live CompilePathCompose.lean, not := true, not lake build
  SystemsLean.CompilePathCompose.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathCompose drivers are not prefix hits):
  SlakeTypecheckCompilePathCompose
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-COMPOSE
  SLAKE_TYPECHECK_COMPILE_PATH_COMPOSE_V0
  PARSE-LIVE-COMPILE-PATH-COMPOSE
  COMPILE-PATH-COMPOSE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathcompose,
  slakeTypecheckCompilePathComposeReady,
  kernelCheckLiveCompilePathComposeSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathCompose
  Checkable writer: just slake-typecheck-compilepathcompose
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathCompose

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-COMPOSE"

/-- Named just recipe. Not lake build SystemsLean.CompilePathCompose. -/
def justRecipeSlakeTypecheckCompilePathCompose : String :=
  "slake-typecheck-compilepathcompose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathComposeRel : String :=
  SystemsLean.HostFrontLiveCompilePathCompose.liveCompilePathComposeRel

/-- Ready names HostFrontLiveCompilePathCompose parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathComposeReady,
    kernelCheckLiveCompilePathComposeSource. -/
def slakeTypecheckCompilePathComposeReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathCompose.hostFrontLiveCompilePathComposeReady

/-- Honesty: this command is not lake build of CompilePathCompose. -/
def slakeTypecheckCompilePathComposeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathComposeFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathComposeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathCompose.lean.
    Ready is HostFrontLiveCompilePathCompose.hostFrontLiveCompilePathComposeReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathCompose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathCompose} =="
  IO.println s!"  host={hostId} file={liveCompilePathComposeRel}"
  unless (!slakeTypecheckCompilePathComposeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathComposeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathCompose.main args
