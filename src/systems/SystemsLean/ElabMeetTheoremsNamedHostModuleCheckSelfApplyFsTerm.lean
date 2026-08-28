/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckSelfApplyFsTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckSelfApplyFsTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckSelfApplyFsTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckSelfApplyFsTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfApplyFsTerm,
  theorem elabMeetDrivesNamedHostModuleCheckSelfApplyFsTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckSelfApplyFsTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckSelfApplyFsTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfApplyFsTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfApplyFsTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfApplyFsTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LlvmComposeTextTerm closed set plus HostModuleCheckSelfApplyFsTerm.
  Dispatcher-split honesty: SelfApplyFsTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckInventoryCloseTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckSelfApplyFsTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckSelfApplyFsTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckSelfApplyFsTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckSelfApplyFsTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckSelfApplyFsTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLlvmComposeTextTerm
    plus HostModuleCheckSelfApplyFsTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckSelfApplyFsTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckSelfApplyFsTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckSelfApplyFsTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckSelfApplyFsTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckSelfApplyFsTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfApplyFsTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfApplyFsTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
