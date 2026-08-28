/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelTypesTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelTypesTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelTypesTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelTypesTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelTypesTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelTypesTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelTypesTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelLinearTerm closed set plus HostModuleCheckKernelTypesTerm.
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelTypesTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelLinearTerm plus HostModuleCheckKernelTypesTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelTypesTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
