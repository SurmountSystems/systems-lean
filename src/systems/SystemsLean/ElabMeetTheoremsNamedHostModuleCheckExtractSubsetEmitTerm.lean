/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckExtractSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckExtractSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckExtractSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckExtractSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckExtractSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckExtractSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ErasureSubsetEmitTerm closed set plus HostModuleCheckExtractSubsetEmitTerm.
  Dispatcher-split honesty: ExtractSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckMultSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckExtractSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckExtractSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckExtractSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckExtractSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckExtractSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckErasureSubsetEmitTerm
    plus HostModuleCheckExtractSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckExtractSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckExtractSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckExtractSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
