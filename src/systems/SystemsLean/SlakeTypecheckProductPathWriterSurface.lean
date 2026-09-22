/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathWriterSurface.
  Short role: named driver for just slake-typecheck-productpathwritersurface.
  Ready is HostFrontLiveProductPathWriterSurface parse plus HostKernel.kernelCheck
  of live ProductPathWriterSurface.lean, not a hardcoded true, not lake build
  SystemsLean.ProductPathWriterSurface.
  liveRel is ProductPathWriterSurface.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-SURFACE,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_SURFACE_V0,
  slake-typecheck-productpathwritersurface,
  slakeTypecheckProductPathWriterSurfaceReady,
  kernelCheckLiveProductPathWriterSurfaceSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE.
  Module: SystemsLean.SlakeTypecheckProductPathWriterSurface
  Checkable writer: just slake-typecheck-productpathwritersurface
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriterSurface

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-SURFACE"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriterSurface. -/
def justRecipeSlakeTypecheckProductPathWriterSurface : String :=
  "slake-typecheck-productpathwritersurface"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterSurfaceRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterSurface.liveProductPathWriterSurfaceRel

/-- Ready names HostFrontLiveProductPathWriterSurface parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductPathWriterSurfaceReady,
    kernelCheckLiveProductPathWriterSurfaceSource. -/
def slakeTypecheckProductPathWriterSurfaceReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterSurface.hostFrontLiveProductPathWriterSurfaceReady

/-- Honesty: this command is not lake build of ProductPathWriterSurface. -/
def slakeTypecheckProductPathWriterSurfaceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterSurfaceFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterSurfaceOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriterSurface.lean.
    Ready is HostFrontLiveProductPathWriterSurface.hostFrontLiveProductPathWriterSurfaceReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathWriterSurface.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterSurface} =="
  IO.println s!"  host={hostId} file={liveProductPathWriterSurfaceRel}"
  unless (!slakeTypecheckProductPathWriterSurfaceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterSurfaceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterSurface.main args
