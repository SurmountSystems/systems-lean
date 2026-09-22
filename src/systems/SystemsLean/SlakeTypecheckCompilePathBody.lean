/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathBody.
  Short role: named driver for just slake-typecheck-compilepathbody.
  Ready is HostFrontLiveCompilePathBody parse plus HostKernel.kernelCheck
  of live CompilePathBody.lean, not := true, not lake build
  SystemsLean.CompilePathBody.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathBody drivers are not prefix hits):
  SlakeTypecheckCompilePathBody
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-BODY
  SLAKE_TYPECHECK_COMPILE_PATH_BODY_V0
  PARSE-LIVE-COMPILE-PATH-BODY
  COMPILE-PATH-BODY
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathbody,
  slakeTypecheckCompilePathBodyReady,
  kernelCheckLiveCompilePathBodySource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathBody
  Checkable writer: just slake-typecheck-compilepathbody
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathBody

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_BODY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-BODY"

/-- Named just recipe. Not lake build SystemsLean.CompilePathBody. -/
def justRecipeSlakeTypecheckCompilePathBody : String :=
  "slake-typecheck-compilepathbody"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathBodyRel : String :=
  SystemsLean.HostFrontLiveCompilePathBody.liveCompilePathBodyRel

/-- Ready names HostFrontLiveCompilePathBody parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathBodyReady,
    kernelCheckLiveCompilePathBodySource. -/
def slakeTypecheckCompilePathBodyReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathBody.hostFrontLiveCompilePathBodyReady

/-- Honesty: this command is not lake build of CompilePathBody. -/
def slakeTypecheckCompilePathBodyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathBodyFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathBodyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathBody.lean.
    Ready is HostFrontLiveCompilePathBody.hostFrontLiveCompilePathBodyReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathBody.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathBody} =="
  IO.println s!"  host={hostId} file={liveCompilePathBodyRel}"
  unless (!slakeTypecheckCompilePathBodyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathBodyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathBody.main args
