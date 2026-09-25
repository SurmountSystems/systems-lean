/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmLinearTextTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckLlvmLinearTextTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckLlvmLinearTextTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckLlvmLinearTextTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckLlvmLinearTextTerm.
  liveRel is HostModuleCheckLlvmLinearTextTerm.lean.
  This wrap is HostModuleCheckLlvmLinearTextTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMLINEARTEXTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKLLVMLINEARTEXTTERM,
  slake-typecheck-hostmodulecheckllvmlineartextterm,
  slakeTypecheckHostModuleCheckLlvmLinearTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmLinearTextTermSource,
  PARSE-LIVE-HOSTMODULECHECKLLVMLINEARTEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmLinearTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmLinearTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKLLVMLINEARTEXTTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMLINEARTEXTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmLinearTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmlineartextterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckLlvmLinearTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm.liveHostModuleCheckLlvmLinearTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmLinearTextTermReady,
    kernelCheckLiveHostModuleCheckLlvmLinearTextTermSource. -/
def slakeTypecheckHostModuleCheckLlvmLinearTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm.hostFrontLiveHostModuleCheckLlvmLinearTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmLinearTextTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmLinearTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckLlvmLinearTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmLinearTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmLinearTextTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckLlvmLinearTextTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckLlvmLinearTextTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmLinearTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmLinearTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmLinearTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmLinearTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmLinearTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckLlvmLinearTextTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm.main args
