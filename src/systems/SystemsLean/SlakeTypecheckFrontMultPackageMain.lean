/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FrontMultPackageMain.
  Short role: named driver for just slake-typecheck-frontmultpackagemain.
  Ready is HostFrontLiveFrontMultPackageMain parse plus HostKernel.kernelCheck
  of live FrontMultPackageMain.lean, not := true, not lake build
  SystemsLean.FrontMultPackageMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckFrontMultPackageMain
  is not a prefix):
  SlakeTypecheckFrontMultPackageMain
  HOST-SLAKE-TYPECHECK-FRONT-MULT-PACKAGE-MAIN
  SLAKE_TYPECHECK_FRONT_MULT_PACKAGE_MAIN_V0
  slake-typecheck-frontmultpackagemain
  PARSE-LIVE-FRONT-MULT-PACKAGE-MAIN
  FRONT-MULT-PACKAGE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-frontmultpackagemain,
  slakeTypecheckFrontMultPackageMainReady,
  kernelCheckLiveFrontMultPackageMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckFrontMultPackageMain
  Checkable writer: just slake-typecheck-frontmultpackagemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveFrontMultPackageMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FRONT_MULT_PACKAGE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FRONT-MULT-PACKAGE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.FrontMultPackageMain. -/
def justRecipeSlakeTypecheckFrontMultPackageMain : String :=
  "slake-typecheck-frontmultpackagemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontMultPackageMainRel : String :=
  SystemsLean.HostFrontLiveFrontMultPackageMain.liveFrontMultPackageMainRel

/-- Ready names HostFrontLiveFrontMultPackageMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckFrontMultPackageMainReady,
    kernelCheckLiveFrontMultPackageMainSource. -/
def slakeTypecheckFrontMultPackageMainReady : Bool :=
  SystemsLean.HostFrontLiveFrontMultPackageMain.hostFrontLiveFrontMultPackageMainReady

/-- Honesty: this command is not lake build of FrontMultPackageMain. -/
def slakeTypecheckFrontMultPackageMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFrontMultPackageMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFrontMultPackageMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FrontMultPackageMain.lean.
    Ready is HostFrontLiveFrontMultPackageMain.hostFrontLiveFrontMultPackageMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveFrontMultPackageMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFrontMultPackageMain} =="
  IO.println s!"  host={hostId} file={liveFrontMultPackageMainRel}"
  unless (!slakeTypecheckFrontMultPackageMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFrontMultPackageMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFrontMultPackageMain.main args
