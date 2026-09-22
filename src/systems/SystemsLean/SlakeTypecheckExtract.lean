/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Extract.
  Short role: named driver for just slake-typecheck-extract.
  Ready is HostFrontLiveExtract parse plus HostKernel.kernelCheck of live
  Extract.lean, not := true, not lake build SystemsLean.Extract.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EXTRACT,
  SLAKE_TYPECHECK_EXTRACT_V0, slake-typecheck-extract, slakeTypecheckExtractReady,
  kernelCheckLiveExtractSource, PARSE-LIVE-EXTRACT, SKELETON.
  Module: SystemsLean.SlakeTypecheckExtract
  Checkable writer: just slake-typecheck-extract (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveExtract

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT"

/-- Named just recipe. Not lake build SystemsLean.Extract. -/
def justRecipeSlakeTypecheckExtract : String := "slake-typecheck-extract"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractRel : String := SystemsLean.HostFrontLiveExtract.liveExtractRel

/-- Ready names HostFrontLiveExtract parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckExtractReady, kernelCheckLiveExtractSource. -/
def slakeTypecheckExtractReady : Bool :=
  SystemsLean.HostFrontLiveExtract.hostFrontLiveExtractReady

/-- Honesty: this command is not lake build of Extract. -/
def slakeTypecheckExtractDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Extract.lean.
    Ready is HostFrontLiveExtract.hostFrontLiveExtractReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveExtract.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtract} =="
  IO.println s!"  host={hostId} file={liveExtractRel}"
  unless (!slakeTypecheckExtractFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtract.main args
