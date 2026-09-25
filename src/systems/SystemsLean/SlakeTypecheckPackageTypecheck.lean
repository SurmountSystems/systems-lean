/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PackageTypecheck.
  Short role: named driver for just slake-typecheck-packagetypecheck.
  Ready is HostFrontLivePackageTypecheck parse plus HostKernel.kernelCheck
  of live PackageTypecheck.lean, not a hardcoded true, not lake build
  SystemsLean.PackageTypecheck.
  liveRel is PackageTypecheck.lean.
  This wrap is PackageTypecheck.lean. It does not call
  runPackageTypecheckIOSafe and it does not elaborate the package walk.
  Not a full LLVM backend. FullBackend stays false.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  This does not make Slake own package typechecking.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PACKAGE-TYPECHECK,
  SLAKE_TYPECHECK_PACKAGE_TYPECHECK_V0,
  slake-typecheck-packagetypecheck,
  slakeTypecheckPackageTypecheckReady,
  kernelCheckLivePackageTypecheckSource,
  PARSE-LIVE-PACKAGE-TYPECHECK.
  Module: SystemsLean.SlakeTypecheckPackageTypecheck
  Checkable writer: just slake-typecheck-packagetypecheck
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePackageTypecheck

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PACKAGE_TYPECHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PACKAGE-TYPECHECK"

/-- Named just recipe. Not lake build SystemsLean.PackageTypecheck. -/
def justRecipeSlakeTypecheckPackageTypecheck : String :=
  "slake-typecheck-packagetypecheck"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def livePackageTypecheckRel : String :=
  SystemsLean.HostFrontLivePackageTypecheck.liveRel

/-- Ready names HostFrontLivePackageTypecheck parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckPackageTypecheckReady,
    kernelCheckLivePackageTypecheckSource. -/
def slakeTypecheckPackageTypecheckReady : Bool :=
  SystemsLean.HostFrontLivePackageTypecheck.hostFrontLivePackageTypecheckReady

/-- Honesty: this command is not lake build of PackageTypecheck. -/
def slakeTypecheckPackageTypecheckDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPackageTypecheckFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a full LLVM backend. -/
def slakeTypecheckPackageTypecheckFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPackageTypecheckOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PackageTypecheck.lean.
    Ready is HostFrontLivePackageTypecheck.hostFrontLivePackageTypecheckReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLivePackageTypecheck.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPackageTypecheck} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLivePackageTypecheck.liveRel}"
  IO.println s!"  host={hostId} file={livePackageTypecheckRel}"
  unless (!slakeTypecheckPackageTypecheckFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPackageTypecheckFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckPackageTypecheckOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePackageTypecheck.main args
