/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageWrite.
  Short role: named driver for just slake-typecheck-packagewrite.
  Ready is HostFrontLivePackageWrite parse plus HostKernel.kernelCheck of live
  HostPackageWrite.lean, not := true, not lake build SystemsLean.HostPackageWrite.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PACKAGEWRITE,
  SLAKE_TYPECHECK_PACKAGEWRITE_V0, slake-typecheck-packagewrite, slakeTypecheckPackageWriteReady,
  kernelCheckLivePackageWriteSource, PARSE-LIVE-PACKAGEWRITE, SKELETON.
  Module: SystemsLean.SlakeTypecheckPackageWrite
  Checkable writer: just slake-typecheck-packagewrite (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePackageWrite

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PACKAGEWRITE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PACKAGEWRITE"

/-- Named just recipe. Not lake build SystemsLean.HostPackageWrite. -/
def justRecipeSlakeTypecheckPackageWrite : String := "slake-typecheck-packagewrite"

/-- Live file relative to repo root. Dual-pin path. -/
def livePackageWriteRel : String := SystemsLean.HostFrontLivePackageWrite.livePackageWriteRel

/-- Ready names HostFrontLivePackageWrite parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckPackageWriteReady, kernelCheckLivePackageWriteSource. -/
def slakeTypecheckPackageWriteReady : Bool :=
  SystemsLean.HostFrontLivePackageWrite.hostFrontLivePackageWriteReady

/-- Honesty: this command is not lake build of HostPackageWrite. -/
def slakeTypecheckPackageWriteDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPackageWriteFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPackageWriteOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageWrite.lean.
    Ready is HostFrontLivePackageWrite.hostFrontLivePackageWriteReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLivePackageWrite.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPackageWrite} =="
  IO.println s!"  host={hostId} file={livePackageWriteRel}"
  unless (!slakeTypecheckPackageWriteFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPackageWriteOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePackageWrite.main args
