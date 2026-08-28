/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckFrontMultPackageTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckFrontMultPackageTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckFrontMultPackageTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckFrontMultPackageTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFrontMultPackageTerm,
  theorem elabMeetDrivesNamedHostModuleCheckFrontMultPackageTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFrontMultPackageTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFrontMultPackageTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFrontMultPackageTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFrontMultPackageTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFrontMultPackageTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: MultFsWriteToolTerm closed set plus HostModuleCheckFrontMultPackageTerm.
  Dispatcher-split honesty: FrontMultPackageTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckSubsetPackageJoinTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckFrontMultPackageTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckFrontMultPackageTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckFrontMultPackageTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFrontMultPackageTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckFrontMultPackageTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckMultFsWriteToolTerm
    plus HostModuleCheckFrontMultPackageTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFrontMultPackageTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFrontMultPackageTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFrontMultPackageTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFrontMultPackageTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFrontMultPackageTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFrontMultPackageTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFrontMultPackageTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
