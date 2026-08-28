/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckExtractSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckExtractSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckExtractSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckExtractSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckExtractSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckExtractSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckExtractSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ErasureSubsetRebuildTerm closed set plus HostModuleCheckExtractSubsetRebuildTerm.
  Dispatcher-split honesty: ExtractSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckHostFrontTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckExtractSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckExtractSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckExtractSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckExtractSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckExtractSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckErasureSubsetRebuildTerm
    plus HostModuleCheckExtractSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckExtractSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckExtractSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckExtractSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckExtractSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckExtractSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
