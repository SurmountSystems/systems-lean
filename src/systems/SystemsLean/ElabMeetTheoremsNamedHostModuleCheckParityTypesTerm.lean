/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckParityTypesTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckParityTypesTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckParityTypesTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckParityTypesTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityTypesTerm,
  theorem elabMeetDrivesNamedHostModuleCheckParityTypesTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityTypesTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityTypesTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityTypesTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityTypesTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityTypesTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ParityLinearTerm closed set plus HostModuleCheckParityTypesTerm.
  Dispatcher-split honesty: ParityTypesTerm imports HostModuleCheckSurface and
  HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckParityProgramTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckParityTypesTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckParityTypesTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckParityTypesTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityTypesTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityTypesTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckParityLinearTerm plus HostModuleCheckParityTypesTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityTypesTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityTypesTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityTypesTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityTypesTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityTypesTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityTypesTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityTypesTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
