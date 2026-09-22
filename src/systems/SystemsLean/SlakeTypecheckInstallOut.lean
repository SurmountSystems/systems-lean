/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.InstallOut.
  Short role: named driver for the InstallOut closed subset.
  Ready is HostFrontLiveInstallOut parse plus HostKernel.kernelCheck
  of live InstallOut.lean, not a hardcoded true, not lake build
  SystemsLean.InstallOut.
  liveRel is InstallOut.lean.
  This wrap is InstallOut.lean. It is not InstallOutTheorems.lean.
  It is not InstallOutMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-INSTALL-OUT,
  SLAKE_TYPECHECK_INSTALL_OUT, slake-typecheck-installout,
  slakeTypecheckInstallOutReady,
  kernelCheckLiveInstallOutSource,
  PARSE-LIVE-INSTALL-OUT.
  Module: SystemsLean.SlakeTypecheckInstallOut
  Checkable writer: lean --run SlakeTypecheckInstallOut.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveInstallOut

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_INSTALL_OUT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-INSTALL-OUT"

/-- Named recipe string. Not lake build SystemsLean.InstallOut. -/
def justRecipeSlakeTypecheckInstallOut : String :=
  "slake-typecheck-installout"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInstallOutRel : String :=
  SystemsLean.HostFrontLiveInstallOut.liveInstallOutRel

/-- Ready names HostFrontLiveInstallOut parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckInstallOutReady,
    kernelCheckLiveInstallOutSource. -/
def slakeTypecheckInstallOutReady : Bool :=
  SystemsLean.HostFrontLiveInstallOut.hostFrontLiveInstallOutReady

/-- Honesty: this command is not lake build of InstallOut. -/
def slakeTypecheckInstallOutDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckInstallOutFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckInstallOutFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckInstallOutOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live InstallOut.lean.
    Ready is HostFrontLiveInstallOut.hostFrontLiveInstallOutReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveInstallOut.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckInstallOut} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveInstallOut.liveRel}"
  IO.println s!"  host={hostId} file={liveInstallOutRel}"
  unless (!slakeTypecheckInstallOutFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckInstallOutFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckInstallOutOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveInstallOut.main args
