/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckComposeSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckComposeSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckComposeSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckComposeSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckComposeSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckComposeSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: GraphSubsetEmitTerm closed set plus HostModuleCheckComposeSubsetEmitTerm.
  Dispatcher-split honesty: ComposeSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckErasureSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckComposeSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckComposeSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckComposeSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckComposeSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckComposeSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckGraphSubsetEmitTerm
    plus HostModuleCheckComposeSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckComposeSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckComposeSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckComposeSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
