/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitExtractScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitExtractScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitExtractScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitExtractScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitExtractScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitExtractScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitExtractScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitExtractScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitExtractScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitExtractScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitExtractScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitErasureScaffoldTerm closed set plus HostModuleCheckEmitExtractScaffoldTerm.
  Dispatcher-split honesty: EmitExtractScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitBannerScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitExtractScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitExtractScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitExtractScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitExtractScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitExtractScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitErasureScaffoldTerm plus HostModuleCheckEmitExtractScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitExtractScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitExtractScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitExtractScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitExtractScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitExtractScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitExtractScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitExtractScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
