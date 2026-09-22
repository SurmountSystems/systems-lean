/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathExtract.
  Short role: named driver for just slake-typecheck-compilepathextract.
  Ready is HostFrontLiveCompilePathExtract parse plus HostKernel.kernelCheck
  of live CompilePathExtract.lean, not := true, not lake build
  SystemsLean.CompilePathExtract.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathExtract drivers are not prefix hits):
  SlakeTypecheckCompilePathExtract
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-EXTRACT
  SLAKE_TYPECHECK_COMPILE_PATH_EXTRACT_V0
  PARSE-LIVE-COMPILE-PATH-EXTRACT
  COMPILE-PATH-EXTRACT
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathextract,
  slakeTypecheckCompilePathExtractReady,
  kernelCheckLiveCompilePathExtractSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathExtract
  Checkable writer: just slake-typecheck-compilepathextract
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathExtract

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_EXTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-EXTRACT"

/-- Named just recipe. Not lake build SystemsLean.CompilePathExtract. -/
def justRecipeSlakeTypecheckCompilePathExtract : String :=
  "slake-typecheck-compilepathextract"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathExtractRel : String :=
  SystemsLean.HostFrontLiveCompilePathExtract.liveCompilePathExtractRel

/-- Ready names HostFrontLiveCompilePathExtract parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathExtractReady,
    kernelCheckLiveCompilePathExtractSource. -/
def slakeTypecheckCompilePathExtractReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathExtract.hostFrontLiveCompilePathExtractReady

/-- Honesty: this command is not lake build of CompilePathExtract. -/
def slakeTypecheckCompilePathExtractDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathExtractFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathExtractOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathExtract.lean.
    Ready is HostFrontLiveCompilePathExtract.hostFrontLiveCompilePathExtractReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathExtract.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathExtract} =="
  IO.println s!"  host={hostId} file={liveCompilePathExtractRel}"
  unless (!slakeTypecheckCompilePathExtractFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathExtractOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathExtract.main args
