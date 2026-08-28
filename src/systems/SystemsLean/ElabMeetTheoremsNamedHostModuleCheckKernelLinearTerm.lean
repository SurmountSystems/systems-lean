/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelLinearTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelLinearTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelLinearTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelLinearTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelLinearTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelLinearTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelLinearTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelMultTerm closed set plus HostModuleCheckKernelLinearTerm.
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelLinearTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelMultTerm plus HostModuleCheckKernelLinearTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelLinearTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
