/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathProgramTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathProgramTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathProgramTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathProgramTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathProgramTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathProgramTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathProgramTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathProgramTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathProgramTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathProgramTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathProgramTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathTypesTerm closed set plus HostModuleCheckCompilePathProgramTerm.
  Dispatcher-split honesty: CompilePathProgramTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathGraphTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathProgramTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathProgramTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathProgramTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathProgramTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathProgramTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathTypesTerm
    plus HostModuleCheckCompilePathProgramTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathProgramTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathProgramTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathProgramTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathProgramTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathProgramTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathProgramTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathProgramTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
