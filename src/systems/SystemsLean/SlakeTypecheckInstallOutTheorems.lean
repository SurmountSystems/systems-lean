/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.InstallOutTheorems.
  Short role: named driver for just slake-typecheck-installouttheorems.
  Ready is HostFrontLiveInstallOutTheorems parse plus HostKernel.kernelCheck
  of live InstallOutTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.InstallOutTheorems.
  liveRel is InstallOutTheorems.lean.
  This wrap is InstallOutTheorems.lean. It is not InstallOut.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-INSTALL-OUT-THEOREMS,
  SLAKE_TYPECHECK_INSTALL_OUT_THEOREMS, slake-typecheck-installouttheorems,
  slakeTypecheckInstallOutTheoremsReady,
  kernelCheckLiveInstallOutTheoremsSource,
  PARSE-LIVE-INSTALL-OUT-THEOREMS.
  Module: SystemsLean.SlakeTypecheckInstallOutTheorems
  Checkable writer: just slake-typecheck-installouttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveInstallOutTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_INSTALL_OUT_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-INSTALL-OUT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.InstallOutTheorems. -/
def justRecipeSlakeTypecheckInstallOutTheorems : String :=
  "slake-typecheck-installouttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInstallOutTheoremsRel : String :=
  SystemsLean.HostFrontLiveInstallOutTheorems.liveInstallOutTheoremsRel

/-- Ready names HostFrontLiveInstallOutTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckInstallOutTheoremsReady,
    kernelCheckLiveInstallOutTheoremsSource. -/
def slakeTypecheckInstallOutTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveInstallOutTheorems.hostFrontLiveInstallOutTheoremsReady

/-- Honesty: this command is not lake build of InstallOutTheorems. -/
def slakeTypecheckInstallOutTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckInstallOutTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckInstallOutTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckInstallOutTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live InstallOutTheorems.lean.
    Ready is HostFrontLiveInstallOutTheorems.hostFrontLiveInstallOutTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveInstallOutTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckInstallOutTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveInstallOutTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveInstallOutTheoremsRel}"
  unless (!slakeTypecheckInstallOutTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckInstallOutTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckInstallOutTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveInstallOutTheorems.main args
