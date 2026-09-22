/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageWriteTheorems.
  Short role: named driver for just slake-typecheck-hostpackagewritetheorems.
  Ready is HostFrontLiveHostPackageWriteTheorems parse plus HostKernel.kernelCheck
  of live HostPackageWriteTheorems.lean, not := true, not lake build
  SystemsLean.HostPackageWriteTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not steal HostFrontLivePackageWrite (liveRel is HostPackageWrite.lean).
  Do not steal HostFrontLiveHostPackageWriteMain (liveRel is HostPackageWriteMain.lean).
  Unique needles (trailing newline so HostFrontLiveHostPackageWriteMain is not a prefix):
  SlakeTypecheckHostPackageWriteTheorems
  HOST-SLAKE-TYPECHECK-HOST-PACKAGE-WRITE-THEOREMS
  SLAKE_TYPECHECK_HOST_PACKAGE_WRITE_THEOREMS_V0
  PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS
  HOST-PACKAGE-WRITE-THEOREMS
  liveRel
  HostPackageWriteTheorems.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostpackagewritetheorems,
  slakeTypecheckHostPackageWriteTheoremsReady,
  kernelCheckLiveHostPackageWriteTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostPackageWriteTheorems
  Checkable writer: just slake-typecheck-hostpackagewritetheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostPackageWriteTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_PACKAGE_WRITE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-PACKAGE-WRITE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostPackageWriteTheorems. -/
def justRecipeSlakeTypecheckHostPackageWriteTheorems : String :=
  "slake-typecheck-hostpackagewritetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostPackageWriteTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostPackageWriteTheorems.liveHostPackageWriteTheoremsRel

/-- Live basename. Greppable: liveRel. Must be HostPackageWriteTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostPackageWriteTheorems.liveRel

/-- Ready names HostFrontLiveHostPackageWriteTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostPackageWriteTheoremsReady,
    kernelCheckLiveHostPackageWriteTheoremsSource. -/
def slakeTypecheckHostPackageWriteTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostPackageWriteTheorems.hostFrontLiveHostPackageWriteTheoremsReady

/-- Honesty: this command is not lake build of HostPackageWriteTheorems. -/
def slakeTypecheckHostPackageWriteTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostPackageWriteTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostPackageWriteTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageWriteTheorems.lean.
    Ready is HostFrontLiveHostPackageWriteTheorems.hostFrontLiveHostPackageWriteTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostPackageWriteTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostPackageWriteTheorems} =="
  IO.println s!"  host={hostId} file={liveHostPackageWriteTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostPackageWriteTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostPackageWriteTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostPackageWriteTheorems.main args
