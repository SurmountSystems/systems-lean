/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckFirstSurfaceTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckFirstSurfaceTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckFirstSurfaceTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckFirstSurfaceTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFirstSurfaceTerm,
  theorem elabMeetDrivesNamedHostModuleCheckFirstSurfaceTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFirstSurfaceTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFirstSurfaceTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFirstSurfaceTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFirstSurfaceTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFirstSurfaceTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathBodyTerm closed set plus HostModuleCheckFirstSurfaceTerm.
  Dispatcher-split honesty: FirstSurfaceTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLinearSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckFirstSurfaceTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckFirstSurfaceTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckFirstSurfaceTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFirstSurfaceTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckFirstSurfaceTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathBodyTerm
    plus HostModuleCheckFirstSurfaceTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFirstSurfaceTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFirstSurfaceTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFirstSurfaceTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFirstSurfaceTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFirstSurfaceTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFirstSurfaceTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFirstSurfaceTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
