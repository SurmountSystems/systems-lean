/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathWriterPathExecTheorems.
  Short role: named driver for
  just slake-typecheck-productpathwriterpathexectheorems.
  Ready is HostFrontLiveProductPathWriterPathExecTheorems parse plus
  HostKernel.kernelCheck of live ProductPathWriterPathExecTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.ProductPathWriterPathExecTheorems.
  liveRel is ProductPathWriterPathExecTheorems.lean.
  This wrap is ProductPathWriterPathExecTheorems.lean.
  It is not ProductPathWriterPathExec.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_EXEC_THEOREMS,
  slake-typecheck-productpathwriterpathexectheorems,
  slakeTypecheckProductPathWriterPathExecTheoremsReady,
  kernelCheckLiveProductPathWriterPathExecTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS.
  Module: SystemsLean.SlakeTypecheckProductPathWriterPathExecTheorems
  Checkable writer: just slake-typecheck-productpathwriterpathexectheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_EXEC_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriterPathExecTheorems. -/
def justRecipeSlakeTypecheckProductPathWriterPathExecTheorems : String :=
  "slake-typecheck-productpathwriterpathexectheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathExecTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.liveProductPathWriterPathExecTheoremsRel

/-- Ready names HostFrontLiveProductPathWriterPathExecTheorems parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckProductPathWriterPathExecTheoremsReady,
    kernelCheckLiveProductPathWriterPathExecTheoremsSource. -/
def slakeTypecheckProductPathWriterPathExecTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.hostFrontLiveProductPathWriterPathExecTheoremsReady

/-- Honesty: this command is not lake build of ProductPathWriterPathExecTheorems. -/
def slakeTypecheckProductPathWriterPathExecTheoremsDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterPathExecTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathWriterPathExecTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterPathExecTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathWriterPathExecTheorems.lean.
    Ready is HostFrontLiveProductPathWriterPathExecTheorems.hostFrontLiveProductPathWriterPathExecTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathWriterPathExecTheorems.main at runtime.
    kernelCheck is HostKernel.kernelCheck. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterPathExecTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathWriterPathExecTheoremsRel}"
  unless (!slakeTypecheckProductPathWriterPathExecTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathExecTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathExecTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.main args
