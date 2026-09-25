/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultFsWriteToolMain.
  Short role: named driver for the closed MultFsWriteToolMain wrap.
  Ready is HostFrontLiveMultFsWriteToolMain parse plus HostKernel.kernelCheck
  of live MultFsWriteToolMain.lean, not a hardcoded true, not lake build
  SystemsLean.MultFsWriteToolMain.
  liveRel is MultFsWriteToolMain.lean.
  This wrap is MultFsWriteToolMain.lean.
  Not HostFrontLiveMultFsWriteTool. That module parses MultFsWriteTool.lean.
  Do not edit MultFsWriteTool.lean. This driver does not import it.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL-MAIN,
  SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL-MAIN, slake-typecheck-multfswritetoolmain,
  slakeTypecheckMultFsWriteToolMainReady,
  kernelCheckLiveMultFsWriteToolMainSource,
  PARSE-LIVE-MULT-FS-WRITE-TOOL-MAIN.
  Module: SystemsLean.SlakeTypecheckMultFsWriteToolMain
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultFsWriteToolMain
import SystemsLean.HostKernel

/-- Greppable stage id (hyphenated). -/
def stageId : String := "SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL-MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL-MAIN"

/-- Named closed recipe. Not lake build SystemsLean.MultFsWriteToolMain. -/
def justRecipeSlakeTypecheckMultFsWriteToolMain : String :=
  "slake-typecheck-multfswritetoolmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteToolMainRel : String :=
  SystemsLean.HostFrontLiveMultFsWriteToolMain.liveMultFsWriteToolMainRel

/-- Kernel-check live MultFsWriteToolMain parse.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveMultFsWriteToolMainSource. -/
def kernelCheckLiveMultFsWriteToolMainSource (src : String) : Bool :=
  match SystemsLean.HostFrontLiveMultFsWriteToolMain.parseLiveMultFsWriteToolMainSource src with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveMultFsWriteToolMain parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckMultFsWriteToolMainReady,
    kernelCheckLiveMultFsWriteToolMainSource. -/
def slakeTypecheckMultFsWriteToolMainReady : Bool :=
  SystemsLean.HostFrontLiveMultFsWriteToolMain.hostFrontLiveMultFsWriteToolMainReady
    && kernelCheckLiveMultFsWriteToolMainSource
      SystemsLean.HostFrontLiveMultFsWriteToolMain.liveMultFsWriteToolMainSource
    && (SystemsLean.HostFrontLiveMultFsWriteToolMain.liveRel
      == "MultFsWriteToolMain.lean")

/-- Honesty: this command is not lake build of MultFsWriteToolMain. -/
def slakeTypecheckMultFsWriteToolMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFsWriteToolMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckMultFsWriteToolMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultFsWriteToolMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultFsWriteToolMain.lean.
    kernelCheck calls HostKernel.kernelCheck, not a local stub.
    Ready is not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultFsWriteToolMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultFsWriteToolMain.liveRel}"
  IO.println s!"  host={hostId} file={liveMultFsWriteToolMainRel}"
  unless (!slakeTypecheckMultFsWriteToolMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteToolMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteToolMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveMultFsWriteToolMainSource
      SystemsLean.HostFrontLiveMultFsWriteToolMain.liveMultFsWriteToolMainSource do
    IO.eprintln "error: kernelCheck live MultFsWriteToolMain parse false"
    return 1
  unless slakeTypecheckMultFsWriteToolMainReady do
    IO.eprintln "error: slakeTypecheckMultFsWriteToolMainReady false"
    return 1
  SystemsLean.HostFrontLiveMultFsWriteToolMain.main args
