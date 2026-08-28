/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckRealModule named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckRealModule named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckRealModule-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckRealModule,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckRealModule,
  theorem elabMeetDrivesNamedHostModuleCheckRealModuleSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckRealModule
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckRealModule;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: fortieth of about 206. Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckRealModule closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckRealModuleSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckRealModuleSubset_true :
    elabMeetDrivesNamedHostModuleCheckRealModuleSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCheckersLater plus HostModuleCheckRealModule. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckRealModule copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset = true := by
  native_decide

end SystemsLean.ElabMeet
