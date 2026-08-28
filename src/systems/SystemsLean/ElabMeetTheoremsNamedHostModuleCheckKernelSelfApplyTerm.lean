/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelSelfApplyTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelSelfApplyTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelSelfApplyTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelSelfApplyTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelSelfApplyTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelSelfApplyTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelSelfApplyTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelSelfApplyTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelSelfApplyTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelSelfApplyTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelSelfApplyTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: EmitBannerScaffoldTerm closed set plus HostModuleCheckKernelSelfApplyTerm.
  Dispatcher-split honesty: KernelSelfApplyTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckProductOutKernelTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelSelfApplyTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelSelfApplyTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelSelfApplyTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelSelfApplyTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelSelfApplyTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitBannerScaffoldTerm plus HostModuleCheckKernelSelfApplyTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelSelfApplyTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelSelfApplyTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelSelfApplyTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelSelfApplyTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelSelfApplyTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelSelfApplyTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelSelfApplyTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
