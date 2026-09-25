/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageEnvFixturesS5.
  Short role: named driver for the HostModuleCheckPackageEnvFixturesS5
  closed subset.
  Ready is HostFrontLiveHostModuleCheckPackageEnvFixturesS5 parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckPackageEnvFixturesS5.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckPackageEnvFixturesS5.
  liveRel is HostModuleCheckPackageEnvFixturesS5.lean.
  This checker is HostModuleCheckPackageEnvFixturesS5.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  slake-typecheck-hostmodulecheckpackageenvfixturess5,
  slakeTypecheckHostModuleCheckPackageEnvFixturesS5Ready,
  kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvFixturesS5
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageEnvFixturesS5.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5Source
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURESS5"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURESS5"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixturesS5 : String :=
  "slake-typecheck-hostmodulecheckpackageenvfixturess5"

/-- Live file relative to repo root. -/
def liveHostModuleCheckPackageEnvFixturesS5Rel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5.liveHostModuleCheckPackageEnvFixturesS5Rel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageEnvFixturesS5Ready. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS5Ready : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5.hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS5DoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS5FullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS5FullBackend : Bool :=
  false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS5OwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageEnvFixturesS5.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixturesS5} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesS5Rel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesS5FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesS5FullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesS5OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageEnvFixturesS5DoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5.main args
