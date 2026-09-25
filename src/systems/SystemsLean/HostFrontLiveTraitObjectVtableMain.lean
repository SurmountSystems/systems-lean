/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-TRAIT-OBJECT-VTABLE.
  Root for optional lean --run of live TraitObjectVtable.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveTraitObjectVtable.
  Greppable: SystemsLean.HostFrontLiveTraitObjectVtableMain,
  HostFrontLiveTraitObjectVtableMain, HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE,
  SLAKE_HOST_FRONT_LIVE_TRAIT_OBJECT_VTABLE_V0, PARSE-LIVE-TRAIT-OBJECT-VTABLE,
  parseLiveTraitObjectVtableSource, kernelCheckLiveTraitObjectVtableSource,
  liveRel, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveTraitObjectVtableMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveTraitObjectVtable

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveTraitObjectVtable.main args
