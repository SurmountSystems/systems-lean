/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathApplyTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathApplyTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathApplyTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathApplyTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathApplyTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathApplyTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathApplyTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathApplyTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathApplyTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathApplyTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathApplyTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathPlanTerm closed set plus HostModuleCheckCompilePathApplyTerm.
  Dispatcher-split honesty: CompilePathApplyTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathBodyTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathApplyTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathApplyTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathApplyTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathApplyTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathApplyTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathPlanTerm
    plus HostModuleCheckCompilePathApplyTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathApplyTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathApplyTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathApplyTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathApplyTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathApplyTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathApplyTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathApplyTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
