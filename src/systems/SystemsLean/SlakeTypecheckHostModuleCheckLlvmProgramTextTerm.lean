/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmProgramTextTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckLlvmProgramTextTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckLlvmProgramTextTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckLlvmProgramTextTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckLlvmProgramTextTerm.
  liveRel is HostModuleCheckLlvmProgramTextTerm.lean.
  This wrap is HostModuleCheckLlvmProgramTextTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMPROGRAMTEXTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKLLVMPROGRAMTEXTTERM,
  slake-typecheck-hostmodulecheckllvmprogramtextterm,
  slakeTypecheckHostModuleCheckLlvmProgramTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmProgramTextTermSource,
  PARSE-LIVE-HOSTMODULECHECKLLVMPROGRAMTEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmProgramTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmProgramTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKLLVMPROGRAMTEXTTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMPROGRAMTEXTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmProgramTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmprogramtextterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckLlvmProgramTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm.liveHostModuleCheckLlvmProgramTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmProgramTextTermReady,
    kernelCheckLiveHostModuleCheckLlvmProgramTextTermSource. -/
def slakeTypecheckHostModuleCheckLlvmProgramTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm.hostFrontLiveHostModuleCheckLlvmProgramTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmProgramTextTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmProgramTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckLlvmProgramTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmProgramTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmProgramTextTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckLlvmProgramTextTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckLlvmProgramTextTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmProgramTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmProgramTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmProgramTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmProgramTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmProgramTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckLlvmProgramTextTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm.main args
