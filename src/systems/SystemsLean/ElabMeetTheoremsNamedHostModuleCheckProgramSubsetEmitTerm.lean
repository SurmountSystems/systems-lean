/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckProgramSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckProgramSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckProgramSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckProgramSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: TypesSubsetEmitTerm closed set plus HostModuleCheckProgramSubsetEmitTerm.
  Dispatcher-split honesty: ProgramSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckGraphSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckProgramSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckTypesSubsetEmitTerm
    plus HostModuleCheckProgramSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckProgramSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
