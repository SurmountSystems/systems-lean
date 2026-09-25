/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmComposeTextTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckLlvmComposeTextTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckLlvmComposeTextTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckLlvmComposeTextTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckLlvmComposeTextTerm.
  liveRel is HostModuleCheckLlvmComposeTextTerm.lean.
  This wrap is HostModuleCheckLlvmComposeTextTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMCOMPOSETEXTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKLLVMCOMPOSETEXTTERM,
  slake-typecheck-hostmodulecheckllvmcomposetextterm,
  slakeTypecheckHostModuleCheckLlvmComposeTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource,
  PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmComposeTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmComposeTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKLLVMCOMPOSETEXTTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKLLVMCOMPOSETEXTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmComposeTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmcomposetextterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckLlvmComposeTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm.liveHostModuleCheckLlvmComposeTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmComposeTextTermReady,
    kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource. -/
def slakeTypecheckHostModuleCheckLlvmComposeTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm.hostFrontLiveHostModuleCheckLlvmComposeTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmComposeTextTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmComposeTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckLlvmComposeTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmComposeTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmComposeTextTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckLlvmComposeTextTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckLlvmComposeTextTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmComposeTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmComposeTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmComposeTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmComposeTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmComposeTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckLlvmComposeTextTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm.main args
