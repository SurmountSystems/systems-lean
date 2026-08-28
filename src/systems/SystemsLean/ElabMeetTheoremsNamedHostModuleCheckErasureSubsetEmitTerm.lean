/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckErasureSubsetEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckErasureSubsetEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckErasureSubsetEmitTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckErasureSubsetEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckErasureSubsetEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckErasureSubsetEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ComposeSubsetEmitTerm closed set plus HostModuleCheckErasureSubsetEmitTerm.
  Dispatcher-split honesty: ErasureSubsetEmitTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckExtractSubsetEmitTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckErasureSubsetEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckErasureSubsetEmitTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckErasureSubsetEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckErasureSubsetEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckErasureSubsetEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckComposeSubsetEmitTerm
    plus HostModuleCheckErasureSubsetEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckErasureSubsetEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckErasureSubsetEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckErasureSubsetEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
