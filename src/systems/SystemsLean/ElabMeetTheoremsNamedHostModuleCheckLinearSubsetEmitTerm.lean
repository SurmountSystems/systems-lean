/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLinearSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLinearSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLinearSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLinearSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLinearSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLinearSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: FirstSurfaceTerm closed set plus HostModuleCheckLinearSubsetEmitTerm.
  Dispatcher-split honesty: LinearSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckTypesSubsetEmitTerm.
  This Name is HostModuleCheckLinearSubsetEmitTerm, not SystemsLean.Linear.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLinearSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLinearSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLinearSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLinearSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLinearSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFirstSurfaceTerm
    plus HostModuleCheckLinearSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLinearSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLinearSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLinearSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
