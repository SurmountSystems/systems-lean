/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesTheorems.
  Short role: named driver for just slake-typecheck-typestheorems.
  Ready is HostFrontLiveTypesTheorems parse plus HostKernel.kernelCheck of live
  TypesTheorems.lean, not := true, not lake build SystemsLean.TypesTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TYPES-THEOREMS,
  SLAKE_TYPECHECK_TYPES_THEOREMS_V0, slake-typecheck-typestheorems,
  slakeTypecheckTypesTheoremsReady, kernelCheckLiveTypesTheoremsSource,
  PARSE-LIVE-TYPESTHEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckTypesTheorems
  Checkable writer: just slake-typecheck-typestheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveTypesTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPES_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.TypesTheorems. -/
def justRecipeSlakeTypecheckTypesTheorems : String :=
  "slake-typecheck-typestheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesTheoremsRel : String :=
  SystemsLean.HostFrontLiveTypesTheorems.liveTypesTheoremsRel

/-- Ready names HostFrontLiveTypesTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckTypesTheoremsReady,
    kernelCheckLiveTypesTheoremsSource. -/
def slakeTypecheckTypesTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveTypesTheorems.hostFrontLiveTypesTheoremsReady

/-- Honesty: this command is not lake build of TypesTheorems. -/
def slakeTypecheckTypesTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesTheorems.lean.
    Ready is HostFrontLiveTypesTheorems.hostFrontLiveTypesTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveTypesTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTypesTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveTypesTheoremsRel}"
  unless (!slakeTypecheckTypesTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypesTheorems.main args
