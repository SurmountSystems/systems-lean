/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLlvmLinearTextTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLlvmLinearTextTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLlvmLinearTextTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLlvmLinearTextTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmLinearTextTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLlvmLinearTextTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmLinearTextTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLlvmLinearTextTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmLinearTextTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmLinearTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmLinearTextTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: HostGraphTerm closed set plus HostModuleCheckLlvmLinearTextTerm.
  Dispatcher-split honesty: LlvmLinearTextTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckMultFsWriteToolTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLlvmLinearTextTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLlvmLinearTextTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLlvmLinearTextTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLlvmLinearTextTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLlvmLinearTextTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckHostGraphTerm
    plus HostModuleCheckLlvmLinearTextTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmLinearTextTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLlvmLinearTextTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLlvmLinearTextTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLlvmLinearTextTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLlvmLinearTextTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmLinearTextTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmLinearTextTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
