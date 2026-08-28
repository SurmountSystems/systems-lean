/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelEmitTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelEmitTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelEmitTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44 or 45 or 46.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelEmitTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelEmitTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelEmitTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelProgramTerm closed set plus HostModuleCheckKernelEmitTerm.
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelEmitTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelProgramTerm plus HostModuleCheckKernelEmitTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelEmitTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
