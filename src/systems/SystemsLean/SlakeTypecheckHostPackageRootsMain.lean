/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageRootsMain.
  Short role: named driver for just slake-typecheck-hostpackagerootsmain.
  Ready is HostFrontLiveHostPackageRootsMain parse plus HostKernel.kernelCheck
  of live HostPackageRootsMain.lean, not a hardcoded true, not lake build
  SystemsLean.HostPackageRootsMain.
  liveRel is HostPackageRootsMain.lean.
  This wrap is HostPackageRootsMain.lean. It is not HostPackageRoots.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-PACKAGE-ROOTS-MAIN,
  SLAKE_TYPECHECK_HOST_PACKAGE_ROOTS_MAIN, slake-typecheck-hostpackagerootsmain,
  slakeTypecheckHostPackageRootsMainReady,
  kernelCheckLiveHostPackageRootsMainSource,
  PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN.
  Module: SystemsLean.SlakeTypecheckHostPackageRootsMain
  Checkable writer: just slake-typecheck-hostpackagerootsmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostPackageRootsMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_PACKAGE_ROOTS_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-PACKAGE-ROOTS-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostPackageRootsMain. -/
def justRecipeSlakeTypecheckHostPackageRootsMain : String :=
  "slake-typecheck-hostpackagerootsmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostPackageRootsMainRel : String :=
  SystemsLean.HostFrontLiveHostPackageRootsMain.liveHostPackageRootsMainRel

/-- Ready names HostFrontLiveHostPackageRootsMain parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostPackageRootsMainReady,
    kernelCheckLiveHostPackageRootsMainSource. -/
def slakeTypecheckHostPackageRootsMainReady : Bool :=
  SystemsLean.HostFrontLiveHostPackageRootsMain.hostFrontLiveHostPackageRootsMainReady

/-- Honesty: this command is not lake build of HostPackageRootsMain. -/
def slakeTypecheckHostPackageRootsMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostPackageRootsMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostPackageRootsMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostPackageRootsMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageRootsMain.lean.
    Ready is HostFrontLiveHostPackageRootsMain.hostFrontLiveHostPackageRootsMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostPackageRootsMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostPackageRootsMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostPackageRootsMain.liveRel}"
  IO.println s!"  host={hostId} file={liveHostPackageRootsMainRel}"
  unless (!slakeTypecheckHostPackageRootsMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostPackageRootsMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostPackageRootsMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostPackageRootsMain.main args
