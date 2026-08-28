/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckSubsetPackageJoinTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckSubsetPackageJoinTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckSubsetPackageJoinTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckSubsetPackageJoinTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSubsetPackageJoinTerm,
  theorem elabMeetDrivesNamedHostModuleCheckSubsetPackageJoinTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckSubsetPackageJoinTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckSubsetPackageJoinTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSubsetPackageJoinTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSubsetPackageJoinTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSubsetPackageJoinTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: FrontMultPackageTerm closed set plus HostModuleCheckSubsetPackageJoinTerm.
  Dispatcher-split honesty: SubsetPackageJoinTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLlvmTypesTextTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckSubsetPackageJoinTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckSubsetPackageJoinTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckSubsetPackageJoinTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckSubsetPackageJoinTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckSubsetPackageJoinTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFrontMultPackageTerm
    plus HostModuleCheckSubsetPackageJoinTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckSubsetPackageJoinTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckSubsetPackageJoinTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckSubsetPackageJoinTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckSubsetPackageJoinTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckSubsetPackageJoinTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSubsetPackageJoinTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckSubsetPackageJoinTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
