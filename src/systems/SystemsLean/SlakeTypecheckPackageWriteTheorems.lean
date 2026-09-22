/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageWriteTheorems.
  Short role: named driver for just slake-typecheck-packagewritetheorems.
  Ready is HostFrontLivePackageWriteTheorems parse plus HostKernel.kernelCheck of live
  HostPackageWriteTheorems.lean, not := true, not lake build
  SystemsLean.HostPackageWriteTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PACKAGEWRITE-THEOREMS,
  SLAKE_TYPECHECK_PACKAGEWRITE_THEOREMS_V0, slake-typecheck-packagewritetheorems,
  slakeTypecheckPackageWriteTheoremsReady, kernelCheckLivePackageWriteTheoremsSource,
  PARSE-LIVE-PACKAGEWRITE-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckPackageWriteTheorems
  Checkable writer: just slake-typecheck-packagewritetheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePackageWriteTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PACKAGEWRITE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PACKAGEWRITE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostPackageWriteTheorems. -/
def justRecipeSlakeTypecheckPackageWriteTheorems : String :=
  "slake-typecheck-packagewritetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def livePackageWriteTheoremsRel : String :=
  SystemsLean.HostFrontLivePackageWriteTheorems.livePackageWriteTheoremsRel

/-- Ready names HostFrontLivePackageWriteTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckPackageWriteTheoremsReady,
    kernelCheckLivePackageWriteTheoremsSource. -/
def slakeTypecheckPackageWriteTheoremsReady : Bool :=
  SystemsLean.HostFrontLivePackageWriteTheorems.hostFrontLivePackageWriteTheoremsReady

/-- Honesty: this command is not lake build of HostPackageWriteTheorems. -/
def slakeTypecheckPackageWriteTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPackageWriteTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPackageWriteTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageWriteTheorems.lean.
    Ready is hostFrontLivePackageWriteTheoremsReady (parse plus HostKernel.kernelCheck),
    not := true. Evaluated inside HostFrontLivePackageWriteTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPackageWriteTheorems} =="
  IO.println s!"  host={hostId} file={livePackageWriteTheoremsRel}"
  unless (!slakeTypecheckPackageWriteTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPackageWriteTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePackageWriteTheorems.main args
