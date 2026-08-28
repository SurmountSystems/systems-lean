/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitLinearScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitLinearScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitLinearScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitLinearScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitLinearScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitLinearScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitLinearScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitLinearScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitLinearScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitLinearScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitLinearScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitMultScaffoldTerm closed set plus HostModuleCheckEmitLinearScaffoldTerm.
  Dispatcher-split honesty: EmitLinearScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitTypesScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitLinearScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitLinearScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitLinearScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitLinearScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitLinearScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitMultScaffoldTerm plus HostModuleCheckEmitLinearScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitLinearScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitLinearScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitLinearScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitLinearScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitLinearScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitLinearScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitLinearScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
