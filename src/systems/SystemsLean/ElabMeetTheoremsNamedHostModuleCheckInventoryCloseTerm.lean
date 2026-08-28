/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckInventoryCloseTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckInventoryCloseTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckInventoryCloseTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckInventoryCloseTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckInventoryCloseTerm,
  theorem elabMeetDrivesNamedHostModuleCheckInventoryCloseTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckInventoryCloseTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckInventoryCloseTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckInventoryCloseTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckInventoryCloseTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckInventoryCloseTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: SelfApplyFsTerm closed set plus HostModuleCheckInventoryCloseTerm.
  Dispatcher-split honesty: InventoryCloseTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckProductPathBarsTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckInventoryCloseTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckInventoryCloseTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckInventoryCloseTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckInventoryCloseTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckInventoryCloseTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckSelfApplyFsTerm
    plus HostModuleCheckInventoryCloseTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckInventoryCloseTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckInventoryCloseTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckInventoryCloseTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckInventoryCloseTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckInventoryCloseTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckInventoryCloseTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckInventoryCloseTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
