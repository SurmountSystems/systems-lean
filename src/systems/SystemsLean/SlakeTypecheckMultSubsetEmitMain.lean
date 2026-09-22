/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultSubsetEmitMain.
  Short role: named driver for just slake-typecheck-multsubsetemitmain.
  Ready is HostFrontLiveMultSubsetEmitMain parse plus HostKernel.kernelCheck
  of live MultSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.MultSubsetEmitMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckMultSubsetEmitMain is not a prefix):
  SlakeTypecheckMultSubsetEmitMain
  HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_MULT_SUBSET_EMIT_MAIN_V0
  slake-typecheck-multsubsetemitmain
  PARSE-LIVE-MULT-SUBSET-EMIT-MAIN
  MULT-SUBSET-EMIT-MAIN
  HOST-MULT-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-multsubsetemitmain,
  slakeTypecheckMultSubsetEmitMainReady,
  kernelCheckLiveMultSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckMultSubsetEmitMain
  Checkable writer: just slake-typecheck-multsubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveMultSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.MultSubsetEmitMain. -/
def justRecipeSlakeTypecheckMultSubsetEmitMain : String :=
  "slake-typecheck-multsubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveMultSubsetEmitMain.liveMultSubsetEmitMainRel

/-- Ready names HostFrontLiveMultSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckMultSubsetEmitMainReady,
    kernelCheckLiveMultSubsetEmitMainSource. -/
def slakeTypecheckMultSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveMultSubsetEmitMain.hostFrontLiveMultSubsetEmitMainReady

/-- Honesty: this command is not lake build of MultSubsetEmitMain. -/
def slakeTypecheckMultSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultSubsetEmitMain.lean.
    Ready is HostFrontLiveMultSubsetEmitMain.hostFrontLiveMultSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveMultSubsetEmitMainRel}"
  unless (!slakeTypecheckMultSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultSubsetEmitMain.main args
