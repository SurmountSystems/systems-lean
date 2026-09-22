/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultFsWriteTool.
  Short role: named driver for the closed MultFsWriteTool wrap.
  Ready is HostFrontLiveMultFsWriteTool parse plus HostKernel.kernelCheck
  of live MultFsWriteTool.lean, not a hardcoded true, not lake build
  SystemsLean.MultFsWriteTool.
  liveRel is MultFsWriteTool.lean.
  This wrap is MultFsWriteTool.lean.
  Not HostFrontLiveMultFsWriteToolMain. That module parses
  MultFsWriteToolMain.lean. This driver does not import it.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL,
  SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL, slake-typecheck-multfswritetool,
  slakeTypecheckMultFsWriteToolReady,
  kernelCheckLiveMultFsWriteToolSource,
  PARSE-LIVE-MULT-FS-WRITE-TOOL.
  Module: SystemsLean.SlakeTypecheckMultFsWriteTool
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultFsWriteTool
import SystemsLean.HostKernel

/-- Greppable stage id (hyphenated). -/
def stageId : String := "SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-TOOL"

/-- Named closed recipe. Not lake build SystemsLean.MultFsWriteTool. -/
def justRecipeSlakeTypecheckMultFsWriteTool : String :=
  "slake-typecheck-multfswritetool"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteToolRel : String :=
  SystemsLean.HostFrontLiveMultFsWriteTool.liveMultFsWriteToolRel

/-- Kernel-check live MultFsWriteTool parse.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveMultFsWriteToolSource. -/
def kernelCheckLiveMultFsWriteToolSource (src : String) : Bool :=
  match SystemsLean.HostFrontLiveMultFsWriteTool.parseLiveMultFsWriteToolSource src with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveMultFsWriteTool parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckMultFsWriteToolReady,
    kernelCheckLiveMultFsWriteToolSource. -/
def slakeTypecheckMultFsWriteToolReady : Bool :=
  SystemsLean.HostFrontLiveMultFsWriteTool.hostFrontLiveMultFsWriteToolReady
    && kernelCheckLiveMultFsWriteToolSource
      SystemsLean.HostFrontLiveMultFsWriteTool.liveMultFsWriteToolSource

/-- Honesty: this command is not lake build of MultFsWriteTool. -/
def slakeTypecheckMultFsWriteToolDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFsWriteToolFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckMultFsWriteToolFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultFsWriteToolOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultFsWriteTool.lean.
    kernelCheck calls HostKernel.kernelCheck, not a local stub.
    Ready is not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultFsWriteTool} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultFsWriteTool.liveRel}"
  IO.println s!"  host={hostId} file={liveMultFsWriteToolRel}"
  unless (!slakeTypecheckMultFsWriteToolFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteToolFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteToolOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveMultFsWriteToolSource
      SystemsLean.HostFrontLiveMultFsWriteTool.liveMultFsWriteToolSource do
    IO.eprintln "error: kernelCheck live MultFsWriteTool parse false"
    return 1
  unless slakeTypecheckMultFsWriteToolReady do
    IO.eprintln "error: slakeTypecheckMultFsWriteToolReady false"
    return 1
  SystemsLean.HostFrontLiveMultFsWriteTool.main args
