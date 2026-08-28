/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLlvmTypesTextTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLlvmTypesTextTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLlvmTypesTextTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLlvmTypesTextTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmTypesTextTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLlvmTypesTextTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmTypesTextTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLlvmTypesTextTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmTypesTextTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmTypesTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmTypesTextTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: SubsetPackageJoinTerm closed set plus HostModuleCheckLlvmTypesTextTerm.
  Dispatcher-split honesty: LlvmTypesTextTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckMultFsDeepenTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLlvmTypesTextTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLlvmTypesTextTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLlvmTypesTextTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLlvmTypesTextTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLlvmTypesTextTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckSubsetPackageJoinTerm
    plus HostModuleCheckLlvmTypesTextTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmTypesTextTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLlvmTypesTextTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLlvmTypesTextTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLlvmTypesTextTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLlvmTypesTextTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmTypesTextTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmTypesTextTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
