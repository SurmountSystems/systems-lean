/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelProgramTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelProgramTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelProgramTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44 or 45.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelProgramTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelProgramTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelProgramTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelProgramTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelProgramTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelProgramTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelProgramTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelProgramTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelTypesTerm closed set plus HostModuleCheckKernelProgramTerm.
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelProgramTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelProgramTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelProgramTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelProgramTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelProgramTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelTypesTerm plus HostModuleCheckKernelProgramTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelProgramTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelProgramTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelProgramTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelProgramTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelProgramTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelProgramTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelProgramTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
