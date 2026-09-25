/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TraitObjectVtable.lean bytes.
  Join of HostFrontLiveTraitObjectVtableSource01 onward.
  liveRel is TraitObjectVtable.lean on the parser, not a path.
  Greppable: liveTraitObjectVtableSource, PARSE-LIVE-TRAIT-OBJECT-VTABLE,
  HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE.
  Module: SystemsLean.HostFrontLiveTraitObjectVtableSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveTraitObjectVtableSource01
import SystemsLean.HostFrontLiveTraitObjectVtableSource02
import SystemsLean.HostFrontLiveTraitObjectVtableSource03
import SystemsLean.HostFrontLiveTraitObjectVtableSource04
import SystemsLean.HostFrontLiveTraitObjectVtableSource05
import SystemsLean.HostFrontLiveTraitObjectVtableSource06
import SystemsLean.HostFrontLiveTraitObjectVtableSource07
import SystemsLean.HostFrontLiveTraitObjectVtableSource08

namespace SystemsLean.HostFrontLiveTraitObjectVtable

/-- Dual-pinned live TraitObjectVtable.lean bytes (must match on-disk file).
    Greppable: liveTraitObjectVtableSource, PARSE-LIVE-TRAIT-OBJECT-VTABLE. -/
def liveTraitObjectVtableSource : String :=
  liveTraitObjectVtableSourcePart01
    ++ liveTraitObjectVtableSourcePart02
    ++ liveTraitObjectVtableSourcePart03
    ++ liveTraitObjectVtableSourcePart04
    ++ liveTraitObjectVtableSourcePart05
    ++ liveTraitObjectVtableSourcePart06
    ++ liveTraitObjectVtableSourcePart07
    ++ liveTraitObjectVtableSourcePart08

end SystemsLean.HostFrontLiveTraitObjectVtable
