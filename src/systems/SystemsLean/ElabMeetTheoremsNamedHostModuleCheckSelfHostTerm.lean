/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckSelfHostTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckSelfHostTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckSelfHostTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckSelfHostTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfHostTerm,
  theorem elabMeetDrivesNamedHostModuleCheckSelfHostTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckSelfHostTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckSelfHostTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfHostTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfHostTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSelfHostTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: JoinMapTerm closed set plus HostModuleCheckSelfHostTerm.
  Dispatcher-split honesty: SelfHostTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  Not full-package typecheck. Do not skip to HostModuleCheckSurfaceMatrixTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckSelfHostTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckSelfHostTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckSelfHostTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckSelfHostTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckSelfHostTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckJoinMapTerm
    plus HostModuleCheckSelfHostTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckSelfHostTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckSelfHostTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckSelfHostTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckSelfHostTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckSelfHostTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfHostTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckSelfHostTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
