/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathExtractTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathExtractTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathExtractTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathExtractTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathExtractTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathExtractTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHEXTRACTTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathextractterm,
  slakeTypecheckHostModuleCheckCompilePathExtractTermReady,
  kernelCheckLiveHostModuleCheckCompilePathExtractTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathExtractTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHEXTRACTTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathExtractTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathExtractTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathextractterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathExtractTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm.liveHostModuleCheckCompilePathExtractTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathExtractTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathExtractTermReady,
    kernelCheckLiveHostModuleCheckCompilePathExtractTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathExtractTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm.hostFrontLiveHostModuleCheckCompilePathExtractTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathExtractTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathExtractTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathExtractTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathExtractTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathExtractTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathExtractTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathExtractTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathExtractTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathExtractTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathExtractTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathExtractTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm.main args
