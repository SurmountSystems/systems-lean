/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLlvmComposeTextTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLlvmComposeTextTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLlvmComposeTextTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLlvmComposeTextTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmComposeTextTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLlvmComposeTextTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmComposeTextTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLlvmComposeTextTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmComposeTextTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmComposeTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmComposeTextTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LlvmGraphTextTerm closed set plus HostModuleCheckLlvmComposeTextTerm.
  Dispatcher-split honesty: LlvmComposeTextTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckSelfApplyFsTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLlvmComposeTextTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLlvmComposeTextTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLlvmComposeTextTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLlvmComposeTextTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLlvmComposeTextTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLlvmGraphTextTerm
    plus HostModuleCheckLlvmComposeTextTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmComposeTextTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLlvmComposeTextTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLlvmComposeTextTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLlvmComposeTextTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLlvmComposeTextTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmComposeTextTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmComposeTextTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
