/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitTypesScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitTypesScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitTypesScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitTypesScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitTypesScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitTypesScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitTypesScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitLinearScaffoldTerm closed set plus HostModuleCheckEmitTypesScaffoldTerm.
  Dispatcher-split honesty: EmitTypesScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitProgramScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitTypesScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitLinearScaffoldTerm plus HostModuleCheckEmitTypesScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitTypesScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
