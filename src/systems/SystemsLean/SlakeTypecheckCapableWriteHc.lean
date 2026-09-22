/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableWriteHc.
  Short role: named driver for just slake-typecheck-capablewritehc.
  Ready is HostFrontLiveCapableWriteHc parse plus HostKernel.kernelCheck
  of live CapableWriteHc.lean, not := true, not lake build
  SystemsLean.CapableWriteHc.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableWriteHc is not a
  prefix of mill wrap SlakeTypecheckCapableWriteHcMain):
  SlakeTypecheckCapableWriteHc
  HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC
  SLAKE_TYPECHECK_CAPABLE_WRITE_HC_V0
  PARSE-LIVE-CAPABLE-WRITE-HC
  slake-typecheck-capablewritehc
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablewritehc,
  slakeTypecheckCapableWriteHcReady,
  kernelCheckLiveCapableWriteHcSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableWriteHc
  Checkable writer: just slake-typecheck-capablewritehc
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableWriteHc

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_WRITE_HC_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC"

/-- Named just recipe. Not lake build SystemsLean.CapableWriteHc. -/
def justRecipeSlakeTypecheckCapableWriteHc : String :=
  "slake-typecheck-capablewritehc"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableWriteHcRel : String :=
  SystemsLean.HostFrontLiveCapableWriteHc.liveCapableWriteHcRel

/-- Ready names HostFrontLiveCapableWriteHc parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableWriteHcReady,
    kernelCheckLiveCapableWriteHcSource. -/
def slakeTypecheckCapableWriteHcReady : Bool :=
  SystemsLean.HostFrontLiveCapableWriteHc.hostFrontLiveCapableWriteHcReady

/-- Honesty: this command is not lake build of CapableWriteHc. -/
def slakeTypecheckCapableWriteHcDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableWriteHcFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableWriteHcOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableWriteHc.lean.
    Ready is HostFrontLiveCapableWriteHc.hostFrontLiveCapableWriteHcReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableWriteHc.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableWriteHc} =="
  IO.println s!"  host={hostId} file={liveCapableWriteHcRel}"
  unless (!slakeTypecheckCapableWriteHcFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableWriteHcOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableWriteHc.main args
