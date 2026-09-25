/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostCompleteMain.
  Short role: named driver for just slake-typecheck-selfhostcompletemain.
  Ready is HostFrontLiveSelfHostCompleteMain parse plus HostKernel.kernelCheck
  of live SelfHostCompleteMain.lean, not := true, not lake build
  SystemsLean.SelfHostCompleteMain.
  Not mill 69 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckSelfHostCompleteMain is not a prefix):
  SlakeTypecheckSelfHostCompleteMain
  HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE-MAIN
  SLAKE_TYPECHECK_SELF_HOST_COMPLETE_MAIN_V0
  slake-typecheck-selfhostcompletemain
  PARSE-LIVE-SELF-HOST-COMPLETE-MAIN
  SELF-HOST-COMPLETE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-selfhostcompletemain,
  slakeTypecheckSelfHostCompleteMainReady,
  kernelCheckLiveSelfHostCompleteMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfHostCompleteMain
  Checkable writer: just slake-typecheck-selfhostcompletemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveSelfHostCompleteMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_COMPLETE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.SelfHostCompleteMain. -/
def justRecipeSlakeTypecheckSelfHostCompleteMain : String :=
  "slake-typecheck-selfhostcompletemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostCompleteMainRel : String :=
  SystemsLean.HostFrontLiveSelfHostCompleteMain.liveSelfHostCompleteMainRel

/-- Ready names HostFrontLiveSelfHostCompleteMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfHostCompleteMainReady,
    kernelCheckLiveSelfHostCompleteMainSource. -/
def slakeTypecheckSelfHostCompleteMainReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostCompleteMain.hostFrontLiveSelfHostCompleteMainReady

/-- Honesty: this command is not lake build of SelfHostCompleteMain. -/
def slakeTypecheckSelfHostCompleteMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostCompleteMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostCompleteMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostCompleteMain.lean.
    Ready is HostFrontLiveSelfHostCompleteMain.hostFrontLiveSelfHostCompleteMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfHostCompleteMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostCompleteMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSelfHostCompleteMain.liveRel}"
  IO.println s!"  host={hostId} file={liveSelfHostCompleteMainRel}"
  unless (!slakeTypecheckSelfHostCompleteMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostCompleteMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostCompleteMain.main args
