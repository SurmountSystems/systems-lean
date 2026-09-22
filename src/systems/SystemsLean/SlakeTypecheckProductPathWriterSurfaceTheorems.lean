/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathWriterSurfaceTheorems.
  Short role: named driver for
  just slake-typecheck-productpathwritersurfacetheorems.
  Ready is HostFrontLiveProductPathWriterSurfaceTheorems parse plus
  HostKernel.kernelCheck of live ProductPathWriterSurfaceTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.ProductPathWriterSurfaceTheorems.
  liveRel is ProductPathWriterSurfaceTheorems.lean.
  This wrap is ProductPathWriterSurfaceTheorems.lean.
  It is not ProductPathWriterSurface.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-SURFACE-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_SURFACE_THEOREMS,
  slake-typecheck-productpathwritersurfacetheorems,
  slakeTypecheckProductPathWriterSurfaceTheoremsReady,
  kernelCheckLiveProductPathWriterSurfaceTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckProductPathWriterSurfaceTheorems
  Checkable writer: just slake-typecheck-productpathwritersurfacetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_SURFACE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-SURFACE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriterSurfaceTheorems. -/
def justRecipeSlakeTypecheckProductPathWriterSurfaceTheorems : String :=
  "slake-typecheck-productpathwritersurfacetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterSurfaceTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.liveProductPathWriterSurfaceTheoremsRel

/-- Ready names HostFrontLiveProductPathWriterSurfaceTheorems parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckProductPathWriterSurfaceTheoremsReady,
    kernelCheckLiveProductPathWriterSurfaceTheoremsSource. -/
def slakeTypecheckProductPathWriterSurfaceTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.hostFrontLiveProductPathWriterSurfaceTheoremsReady

/-- Honesty: this command is not lake build of ProductPathWriterSurfaceTheorems. -/
def slakeTypecheckProductPathWriterSurfaceTheoremsDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterSurfaceTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathWriterSurfaceTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterSurfaceTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathWriterSurfaceTheorems.lean.
    Ready is HostFrontLiveProductPathWriterSurfaceTheorems.hostFrontLiveProductPathWriterSurfaceTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathWriterSurfaceTheorems.main at runtime.
    kernelCheck is HostKernel.kernelCheck. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterSurfaceTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathWriterSurfaceTheoremsRel}"
  unless (!slakeTypecheckProductPathWriterSurfaceTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterSurfaceTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterSurfaceTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.main args
