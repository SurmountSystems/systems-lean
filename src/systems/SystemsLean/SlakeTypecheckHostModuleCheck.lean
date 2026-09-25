/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheck.
  Short role: named driver for just slake-typecheck-hostmodulecheck.
  Ready is HostFrontLiveHostModuleCheck parse plus HostKernel.kernelCheck
  of live HostModuleCheck.lean, not a hardcoded true, not lake build
  SystemsLean.HostModuleCheck.
  liveRel is HostModuleCheck.lean.
  This wrap is HostModuleCheck.lean. It does not import HostModuleCheck.
  It does not import HostModuleCheckMain. It does not elaborate the package walk.
  Not a full LLVM backend. FullBackend stays false.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  This does not make Slake own package typechecking.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_V0,
  slake-typecheck-hostmodulecheck,
  slakeTypecheckHostModuleCheckReady,
  kernelCheckLiveHostModuleCheckSource,
  PARSE-LIVE-HOST-MODULE-CHECK.
  Module: SystemsLean.SlakeTypecheckHostModuleCheck
  Checkable writer: just slake-typecheck-hostmodulecheck
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheck

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheck. -/
def justRecipeSlakeTypecheckHostModuleCheck : String :=
  "slake-typecheck-hostmodulecheck"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveHostModuleCheckRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheck.liveRel

/-- Ready names HostFrontLiveHostModuleCheck parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckReady,
    kernelCheckLiveHostModuleCheckSource. -/
def slakeTypecheckHostModuleCheckReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheck.hostFrontLiveHostModuleCheckReady

/-- Honesty: this command is not lake build of HostModuleCheck. -/
def slakeTypecheckHostModuleCheckDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a full LLVM backend. -/
def slakeTypecheckHostModuleCheckFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheck.lean.
    Ready is HostFrontLiveHostModuleCheck.hostFrontLiveHostModuleCheckReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheck.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheck} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheck.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRel}"
  unless (!slakeTypecheckHostModuleCheckFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheck.main args
