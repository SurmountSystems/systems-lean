/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathComposeTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathComposeTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathComposeTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathComposeTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathComposeTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathComposeTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathComposeTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathComposeTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathComposeTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathComposeTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathComposeTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: CompilePathGraphTerm closed set plus HostModuleCheckCompilePathComposeTerm.
  Dispatcher-split honesty: CompilePathComposeTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathErasureTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathComposeTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathComposeTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathComposeTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathComposeTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathComposeTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckCompilePathGraphTerm
    plus HostModuleCheckCompilePathComposeTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathComposeTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathComposeTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathComposeTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathComposeTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathComposeTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathComposeTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathComposeTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
