/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckProgramSubsetRebuildTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckProgramSubsetRebuildTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckProgramSubsetRebuildTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckProgramSubsetRebuildTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetRebuildTerm,
  theorem elabMeetDrivesNamedHostModuleCheckProgramSubsetRebuildTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckProgramSubsetRebuildTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetRebuildTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProgramSubsetRebuildTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: TypesSubsetRebuildTerm closed set plus HostModuleCheckProgramSubsetRebuildTerm.
  Dispatcher-split honesty: ProgramSubsetRebuildTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckGraphSubsetRebuildTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckProgramSubsetRebuildTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckProgramSubsetRebuildTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckProgramSubsetRebuildTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckProgramSubsetRebuildTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckProgramSubsetRebuildTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckTypesSubsetRebuildTerm
    plus HostModuleCheckProgramSubsetRebuildTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetRebuildTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetRebuildTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckProgramSubsetRebuildTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckProgramSubsetRebuildTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckProgramSubsetRebuildTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetRebuildTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetRebuildTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
