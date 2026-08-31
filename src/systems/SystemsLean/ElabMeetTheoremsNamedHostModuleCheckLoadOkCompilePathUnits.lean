/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLoadOkCompilePathUnits named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLoadOkCompilePathUnits named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.
  Do not import this helper from ElabMeetTheorems.lean.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLoadOkCompilePathUnits-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    This extract does not fold. Do not claim a new named-subset count.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLoadOkCompilePathUnits,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLoadOkCompilePathUnits,
  theorem elabMeetDrivesNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLoadOkCompilePathUnits
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLoadOkCompilePathUnits;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: SelfHostBodyTerm closed set plus HostModuleCheckLoadOkCompilePathUnits.
  Dispatcher-split honesty: LoadOkCompilePathUnits first import is
  HostModuleCheckCompilePathMultTerm. CompilePath Linear / Types / Program /
  Graph / Compose / Erasure / Extract / Plan / Apply / Body TERM modules are
  already named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLoadOkLaterTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLoadOkCompilePathUnitsProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLoadOkCompilePathUnits closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLoadOkCompilePathUnitsSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true :
    elabMeetDrivesNamedHostModuleCheckLoadOkCompilePathUnitsSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckSelfHostBodyTerm
    plus HostModuleCheckLoadOkCompilePathUnits. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLoadOkCompilePathUnitsSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLoadOkCompilePathUnits copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLoadOkCompilePathUnitsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLoadOkCompilePathUnitsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLoadOkCompilePathUnitsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
