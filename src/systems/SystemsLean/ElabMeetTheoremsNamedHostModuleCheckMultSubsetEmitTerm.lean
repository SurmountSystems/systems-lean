/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckMultSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckMultSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckMultSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckMultSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckMultSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckMultSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckMultSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckMultSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ExtractSubsetEmitTerm closed set plus HostModuleCheckMultSubsetEmitTerm.
  Dispatcher-split honesty: MultSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckMultSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckMultSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckMultSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckMultSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckMultSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckMultSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckExtractSubsetEmitTerm
    plus HostModuleCheckMultSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckMultSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckMultSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckMultSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckMultSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckMultSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckMultSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckMultSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
