/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckGraphSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckGraphSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckGraphSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckGraphSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckGraphSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckGraphSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckGraphSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ProgramSubsetRebuildTerm closed set plus HostModuleCheckGraphSubsetRebuildTerm.
  Dispatcher-split honesty: GraphSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckComposeSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckGraphSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckGraphSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckGraphSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckGraphSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckGraphSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckProgramSubsetRebuildTerm
    plus HostModuleCheckGraphSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckGraphSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckGraphSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckGraphSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckGraphSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckGraphSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
