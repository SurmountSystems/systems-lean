/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathTypesTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathTypesTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathTypesTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathTypesTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathTypesTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathTypesTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathTypesTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathTypesTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathTypesTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathTypesTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathTypesTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathLinearTerm closed set plus HostModuleCheckCompilePathTypesTerm.
  Dispatcher-split honesty: CompilePathTypesTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathProgramTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathTypesTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathTypesTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathTypesTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathTypesTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathTypesTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathLinearTerm
    plus HostModuleCheckCompilePathTypesTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathTypesTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathTypesTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathTypesTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathTypesTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathTypesTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathTypesTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathTypesTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
