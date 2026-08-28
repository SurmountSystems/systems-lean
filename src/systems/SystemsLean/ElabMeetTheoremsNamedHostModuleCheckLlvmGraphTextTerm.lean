/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLlvmGraphTextTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLlvmGraphTextTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLlvmGraphTextTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLlvmGraphTextTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmGraphTextTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLlvmGraphTextTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmGraphTextTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLlvmGraphTextTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmGraphTextTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmGraphTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmGraphTextTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LlvmProgramTextTerm closed set plus HostModuleCheckLlvmGraphTextTerm.
  Dispatcher-split honesty: LlvmGraphTextTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLlvmComposeTextTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLlvmGraphTextTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLlvmGraphTextTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLlvmGraphTextTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLlvmGraphTextTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLlvmGraphTextTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLlvmProgramTextTerm
    plus HostModuleCheckLlvmGraphTextTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmGraphTextTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLlvmGraphTextTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLlvmGraphTextTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLlvmGraphTextTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLlvmGraphTextTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmGraphTextTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmGraphTextTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
