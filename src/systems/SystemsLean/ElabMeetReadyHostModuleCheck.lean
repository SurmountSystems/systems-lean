/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet ready HostModuleCheck conjuncts.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeet so that file stays under the
  line cap after the HostModuleCheckKernelEmitTerm fold. Same namespace
  SystemsLean.ElabMeet. Role: the HostModuleCheck named-subset half of
  elabMeetReady (RequiredDecls through KernelProgramTerm). Do not dump
  onto ElabMeetTheorems, Tail, Later, ElabMeetCompile, CheckersLater,
  or KernelProgramTerm / TypesTerm / LinearTerm probes.
  Rec-depth 8192 keep on elabMeetReady in ElabMeet.

  Spec (readable):
  - elabMeetReadyHostModuleCheck is the AND of the already-folded
    HostModuleCheck named-subset drive Bools through KernelProgramTerm.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ElabMeetReadyHostModuleCheck, SystemsLean.ElabMeetReadyHostModuleCheck,
  elabMeetReadyHostModuleCheck, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetReadyHostModuleCheck
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetReadyHostModuleCheck;
  lake build SystemsLean.ElabMeet; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProbe
import SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe
import SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe
import SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe
import SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe
import SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe
import SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe
import SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe
import SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckKernelProgramTermProbe

namespace SystemsLean.ElabMeet

set_option maxRecDepth 8192 in
/-- HostModuleCheck named-subset conjuncts of elabMeetReady.
    RequiredDecls through KernelProgramTerm. EmitTerm stays on elabMeetReady.
    Greppable: elabMeetReadyHostModuleCheck. -/
def elabMeetReadyHostModuleCheck : Bool :=
  elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsSubset
  && elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsSubset
  && elabMeetDrivesNamedHostModuleCheckRequiredDeclsSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset
  && elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset
  && elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset
  && elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset
  && elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset
  && elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset
  && elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset
  && elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset
  && elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset
  && elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset
  && elabMeetRejectsBadNamedHostModuleCheckFixturesSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset
  && elabMeetDrivesNamedHostModuleCheckFixturesSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset
  && elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset
  && elabMeetDrivesNamedHostModuleCheckSurfaceSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset
  && elabMeetRejectsBadNamedHostModuleCheckCheckersSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset
  && elabMeetDrivesNamedHostModuleCheckCheckersSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset
  && elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset
  && elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset
  && elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset
  && elabMeetDrivesNamedHostModuleCheckRealModuleSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset
  && elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset
  && elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset
  && elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset
  && elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckKernelProgramTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckKernelProgramTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelProgramTermSubset
  && elabMeetDrivesNamedHostModuleCheckKernelProgramTermSubset

end SystemsLean.ElabMeet
