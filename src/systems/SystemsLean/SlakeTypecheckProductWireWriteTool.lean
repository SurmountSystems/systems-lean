/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductWireWriteTool.
  Short role: named driver for just slake-typecheck-productwirewritetool.
  Ready is HostFrontLiveProductWireWriteTool parse plus
  HostKernel.kernelCheck of live ProductWireWriteTool.lean, not a
  hardcoded true, not lake build SystemsLean.ProductWireWriteTool.
  liveRel is ProductWireWriteTool.lean.
  This wrap is ProductWireWriteTool.lean. It is not CapableWriteHc.lean.
  It is not InstallOut.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-WIRE-WRITE-TOOL,
  SLAKE_TYPECHECK_PRODUCT_WIRE_WRITE_TOOL,
  slake-typecheck-productwirewritetool,
  slakeTypecheckProductWireWriteToolReady,
  kernelCheckLiveProductWireWriteToolSource,
  PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL.
  Module: SystemsLean.SlakeTypecheckProductWireWriteTool
  Checkable writer: just slake-typecheck-productwirewritetool
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductWireWriteTool

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_WIRE_WRITE_TOOL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-WIRE-WRITE-TOOL"

/-- Named just recipe. Not lake build SystemsLean.ProductWireWriteTool. -/
def justRecipeSlakeTypecheckProductWireWriteTool : String :=
  "slake-typecheck-productwirewritetool"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductWireWriteToolRel : String :=
  SystemsLean.HostFrontLiveProductWireWriteTool.liveProductWireWriteToolRel

/-- Ready names HostFrontLiveProductWireWriteTool parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductWireWriteToolReady,
    kernelCheckLiveProductWireWriteToolSource. -/
def slakeTypecheckProductWireWriteToolReady : Bool :=
  SystemsLean.HostFrontLiveProductWireWriteTool.hostFrontLiveProductWireWriteToolReady

/-- Honesty: this command is not lake build of ProductWireWriteTool. -/
def slakeTypecheckProductWireWriteToolDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductWireWriteToolFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductWireWriteToolFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductWireWriteToolOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductWireWriteTool.lean.
    Ready is HostFrontLiveProductWireWriteTool.hostFrontLiveProductWireWriteToolReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductWireWriteTool.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductWireWriteTool} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductWireWriteTool.liveRel}"
  IO.println s!"  host={hostId} file={liveProductWireWriteToolRel}"
  unless (!slakeTypecheckProductWireWriteToolFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductWireWriteToolFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductWireWriteToolOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductWireWriteTool.main args
