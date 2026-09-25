/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckTheorems.
  Short role: named driver for just slake-typecheck-hostmodulechecktheorems.
  Ready is HostFrontLiveHostModuleCheckTheorems parse plus HostKernel.kernelCheck
  of live HostModuleCheckTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckTheorems.
  liveRel is HostModuleCheckTheorems.lean.
  Stage id is HOST-MODULE-CHECK-THEOREMS.
  Not HostModuleCheck.lean. Not a claim-bool flip. FullHost stays false.
  FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk. Lake is not gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK-THEOREMS,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-THEOREMS,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_THEOREMS,
  slake-typecheck-hostmodulechecktheorems,
  slakeTypecheckHostModuleCheckTheoremsReady,
  kernelCheckLiveHostModuleCheckTheoremsSource,
  PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTheorems
  Checkable writer: just slake-typecheck-hostmodulechecktheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTheorems

/-- Greppable stage id for this driver. The wrap stage id is
    HOST-MODULE-CHECK-THEOREMS on the parser. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckTheorems. -/
def justRecipeSlakeTypecheckHostModuleCheckTheorems : String :=
  "slake-typecheck-hostmodulechecktheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTheorems.liveHostModuleCheckTheoremsRel

/-- Ready names HostFrontLiveHostModuleCheckTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTheoremsReady,
    kernelCheckLiveHostModuleCheckTheoremsSource. -/
def slakeTypecheckHostModuleCheckTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTheorems.hostFrontLiveHostModuleCheckTheoremsReady

/-- Honesty: this command is not lake build of HostModuleCheckTheorems. -/
def slakeTypecheckHostModuleCheckTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckTheorems.lean.
    Ready is HostFrontLiveHostModuleCheckTheorems.hostFrontLiveHostModuleCheckTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTheorems} =="
  IO.println s!"stageId={SystemsLean.HostFrontLiveHostModuleCheckTheorems.stageId}"
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTheoremsRel}"
  unless (!slakeTypecheckHostModuleCheckTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTheorems.main args
