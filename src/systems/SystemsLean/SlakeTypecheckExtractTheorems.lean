/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ExtractTheorems.
  Short role: named driver for just slake-typecheck-extracttheorems.
  Ready is HostFrontLiveExtractTheorems parse plus HostKernel.kernelCheck of live
  ExtractTheorems.lean, not := true, not lake build SystemsLean.ExtractTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EXTRACT-THEOREMS,
  SLAKE_TYPECHECK_EXTRACT_THEOREMS_V0, slake-typecheck-extracttheorems,
  slakeTypecheckExtractTheoremsReady, kernelCheckLiveExtractTheoremsSource,
  PARSE-LIVE-EXTRACT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckExtractTheorems
  Checkable writer: just slake-typecheck-extracttheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveExtractTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ExtractTheorems. -/
def justRecipeSlakeTypecheckExtractTheorems : String :=
  "slake-typecheck-extracttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractTheoremsRel : String :=
  SystemsLean.HostFrontLiveExtractTheorems.liveExtractTheoremsRel

/-- Ready names HostFrontLiveExtractTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckExtractTheoremsReady,
    kernelCheckLiveExtractTheoremsSource. -/
def slakeTypecheckExtractTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveExtractTheorems.hostFrontLiveExtractTheoremsReady

/-- Honesty: this command is not lake build of ExtractTheorems. -/
def slakeTypecheckExtractTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ExtractTheorems.lean.
    Ready is HostFrontLiveExtractTheorems.hostFrontLiveExtractTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveExtractTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtractTheorems} =="
  IO.println s!"  host={hostId} file={liveExtractTheoremsRel}"
  unless (!slakeTypecheckExtractTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtractTheorems.main args
