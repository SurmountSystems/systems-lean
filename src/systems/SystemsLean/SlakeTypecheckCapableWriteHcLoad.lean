/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableWriteHcLoad.
  Short role: named driver for just slake-typecheck-capablewritehcload.
  Ready is HostFrontLiveCapableWriteHcLoad parse plus HostKernel.kernelCheck
  of live CapableWriteHcLoad.lean, not a hardcoded true, not lake build
  SystemsLean.CapableWriteHcLoad.
  liveRel is CapableWriteHcLoad.lean.
  This wrap is CapableWriteHcLoad.lean. It is not CapableWriteHc.lean.
  The live namespace is SystemsLean.CapableWriteHc.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-LOAD,
  SLAKE_TYPECHECK_CAPABLE_WRITE_HC_LOAD, slake-typecheck-capablewritehcload,
  slakeTypecheckCapableWriteHcLoadReady,
  kernelCheckLiveCapableWriteHcLoadSource,
  PARSE-LIVE-CAPABLE-WRITE-HC-LOAD, DUAL-SSOT-EQUALITY.
  Module: SystemsLean.SlakeTypecheckCapableWriteHcLoad
  Checkable writer: just slake-typecheck-capablewritehcload
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableWriteHcLoad

/-- Greppable stage id. Hyphenated host id from CapableWriteHcLoad. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_WRITE_HC_LOAD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-LOAD"

/-- Named just recipe. Not lake build SystemsLean.CapableWriteHcLoad. -/
def justRecipeSlakeTypecheckCapableWriteHcLoad : String :=
  "slake-typecheck-capablewritehcload"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableWriteHcLoadRel : String :=
  SystemsLean.HostFrontLiveCapableWriteHcLoad.liveCapableWriteHcLoadRel

/-- Ready names HostFrontLiveCapableWriteHcLoad parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableWriteHcLoadReady,
    kernelCheckLiveCapableWriteHcLoadSource. -/
def slakeTypecheckCapableWriteHcLoadReady : Bool :=
  SystemsLean.HostFrontLiveCapableWriteHcLoad.hostFrontLiveCapableWriteHcLoadReady

/-- Honesty: this command is not lake build of CapableWriteHcLoad. -/
def slakeTypecheckCapableWriteHcLoadDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableWriteHcLoadFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableWriteHcLoadFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableWriteHcLoadOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableWriteHcLoad.lean.
    Ready is HostFrontLiveCapableWriteHcLoad.hostFrontLiveCapableWriteHcLoadReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableWriteHcLoad.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableWriteHcLoad} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableWriteHcLoad.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableWriteHcLoadRel}"
  unless (!slakeTypecheckCapableWriteHcLoadFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableWriteHcLoadFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableWriteHcLoadOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableWriteHcLoad.main args
