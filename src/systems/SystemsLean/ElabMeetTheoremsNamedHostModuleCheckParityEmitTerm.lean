/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckParityEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckParityEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckParityEmitTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckParityEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckParityEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ParityProgramTerm closed set plus HostModuleCheckParityEmitTerm.
  Dispatcher-split honesty: ParityEmitTerm imports HostModuleCheckSurface and
  HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckEmitMultScaffoldTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckParityEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckParityEmitTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckParityEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckParityProgramTerm plus HostModuleCheckParityEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
