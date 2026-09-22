/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultFsDeepen.
  Short role: named driver for slake-typecheck-multfsdeepen.
  Ready is HostFrontLiveMultFsDeepen parse plus HostKernel.kernelCheck
  of live MultFsDeepen.lean, not a hardcoded true, not lake build
  SystemsLean.MultFsDeepen.
  liveRel is MultFsDeepen.lean.
  This wrap is MultFsDeepen.lean. It is not a different product file.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-FS-DEEPEN,
  SLAKE_TYPECHECK_MULT_FS_DEEPEN, slake-typecheck-multfsdeepen,
  slakeTypecheckMultFsDeepenReady,
  kernelCheckLiveMultFsDeepenSource,
  PARSE-LIVE-MULT-FS-DEEPEN, MULT-FS-DEEPEN.
  Module: SystemsLean.SlakeTypecheckMultFsDeepen
  Checkable writer: lean --run of this driver
  (no mill; no lake). Build dir build/slake-typecheck-multfsdeepen.
-/

import SystemsLean.HostFrontLiveMultFsDeepen

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_FS_DEEPEN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FS-DEEPEN"

/-- Named closed-check recipe. Not lake build SystemsLean.MultFsDeepen. -/
def justRecipeSlakeTypecheckMultFsDeepen : String :=
  "slake-typecheck-multfsdeepen"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsDeepenRel : String :=
  SystemsLean.HostFrontLiveMultFsDeepen.liveMultFsDeepenRel

/-- Ready names HostFrontLiveMultFsDeepen parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckMultFsDeepenReady,
    kernelCheckLiveMultFsDeepenSource. -/
def slakeTypecheckMultFsDeepenReady : Bool :=
  SystemsLean.HostFrontLiveMultFsDeepen.hostFrontLiveMultFsDeepenReady

/-- Honesty: this command is not lake build of MultFsDeepen. -/
def slakeTypecheckMultFsDeepenDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFsDeepenFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckMultFsDeepenFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultFsDeepenOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultFsDeepen.lean.
    Ready is HostFrontLiveMultFsDeepen.hostFrontLiveMultFsDeepenReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveMultFsDeepen.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultFsDeepen} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultFsDeepen.liveRel}"
  IO.println s!"  host={hostId} file={liveMultFsDeepenRel}"
  unless (!slakeTypecheckMultFsDeepenFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultFsDeepenFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckMultFsDeepenOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultFsDeepen.main args
