/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckParityLinearTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckParityLinearTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on the ElabMeet fold. Isolation theorems live
  here. Prove this helper or its probe. Do not lake build the
  ElabMeetTheorems hub.

  Spec (readable):
  - native_decide theorems for HostModuleCheckParityLinearTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 49. FullHost stays false. The theorems hub does not
    import this helper.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckParityLinearTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityLinearTerm,
  theorem elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityLinearTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityLinearTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ParityMultTerm closed set plus HostModuleCheckParityLinearTerm.
  Dispatcher-split honesty: ParityLinearTerm imports HostModuleCheckSurface and
  HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckParityLinearTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckParityMultTerm plus HostModuleCheckParityLinearTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityLinearTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
