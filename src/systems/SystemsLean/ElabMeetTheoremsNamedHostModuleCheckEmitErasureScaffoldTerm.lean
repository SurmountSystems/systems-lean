/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitErasureScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitErasureScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitErasureScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitErasureScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitErasureScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitErasureScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitErasureScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitComposeScaffoldTerm closed set plus HostModuleCheckEmitErasureScaffoldTerm.
  Dispatcher-split honesty: EmitErasureScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitExtractScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitErasureScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitComposeScaffoldTerm plus HostModuleCheckEmitErasureScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitErasureScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
