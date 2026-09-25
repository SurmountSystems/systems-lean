/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearSubsetEmitMain.
  Short role: named driver for just slake-typecheck-linearsubsetemitmain.
  Ready is HostFrontLiveLinearSubsetEmitMain parse plus HostKernel.kernelCheck
  of live LinearSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.LinearSubsetEmitMain.
  Not mill 32 remill. Not occupancy name 50. Not FullHost.
  This wrap parses LinearSubsetEmitMain.lean only. Do not wrap LinearSubsetEmit.lean.
  Do not invent HostFrontLiveLinearSubsetEmit. Do not wrap Linear.lean.
  Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  Occupancy leftover HostModuleCheckLinearSubsetEmitTerm is not this wrap.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckLinearSubsetEmitMain is not a prefix):
  SlakeTypecheckLinearSubsetEmitMain
  HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT_MAIN_V0
  slake-typecheck-linearsubsetemitmain
  PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN
  LINEAR-SUBSET-EMIT-MAIN
  HOST-LINEAR-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearsubsetemitmain,
  slakeTypecheckLinearSubsetEmitMainReady,
  kernelCheckLiveLinearSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearSubsetEmitMain
  Checkable writer: just slake-typecheck-linearsubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLinearSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LinearSubsetEmitMain. -/
def justRecipeSlakeTypecheckLinearSubsetEmitMain : String :=
  "slake-typecheck-linearsubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveLinearSubsetEmitMain.liveLinearSubsetEmitMainRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveLinearSubsetEmitMain.liveRel

/-- Ready names HostFrontLiveLinearSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearSubsetEmitMainReady,
    kernelCheckLiveLinearSubsetEmitMainSource. -/
def slakeTypecheckLinearSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveLinearSubsetEmitMain.hostFrontLiveLinearSubsetEmitMainReady

/-- Honesty: this command is not lake build of LinearSubsetEmitMain. -/
def slakeTypecheckLinearSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearSubsetEmitMain.lean.
    Ready is HostFrontLiveLinearSubsetEmitMain.hostFrontLiveLinearSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearSubsetEmitMain} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLinearSubsetEmitMainRel}"
  unless (liveRel == "LinearSubsetEmitMain.lean") do
    IO.eprintln "error: liveRel must be LinearSubsetEmitMain.lean"
    return 1
  unless (!slakeTypecheckLinearSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearSubsetEmitMain.main args
