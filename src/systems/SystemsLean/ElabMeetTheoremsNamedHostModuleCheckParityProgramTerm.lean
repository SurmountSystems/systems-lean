/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckParityProgramTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckParityProgramTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckParityProgramTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult
    fold. This extract does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckParityProgramTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityProgramTerm,
  theorem elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityProgramTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityProgramTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ParityTypesTerm closed set plus HostModuleCheckParityProgramTerm.
  Dispatcher-split honesty: ParityProgramTerm imports HostModuleCheckSurface and
  HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckParityEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckParityProgramTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckParityProgramTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckParityTypesTerm plus HostModuleCheckParityProgramTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityProgramTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
