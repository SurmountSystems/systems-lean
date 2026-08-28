/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitBannerScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitBannerScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitBannerScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitBannerScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBannerScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitBannerScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitBannerScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitBannerScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBannerScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBannerScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitBannerScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitExtractScaffoldTerm closed set plus HostModuleCheckEmitBannerScaffoldTerm.
  Dispatcher-split honesty: EmitBannerScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckKernelSelfApplyTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitBannerScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitBannerScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitBannerScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitBannerScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitBannerScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitExtractScaffoldTerm plus HostModuleCheckEmitBannerScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitBannerScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitBannerScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitBannerScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitBannerScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitBannerScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBannerScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBannerScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
