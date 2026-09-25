/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.LinearTheorems.
  Short role: named driver for just slake-typecheck-lineartheorems.
  Ready is HostFrontLiveLinearTheorems parse plus HostKernel.kernelCheck
  of live LinearTheorems.lean, not := true, not lake build
  SystemsLean.LinearTheorems.
  This wrap parses LinearTheorems.lean only. Not the Linear.lean library.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  Linear needle is not a prefix hit):
  SlakeTypecheckLinearTheorems
  HOST-SLAKE-TYPECHECK-LINEAR-THEOREMS
  SLAKE_TYPECHECK_LINEAR_THEOREMS_V0
  slake-typecheck-lineartheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckLinearTheoremsReady,
  kernelCheckLiveLinearTheoremsSource,
  liveRel, PARSE-LIVE-LINEAR-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearTheorems
  Checkable writer: just slake-typecheck-lineartheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.LinearTheorems. -/
def justRecipeSlakeTypecheckLinearTheorems : String :=
  "slake-typecheck-lineartheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearTheoremsRel : String :=
  SystemsLean.HostFrontLiveLinearTheorems.liveLinearTheoremsRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveLinearTheorems.liveRel

/-- Ready names HostFrontLiveLinearTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearTheoremsReady,
    kernelCheckLiveLinearTheoremsSource. -/
def slakeTypecheckLinearTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveLinearTheorems.hostFrontLiveLinearTheoremsReady

/-- Honesty: this command is not lake build of LinearTheorems. -/
def slakeTypecheckLinearTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearTheorems.lean.
    Ready is HostFrontLiveLinearTheorems.hostFrontLiveLinearTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearTheorems} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLinearTheoremsRel}"
  unless (liveRel == "LinearTheorems.lean") do
    IO.eprintln "error: liveRel must be LinearTheorems.lean"
    return 1
  unless (!slakeTypecheckLinearTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearTheorems.main args
