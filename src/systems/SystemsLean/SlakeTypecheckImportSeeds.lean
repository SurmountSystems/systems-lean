/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphSeeds.
  Short role: named driver for just slake-typecheck-importseeds.
  Ready is HostFrontLiveImportSeeds parse plus HostKernel.kernelCheck of live
  HostImportGraphSeeds.lean, not := true, not lake build SystemsLean.HostImportGraphSeeds.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-SEEDS,
  SLAKE_TYPECHECK_IMPORT_SEEDS_V0, slake-typecheck-importseeds, slakeTypecheckImportSeedsReady,
  kernelCheckLiveImportSeedsSource, PARSE-LIVE-IMPORT-SEEDS, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportSeeds
  Checkable writer: just slake-typecheck-importseeds (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportSeeds

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_SEEDS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-SEEDS"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphSeeds. -/
def justRecipeSlakeTypecheckImportSeeds : String := "slake-typecheck-importseeds"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportSeedsRel : String := SystemsLean.HostFrontLiveImportSeeds.liveImportSeedsRel

/-- Ready names HostFrontLiveImportSeeds parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportSeedsReady, kernelCheckLiveImportSeedsSource. -/
def slakeTypecheckImportSeedsReady : Bool :=
  SystemsLean.HostFrontLiveImportSeeds.hostFrontLiveImportSeedsReady

/-- Honesty: this command is not lake build of HostImportGraphSeeds. -/
def slakeTypecheckImportSeedsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportSeedsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportSeedsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphSeeds.lean.
    Ready is HostFrontLiveImportSeeds.hostFrontLiveImportSeedsReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveImportSeeds.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportSeeds} =="
  IO.println s!"  host={hostId} file={liveImportSeedsRel}"
  unless (!slakeTypecheckImportSeedsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportSeedsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportSeeds.main args
