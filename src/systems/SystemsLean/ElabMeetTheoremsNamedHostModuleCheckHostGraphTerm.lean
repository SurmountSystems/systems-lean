/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckHostGraphTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckHostGraphTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckHostGraphTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckHostGraphTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostGraphTerm,
  theorem elabMeetDrivesNamedHostModuleCheckHostGraphTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckHostGraphTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckHostGraphTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckHostGraphTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostGraphTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckHostGraphTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: HostCheckTerm closed set plus HostModuleCheckHostGraphTerm.
  Dispatcher-split honesty: HostGraphTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckLlvmLinearTextTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckHostGraphTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckHostGraphTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckHostGraphTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckHostGraphTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckHostGraphTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckHostCheckTerm
    plus HostModuleCheckHostGraphTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckHostGraphTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckHostGraphTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckHostGraphTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckHostGraphTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckHostGraphTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckHostGraphTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckHostGraphTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
