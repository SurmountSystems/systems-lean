/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHost.
  Short role: named driver for just slake-typecheck-selfhost.
  Ready is HostFrontLiveSelfHost parse plus HostKernel.kernelCheck of live
  SelfHost.lean, not := true, not lake build SystemsLean.SelfHost.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SelfHostTheorems wrap is not a prefix):
  SlakeTypecheckSelfHost
  HOST-SLAKE-TYPECHECK-SELF-HOST
  SLAKE_TYPECHECK_SELF_HOST_V0
  PARSE-LIVE-SELF-HOST
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-HOST,
  SLAKE_TYPECHECK_SELF_HOST_V0, slake-typecheck-selfhost,
  slakeTypecheckSelfHostReady, kernelCheckLiveSelfHostSource,
  PARSE-LIVE-SELF-HOST, SELF-HOST, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfHost
  Checkable writer: just slake-typecheck-selfhost (lean --run; no mill; no lake).
  Dests skipped; recipe not invoked from root justfile.
-/

import SystemsLean.HostFrontLiveSelfHost

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST"

/-- Named just recipe. Not lake build SystemsLean.SelfHost. -/
def justRecipeSlakeTypecheckSelfHost : String :=
  "slake-typecheck-selfhost"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostRel : String :=
  SystemsLean.HostFrontLiveSelfHost.liveSelfHostRel

/-- Ready names HostFrontLiveSelfHost parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSelfHostReady,
    kernelCheckLiveSelfHostSource. -/
def slakeTypecheckSelfHostReady : Bool :=
  SystemsLean.HostFrontLiveSelfHost.hostFrontLiveSelfHostReady

/-- Honesty: this command is not lake build of SelfHost. -/
def slakeTypecheckSelfHostDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHost.lean.
    Ready is HostFrontLiveSelfHost.hostFrontLiveSelfHostReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfHost.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHost} =="
  IO.println s!"  host={hostId} file={liveSelfHostRel}"
  unless (!slakeTypecheckSelfHostFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHost.main args
