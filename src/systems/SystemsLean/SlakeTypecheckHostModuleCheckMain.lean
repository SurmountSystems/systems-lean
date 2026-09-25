/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMain.
  Short role: named driver for just slake-typecheck-hostmodulecheckmain.
  Ready is HostFrontLiveHostModuleCheckMain parse plus HostKernel.kernelCheck
  of live HostModuleCheckMain.lean, not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckMain.
  liveRel is HostModuleCheckMain.lean.
  This wrap is HostModuleCheckMain.lean. It is not HostModuleCheck.lean.
  It is not HostModuleCheckTheorems.lean.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MAIN,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_MAIN_V0,
  slake-typecheck-hostmodulecheckmain,
  slakeTypecheckHostModuleCheckMainReady,
  kernelCheckLiveHostModuleCheckMainSource,
  PARSE-LIVE-HOST-MODULE-CHECK-MAIN.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMain
  Checkable writer: just slake-typecheck-hostmodulecheckmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckMain. -/
def justRecipeSlakeTypecheckHostModuleCheckMain : String :=
  "slake-typecheck-hostmodulecheckmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveHostModuleCheckMainRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMain.liveRel

/-- Ready names HostFrontLiveHostModuleCheckMain parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckMainReady,
    kernelCheckLiveHostModuleCheckMainSource. -/
def slakeTypecheckHostModuleCheckMainReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMain.hostFrontLiveHostModuleCheckMainReady

/-- Honesty: this command is not lake build of HostModuleCheckMain. -/
def slakeTypecheckHostModuleCheckMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckMain.lean.
    Ready is HostFrontLiveHostModuleCheckMain.hostFrontLiveHostModuleCheckMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMain.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMainRel}"
  unless (!slakeTypecheckHostModuleCheckMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMain.main args
