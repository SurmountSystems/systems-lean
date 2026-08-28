/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for
  HostModuleCheckFixtureTexts, HostModuleCheckFixtureTextsProduct,
  HostModuleCheckFixtureTextsSelfHost, and HostModuleCheckFixtureTextsEmit.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  HostModuleCheckFixtureTextsLater drive theorems stay in ElabMeetTheorems.

  Spec (readable):
  - native_decide theorems for HostModuleCheckFixtureTexts-subset,
    HostModuleCheckFixtureTextsProduct-subset,
    HostModuleCheckFixtureTextsSelfHost-subset, and
    HostModuleCheckFixtureTextsEmit-subset drive Bools.
    FixtureTexts, Product, and SelfHost statements and proofs are
    unchanged from the former ElabMeetTheorems block.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheoremsNamedHostModuleCheckFixtureTexts,
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtureTexts,
  theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset_true,
  theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset_true,
  theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset_true,
  theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtureTexts
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtureTexts;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the HostModuleCheckFixtureTexts closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckRequiredDeclsLater plus HostModuleCheckFixtureTexts. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFixtureTexts copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset = true := by
  native_decide

/-- Drive fold for the HostModuleCheckFixtureTextsProduct closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFixtureTexts plus HostModuleCheckFixtureTextsProduct. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFixtureTextsProduct copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset = true := by
  native_decide

/-- Drive fold for the HostModuleCheckFixtureTextsSelfHost closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFixtureTextsLater plus HostModuleCheckFixtureTextsSelfHost. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFixtureTextsSelfHost copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset = true := by
  native_decide

/-- Drive fold for the HostModuleCheckFixtureTextsEmit closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset = true := by
  native_decide

/-- Good path typechecks live Mult through HostModuleCheckFixtureTextsSelfHost plus HostModuleCheckFixtureTextsEmit. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckFixtureTextsEmit copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset = true := by
  native_decide

end SystemsLean.ElabMeet
