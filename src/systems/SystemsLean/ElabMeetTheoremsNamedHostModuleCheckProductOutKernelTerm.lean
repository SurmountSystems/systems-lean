/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckProductOutKernelTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckProductOutKernelTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckProductOutKernelTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckProductOutKernelTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProductOutKernelTerm,
  theorem elabMeetDrivesNamedHostModuleCheckProductOutKernelTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckProductOutKernelTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckProductOutKernelTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProductOutKernelTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProductOutKernelTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckProductOutKernelTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelSelfApplyTerm closed set plus HostModuleCheckProductOutKernelTerm.
  Dispatcher-split honesty: ProductOutKernelTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckProductOutKernelTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckProductOutKernelTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckProductOutKernelTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckProductOutKernelTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckProductOutKernelTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelSelfApplyTerm plus HostModuleCheckProductOutKernelTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckProductOutKernelTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckProductOutKernelTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckProductOutKernelTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckProductOutKernelTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckProductOutKernelTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckProductOutKernelTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckProductOutKernelTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
