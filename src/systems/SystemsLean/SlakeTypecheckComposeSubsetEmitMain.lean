/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ComposeSubsetEmitMain.
  Short role: named driver for just slake-typecheck-composesubsetemitmain.
  Ready is HostFrontLiveComposeSubsetEmitMain parse plus HostKernel.kernelCheck
  of live ComposeSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.ComposeSubsetEmitMain.
  not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckComposeSubsetEmitMain is not a prefix):
  SlakeTypecheckComposeSubsetEmitMain
  HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_COMPOSE_SUBSET_EMIT_MAIN_V0
  slake-typecheck-composesubsetemitmain
  PARSE-LIVE-COMPOSE-SUBSET-EMIT-MAIN
  COMPOSE-SUBSET-EMIT-MAIN
  HOST-COMPOSE-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-composesubsetemitmain,
  slakeTypecheckComposeSubsetEmitMainReady,
  kernelCheckLiveComposeSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckComposeSubsetEmitMain
  Checkable writer: just slake-typecheck-composesubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveComposeSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPOSE_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ComposeSubsetEmitMain. -/
def justRecipeSlakeTypecheckComposeSubsetEmitMain : String :=
  "slake-typecheck-composesubsetemitmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveComposeSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveComposeSubsetEmitMain.liveComposeSubsetEmitMainRel

/-- Ready names HostFrontLiveComposeSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckComposeSubsetEmitMainReady,
    kernelCheckLiveComposeSubsetEmitMainSource. -/
def slakeTypecheckComposeSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveComposeSubsetEmitMain.hostFrontLiveComposeSubsetEmitMainReady

/-- Honesty: this command is not lake build of ComposeSubsetEmitMain. -/
def slakeTypecheckComposeSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckComposeSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckComposeSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ComposeSubsetEmitMain.lean.
    Ready is HostFrontLiveComposeSubsetEmitMain.hostFrontLiveComposeSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveComposeSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckComposeSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveComposeSubsetEmitMainRel}"
  unless (!slakeTypecheckComposeSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  IO.println s!"liveRel={SystemsLean.HostFrontLiveComposeSubsetEmitMain.liveRel}"
  SystemsLean.HostFrontLiveComposeSubsetEmitMain.main args
