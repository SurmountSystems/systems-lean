/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckSpecProofTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckSpecProofTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckSpecProofTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckSpecProofTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSpecProofTerm,
  theorem elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSpecProofTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSpecProofTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: SurfaceMatrixTerm closed set plus HostModuleCheckSpecProofTerm.
  Dispatcher-split honesty: SpecProofTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckDualResidualTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckSpecProofTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckSpecProofTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckSurfaceMatrixTerm
    plus HostModuleCheckSpecProofTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckSpecProofTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
