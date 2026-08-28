/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCheckers named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCheckers named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCheckers-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCheckers,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckers,
  theorem elabMeetDrivesNamedHostModuleCheckCheckersSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCheckersSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckers
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckers;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: thirty-eighth of about 206. Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCheckers closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckCheckersSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCheckersSubset_true :
    elabMeetDrivesNamedHostModuleCheckCheckersSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckSurface plus HostModuleCheckCheckers. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCheckers copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCheckersSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCheckersSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset = true := by
  native_decide

end SystemsLean.ElabMeet
