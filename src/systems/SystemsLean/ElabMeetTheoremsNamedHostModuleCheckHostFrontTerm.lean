/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckHostFrontTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckHostFrontTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckHostFrontTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckHostFrontTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostFrontTerm,
  theorem elabMeetDrivesNamedHostModuleCheckHostFrontTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckHostFrontTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckHostFrontTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckHostFrontTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostFrontTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostFrontTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: ExtractSubsetRebuildTerm closed set plus HostModuleCheckHostFrontTerm.
  Dispatcher-split honesty: HostFrontTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLlvmMultTextTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckHostFrontTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckHostFrontTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckHostFrontTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckHostFrontTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckHostFrontTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckExtractSubsetRebuildTerm
    plus HostModuleCheckHostFrontTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckHostFrontTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckHostFrontTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckHostFrontTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckHostFrontTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckHostFrontTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckHostFrontTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckHostFrontTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
