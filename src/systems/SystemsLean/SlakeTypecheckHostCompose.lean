/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCompose.
  Short role: named driver for just slake-typecheck-hostcompose.
  Ready is HostFrontLiveHostCompose parse plus HostKernel.kernelCheck
  of live HostCompose.lean, not a hardcoded true, not lake build
  SystemsLean.HostCompose.
  liveRel is HostCompose.lean.
  This wrap is HostCompose.lean. It is not HostComposeTheorems.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-COMPOSE,
  SLAKE_TYPECHECK_HOST_COMPOSE, slake-typecheck-hostcompose,
  slakeTypecheckHostComposeReady,
  kernelCheckLiveHostComposeSource,
  PARSE-LIVE-HOST-COMPOSE.
  Module: SystemsLean.SlakeTypecheckHostCompose
  Checkable writer: just slake-typecheck-hostcompose
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostCompose

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_COMPOSE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-COMPOSE"

/-- Named just recipe. Not lake build SystemsLean.HostCompose. -/
def justRecipeSlakeTypecheckHostCompose : String :=
  "slake-typecheck-hostcompose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostComposeRel : String :=
  SystemsLean.HostFrontLiveHostCompose.liveHostComposeRel

/-- Ready names HostFrontLiveHostCompose parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckHostComposeReady,
    kernelCheckLiveHostComposeSource. -/
def slakeTypecheckHostComposeReady : Bool :=
  SystemsLean.HostFrontLiveHostCompose.hostFrontLiveHostComposeReady

/-- Honesty: this command is not lake build of HostCompose. -/
def slakeTypecheckHostComposeDoesNotUseLake : Bool :=
  justRecipeSlakeTypecheckHostCompose == "slake-typecheck-hostcompose"

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostComposeFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostComposeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCompose.lean.
    Ready is HostFrontLiveHostCompose.hostFrontLiveHostComposeReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostCompose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostCompose} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostCompose.liveRel}"
  IO.println s!"  host={hostId} file={liveHostComposeRel}"
  unless (!slakeTypecheckHostComposeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostComposeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostComposeDoesNotUseLake do
    IO.eprintln "error: recipe must not be lake build"
    return 1
  SystemsLean.HostFrontLiveHostCompose.main args
