/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableWriteHcMain.
  Short role: named driver for just slake-typecheck-capablewritehcmain.
  Ready is HostFrontLiveCapableWriteHcMain parse plus HostKernel.kernelCheck
  of live CapableWriteHcMain.lean, not := true, not lake build
  SystemsLean.CapableWriteHcMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableWriteHcMain is not a prefix):
  SlakeTypecheckCapableWriteHcMain
  HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-MAIN
  SLAKE_TYPECHECK_CAPABLE_WRITE_HC_MAIN_V0
  slake-typecheck-capablewritehcmain
  PARSE-LIVE-CAPABLE-WRITE-HC-MAIN
  CAPABLE-WRITE-HC-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablewritehcmain,
  slakeTypecheckCapableWriteHcMainReady,
  kernelCheckLiveCapableWriteHcMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableWriteHcMain
  Checkable writer: just slake-typecheck-capablewritehcmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableWriteHcMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_WRITE_HC_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableWriteHcMain. -/
def justRecipeSlakeTypecheckCapableWriteHcMain : String :=
  "slake-typecheck-capablewritehcmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableWriteHcMainRel : String :=
  SystemsLean.HostFrontLiveCapableWriteHcMain.liveCapableWriteHcMainRel

/-- Ready names HostFrontLiveCapableWriteHcMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableWriteHcMainReady,
    kernelCheckLiveCapableWriteHcMainSource. -/
def slakeTypecheckCapableWriteHcMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableWriteHcMain.hostFrontLiveCapableWriteHcMainReady

/-- Honesty: this command is not lake build of CapableWriteHcMain. -/
def slakeTypecheckCapableWriteHcMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableWriteHcMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableWriteHcMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableWriteHcMain.lean.
    Ready is HostFrontLiveCapableWriteHcMain.hostFrontLiveCapableWriteHcMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableWriteHcMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableWriteHcMain} =="
  IO.println s!"  host={hostId} file={liveCapableWriteHcMainRel}"
  unless (!slakeTypecheckCapableWriteHcMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableWriteHcMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableWriteHcMain.main args
