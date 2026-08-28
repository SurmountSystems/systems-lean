/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitProgramScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitProgramScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitProgramScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitProgramScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitProgramScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitProgramScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitProgramScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitProgramScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitProgramScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitProgramScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitProgramScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitTypesScaffoldTerm closed set plus HostModuleCheckEmitProgramScaffoldTerm.
  Dispatcher-split honesty: EmitProgramScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitGraphScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitProgramScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitProgramScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitProgramScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitProgramScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitProgramScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitTypesScaffoldTerm plus HostModuleCheckEmitProgramScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitProgramScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitProgramScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitProgramScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitProgramScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitProgramScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitProgramScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitProgramScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
