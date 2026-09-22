/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductOutKernel.
  Short role: named driver for just slake-typecheck-productoutkernel.
  Ready is HostFrontLiveProductOutKernel parse plus HostKernel.kernelCheck
  of live ProductOutKernel.lean, not a hardcoded true, not lake build
  SystemsLean.ProductOutKernel.
  liveRel is ProductOutKernel.lean.
  This wrap is ProductOutKernel.lean. It is not ProductOutKernelTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL,
  SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL, slake-typecheck-productoutkernel,
  slakeTypecheckProductOutKernelReady,
  kernelCheckLiveProductOutKernelSource,
  PARSE-LIVE-PRODUCT-OUT-KERNEL.
  Module: SystemsLean.SlakeTypecheckProductOutKernel
  Checkable writer: just slake-typecheck-productoutkernel
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductOutKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL"

/-- Named just recipe. Not lake build SystemsLean.ProductOutKernel. -/
def justRecipeSlakeTypecheckProductOutKernel : String :=
  "slake-typecheck-productoutkernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductOutKernelRel : String :=
  SystemsLean.HostFrontLiveProductOutKernel.liveProductOutKernelRel

/-- Ready names HostFrontLiveProductOutKernel parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductOutKernelReady,
    kernelCheckLiveProductOutKernelSource. -/
def slakeTypecheckProductOutKernelReady : Bool :=
  SystemsLean.HostFrontLiveProductOutKernel.hostFrontLiveProductOutKernelReady

/-- Honesty: this command is not lake build of ProductOutKernel. -/
def slakeTypecheckProductOutKernelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductOutKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductOutKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductOutKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductOutKernel.lean.
    Ready is HostFrontLiveProductOutKernel.hostFrontLiveProductOutKernelReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductOutKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductOutKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductOutKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveProductOutKernelRel}"
  unless (!slakeTypecheckProductOutKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductOutKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductOutKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductOutKernel.main args
