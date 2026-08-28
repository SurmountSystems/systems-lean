/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeet so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  Drive theorems live here; honesty flags, ready fold, and
  examples stay in SystemsLean.ElabMeet.

  Spec (readable):
  - native_decide theorems for one-command through live-module,
    live-theorems, named-subset, TypesTheorems-subset,
    Erasure-subset, ErasureTheorems-subset, Extract-subset,
    ExtractTheorems-subset, IrProgram-subset,
    IrProgramTheorems-subset, HostTerm-subset,
    HostFrontGoldens-subset, and HostFront-subset drive Bools.
    This hub must not import SystemsLean.ElabMeetNamed*Probe
    modules. Isolation theorems for HostFrontTheorems through
    HostModuleCheckFixtureTextsLater live on those probe modules.
    HostModuleCheckFixtureTexts-subset,
    HostModuleCheckFixtureTextsProduct-subset, and
    HostModuleCheckFixtureTextsSelfHost-subset theorems live in
    SystemsLean.ElabMeetTheoremsNamedHostModuleCheckFixtureTexts
    (same namespace). Later named-subset theorems live in those
    named helpers. Prove a named isolation subset with one serial
    niced lake build of that probe, LEAN_NUM_THREADS=1. Never
    lake build this hub as the prove (hub fan-out).
    Statements and proofs for the hub theorems above are
    unchanged from the former ElabMeet block.
  - Honesty theorems slakeOwnsPackageTypecheck_false,
    elabMeetFullHostElaborateRemains_false, and
    elabMeetReady_true stay in ElabMeet (those Bools live there).
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, ElabMeetTheorems, SystemsLean.ElabMeetTheorems,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetTheorems
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build one isolation probe only
  (example SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe)
  with LEAN_NUM_THREADS=1; just systems-host. Never lake build
  SystemsLean.ElabMeetTheorems or SystemsLean.ElabMeet as the prove.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetEarly
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetOlean
import SystemsLean.ElabMeetDesc
import SystemsLean.ElabMeetExe
import SystemsLean.ElabMeetImpSrc
import SystemsLean.ElabMeetImpSrcTwo
import SystemsLean.ElabMeetExeSrcTwo
import SystemsLean.ElabMeetDefSrc
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalkLater
import SystemsLean.ElabMeetNamedWalkTail
import SystemsLean.ElabMeetSubset
import SystemsLean.ElabMeetExeProbe

namespace SystemsLean.ElabMeet
/-! ### ELAB-MEET-THEOREM -/
/-- Same theorem as the observed red: one-command drive is true. -/
theorem elabMeetDrivesOneModule_true : elabMeetDrivesOneModule = true := by
  native_decide

theorem elabMeetAcceptsGood_true : elabMeetAcceptsGood = true := by
  native_decide

theorem elabMeetRejectsBad_true : elabMeetRejectsBad = true := by
  native_decide

/-- Same theorem as the observed red: one-theorem-command drive is true. -/
theorem elabMeetDrivesOneTheorem_true : elabMeetDrivesOneTheorem = true := by
  native_decide

theorem elabMeetAcceptsGoodTheorem_true : elabMeetAcceptsGoodTheorem = true := by
  native_decide

theorem elabMeetRejectsBadTheorem_true : elabMeetRejectsBadTheorem = true := by
  native_decide

/-- Same theorem as the observed red: one imported-module drive is true. -/
theorem elabMeetDrivesOneImportedModule_true :
    elabMeetDrivesOneImportedModule = true := by
  native_decide

theorem elabMeetAcceptsGoodImport_true : elabMeetAcceptsGoodImport = true := by
  native_decide

theorem elabMeetRejectsBadImport_true : elabMeetRejectsBadImport = true := by
  native_decide

/-- Same theorem as the observed red: one-file-from-disk drive is true. -/
theorem elabMeetDrivesOneFileFromDisk_true :
    elabMeetDrivesOneFileFromDisk = true := by
  native_decide

theorem elabMeetAcceptsGoodFile_true : elabMeetAcceptsGoodFile = true := by
  native_decide

theorem elabMeetRejectsBadFile_true : elabMeetRejectsBadFile = true := by
  native_decide

/-- Same theorem as the observed red: on-disk import drive is true. -/
theorem elabMeetDrivesOnDiskImport_true : elabMeetDrivesOnDiskImport = true := by
  native_decide

theorem elabMeetAcceptsGoodOnDiskImport_true :
    elabMeetAcceptsGoodOnDiskImport = true := by
  native_decide

theorem elabMeetRejectsBadOnDiskImport_true :
    elabMeetRejectsBadOnDiskImport = true := by
  native_decide

/-- Same theorem as the observed red: compile-then-import drive is true. -/
theorem elabMeetDrivesCompiledImport_true :
    elabMeetDrivesCompiledImport = true := by
  native_decide

theorem elabMeetAcceptsGoodCompiledImport_true :
    elabMeetAcceptsGoodCompiledImport = true := by
  native_decide

theorem elabMeetRejectsBadCompiledImport_true :
    elabMeetRejectsBadCompiledImport = true := by
  native_decide

/-- Same theorem as the observed red: two-module package drive is true. -/
theorem elabMeetDrivesTwoModulePackage_true :
    elabMeetDrivesTwoModulePackage = true := by
  native_decide

theorem elabMeetAcceptsGoodTwoModulePackage_true :
    elabMeetAcceptsGoodTwoModulePackage = true := by
  native_decide

theorem elabMeetRejectsBadTwoModulePackage_true :
    elabMeetRejectsBadTwoModulePackage = true := by
  native_decide

/-- Same theorem as the observed red: package-description drive is true. -/
theorem elabMeetDrivesPackageDesc_true : elabMeetDrivesPackageDesc = true := by
  native_decide

theorem elabMeetAcceptsGoodPackageDesc_true :
    elabMeetAcceptsGoodPackageDesc = true := by
  native_decide

theorem elabMeetRejectsBadPackageDesc_true :
    elabMeetRejectsBadPackageDesc = true := by
  native_decide

/-- Same theorem as the observed red: compile-order drive is true. -/
theorem elabMeetDrivesCompileOrder_true : elabMeetDrivesCompileOrder = true := by
  native_decide

theorem elabMeetAcceptsGoodCompileOrder_true :
    elabMeetAcceptsGoodCompileOrder = true := by
  native_decide

theorem elabMeetRejectsBadCompileOrder_true :
    elabMeetRejectsBadCompileOrder = true := by
  native_decide

/-- Same theorem as the observed red: follow-imports drive is true. -/
theorem elabMeetDrivesFollowImports_true : elabMeetDrivesFollowImports = true := by
  native_decide

theorem elabMeetAcceptsGoodFollowImports_true :
    elabMeetAcceptsGoodFollowImports = true := by
  native_decide

theorem elabMeetRejectsBadFollowImports_true :
    elabMeetRejectsBadFollowImports = true := by
  native_decide

/-- Same theorem as the observed red: follow-import-chain drive is true. -/
theorem elabMeetDrivesFollowImportChain_true :
    elabMeetDrivesFollowImportChain = true := by
  native_decide

theorem elabMeetAcceptsGoodFollowImportChain_true :
    elabMeetAcceptsGoodFollowImportChain = true := by
  native_decide

theorem elabMeetRejectsBadFollowImportChain_true :
    elabMeetRejectsBadFollowImportChain = true := by
  native_decide

/-- Same theorem as the observed red: cycle-reject drive is true. -/
theorem elabMeetDrivesCycleReject_true :
    elabMeetDrivesCycleReject = true := by
  native_decide

theorem elabMeetAcceptsGoodCycleReject_true :
    elabMeetAcceptsGoodCycleReject = true := by
  native_decide

theorem elabMeetRejectsBadCycleReject_true :
    elabMeetRejectsBadCycleReject = true := by
  native_decide

/-- Same theorem as the observed red: package-module theorem drive is true. -/
theorem elabMeetDrivesPackageTheorem_true :
    elabMeetDrivesPackageTheorem = true := by
  native_decide

theorem elabMeetAcceptsGoodPackageTheorem_true :
    elabMeetAcceptsGoodPackageTheorem = true := by
  native_decide

theorem elabMeetRejectsBadPackageTheorem_true :
    elabMeetRejectsBadPackageTheorem = true := by
  native_decide

/-- Same theorem as the observed red: library-theorem drive is true. -/
theorem elabMeetDrivesLibraryTheorem_true :
    elabMeetDrivesLibraryTheorem = true := by
  native_decide

theorem elabMeetAcceptsGoodLibraryTheorem_true :
    elabMeetAcceptsGoodLibraryTheorem = true := by
  native_decide

theorem elabMeetRejectsBadLibraryTheorem_true :
    elabMeetRejectsBadLibraryTheorem = true := by
  native_decide

/-- Same theorem as the observed red: compiled-olean reuse drive is true. -/
theorem elabMeetDrivesOleanReuse_true :
    elabMeetDrivesOleanReuse = true := by
  native_decide

theorem elabMeetAcceptsGoodOleanReuse_true :
    elabMeetAcceptsGoodOleanReuse = true := by
  native_decide

theorem elabMeetRejectsBadOleanReuse_true :
    elabMeetRejectsBadOleanReuse = true := by
  native_decide

/-- Same theorem as the observed red: rebuild-when-changed drive is true. -/
theorem elabMeetDrivesRebuildWhenChanged_true :
    elabMeetDrivesRebuildWhenChanged = true := by
  native_decide

/-- Same theorem as the observed red: richer package-description drive is true. -/
theorem elabMeetDrivesRicherPackageDesc_true :
    elabMeetDrivesRicherPackageDesc = true := by
  native_decide

/-- Same theorem as the observed red: named library-target drive is true. -/
theorem elabMeetDrivesNamedLibraryTargets_true :
    elabMeetDrivesNamedLibraryTargets = true := by
  native_decide

/-- Same theorem as the observed red: default library-target drive is true. -/
theorem elabMeetDrivesDefaultLibraryTarget_true :
    elabMeetDrivesDefaultLibraryTarget = true := by
  native_decide

/-- Same theorem as the observed red: source-directory drive is true. -/
theorem elabMeetDrivesSourceDirectory_true :
    elabMeetDrivesSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: executable-target drive is true. -/
theorem elabMeetDrivesExecutableTarget_true :
    elabMeetDrivesExecutableTarget = true := by
  native_decide

/-- Same theorem as the observed red: executable-import drive is true. -/
theorem elabMeetDrivesExecutableImport_true :
    elabMeetDrivesExecutableImport = true := by
  native_decide

/-- Same theorem as the observed red: executable multi-lib drive is true. -/
theorem elabMeetDrivesExecutableMultiLib_true :
    elabMeetDrivesExecutableMultiLib = true := by
  native_decide

/-- Same theorem as the observed red: two-executable-target drive is true. -/
theorem elabMeetDrivesExecutableTargets_true :
    elabMeetDrivesExecutableTargets = true := by
  native_decide

/-- Same theorem as the observed red: default-executable-target drive is true. -/
theorem elabMeetDrivesDefaultExecutableTarget_true :
    elabMeetDrivesDefaultExecutableTarget = true := by
  native_decide

/-- Same theorem as the observed red: executable source-directory drive is true. -/
theorem elabMeetDrivesExecutableSourceDirectory_true :
    elabMeetDrivesExecutableSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: executable-import source-directory drive is true. -/
theorem elabMeetDrivesExecutableImportSourceDirectory_true :
    elabMeetDrivesExecutableImportSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: executable multi-lib source-directory drive is true. -/
theorem elabMeetDrivesExecutableMultiLibSourceDirectory_true :
    elabMeetDrivesExecutableMultiLibSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: two-executable source-directory drive is true. -/
theorem elabMeetDrivesExecutableTargetsSourceDirectory_true :
    elabMeetDrivesExecutableTargetsSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: default-executable source-directory drive is true. -/
theorem elabMeetDrivesDefaultExecutableSourceDirectory_true :
    elabMeetDrivesDefaultExecutableSourceDirectory = true := by
  native_decide

/-- Same theorem as the observed red: live SystemsLean.Mult typecheck drive is true. -/
theorem elabMeetDrivesLiveModule_true :
    elabMeetDrivesLiveModule = true := by
  native_decide

/-- Same theorem as the observed red: accept live SystemsLean.Mult. -/
theorem elabMeetAcceptsGoodLiveModule_true :
    elabMeetAcceptsGoodLiveModule = true := by
  native_decide

/-- Same theorem as the observed red: reject planted type error sidecar. -/
theorem elabMeetRejectsBadLiveModule_true :
    elabMeetRejectsBadLiveModule = true := by
  native_decide

/-- Same theorem as the observed red: prior temp-file walk is not this accept. -/
theorem elabMeetRejectsOldWalkAsLiveModule_true :
    elabMeetRejectsOldWalkAsLiveModule = true := by
  native_decide

/-- Same theorem as the observed red: live SystemsLean.MultTheorems typecheck drive is true. -/
theorem elabMeetDrivesLiveTheorems_true :
    elabMeetDrivesLiveTheorems = true := by
  native_decide

theorem elabMeetAcceptsGoodLiveTheorems_true :
    elabMeetAcceptsGoodLiveTheorems = true := by
  native_decide

theorem elabMeetRejectsBadLiveTheorems_true :
    elabMeetRejectsBadLiveTheorems = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsLiveTheorems_true :
    elabMeetRejectsOldWalkAsLiveTheorems = true := by
  native_decide

/-- Same theorem as the observed red: named closed-subset drive is true. -/
theorem elabMeetDrivesNamedSubset_true :
    elabMeetDrivesNamedSubset = true := by
  native_decide

/-- Same theorem as the observed red: accept good named closed subset. -/
theorem elabMeetAcceptsGoodNamedSubset_true :
    elabMeetAcceptsGoodNamedSubset = true := by
  native_decide

/-- Same theorem as the observed red: reject planted type error sidecar. -/
theorem elabMeetRejectsBadNamedSubset_true :
    elabMeetRejectsBadNamedSubset = true := by
  native_decide

/-- Same theorem as the observed red: leftover walk is not this accept. -/
theorem elabMeetRejectsOldWalkAsNamedSubset_true :
    elabMeetRejectsOldWalkAsNamedSubset = true := by
  native_decide

/-- Drive fold for the TypesTheorems closed subset. Greppable: elabMeetDrivesNamedTypesTheoremsSubset. -/
theorem elabMeetDrivesNamedTypesTheoremsSubset_true :
    elabMeetDrivesNamedTypesTheoremsSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems. -/
theorem elabMeetAcceptsGoodNamedTypesTheoremsSubset_true :
    elabMeetAcceptsGoodNamedTypesTheoremsSubset = true := by
  native_decide

/-- Bad path is a planted type error on a TypesTheorems copy. -/
theorem elabMeetRejectsBadNamedTypesTheoremsSubset_true :
    elabMeetRejectsBadNamedTypesTheoremsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset = true := by
  native_decide

/-- Drive fold for the Erasure closed subset. Greppable: elabMeetDrivesNamedErasureSubset. -/
theorem elabMeetDrivesNamedErasureSubset_true :
    elabMeetDrivesNamedErasureSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure. -/
theorem elabMeetAcceptsGoodNamedErasureSubset_true :
    elabMeetAcceptsGoodNamedErasureSubset = true := by
  native_decide

/-- Bad path is a planted type error on an Erasure copy. -/
theorem elabMeetRejectsBadNamedErasureSubset_true :
    elabMeetRejectsBadNamedErasureSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedErasureSubset_true :
    elabMeetRejectsOldWalkAsNamedErasureSubset = true := by
  native_decide

/-- Drive fold for the ErasureTheorems closed subset. Greppable: elabMeetDrivesNamedErasureTheoremsSubset. -/
theorem elabMeetDrivesNamedErasureTheoremsSubset_true :
    elabMeetDrivesNamedErasureTheoremsSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems. -/
theorem elabMeetAcceptsGoodNamedErasureTheoremsSubset_true :
    elabMeetAcceptsGoodNamedErasureTheoremsSubset = true := by
  native_decide

/-- Bad path is a planted type error on an ErasureTheorems copy. -/
theorem elabMeetRejectsBadNamedErasureTheoremsSubset_true :
    elabMeetRejectsBadNamedErasureTheoremsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset = true := by
  native_decide

/-- Drive fold for the Extract closed subset. Greppable: elabMeetDrivesNamedExtractSubset. -/
theorem elabMeetDrivesNamedExtractSubset_true :
    elabMeetDrivesNamedExtractSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract. -/
theorem elabMeetAcceptsGoodNamedExtractSubset_true :
    elabMeetAcceptsGoodNamedExtractSubset = true := by
  native_decide

/-- Bad path is a planted type error on an Extract copy. -/
theorem elabMeetRejectsBadNamedExtractSubset_true :
    elabMeetRejectsBadNamedExtractSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedExtractSubset_true :
    elabMeetRejectsOldWalkAsNamedExtractSubset = true := by
  native_decide

/-- Drive fold for the ExtractTheorems closed subset. Greppable: elabMeetDrivesNamedExtractTheoremsSubset. -/
theorem elabMeetDrivesNamedExtractTheoremsSubset_true :
    elabMeetDrivesNamedExtractTheoremsSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems. -/
theorem elabMeetAcceptsGoodNamedExtractTheoremsSubset_true :
    elabMeetAcceptsGoodNamedExtractTheoremsSubset = true := by
  native_decide

/-- Bad path is a planted type error on an ExtractTheorems copy. -/
theorem elabMeetRejectsBadNamedExtractTheoremsSubset_true :
    elabMeetRejectsBadNamedExtractTheoremsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset = true := by
  native_decide

/-- Drive fold for the IrProgram closed subset. Greppable: elabMeetDrivesNamedIrProgramSubset. -/
theorem elabMeetDrivesNamedIrProgramSubset_true :
    elabMeetDrivesNamedIrProgramSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram. -/
theorem elabMeetAcceptsGoodNamedIrProgramSubset_true :
    elabMeetAcceptsGoodNamedIrProgramSubset = true := by
  native_decide

/-- Bad path is a planted type error on an IrProgram copy. -/
theorem elabMeetRejectsBadNamedIrProgramSubset_true :
    elabMeetRejectsBadNamedIrProgramSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedIrProgramSubset_true :
    elabMeetRejectsOldWalkAsNamedIrProgramSubset = true := by
  native_decide

/-- Drive fold for the IrProgramTheorems closed subset. Greppable: elabMeetDrivesNamedIrProgramTheoremsSubset. -/
theorem elabMeetDrivesNamedIrProgramTheoremsSubset_true :
    elabMeetDrivesNamedIrProgramTheoremsSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems. -/
theorem elabMeetAcceptsGoodNamedIrProgramTheoremsSubset_true :
    elabMeetAcceptsGoodNamedIrProgramTheoremsSubset = true := by
  native_decide

/-- Bad path is a planted type error on an IrProgramTheorems copy. -/
theorem elabMeetRejectsBadNamedIrProgramTheoremsSubset_true :
    elabMeetRejectsBadNamedIrProgramTheoremsSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset = true := by
  native_decide

/-- Drive fold for the HostTerm closed subset. Greppable: elabMeetDrivesNamedHostTermSubset. -/
theorem elabMeetDrivesNamedHostTermSubset_true :
    elabMeetDrivesNamedHostTermSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm. -/
theorem elabMeetAcceptsGoodNamedHostTermSubset_true :
    elabMeetAcceptsGoodNamedHostTermSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostTerm copy. -/
theorem elabMeetRejectsBadNamedHostTermSubset_true :
    elabMeetRejectsBadNamedHostTermSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostTermSubset_true :
    elabMeetRejectsOldWalkAsNamedHostTermSubset = true := by
  native_decide

/-- Drive fold for the HostFrontGoldens closed subset. Greppable: elabMeetDrivesNamedHostFrontGoldensSubset. -/
theorem elabMeetDrivesNamedHostFrontGoldensSubset_true :
    elabMeetDrivesNamedHostFrontGoldensSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens. -/
theorem elabMeetAcceptsGoodNamedHostFrontGoldensSubset_true :
    elabMeetAcceptsGoodNamedHostFrontGoldensSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostFrontGoldens copy. -/
theorem elabMeetRejectsBadNamedHostFrontGoldensSubset_true :
    elabMeetRejectsBadNamedHostFrontGoldensSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset_true :
    elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset = true := by
  native_decide

/-- Drive fold for the HostFront closed subset. Greppable: elabMeetDrivesNamedHostFrontSubset. -/
theorem elabMeetDrivesNamedHostFrontSubset_true :
    elabMeetDrivesNamedHostFrontSubset = true := by
  native_decide

/-- Good path typechecks live Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront. -/
theorem elabMeetAcceptsGoodNamedHostFrontSubset_true :
    elabMeetAcceptsGoodNamedHostFrontSubset = true := by
  native_decide

/-- Bad path is a planted type error on a HostFront copy. -/
theorem elabMeetRejectsBadNamedHostFrontSubset_true :
    elabMeetRejectsBadNamedHostFrontSubset = true := by
  native_decide

/-- Isolation: leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. -/
theorem elabMeetRejectsOldWalkAsNamedHostFrontSubset_true :
    elabMeetRejectsOldWalkAsNamedHostFrontSubset = true := by
  native_decide

end SystemsLean.ElabMeet

