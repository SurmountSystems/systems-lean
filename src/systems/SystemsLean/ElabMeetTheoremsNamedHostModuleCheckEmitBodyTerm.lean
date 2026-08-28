/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitBodyTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitBodyTerm named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitBodyTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitBodyTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBodyTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBodyTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBodyTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: forty-first of about 206. Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitBodyTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckRealModule plus HostModuleCheckEmitBodyTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitBodyTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
