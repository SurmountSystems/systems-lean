/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckCompilePathMultTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckCompilePathMultTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckCompilePathMultTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckCompilePathMultTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathMultTerm,
  theorem elabMeetDrivesNamedHostModuleCheckCompilePathMultTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathMultTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathMultTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathMultTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathMultTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCompilePathMultTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: DualResidualTerm closed set plus HostModuleCheckCompilePathMultTerm.
  Dispatcher-split honesty: CompilePathMultTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckCompilePathLinearTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckCompilePathMultTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckCompilePathMultTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckCompilePathMultTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckCompilePathMultTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckCompilePathMultTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckDualResidualTerm
    plus HostModuleCheckCompilePathMultTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckCompilePathMultTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckCompilePathMultTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckCompilePathMultTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckCompilePathMultTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckCompilePathMultTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathMultTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckCompilePathMultTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
