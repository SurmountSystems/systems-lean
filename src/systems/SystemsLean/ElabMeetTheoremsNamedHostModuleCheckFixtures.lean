/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckFixtures named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckFixtures named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckFixtures-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckFixtures,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtures,
  theorem elabMeetDrivesNamedHostModuleCheckFixturesSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFixturesSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtures
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtures;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckFixtures closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixturesSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixturesSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixturesSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFixtureTextsEmit plus HostModuleCheckFixtures. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFixtures copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFixturesSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixturesSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset = true := by
  native_decide

end SystemsLean.ElabMeet
