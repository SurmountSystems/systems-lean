/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckMultFsDeepenTerm named subset.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckMultFsDeepenTerm named-subset native_decide theorems.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for HostModuleCheckMultFsDeepenTerm-subset
    drive Bools. Four theorems first, before drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206. This extract does
    not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckMultFsDeepenTerm,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultFsDeepenTerm,
  theorem elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultFsDeepenTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckMultFsDeepenTerm;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: LlvmTypesTextTerm closed set plus HostModuleCheckMultFsDeepenTerm.
  Dispatcher-split honesty: MultFsDeepenTerm imports HostModuleCheckSurface
  and HostModuleCheckEmitPlanTerm (EmitPlanTerm is compile-dep only, not named).
  RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
  named members of the closed set, not extra plus-ones.
  Not full-package typecheck. Do not skip to HostModuleCheckHostPackageWriteTerm.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckMultFsDeepenTermProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckMultFsDeepenTerm closed subset.
    Greppable: elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset_true :
    elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckLlvmTypesTextTerm
    plus HostModuleCheckMultFsDeepenTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckMultFsDeepenTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset = true := by
  native_decide

end SystemsLean.ElabMeet
