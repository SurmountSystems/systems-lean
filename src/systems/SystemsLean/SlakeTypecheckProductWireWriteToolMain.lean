/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductWireWriteToolMain.
  Short role: named driver for just slake-typecheck-productwirewritetoolmain.
  Ready is HostFrontLiveProductWireWriteToolMainSource parse plus HostKernel.kernelCheck
  of live ProductWireWriteToolMain.lean, not a hardcoded true, not lake build
  SystemsLean.ProductWireWriteToolMain.
  liveRel is ProductWireWriteToolMain.lean.
  This wrap is ProductWireWriteToolMain.lean. It is not ProductWireWriteTool.lean.
  The checker accepts the Main source. The forwarder only calls the neighbor.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-WIRE-WRITE-TOOL-MAIN,
  SLAKE_TYPECHECK_PRODUCT_WIRE_WRITE_TOOL_MAIN_V0,
  slake-typecheck-productwirewritetoolmain,
  slakeTypecheckProductWireWriteToolMainReady,
  kernelCheckLiveProductWireWriteToolMainSource,
  PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL-MAIN.
  Module: SystemsLean.SlakeTypecheckProductWireWriteToolMain
  Checkable writer: just slake-typecheck-productwirewritetoolmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductWireWriteToolMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_WIRE_WRITE_TOOL_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-WIRE-WRITE-TOOL-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProductWireWriteToolMain. -/
def justRecipeSlakeTypecheckProductWireWriteToolMain : String :=
  "slake-typecheck-productwirewritetoolmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveProductWireWriteToolMainRel : String :=
  SystemsLean.HostFrontLiveProductWireWriteToolMainSource.liveRel

/-- Ready names HostFrontLiveProductWireWriteToolMainSource parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductWireWriteToolMainReady,
    kernelCheckLiveProductWireWriteToolMainSource. -/
def slakeTypecheckProductWireWriteToolMainReady : Bool :=
  SystemsLean.HostFrontLiveProductWireWriteToolMainSource.hostFrontLiveProductWireWriteToolMainReady

/-- Honesty: this command is not lake build of ProductWireWriteToolMain. -/
def slakeTypecheckProductWireWriteToolMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductWireWriteToolMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductWireWriteToolMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductWireWriteToolMain.lean.
    Ready is HostFrontLiveProductWireWriteToolMainSource.hostFrontLiveProductWireWriteToolMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductWireWriteToolMainSource.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductWireWriteToolMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductWireWriteToolMainSource.liveRel}"
  IO.println s!"  host={hostId} file={liveProductWireWriteToolMainRel}"
  unless (!slakeTypecheckProductWireWriteToolMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductWireWriteToolMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductWireWriteToolMainSource.main args
