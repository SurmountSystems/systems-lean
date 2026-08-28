/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCheckersLater named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCheckersLater named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCheckersLater-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCheckersLater,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckersLater,
  theorem elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckersLater
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckersLater;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: thirty-ninth of about 206. Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCheckersLater closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset_true :
    elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCheckers plus HostModuleCheckCheckersLater. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCheckersLater copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
