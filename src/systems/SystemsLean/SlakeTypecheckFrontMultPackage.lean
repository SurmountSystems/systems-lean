/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FrontMultPackage.
  Short role: named driver for slake-typecheck-frontmultpackage.
  Ready is HostFrontLiveFrontMultPackage parse plus HostKernel.kernelCheck
  of live FrontMultPackage.lean, not a hardcoded true, not lake build
  SystemsLean.FrontMultPackage.
  liveRel is FrontMultPackage.lean.
  This wrap is FrontMultPackage.lean. It is not FrontMultPackageMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-FRONT-MULT-PACKAGE,
  SLAKE_TYPECHECK_FRONT_MULT_PACKAGE, slake-typecheck-frontmultpackage,
  slakeTypecheckFrontMultPackageReady,
  kernelCheckLiveFrontMultPackageSource,
  PARSE-LIVE-FRONT-MULT-PACKAGE.
  Module: SystemsLean.SlakeTypecheckFrontMultPackage
  Checkable writer: slake-typecheck-frontmultpackage
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFrontMultPackage

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FRONT_MULT_PACKAGE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FRONT-MULT-PACKAGE"

/-- Named recipe. Not lake build SystemsLean.FrontMultPackage. -/
def justRecipeSlakeTypecheckFrontMultPackage : String :=
  "slake-typecheck-frontmultpackage"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontMultPackageRel : String :=
  SystemsLean.HostFrontLiveFrontMultPackage.liveFrontMultPackageRel

/-- Ready names HostFrontLiveFrontMultPackage parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckFrontMultPackageReady,
    kernelCheckLiveFrontMultPackageSource. -/
def slakeTypecheckFrontMultPackageReady : Bool :=
  SystemsLean.HostFrontLiveFrontMultPackage.hostFrontLiveFrontMultPackageReady

/-- Honesty: this command is not lake build of FrontMultPackage. -/
def slakeTypecheckFrontMultPackageDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFrontMultPackageFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckFrontMultPackageFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFrontMultPackageOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FrontMultPackage.lean.
    Ready is HostFrontLiveFrontMultPackage.hostFrontLiveFrontMultPackageReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveFrontMultPackage.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFrontMultPackage} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveFrontMultPackage.liveRel}"
  IO.println s!"  host={hostId} file={liveFrontMultPackageRel}"
  unless (!slakeTypecheckFrontMultPackageFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFrontMultPackageFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckFrontMultPackageOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFrontMultPackage.main args
