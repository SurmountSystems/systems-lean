/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckTypesSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckTypesSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckTypesSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckTypesSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckTypesSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckTypesSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LinearSubsetEmitTerm closed set plus HostModuleCheckTypesSubsetEmitTerm.
  Dispatcher-split honesty: TypesSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckProgramSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckTypesSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckTypesSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckTypesSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckTypesSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckTypesSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLinearSubsetEmitTerm
    plus HostModuleCheckTypesSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckTypesSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckTypesSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckTypesSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
