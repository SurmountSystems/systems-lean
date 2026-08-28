/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckErasureSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckErasureSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckErasureSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckErasureSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckErasureSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckErasureSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckErasureSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ComposeSubsetRebuildTerm closed set plus HostModuleCheckErasureSubsetRebuildTerm.
  Dispatcher-split honesty: ErasureSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckExtractSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckErasureSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckErasureSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckErasureSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckErasureSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckErasureSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckComposeSubsetRebuildTerm
    plus HostModuleCheckErasureSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckErasureSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckErasureSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckErasureSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckErasureSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckErasureSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
