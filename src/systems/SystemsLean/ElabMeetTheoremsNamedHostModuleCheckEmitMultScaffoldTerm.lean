/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckEmitMultScaffoldTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckEmitMultScaffoldTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckEmitMultScaffoldTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckEmitMultScaffoldTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitMultScaffoldTerm,
  theorem elabMeetDrivesNamedHostModuleCheckEmitMultScaffoldTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitMultScaffoldTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckEmitMultScaffoldTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitMultScaffoldTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitMultScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckEmitMultScaffoldTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ParityEmitTerm closed set plus HostModuleCheckEmitMultScaffoldTerm.
  Dispatcher-split honesty: EmitMultScaffoldTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitLinearScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckEmitMultScaffoldTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckEmitMultScaffoldTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckEmitMultScaffoldTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckEmitMultScaffoldTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckEmitMultScaffoldTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckParityEmitTerm plus HostModuleCheckEmitMultScaffoldTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckEmitMultScaffoldTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckEmitMultScaffoldTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckEmitMultScaffoldTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckEmitMultScaffoldTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckEmitMultScaffoldTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitMultScaffoldTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitMultScaffoldTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
