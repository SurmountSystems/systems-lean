/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckKernelMultTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckKernelMultTerm named-subset native_decide theorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckKernelMultTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckKernelMultTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelMultTerm,
  theorem elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelMultTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckKernelMultTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: forty-second of about 206. Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckKernelMultTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckEmitBodyTerm plus HostModuleCheckKernelMultTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckKernelMultTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
