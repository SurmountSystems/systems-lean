/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ProductOutKernelTheorems.
  Short role: named driver for just slake-typecheck-productoutkerneltheorems.
  Ready is HostFrontLiveProductOutKernelTheorems parse plus HostKernel.kernelCheck
  of live ProductOutKernelTheorems.lean, not := true, not lake build
  SystemsLean.ProductOutKernelTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  ProductOutKernel needle is not a prefix hit):
  SlakeTypecheckProductOutKernelTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL_THEOREMS_V0
  slake-typecheck-productoutkerneltheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductOutKernelTheoremsReady,
  kernelCheckLiveProductOutKernelTheoremsSource,
  PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductOutKernelTheorems
  Checkable writer: just slake-typecheck-productoutkerneltheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductOutKernelTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductOutKernelTheorems. -/
def justRecipeSlakeTypecheckProductOutKernelTheorems : String :=
  "slake-typecheck-productoutkerneltheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductOutKernelTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductOutKernelTheorems.liveProductOutKernelTheoremsRel

/-- Ready names HostFrontLiveProductOutKernelTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductOutKernelTheoremsReady,
    kernelCheckLiveProductOutKernelTheoremsSource. -/
def slakeTypecheckProductOutKernelTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductOutKernelTheorems.hostFrontLiveProductOutKernelTheoremsReady

/-- Honesty: this command is not lake build of ProductOutKernelTheorems. -/
def slakeTypecheckProductOutKernelTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductOutKernelTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductOutKernelTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductOutKernelTheorems.lean.
    Ready is HostFrontLiveProductOutKernelTheorems.hostFrontLiveProductOutKernelTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductOutKernelTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductOutKernelTheorems} =="
  IO.println s!"  host={hostId} file={liveProductOutKernelTheoremsRel}"
  unless (!slakeTypecheckProductOutKernelTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductOutKernelTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductOutKernelTheorems.main args
