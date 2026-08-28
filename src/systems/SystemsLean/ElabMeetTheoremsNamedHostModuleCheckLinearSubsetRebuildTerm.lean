/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLinearSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLinearSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLinearSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLinearSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLinearSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLinearSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLinearSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: MultSubsetRebuildTerm closed set plus HostModuleCheckLinearSubsetRebuildTerm.
  Dispatcher-split honesty: LinearSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckTypesSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLinearSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLinearSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLinearSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLinearSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLinearSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckMultSubsetRebuildTerm
    plus HostModuleCheckLinearSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLinearSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLinearSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLinearSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLinearSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLinearSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
