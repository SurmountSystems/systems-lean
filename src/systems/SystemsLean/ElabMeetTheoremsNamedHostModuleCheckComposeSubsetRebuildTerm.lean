/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckComposeSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckComposeSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckComposeSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckComposeSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckComposeSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckComposeSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckComposeSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: GraphSubsetRebuildTerm closed set plus HostModuleCheckComposeSubsetRebuildTerm.
  Dispatcher-split honesty: ComposeSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckErasureSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckComposeSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckComposeSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckComposeSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckComposeSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckComposeSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckGraphSubsetRebuildTerm
    plus HostModuleCheckComposeSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckComposeSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckComposeSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckComposeSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckComposeSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckComposeSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
