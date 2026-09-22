/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.BootstrapHonestyTheorems.
  Short role: named driver for just slake-typecheck-bootstraphonestytheorems.
  Ready is HostFrontLiveBootstrapHonestyTheorems parse plus
  HostKernel.kernelCheck of live BootstrapHonestyTheorems.lean, not a
  hardcoded true, not lake build SystemsLean.BootstrapHonestyTheorems.
  liveRel is BootstrapHonestyTheorems.lean.
  This wrap is BootstrapHonestyTheorems.lean. It is not
  BootstrapHonesty.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY-THEOREMS,
  SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_THEOREMS,
  slake-typecheck-bootstraphonestytheorems,
  slakeTypecheckBootstrapHonestyTheoremsReady,
  kernelCheckLiveBootstrapHonestyTheoremsSource,
  PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS.
  Module: SystemsLean.SlakeTypecheckBootstrapHonestyTheorems
  Checkable writer: just slake-typecheck-bootstraphonestytheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveBootstrapHonestyTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.BootstrapHonestyTheorems. -/
def justRecipeSlakeTypecheckBootstrapHonestyTheorems : String :=
  "slake-typecheck-bootstraphonestytheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveBootstrapHonestyTheoremsRel : String :=
  SystemsLean.HostFrontLiveBootstrapHonestyTheorems.liveBootstrapHonestyTheoremsRel

/-- Ready names HostFrontLiveBootstrapHonestyTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckBootstrapHonestyTheoremsReady,
    kernelCheckLiveBootstrapHonestyTheoremsSource. -/
def slakeTypecheckBootstrapHonestyTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveBootstrapHonestyTheorems.hostFrontLiveBootstrapHonestyTheoremsReady

/-- Honesty: this command is not lake build of BootstrapHonestyTheorems. -/
def slakeTypecheckBootstrapHonestyTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckBootstrapHonestyTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckBootstrapHonestyTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckBootstrapHonestyTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live BootstrapHonestyTheorems.lean.
    Ready is HostFrontLiveBootstrapHonestyTheorems.hostFrontLiveBootstrapHonestyTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveBootstrapHonestyTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckBootstrapHonestyTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveBootstrapHonestyTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveBootstrapHonestyTheoremsRel}"
  unless (!slakeTypecheckBootstrapHonestyTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckBootstrapHonestyTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckBootstrapHonestyTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveBootstrapHonestyTheorems.main args
