/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckGraphSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckGraphSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckGraphSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckGraphSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckGraphSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckGraphSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ProgramSubsetEmitTerm closed set plus HostModuleCheckGraphSubsetEmitTerm.
  Dispatcher-split honesty: GraphSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckComposeSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckGraphSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckGraphSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckGraphSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckGraphSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckGraphSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckProgramSubsetEmitTerm
    plus HostModuleCheckGraphSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckGraphSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckGraphSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckGraphSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
