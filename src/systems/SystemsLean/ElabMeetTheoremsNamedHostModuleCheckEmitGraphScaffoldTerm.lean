/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitGraphScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitGraphScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitGraphScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitGraphScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitGraphScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitGraphScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitGraphScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitGraphScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitGraphScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitGraphScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitGraphScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitProgramScaffoldTerm closed set plus HostModuleCheckEmitGraphScaffoldTerm.
  Dispatcher-split honesty: EmitGraphScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitComposeScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitGraphScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitGraphScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitGraphScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitGraphScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitGraphScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitProgramScaffoldTerm plus HostModuleCheckEmitGraphScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitGraphScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitGraphScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitGraphScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitGraphScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitGraphScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitGraphScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitGraphScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
