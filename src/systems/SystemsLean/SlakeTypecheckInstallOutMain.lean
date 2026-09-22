/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.InstallOutMain.
  Short role: named driver for just slake-typecheck-installoutmain.
  Ready is HostFrontLiveInstallOutMain parse plus HostKernel.kernelCheck
  of live InstallOutMain.lean, not := true, not lake build
  SystemsLean.InstallOutMain.
  Not mill 9 remill (just ninth-host-tool / inventory row 11).
  Not occupancy name 50. Not FullHost.
  This wrap parses InstallOutMain.lean only. Do not wrap InstallOut.lean.
  Do not invent HostFrontLiveInstallOut. Do not wrap Linear.lean.
  Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  Do not steal HostFrontLiveCapableRegenerateMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckInstallOutMain is not a prefix):
  SlakeTypecheckInstallOutMain
  HOST-SLAKE-TYPECHECK-INSTALL-OUT-MAIN
  SLAKE_TYPECHECK_INSTALL_OUT_MAIN_V0
  slake-typecheck-installoutmain
  PARSE-LIVE-INSTALL-OUT-MAIN
  INSTALL-OUT-MAIN
  HOST-INSTALL-OUT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-installoutmain,
  slakeTypecheckInstallOutMainReady,
  kernelCheckLiveInstallOutMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckInstallOutMain
  Checkable writer: just slake-typecheck-installoutmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveInstallOutMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_INSTALL_OUT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-INSTALL-OUT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.InstallOutMain. -/
def justRecipeSlakeTypecheckInstallOutMain : String :=
  "slake-typecheck-installoutmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInstallOutMainRel : String :=
  SystemsLean.HostFrontLiveInstallOutMain.liveInstallOutMainRel

/-- Ready names HostFrontLiveInstallOutMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckInstallOutMainReady,
    kernelCheckLiveInstallOutMainSource. -/
def slakeTypecheckInstallOutMainReady : Bool :=
  SystemsLean.HostFrontLiveInstallOutMain.hostFrontLiveInstallOutMainReady

/-- Honesty: this command is not lake build of InstallOutMain. -/
def slakeTypecheckInstallOutMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckInstallOutMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckInstallOutMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live InstallOutMain.lean.
    Ready is HostFrontLiveInstallOutMain.hostFrontLiveInstallOutMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveInstallOutMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckInstallOutMain} =="
  IO.println s!"  host={hostId} file={liveInstallOutMainRel}"
  unless (!slakeTypecheckInstallOutMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckInstallOutMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveInstallOutMain.main args
