/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathBodyTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathBodyTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathBodyTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathBodyTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathBodyTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathBodyTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathBodyTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathBodyTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathBodyTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathBodyTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathBodyTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathApplyTerm closed set plus HostModuleCheckCompilePathBodyTerm.
  Dispatcher-split honesty: CompilePathBodyTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckFirstSurfaceTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathBodyTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathBodyTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathBodyTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathBodyTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathBodyTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathApplyTerm
    plus HostModuleCheckCompilePathBodyTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathBodyTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathBodyTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathBodyTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathBodyTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathBodyTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathBodyTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathBodyTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
