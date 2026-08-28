/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckTypesSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckTypesSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckTypesSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckTypesSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckTypesSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckTypesSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckTypesSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LinearSubsetRebuildTerm closed set plus HostModuleCheckTypesSubsetRebuildTerm.
  Dispatcher-split honesty: TypesSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckProgramSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckTypesSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckTypesSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckTypesSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckTypesSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckTypesSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLinearSubsetRebuildTerm
    plus HostModuleCheckTypesSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckTypesSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckTypesSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckTypesSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckTypesSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckTypesSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
