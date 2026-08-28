/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckParityMultTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckParityMultTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on the ElabMeet fold. Isolation theorems live
  here. Prove this helper or its probe. Do not lake build the
  ElabMeetTheorems hub.

  Spec (readable):
  - native_decide theorems for HostModuleCheckParityMultTerm-subset drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 49. FullHost stays false. The theorems hub does not
    import this helper.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckParityMultTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityMultTerm,
  theorem elabMeetDrivesNamedHostModuleCheckParityMultTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityMultTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityMultTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityMultTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityMultTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckParityMultTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: KernelEmitTerm closed set plus HostModuleCheckParityMultTerm.
  Dispatcher-split honesty: ParityMultTerm imports HostModuleCheckSurface and
  HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckParityMultTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckParityMultTerm closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckParityMultTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityMultTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityMultTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckKernelEmitTerm plus HostModuleCheckParityMultTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityMultTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityMultTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityMultTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityMultTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityMultTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityMultTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityMultTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
