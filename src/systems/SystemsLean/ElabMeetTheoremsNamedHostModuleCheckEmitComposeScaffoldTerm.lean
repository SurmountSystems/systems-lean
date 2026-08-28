/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitComposeScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitComposeScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitComposeScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitComposeScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitComposeScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitComposeScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitComposeScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitComposeScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitComposeScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitComposeScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitComposeScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitGraphScaffoldTerm closed set plus HostModuleCheckEmitComposeScaffoldTerm.
  Dispatcher-split honesty: EmitComposeScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitErasureScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitComposeScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitComposeScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitComposeScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitComposeScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitComposeScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitGraphScaffoldTerm plus HostModuleCheckEmitComposeScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitComposeScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitComposeScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitComposeScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitComposeScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitComposeScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitComposeScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitComposeScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
