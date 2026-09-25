/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TraitObjectVtable.
  Short role: named driver for just slake-typecheck-traitobjectvtable.
  Ready is HostFrontLiveTraitObjectVtable parse plus HostKernel.kernelCheck of
  live TraitObjectVtable.lean, not := true, not lake build
  SystemsLean.TraitObjectVtable.
  liveRel is TraitObjectVtable.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TRAIT-OBJECT-VTABLE,
  SLAKE_TYPECHECK_TRAIT_OBJECT_VTABLE_V0, slake-typecheck-traitobjectvtable,
  slakeTypecheckTraitObjectVtableReady, kernelCheckLiveTraitObjectVtableSource,
  PARSE-LIVE-TRAIT-OBJECT-VTABLE, SKELETON.
  Module: SystemsLean.SlakeTypecheckTraitObjectVtable
  Checkable writer: just slake-typecheck-traitobjectvtable (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveTraitObjectVtable

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TRAIT_OBJECT_VTABLE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TRAIT-OBJECT-VTABLE"

/-- Named just recipe. Not lake build SystemsLean.TraitObjectVtable. -/
def justRecipeSlakeTypecheckTraitObjectVtable : String :=
  "slake-typecheck-traitobjectvtable"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTraitObjectVtableRel : String :=
  SystemsLean.HostFrontLiveTraitObjectVtable.liveTraitObjectVtableRel

/-- Ready names HostFrontLiveTraitObjectVtable parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckTraitObjectVtableReady,
    kernelCheckLiveTraitObjectVtableSource. -/
def slakeTypecheckTraitObjectVtableReady : Bool :=
  SystemsLean.HostFrontLiveTraitObjectVtable.hostFrontLiveTraitObjectVtableReady

/-- Honesty: this command is not lake build of TraitObjectVtable. -/
def slakeTypecheckTraitObjectVtableDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTraitObjectVtableFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTraitObjectVtableOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TraitObjectVtable.lean.
    Ready is HostFrontLiveTraitObjectVtable.hostFrontLiveTraitObjectVtableReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveTraitObjectVtable.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTraitObjectVtable} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTraitObjectVtable.liveRel}"
  IO.println s!"  host={hostId} file={liveTraitObjectVtableRel}"
  unless (!slakeTypecheckTraitObjectVtableFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTraitObjectVtableOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTraitObjectVtable.main args
