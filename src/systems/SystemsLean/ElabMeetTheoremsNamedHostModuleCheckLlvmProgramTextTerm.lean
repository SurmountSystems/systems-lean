/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckLlvmProgramTextTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckLlvmProgramTextTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckLlvmProgramTextTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckLlvmProgramTextTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmProgramTextTerm,
  theorem elabMeetDrivesNamedHostModuleCheckLlvmProgramTextTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmProgramTextTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckLlvmProgramTextTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmProgramTextTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmProgramTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckLlvmProgramTextTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: HostPackageWriteTerm closed set plus HostModuleCheckLlvmProgramTextTerm.
  Dispatcher-split honesty: LlvmProgramTextTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLlvmGraphTextTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckLlvmProgramTextTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckLlvmProgramTextTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckLlvmProgramTextTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckLlvmProgramTextTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckLlvmProgramTextTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckHostPackageWriteTerm
    plus HostModuleCheckLlvmProgramTextTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckLlvmProgramTextTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckLlvmProgramTextTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckLlvmProgramTextTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckLlvmProgramTextTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckLlvmProgramTextTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmProgramTextTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckLlvmProgramTextTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
