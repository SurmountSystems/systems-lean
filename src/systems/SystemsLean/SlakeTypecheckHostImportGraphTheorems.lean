/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphTheorems.
  Short role: named driver for just slake-typecheck-hostimportgraphtheorems.
  Ready is HostFrontLiveHostImportGraphTheorems parse plus HostKernel.kernelCheck
  of live HostImportGraphTheorems.lean, not := true, not lake build
  SystemsLean.HostImportGraphTheorems.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphTheorems is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain):
  SlakeTypecheckHostImportGraphTheorems
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-THEOREMS
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_THEOREMS_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS
  slake-typecheck-hostimportgraphtheorems
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphtheorems,
  slakeTypecheckHostImportGraphTheoremsReady,
  kernelCheckLiveHostImportGraphTheoremsSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphTheorems
  Checkable writer: just slake-typecheck-hostimportgraphtheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphTheorems. -/
def justRecipeSlakeTypecheckHostImportGraphTheorems : String :=
  "slake-typecheck-hostimportgraphtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphTheorems.liveHostImportGraphTheoremsRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphTheorems.liveRel

/-- Ready names HostFrontLiveHostImportGraphTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphTheoremsReady,
    kernelCheckLiveHostImportGraphTheoremsSource. -/
def slakeTypecheckHostImportGraphTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphTheorems.hostFrontLiveHostImportGraphTheoremsReady

/-- Honesty: this command is not lake build of HostImportGraphTheorems. -/
def slakeTypecheckHostImportGraphTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphTheorems.lean.
    Ready is HostFrontLiveHostImportGraphTheorems.hostFrontLiveHostImportGraphTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphTheorems} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphTheorems.main args
