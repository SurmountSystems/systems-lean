/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckSurface named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckSurface named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckSurface-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckSurface,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSurface,
  theorem elabMeetDrivesNamedHostModuleCheckSurfaceSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSurface
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSurface;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckSurface closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckSurfaceSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckSurfaceSubset_true :
    elabMeetDrivesNamedHostModuleCheckSurfaceSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFixtures plus HostModuleCheckSurface. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckSurface copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset = true := by
  native_decide

end SystemsLean.ElabMeet
