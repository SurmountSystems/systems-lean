/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckAccepts.
  Short role: named driver for just slake-typecheck-hostmodulecheckaccepts.
  Ready is HostFrontLiveHostModuleCheckAccepts parse plus HostKernel.kernelCheck
  of live HostModuleCheckAccepts.lean, not := true, not lake build
  SystemsLean.HostModuleCheckAccepts.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not retarget SlakeTypecheckHostModuleCheck. That driver runs the
  HostModuleCheck checker only.
  Unique needles (trailing newline so SlakeTypecheckHostModuleCheckAccepts
  is not a prefix of a longer driver name):
  SlakeTypecheckHostModuleCheckAccepts
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ACCEPTS
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_ACCEPTS_V0
  PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS
  slake-typecheck-hostmodulecheckaccepts
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostmodulecheckaccepts,
  slakeTypecheckHostModuleCheckAcceptsReady,
  kernelCheckLiveHostModuleCheckAcceptsSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckAccepts
  Checkable writer: just slake-typecheck-hostmodulecheckaccepts
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostModuleCheckAccepts

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_ACCEPTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ACCEPTS"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckAccepts. -/
def justRecipeSlakeTypecheckHostModuleCheckAccepts : String :=
  "slake-typecheck-hostmodulecheckaccepts"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAccepts.liveHostModuleCheckAcceptsRel

/-- Live basename. Greppable: liveRel. Must be HostModuleCheckAccepts.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAccepts.liveRel

/-- Ready names HostFrontLiveHostModuleCheckAccepts parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostModuleCheckAcceptsReady,
    kernelCheckLiveHostModuleCheckAcceptsSource. -/
def slakeTypecheckHostModuleCheckAcceptsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckAccepts.hostFrontLiveHostModuleCheckAcceptsReady

/-- Honesty: this command is not lake build of HostModuleCheckAccepts. -/
def slakeTypecheckHostModuleCheckAcceptsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckAcceptsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckAcceptsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckAccepts.lean.
    Ready is HostFrontLiveHostModuleCheckAccepts.hostFrontLiveHostModuleCheckAcceptsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckAccepts.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckAccepts} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostModuleCheckAcceptsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckAcceptsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckAccepts.main args
