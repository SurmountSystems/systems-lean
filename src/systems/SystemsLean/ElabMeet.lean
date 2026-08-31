/-
  SYSTEMS_LEAN_HOST partial -- Real elaborator meet: Slake drives one Lean 4
  command-elaborator job. Side: classic Lean elaborator under src/systems/
  (not freestanding C).

  Spec (readable):
  - Lake still typechecks this package and builds the host tools.
  - This module invokes Lean 4 command elaboration on a payload string
    (one good def, one ill-typed def, one good theorem, one ill-typed
    theorem, one good import-using sequence, one missing-module
    sequence) and on one tiny file read from disk (one good file, one
    bad file) and on one on-disk import pair (library file plus importer).
    One-command jobs stay one command. The import probe is
    one tiny imported-module command sequence, not package typecheck.
    The file probe reads temp `.lean` files then reuses the import
    helper. The on-disk import probe writes a library file and an
    importer, puts the library on the Lean search path, then reuses
    the import helper. The compile-then-import probe writes library
    source to disk, reads that source, compiles it to an `.olean`,
    then imports the compiled module. The two-module package probe
    writes a library and an importer, compiles both from disk, and
    records whether the importer artifact exists and uses a library
    definition. The package-description probe writes a tiny package
    root that names two modules, walks those names, and compiles the
    named files from disk. The compile-order probe walks an
    importer-first description. The follow-imports probe names only
    the importer and still compiles the omitted library. The
    follow-import-chain probe names only the tip importer and still
    compiles the mid library and the base file that mid imports.
    Compile helpers live in SystemsLean.ElabMeetCompile (same
    namespace). Probe snippets live in SystemsLean.ElabMeetProbe
    (same namespace). The cycle-reject probe names only the tip;
    an omitted mid that imports the tip fail-closes. The
    package-theorem probe compiles a listed module that holds a
    theorem. The library-theorem probe compiles a library that
    proves libFact and an importer theorem that uses it. The
    olean-reuse probe lives in SystemsLean.ElabMeetOlean:
    compile once, then import the compiled `.olean` without
    rewriting the source. The dependent-rebuild probe lives
    there too: changing a library rebuilds the importer.
    The richer-description probe lives in
    SystemsLean.ElabMeetDesc: a `lean_lib` stanza plus
    the modules under that target. Module-only text is
    not a richer accept. The named-library probe lives
    there too: two `lean_lib` stanzas; a requested
    target compiles only that library; omitted request
    compiles both in order. A one-library richer
    description is not a two-target accept.
    The default-library probe lives there too: two
    `lean_lib` stanzas plus a default; compile only
    the default. A request-A-only Name 114 walk is
    not a default accept.
    The source-directory probe lives there too: a
    `srcDir` line plus the listed module under that
    directory. A cwd-only walk is not a source-dir
    accept.
    The executable-target probe lives in
    SystemsLean.ElabMeetExeProbe: a `lean_exe` stanza plus
    the named executable module. A library-only walk
    is not an executable accept.
    The executable-import probe lives there too: a
    `lean_lib` plus a `lean_exe` whose module imports
    that library. Compile the library first. A Name
    117 standalone `lean_exe` is not this accept.
    The executable-multi-lib probe lives there too:
    two `lean_lib` plus a `lean_exe` whose module
    imports both. Compile the libraries first. A
    Name 118 one-library walk is not this accept.
    The two-executable probe lives there too: two
    `lean_exe` targets; a requested executable
    compiles only that module; omitted request
    compiles both in order. A Name 117 one-exe
    walk is not this accept.
    The default-executable probe lives there too:
    two `lean_exe` plus a default; compile only
    the default. A request-A-only Name 120 walk
    is not a default accept.
    The executable source-directory probe lives
    in SystemsLean.ElabMeetExeProbe: a `srcDir`
    plus `lean_exe`. A cwd-only Name 117 walk
    is not this accept.
    The executable-import source-directory probe
    lives there too: a `srcDir` plus `lean_lib`
    plus `lean_exe`. Compile the library first
    from that directory. A cwd-only Name 118
    walk is not this accept.
    The two-library executable source-directory
    probe lives in SystemsLean.ElabMeetImpSrcTwo:
    two `lean_lib` plus `lean_exe` plus `srcDir`.
    Compile both libraries then the executable
    from that directory. A cwd-only Name 119 walk
    is not this accept. A one-library Name 123
    walk is not this accept.
    The two-executable source-directory probe
    lives in SystemsLean.ElabMeetExeSrcTwo: two
    `lean_exe` plus `srcDir`. Compile both from
    that directory. A cwd-only Name 120 walk is
    not this accept. A one-exe Name 122 walk is
    not this accept.
    The default-executable source-directory
    probe lives in SystemsLean.ElabMeetDefSrc:
    two `lean_exe` plus `default` plus `srcDir`.
    Compile only the default from that directory.
    A both-in-order Name 125 walk is not this
    accept. A cwd-only Name 121 walk is not this
    accept.
    It is not leftover seed theater.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
  - Partial capability elabMeetDrivesOneModule / elabMeetDrivesOneTheorem
    / elabMeetDrivesOneImportedModule / elabMeetDrivesOneFileFromDisk
    / elabMeetDrivesOnDiskImport / elabMeetDrivesCompiledImport
    / elabMeetDrivesTwoModulePackage / elabMeetDrivesPackageDesc
    / elabMeetDrivesCompileOrder / elabMeetDrivesFollowImports
    / elabMeetDrivesFollowImportChain / elabMeetDrivesCycleReject
    / elabMeetDrivesPackageTheorem / elabMeetDrivesLibraryTheorem
    / elabMeetDrivesOleanReuse / elabMeetDrivesRebuildWhenChanged
    / elabMeetDrivesDependentRebuild
    / elabMeetDrivesRicherPackageDesc
    / elabMeetDrivesNamedLibraryTargets
    / elabMeetDrivesDefaultLibraryTarget
    / elabMeetDrivesSourceDirectory
    / elabMeetDrivesExecutableTarget
    / elabMeetDrivesExecutableImport
    / elabMeetDrivesExecutableMultiLib
    / elabMeetDrivesExecutableTargets
    / elabMeetDrivesDefaultExecutableTarget
    / elabMeetDrivesExecutableSourceDirectory
    / elabMeetDrivesExecutableImportSourceDirectory
    / elabMeetDrivesExecutableMultiLibSourceDirectory
    / elabMeetDrivesExecutableTargetsSourceDirectory
    / elabMeetDrivesDefaultExecutableSourceDirectory
    / elabMeetDrivesLiveModule
    / elabMeetDrivesLiveTheorems
    / elabMeetDrivesNamedSubset
    / elabMeetDrivesNamedTypesTheoremsSubset
    / elabMeetDrivesNamedErasureSubset
    / elabMeetDrivesNamedErasureTheoremsSubset
    / elabMeetDrivesNamedExtractSubset
    / elabMeetDrivesNamedExtractTheoremsSubset
    / elabMeetDrivesNamedIrProgramSubset
    / elabMeetDrivesNamedIrProgramTheoremsSubset
    / elabMeetDrivesNamedHostTermSubset
    / elabMeetDrivesNamedHostFrontGoldensSubset
    / elabMeetDrivesNamedHostFrontSubset
    / elabMeetDrivesNamedHostFrontTheoremsSubset
    / elabMeetDrivesNamedHostCheckSubset
    / elabMeetDrivesNamedHostGraphSubset
    / elabMeetDrivesNamedHostGraphTheoremsSubset
    / elabMeetDrivesNamedHostPackageWriteSubset
    may be true while the full-package aggregate
    slakeOwnsPackageTypecheck stays false.
  - Cite: doc/dev/research/full-host-package-elaborate-meet-2026-08-12.md

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  SLAKE_ELAB_MEET_V0, elabMeetReady, elabMeetDrivesOneModule,
  elabMeetDrivesOneTheorem, elabMeetDrivesOneImportedModule,
  elabMeetDrivesOneFileFromDisk, elabMeetDrivesOnDiskImport,
  elabMeetDrivesCompiledImport, elabMeetDrivesTwoModulePackage,
  elabMeetDrivesPackageDesc, elabMeetDrivesCompileOrder,
  elabMeetDrivesFollowImports, elabMeetDrivesFollowImportChain,
  elabMeetDrivesCycleReject, elabMeetDrivesPackageTheorem,
  elabMeetDrivesLibraryTheorem, elabMeetDrivesOleanReuse,
  elabMeetDrivesRebuildWhenChanged, elabMeetDrivesDependentRebuild,
  elabMeetDrivesRicherPackageDesc,
  elabMeetDrivesNamedLibraryTargets,
  elabMeetDrivesDefaultLibraryTarget,
  elabMeetDrivesSourceDirectory,
  elabMeetDrivesExecutableTarget,
  elabMeetDrivesExecutableImport,
  elabMeetDrivesExecutableMultiLib,
  elabMeetDrivesExecutableTargets,
  elabMeetDrivesDefaultExecutableTarget,
  elabMeetDrivesExecutableSourceDirectory,
  elabMeetDrivesExecutableImportSourceDirectory,
  elabMeetDrivesExecutableMultiLibSourceDirectory,
  elabMeetDrivesExecutableTargetsSourceDirectory,
  elabMeetDrivesDefaultExecutableSourceDirectory,
  elabMeetDrivesLiveModule,
  elabMeetAcceptsGoodLiveModule,
  elabMeetRejectsBadLiveModule,
  elabMeetRejectsOldWalkAsLiveModule,
  elabMeetDrivesLiveTheorems,
  elabMeetAcceptsGoodLiveTheorems,
  elabMeetRejectsBadLiveTheorems,
  elabMeetRejectsOldWalkAsLiveTheorems,
  elabMeetDrivesNamedSubset,
  elabMeetDrivesNamedTypesTheoremsSubset,
  elabMeetDrivesNamedErasureSubset,
  elabMeetDrivesNamedErasureTheoremsSubset,
  elabMeetDrivesNamedExtractSubset,
  elabMeetDrivesNamedExtractTheoremsSubset,
  elabMeetDrivesNamedIrProgramSubset,
  elabMeetDrivesNamedIrProgramTheoremsSubset,
  elabMeetDrivesNamedHostTermSubset,
  elabMeetDrivesNamedHostFrontGoldensSubset,
  elabMeetDrivesNamedHostFrontSubset,
  elabMeetDrivesNamedHostFrontTheoremsSubset,
  elabMeetDrivesNamedHostCheckSubset,
  elabMeetDrivesNamedHostGraphSubset,
  elabMeetDrivesNamedHostGraphTheoremsSubset,
  elabMeetDrivesNamedHostPackageWriteSubset,
  slakeOwnsPackageTypecheck,
  elabMeetFullHostElaborateRemains,
  elabMeetAcceptsGood, elabMeetRejectsBad, elabMeetAcceptsGoodTheorem,
  elabMeetRejectsBadTheorem, elabMeetAcceptsGoodImport,
  elabMeetRejectsBadImport, elabMeetAcceptsGoodFile,
  elabMeetRejectsBadFile, elabMeetAcceptsGoodOnDiskImport,
  elabMeetRejectsBadOnDiskImport, elabMeetAcceptsGoodCompiledImport,
  elabMeetRejectsBadCompiledImport, elabMeetAcceptsGoodTwoModulePackage,
  elabMeetRejectsBadTwoModulePackage, elabMeetAcceptsGoodPackageDesc,
  elabMeetRejectsBadPackageDesc, elabMeetAcceptsGoodCompileOrder,
  elabMeetRejectsBadCompileOrder, elabMeetAcceptsGoodFollowImports,
  elabMeetRejectsBadFollowImports, elabMeetAcceptsGoodFollowImportChain,
  elabMeetRejectsBadFollowImportChain, elabMeetAcceptsGoodCycleReject,
  elabMeetRejectsBadCycleReject, elabMeetAcceptsGoodPackageTheorem,
  elabMeetRejectsBadPackageTheorem, elabMeetAcceptsGoodLibraryTheorem,
  elabMeetRejectsBadLibraryTheorem, elabMeetAcceptsGoodOleanReuse,
  elabMeetRejectsBadOleanReuse, elabMeetAcceptsUnchangedRebuildReuse,
  elabMeetRejectsStaleRebuild, elabMeetAcceptsDependentRebuild,
  elabMeetRejectsStaleDependent, elabMeetAcceptsGoodRicherPackageDesc,
  elabMeetRejectsBadRicherPackageDesc,
  elabMeetRejectsModuleOnlyRicherPackageDesc,
  elabMeetAcceptsGoodNamedLibraryTargets,
  elabMeetRejectsMissingNamedLibraryTarget,
  elabMeetRejectsSingleLibAsNamedTargets,
  elabMeetAcceptsGoodDefaultLibraryTarget,
  elabMeetRejectsMissingDefaultLibraryTarget,
  elabMeetRejectsRequestOnlyAsDefault,
  elabMeetAcceptsGoodSourceDirectory,
  elabMeetRejectsMissingSourceDirectory,
  elabMeetRejectsCwdOnlyAsSourceDirectory,
  elabMeetAcceptsGoodExecutableTarget,
  elabMeetRejectsMissingExecutableTarget,
  elabMeetRejectsLibraryOnlyAsExecutable,
  elabMeetAcceptsGoodExecutableImport,
  elabMeetRejectsMissingExeImpLib,
  elabMeetRejectsMissingExeImp,
  elabMeetRejectsExeOnlyAsExecutableImport,
  elabMeetAcceptsGoodExecutableMultiLib,
  elabMeetRejectsMissingExeMultiLib,
  elabMeetRejectsOneLibAsExecutableMultiLib,
  elabMeetAcceptsGoodExecutableTargets,
  elabMeetRejectsMissingExeTwo,
  elabMeetRejectsOneExeAsExecutableTargets,
  elabMeetAcceptsGoodDefaultExecutableTarget,
  elabMeetRejectsMissingDefaultExecutableTarget,
  elabMeetRejectsRequestOnlyAsDefaultExecutable,
  elabMeetAcceptsGoodExecutableSourceDirectory,
  elabMeetRejectsMissingExecutableSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableSourceDirectory,
  elabMeetAcceptsGoodExecutableImportSourceDirectory,
  elabMeetRejectsMissingExecutableImportSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory,
  elabMeetAcceptsGoodExecutableMultiLibSourceDirectory,
  elabMeetRejectsMissingExecutableMultiLibSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory,
  elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory,
  elabMeetAcceptsGoodDefaultExecutableSourceDirectory,
  elabMeetRejectsMissingDefaultExecutableSourceDirectory,
  elabMeetRejectsBothAsDefaultExecutableSourceDirectory,
  elabMeetRejectsCwdDefaultAsDefaultExecutableSourceDirectory,
  elabMeetAcceptsGoodLiveModule,
  elabMeetRejectsBadLiveModule,
  elabMeetRejectsOldWalkAsLiveModule,
  elabMeetAcceptsGoodLiveTheorems,
  elabMeetRejectsBadLiveTheorems,
  elabMeetRejectsOldWalkAsLiveTheorems,
  tryElabCommandString,
  tryElabImportedModuleString, tryElabFileFromDisk,
  tryElabOnDiskImportFiles, tryCompileOnDiskModule,
  tryCompileThenImportFiles, tryCompileTwoModulePackage,
  tryCompilePackageDesc, tryCompilePackageDescOrdered,
  tryCompilePackageDescFollowImports,
  tryCompilePackageDescFollowImportChain,
  tryCompilePackageDescCycleReject, tryCompilePackageDescTheorem,
  tryCompilePackageDescLibraryTheorem, tryCompileLibraryTheoremPkg,
  tryReuseCompiledOlean, tryReuseCompiledOleanPkg,
  tryCompileReuseOrRebuild, tryRebuildWhenChanged,
  tryRebuildWhenChangedPkg, tryCompileReuseOrRebuildDependent,
  tryCompileDependentRebuild, tryCompileDependentRebuildPkg,
  parsePackageDescModules, parseRicherPackageDesc,
  tryCompileRicherPackageDesc, parseNamedLibraryTargets,
  tryCompileNamedLibraryTarget, tryCompileNamedLibraryTargets,
  parseDefaultLibraryTarget, tryCompileDefaultLibraryTarget,
  parseSourceDirectory, tryCompileSourceDirectory,
  parseExecutableTarget, tryCompileExecutable,
  parseExecutableImport, tryCompileExecutableImport,
  parseExecutableMultiLib, tryCompileExecutableMultiLib,
  parseExecutableTargets, tryCompileExecutableTarget,
  tryCompileExecutableTargets,
  parseDefaultExecutableTarget, tryCompileDefaultExecutableTarget,
  parseExecutableSourceDirectory, tryCompileExecutableSourceDirectory,
  parseExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectory,
  parseExecutableMultiLibSourceDirectory,
  tryCompileExecutableMultiLibSourceDirectory,
  parseExecutableTargetsSourceDirectory,
  tryCompileExecutableTargetsSourceDirectory,
  parseDefaultExecutableSourceDirectory,
  tryCompileDefaultExecutableSourceDirectory,
  goodSnippet,
  badSnippet, goodTheoremSnippet, badTheoremSnippet,
  goodImportSnippet, badImportSnippet, goodFileSnippet,
  badFileSnippet, onDiskLibSnippet, goodOnDiskImportSnippet,
  badOnDiskImportSnippet, compiledLibSnippet,
  goodCompiledImportSnippet, badCompiledLibSnippet,
  twoModuleLibSnippet, goodTwoModuleImporterSnippet,
  badTwoModuleImporterSnippet, goodPackageDescText, badPackageDescText,
  packageDescLibSnippet, goodPackageDescImporterSnippet,
  goodOrderDescText, orderLibSnippet, goodOrderImporterSnippet,
  badOrderLibSnippet, omitLibSnippet, goodFollowImporterSnippet,
  goodFollowDescText, chainBaseSnippet, goodChainMidSnippet,
  goodChainTipSnippet, goodChainDescText,
  cycleMidLibSnippet, goodCycleTipSnippet, goodCycleDescText,
  badCycleMidSnippet, pkgTheoremLibSnippet, goodPkgTheoremSnippet,
  badPkgTheoremSnippet, goodPkgTheoremDescText,
  libFactSnippet, goodUseFactSnippet, badUseFactSnippet,
  goodLibFactDescText, oleanReuseLibSnippet,
  goodOleanReuseImporterSnippet, rebuildWhenLibSnippet,
  rebuildWhenChangedLibSnippet, goodRebuildWhenImporterSnippet,
  goodRebuildWhenChangedImporterSnippet, depLibSnippet,
  depLibChangedSnippet, goodDepLibImporterSnippet,
  goodDepLibChangedImporterSnippet, richLibSnippet,
  goodRichImporterSnippet, goodRicherPackageDescText,
  badRicherPackageDescText, moduleOnlyRicherPackageDescText,
  libASnippet, libBSnippet, goodNamedLibraryTargetsText,
  badNamedLibraryTargetsText, defLibASnippet, defLibBSnippet,
  goodDefaultLibraryTargetText, badDefaultLibraryTargetText,
  srcLibSnippet, goodSourceDirectoryText,
  badSourceDirectoryText,
  exeMainSnippet, goodExecutableTargetText,
  badExecutableTargetText,
  exeImpLibSnippet, goodExeImpMainSnippet,
  goodExecutableImportText, badExecutableImportLibText,
  badExecutableImportExeText,
  exeMultiLibASnippet, exeMultiLibBSnippet,
  goodExeMultiMainSnippet, goodExecutableMultiLibText,
  badExecutableMultiLibText,
  exeTwoASnippet, exeTwoBSnippet,
  goodExecutableTargetsText, badExecutableTargetsText,
  defExeASnippet, defExeBSnippet,
  goodDefaultExecutableTargetText, badDefaultExecutableTargetText,
  exeSrcMainSnippet, goodExecutableSourceDirectoryText,
  badExecutableSourceDirectoryText,
  exeImpSrcLibSnippet, goodExeImpSrcMainSnippet,
  goodExecutableImportSourceDirectoryText,
  badExecutableImportSourceDirectoryText,
  exeMultiSrcLibASnippet, exeMultiSrcLibBSnippet,
  goodExeMultiSrcMainSnippet,
  goodExecutableMultiLibSourceDirectoryText,
  badExecutableMultiLibSourceDirectoryText,
  exeTwoSrcASnippet, exeTwoSrcBSnippet,
  goodExecutableTargetsSourceDirectoryText,
  badExecutableTargetsSourceDirectoryText,
  defExeSrcASnippet, defExeSrcBSnippet,
  goodDefaultExecutableSourceDirectoryText,
  badDefaultExecutableSourceDirectoryText,
  missingDefaultExecutableSourceDirectoryText,
  ELAB-MEET-THEOREM, ELAB-MEET-SMOKE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeet
  Compile helpers: SystemsLean.ElabMeetCompile (same namespace).
  Probe snippets: SystemsLean.ElabMeetProbe (same namespace).
  Older one-command probes: SystemsLean.ElabMeetEarly (same namespace).
  Olean reuse: SystemsLean.ElabMeetOlean (same namespace).
  Richer description: SystemsLean.ElabMeetDesc (same namespace).
  Executable target: SystemsLean.ElabMeetExe (same namespace).
  Executable import from srcDir: SystemsLean.ElabMeetImpSrc.
  Two-library import from srcDir: SystemsLean.ElabMeetImpSrcTwo.
  Two executable targets from srcDir: SystemsLean.ElabMeetExeSrcTwo.
  Default executable from srcDir: SystemsLean.ElabMeetDefSrc.
  Live module: SystemsLean.ElabMeetLive.
  Named subset: SystemsLean.ElabMeetSubset.
  HostModuleCheckSurface subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe.
  HostModuleCheckCheckers subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe.
  HostModuleCheckCheckersLater subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe.
  HostModuleCheckRealModule subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe.
  HostModuleCheckKernelMultTerm subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe.
  HostModuleCheckKernelLinearTerm subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe.
  HostModuleCheckKernelTypesTerm subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe.
  HostModuleCheckKernelProgramTerm subset probe:
  SystemsLean.ElabMeetNamedHostModuleCheckKernelProgramTermProbe.
  HostModuleCheckSurface theorems:
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckSurface.
  HostModuleCheckCheckers theorems:
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckers.
  HostModuleCheckCheckersLater theorems:
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckCheckersLater.
  HostModuleCheckRealModule theorems:
  SystemsLean.ElabMeetTheoremsNamedHostModuleCheckRealModule.
  Older exe and disk-import probes: SystemsLean.ElabMeetExeProbe.
  Drive theorems: SystemsLean.ElabMeetTheorems (same namespace).
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build one isolation probe only
  (example SystemsLean.ElabMeetNamedHostModuleCheckParityTypesTermProbe)
  with LEAN_NUM_THREADS=1; just systems-host. Never lake build
  SystemsLean.ElabMeetTheorems or SystemsLean.ElabMeet as the prove.
  Do not add SystemsLean.ElabMeetNamed*Probe imports here.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
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
import SystemsLean.ElabMeetNamedWalkHostTerm
import SystemsLean.ElabMeetNamedWalkHostGraphTheorems
import SystemsLean.ElabMeetNamedWalkHostPackageWrite
import SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds
import SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm
import SystemsLean.ElabMeetNamedHostFrontTheoremsProbe
import SystemsLean.ElabMeetNamedHostCheckProbe
import SystemsLean.ElabMeetNamedHostGraphProbe
import SystemsLean.ElabMeetNamedHostGraphTheoremsProbe
import SystemsLean.ElabMeetNamedHostPackageWriteProbe
import SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe
import SystemsLean.ElabMeetNamedHostPackageRootsProbe
import SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe
import SystemsLean.ElabMeetNamedHostImportGraphModelProbe
import SystemsLean.ElabMeetNamedHostImportGraphModsProbe
import SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe
import SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe
import SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe
import SystemsLean.ElabMeetNamedHostImportGraphWalkProbe
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
import SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckParityMultTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe
import SystemsLean.ElabMeetNamedHostModuleCheckParityTypesTermProbe
import SystemsLean.ElabMeetSubset
import SystemsLean.ElabMeetReadyHostModuleCheck

import SystemsLean.ElabMeetExeProbe
import SystemsLean.ElabMeetTheorems

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_ELAB_MEET_V0"

/-- Greppable host map id. HOST-ELAB-MEET durable product token. -/
def hostId : String := "HOST-ELAB-MEET"

/-- Short surface name. -/
def surfaceId : String := "ELAB-MEET"

/-- Surface alias. -/
def surfaceAlias : String := "SLAKE_ELAB_MEET"

/-- Honest: Slake does not own full-package typecheck. Lake still does.
    Greppable: slakeOwnsPackageTypecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Mirror only. Does not flip HostResidualShrink.
    Greppable: elabMeetFullHostElaborateRemains. -/
def elabMeetFullHostElaborateRemains : Bool := false

/-
  One-command, theorem, import, and file probes live in
  SystemsLean.ElabMeetEarly (same namespace) so this file
  stays under the line cap.
  #elabMeetProbe #elabMeetTheoremProbe #elabMeetImportProbe
  #elabMeetFileProbe
  On-disk import and compile-then-import probes live in
  SystemsLean.ElabMeetExeProbe (same namespace) so this file
  stays under the line cap.
  #elabMeetOnDiskImportProbe #elabMeetCompiledImportProbe
  Two-module package and package-description probes live in
  SystemsLean.ElabMeetCompile (same namespace) so this file
  stays under the line cap.
  #elabMeetTwoModulePackageProbe #elabMeetPackageDescProbe
  Compile-order probe lives in SystemsLean.ElabMeetDesc so this
  file stays under the line cap.
  #elabMeetCompileOrderProbe
  Follow-imports, follow-import-chain, and cycle-reject probe
  commands live in SystemsLean.ElabMeetOlean (same namespace) so
  this file stays under the line cap.
  #elabMeetFollowImportsProbe #elabMeetFollowImportChainProbe
  #elabMeetCycleRejectProbe
  Package-theorem and library-theorem probe commands and living
  Bools live in SystemsLean.ElabMeetCompile (same namespace).
  #elabMeetPackageTheoremProbe #elabMeetLibraryTheoremProbe
  Richer library-target probe lives in SystemsLean.ElabMeetDesc.
  #elabMeetRicherPackageDescProbe
  Named library-target probe lives in SystemsLean.ElabMeetDesc.
  #elabMeetNamedLibraryTargetsProbe
  Default library-target probe lives in SystemsLean.ElabMeetDesc.
  #elabMeetDefaultLibraryTargetProbe
  Source-directory probe lives in SystemsLean.ElabMeetDesc.
  #elabMeetSourceDirectoryProbe
  Executable-target probe lives in SystemsLean.ElabMeetExeProbe.
  #elabMeetExecutableTargetProbe
  Executable-import probe lives in SystemsLean.ElabMeetExeProbe.
  #elabMeetExecutableImportProbe
  Two-executable probe lives in SystemsLean.ElabMeetExeProbe.
  #elabMeetExecutableTargetsProbe
  Default-executable probe lives in SystemsLean.ElabMeetExeProbe.
  #elabMeetDefaultExecutableTargetProbe
  Executable source-directory probe lives in
  SystemsLean.ElabMeetExeProbe.
  #elabMeetExecutableSourceDirectoryProbe
  Executable-import source-directory probe lives in
  SystemsLean.ElabMeetExeProbe.
  #elabMeetExecutableImportSourceDirectoryProbe
  Two-library executable source-directory probe lives
  in SystemsLean.ElabMeetImpSrcTwo.
  #elabMeetExecutableMultiLibSourceDirectoryProbe
  Two-executable source-directory probe lives in
  SystemsLean.ElabMeetExeSrcTwo.
  #elabMeetExecutableTargetsSourceDirectoryProbe
  Default-executable source-directory probe lives in
  SystemsLean.ElabMeetDefSrc.
  #elabMeetDefaultExecutableSourceDirectoryProbe
  Live-module probe lives in SystemsLean.ElabMeetLive.
  #elabMeetLiveModuleProbe
  Live-theorems probe lives in SystemsLean.ElabMeetLive.
  #elabMeetLiveTheoremsProbe
  Named-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedSubsetProbe
  Named TypesTheorems-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedTypesTheoremsSubsetProbe
  Named Erasure-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedErasureSubsetProbe
  Named ErasureTheorems-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedErasureTheoremsSubsetProbe
  Named Extract-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedExtractSubsetProbe
  Named ExtractTheorems-subset probe lives in SystemsLean.ElabMeetNamedWalkLater.
  #elabMeetNamedExtractTheoremsSubsetProbe
  Named IrProgram-subset probe lives in SystemsLean.ElabMeetNamedWalkTail.
  #elabMeetNamedIrProgramSubsetProbe
  Named IrProgramTheorems-subset probe lives in SystemsLean.ElabMeetSubset.
  #elabMeetNamedIrProgramTheoremsSubsetProbe
  HostTerm-subset probe lives in SystemsLean.ElabMeetSubset.
  Leftover 3-6 probes now live on Tail.
  #elabMeetNamedHostTermSubsetProbe
  HostFrontGoldens-subset probe lives in SystemsLean.ElabMeetSubset.
  #elabMeetNamedHostFrontGoldensSubsetProbe
  HostFront-subset probe lives in SystemsLean.ElabMeetSubset.
  #elabMeetNamedHostFrontSubsetProbe
  HostFrontTheorems-subset probe lives in
  SystemsLean.ElabMeetNamedHostFrontTheoremsProbe.
  #elabMeetNamedHostFrontTheoremsSubsetProbe
  HostCheck-subset probe lives in
  SystemsLean.ElabMeetNamedHostCheckProbe.
  #elabMeetNamedHostCheckSubsetProbe
  HostGraph-subset probe lives in
  SystemsLean.ElabMeetNamedHostGraphProbe.
  #elabMeetNamedHostGraphSubsetProbe
  HostGraphTheorems-subset probe lives in
  SystemsLean.ElabMeetNamedHostGraphTheoremsProbe.
  #elabMeetNamedHostGraphTheoremsSubsetProbe
  HostPackageWrite-subset probe lives in
  SystemsLean.ElabMeetNamedHostPackageWriteProbe.
  #elabMeetNamedHostPackageWriteSubsetProbe
  HostPackageWriteTheorems-subset probe lives in
  SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe.
  #elabMeetNamedHostPackageWriteTheoremsSubsetProbe
  HostPackageRoots-subset probe lives in
  SystemsLean.ElabMeetNamedHostPackageRootsProbe.
  #elabMeetNamedHostPackageRootsSubsetProbe
  HostImportGraphSeeds-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe.
  #elabMeetNamedHostImportGraphSeedsSubsetProbe
  HostImportGraphModel-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphModelProbe.
  #elabMeetNamedHostImportGraphModelSubsetProbe
  HostImportGraphMods-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphModsProbe.
  #elabMeetNamedHostImportGraphModsSubsetProbe
  HostImportGraphModsLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe.
  #elabMeetNamedHostImportGraphModsLaterSubsetProbe
  HostImportGraphLoadOkLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe.
  #elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe
  HostImportGraphWalkLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe.
  #elabMeetNamedHostImportGraphWalkLaterSubsetProbe
  HostImportGraphWalk-subset probe lives in
  SystemsLean.ElabMeetNamedHostImportGraphWalkProbe.
  #elabMeetNamedHostImportGraphWalkSubsetProbe
  HostModuleCheckRequiredDecls-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProbe.
  #elabMeetNamedHostModuleCheckRequiredDeclsSubsetProbe
  HostModuleCheckRequiredDeclsProduct-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.
  #elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe
  HostModuleCheckRequiredDeclsLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.
  #elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe
  HostModuleCheckFixtureTexts-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe.
  #elabMeetNamedHostModuleCheckFixtureTextsSubsetProbe
  HostModuleCheckFixtureTextsProduct-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe.
  #elabMeetNamedHostModuleCheckFixtureTextsProductSubsetProbe
  HostModuleCheckFixtureTextsLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe.
  #elabMeetNamedHostModuleCheckFixtureTextsLaterSubsetProbe
  HostModuleCheckFixtureTextsSelfHost-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe.
  #elabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetProbe
  HostModuleCheckFixtureTextsEmit-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe.
  #elabMeetNamedHostModuleCheckFixtureTextsEmitSubsetProbe
  HostModuleCheckFixtures-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe.
  #elabMeetNamedHostModuleCheckFixturesSubsetProbe
  HostModuleCheckSurface-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe.
  #elabMeetNamedHostModuleCheckSurfaceSubsetProbe
  HostModuleCheckCheckers-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe.
  #elabMeetNamedHostModuleCheckCheckersSubsetProbe
  HostModuleCheckCheckersLater-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe.
  #elabMeetNamedHostModuleCheckCheckersLaterSubsetProbe
  HostModuleCheckRealModule-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe.
  #elabMeetNamedHostModuleCheckRealModuleSubsetProbe
  HostModuleCheckEmitBodyTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe.
  #elabMeetNamedHostModuleCheckEmitBodyTermSubsetProbe
  HostModuleCheckKernelMultTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe.
  #elabMeetNamedHostModuleCheckKernelMultTermSubsetProbe
  HostModuleCheckKernelLinearTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe.
  #elabMeetNamedHostModuleCheckKernelLinearTermSubsetProbe
  HostModuleCheckKernelTypesTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe.
  #elabMeetNamedHostModuleCheckKernelTypesTermSubsetProbe
  HostModuleCheckKernelProgramTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckKernelProgramTermProbe.
  #elabMeetNamedHostModuleCheckKernelProgramTermSubsetProbe
  HostModuleCheckKernelEmitTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe.
  #elabMeetNamedHostModuleCheckKernelEmitTermSubsetProbe
  HostModuleCheckParityMultTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckParityMultTermProbe.
  #elabMeetNamedHostModuleCheckParityMultTermSubsetProbe
  HostModuleCheckParityLinearTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe.
  #elabMeetNamedHostModuleCheckParityLinearTermSubsetProbe
  HostModuleCheckParityTypesTerm-subset probe lives in
  SystemsLean.ElabMeetNamedHostModuleCheckParityTypesTermProbe.
  #elabMeetNamedHostModuleCheckParityTypesTermSubsetProbe
-/

set_option maxRecDepth 8192 in
/-- Slice ready: one-command drive is real and honesty holds.
    Partial drive is not full-package typecheck.
    Rec-depth 8192 keep. This fold ANDs HostModuleCheckParityTypesTerm.
    Do not skip to ParityProgramTerm in this fold. FullHost stays false.
    slakeOwnsPackageTypecheck stays false.
    Greppable: elabMeetReady. MULT-0 MULT-1 MULT-OMEGA (host Mult cite). -/
def elabMeetReady : Bool :=
  !slakeOwnsPackageTypecheck
  && !elabMeetFullHostElaborateRemains
  && elabMeetAcceptsGood
  && elabMeetRejectsBad
  && elabMeetDrivesOneModule
  && elabMeetAcceptsGoodTheorem
  && elabMeetRejectsBadTheorem
  && elabMeetDrivesOneTheorem
  && elabMeetAcceptsGoodImport
  && elabMeetRejectsBadImport
  && elabMeetDrivesOneImportedModule
  && elabMeetAcceptsGoodFile
  && elabMeetRejectsBadFile
  && elabMeetDrivesOneFileFromDisk
  && elabMeetAcceptsGoodOnDiskImport
  && elabMeetRejectsBadOnDiskImport
  && elabMeetDrivesOnDiskImport
  && elabMeetAcceptsGoodCompiledImport
  && elabMeetRejectsBadCompiledImport
  && elabMeetDrivesCompiledImport
  && elabMeetAcceptsGoodTwoModulePackage
  && elabMeetRejectsBadTwoModulePackage
  && elabMeetDrivesTwoModulePackage
  && elabMeetAcceptsGoodPackageDesc
  && elabMeetRejectsBadPackageDesc
  && elabMeetDrivesPackageDesc
  && elabMeetAcceptsGoodCompileOrder
  && elabMeetRejectsBadCompileOrder
  && elabMeetDrivesCompileOrder
  && elabMeetAcceptsGoodFollowImports
  && elabMeetRejectsBadFollowImports
  && elabMeetDrivesFollowImports
  && elabMeetAcceptsGoodFollowImportChain
  && elabMeetRejectsBadFollowImportChain
  && elabMeetDrivesFollowImportChain
  && elabMeetAcceptsGoodCycleReject
  && elabMeetRejectsBadCycleReject
  && elabMeetDrivesCycleReject
  && elabMeetAcceptsGoodPackageTheorem
  && elabMeetRejectsBadPackageTheorem
  && elabMeetDrivesPackageTheorem
  && elabMeetAcceptsGoodLibraryTheorem
  && elabMeetRejectsBadLibraryTheorem
  && elabMeetDrivesLibraryTheorem
  && elabMeetAcceptsGoodOleanReuse
  && elabMeetRejectsBadOleanReuse
  && elabMeetDrivesOleanReuse
  && elabMeetAcceptsUnchangedRebuildReuse
  && elabMeetRejectsStaleRebuild
  && elabMeetDrivesRebuildWhenChanged
  && elabMeetAcceptsDependentRebuild
  && elabMeetRejectsStaleDependent
  && elabMeetDrivesDependentRebuild
  && elabMeetAcceptsGoodRicherPackageDesc
  && elabMeetRejectsBadRicherPackageDesc
  && elabMeetRejectsModuleOnlyRicherPackageDesc
  && elabMeetDrivesRicherPackageDesc
  && elabMeetAcceptsGoodNamedLibraryTargets
  && elabMeetRejectsMissingNamedLibraryTarget
  && elabMeetRejectsSingleLibAsNamedTargets
  && elabMeetDrivesNamedLibraryTargets
  && elabMeetAcceptsGoodDefaultLibraryTarget
  && elabMeetRejectsMissingDefaultLibraryTarget
  && elabMeetRejectsRequestOnlyAsDefault
  && elabMeetDrivesDefaultLibraryTarget
  && elabMeetAcceptsGoodSourceDirectory
  && elabMeetRejectsMissingSourceDirectory
  && elabMeetRejectsCwdOnlyAsSourceDirectory
  && elabMeetDrivesSourceDirectory
  && elabMeetAcceptsGoodExecutableTarget
  && elabMeetRejectsMissingExecutableTarget
  && elabMeetRejectsLibraryOnlyAsExecutable
  && elabMeetDrivesExecutableTarget
  && elabMeetAcceptsGoodExecutableImport
  && elabMeetRejectsMissingExeImpLib
  && elabMeetRejectsMissingExeImp
  && elabMeetRejectsExeOnlyAsExecutableImport
  && elabMeetDrivesExecutableImport
  && elabMeetAcceptsGoodExecutableMultiLib
  && elabMeetRejectsMissingExeMultiLib
  && elabMeetRejectsOneLibAsExecutableMultiLib
  && elabMeetDrivesExecutableMultiLib
  && elabMeetAcceptsGoodExecutableTargets
  && elabMeetRejectsMissingExeTwo
  && elabMeetRejectsOneExeAsExecutableTargets
  && elabMeetDrivesExecutableTargets
  && elabMeetAcceptsGoodDefaultExecutableTarget
  && elabMeetRejectsMissingDefaultExecutableTarget
  && elabMeetRejectsRequestOnlyAsDefaultExecutable
  && elabMeetDrivesDefaultExecutableTarget
  && elabMeetAcceptsGoodExecutableSourceDirectory
  && elabMeetRejectsMissingExecutableSourceDirectory
  && elabMeetRejectsCwdOnlyAsExecutableSourceDirectory
  && elabMeetDrivesExecutableSourceDirectory
  && elabMeetAcceptsGoodExecutableImportSourceDirectory
  && elabMeetRejectsMissingExecutableImportSourceDirectory
  && elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory
  && elabMeetDrivesExecutableImportSourceDirectory
  && elabMeetAcceptsGoodExecutableMultiLibSourceDirectory
  && elabMeetRejectsMissingExecutableMultiLibSourceDirectory
  && elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory
  && elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory
  && elabMeetDrivesExecutableMultiLibSourceDirectory
  && elabMeetAcceptsGoodExecutableTargetsSourceDirectory
  && elabMeetRejectsMissingExecutableTargetsSourceDirectory
  && elabMeetRejectsCwdOnlyAsExecutableTargetsSourceDirectory
  && elabMeetRejectsOneExeAsExecutableTargetsSourceDirectory
  && elabMeetDrivesExecutableTargetsSourceDirectory
  && elabMeetAcceptsGoodDefaultExecutableSourceDirectory
  && elabMeetRejectsMissingDefaultExecutableSourceDirectory
  && elabMeetRejectsBothAsDefaultExecutableSourceDirectory
  && elabMeetRejectsCwdDefaultAsDefaultExecutableSourceDirectory
  && elabMeetDrivesDefaultExecutableSourceDirectory
  && elabMeetAcceptsGoodLiveModule
  && elabMeetRejectsBadLiveModule
  && elabMeetRejectsOldWalkAsLiveModule
  && elabMeetDrivesLiveModule
  && elabMeetAcceptsGoodLiveTheorems
  && elabMeetRejectsBadLiveTheorems
  && elabMeetRejectsOldWalkAsLiveTheorems
  && elabMeetDrivesLiveTheorems
  && elabMeetAcceptsGoodNamedSubset
  && elabMeetRejectsBadNamedSubset
  && elabMeetRejectsOldWalkAsNamedSubset
  && elabMeetDrivesNamedSubset
  && elabMeetAcceptsGoodNamedTypesTheoremsSubset
  && elabMeetRejectsBadNamedTypesTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset
  && elabMeetDrivesNamedTypesTheoremsSubset
  && elabMeetAcceptsGoodNamedErasureSubset
  && elabMeetRejectsBadNamedErasureSubset
  && elabMeetRejectsOldWalkAsNamedErasureSubset
  && elabMeetDrivesNamedErasureSubset
  && elabMeetAcceptsGoodNamedErasureTheoremsSubset
  && elabMeetRejectsBadNamedErasureTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset
  && elabMeetDrivesNamedErasureTheoremsSubset
  && elabMeetAcceptsGoodNamedExtractSubset
  && elabMeetRejectsBadNamedExtractSubset
  && elabMeetRejectsOldWalkAsNamedExtractSubset
  && elabMeetDrivesNamedExtractSubset
  && elabMeetAcceptsGoodNamedExtractTheoremsSubset
  && elabMeetRejectsBadNamedExtractTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset
  && elabMeetDrivesNamedExtractTheoremsSubset
  && elabMeetAcceptsGoodNamedIrProgramSubset
  && elabMeetRejectsBadNamedIrProgramSubset
  && elabMeetRejectsOldWalkAsNamedIrProgramSubset
  && elabMeetDrivesNamedIrProgramSubset
  && elabMeetAcceptsGoodNamedIrProgramTheoremsSubset
  && elabMeetRejectsBadNamedIrProgramTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset
  && elabMeetDrivesNamedIrProgramTheoremsSubset
  && elabMeetAcceptsGoodNamedHostTermSubset
  && elabMeetRejectsBadNamedHostTermSubset
  && elabMeetRejectsOldWalkAsNamedHostTermSubset
  && elabMeetDrivesNamedHostTermSubset
  && elabMeetAcceptsGoodNamedHostFrontGoldensSubset
  && elabMeetRejectsBadNamedHostFrontGoldensSubset
  && elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset
  && elabMeetDrivesNamedHostFrontGoldensSubset
  && elabMeetAcceptsGoodNamedHostFrontSubset
  && elabMeetRejectsBadNamedHostFrontSubset
  && elabMeetRejectsOldWalkAsNamedHostFrontSubset
  && elabMeetDrivesNamedHostFrontSubset
  && elabMeetAcceptsGoodNamedHostFrontTheoremsSubset
  && elabMeetRejectsBadNamedHostFrontTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset
  && elabMeetDrivesNamedHostFrontTheoremsSubset
  && elabMeetAcceptsGoodNamedHostCheckSubset
  && elabMeetRejectsBadNamedHostCheckSubset
  && elabMeetRejectsOldWalkAsNamedHostCheckSubset
  && elabMeetDrivesNamedHostCheckSubset
  && elabMeetAcceptsGoodNamedHostGraphSubset
  && elabMeetRejectsBadNamedHostGraphSubset
  && elabMeetRejectsOldWalkAsNamedHostGraphSubset
  && elabMeetDrivesNamedHostGraphSubset
  && elabMeetAcceptsGoodNamedHostGraphTheoremsSubset
  && elabMeetRejectsBadNamedHostGraphTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset
  && elabMeetDrivesNamedHostGraphTheoremsSubset
  && elabMeetAcceptsGoodNamedHostPackageWriteSubset
  && elabMeetRejectsBadNamedHostPackageWriteSubset
  && elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset
  && elabMeetDrivesNamedHostPackageWriteSubset
  && elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset
  && elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset
  && elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset
  && elabMeetDrivesNamedHostPackageWriteTheoremsSubset
  && elabMeetAcceptsGoodNamedHostPackageRootsSubset
  && elabMeetRejectsBadNamedHostPackageRootsSubset
  && elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset
  && elabMeetDrivesNamedHostPackageRootsSubset
  && elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset
  && elabMeetRejectsBadNamedHostImportGraphSeedsSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset
  && elabMeetDrivesNamedHostImportGraphSeedsSubset
  && elabMeetAcceptsGoodNamedHostImportGraphModelSubset
  && elabMeetRejectsBadNamedHostImportGraphModelSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset
  && elabMeetDrivesNamedHostImportGraphModelSubset
  && elabMeetAcceptsGoodNamedHostImportGraphModsSubset
  && elabMeetRejectsBadNamedHostImportGraphModsSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset
  && elabMeetDrivesNamedHostImportGraphModsSubset
  && elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset
  && elabMeetRejectsBadNamedHostImportGraphModsLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset
  && elabMeetDrivesNamedHostImportGraphModsLaterSubset
  && elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset
  && elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset
  && elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset
  && elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset
  && elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset
  && elabMeetDrivesNamedHostImportGraphWalkLaterSubset
  && elabMeetAcceptsGoodNamedHostImportGraphWalkSubset
  && elabMeetRejectsBadNamedHostImportGraphWalkSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphWalkSubset
  && elabMeetDrivesNamedHostImportGraphWalkSubset
  && elabMeetReadyHostModuleCheck
  && elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset
  && elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckParityMultTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckParityMultTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckParityMultTermSubset
  && elabMeetDrivesNamedHostModuleCheckParityMultTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset
  && elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset
  && elabMeetAcceptsGoodNamedHostModuleCheckParityTypesTermSubset
  && elabMeetRejectsBadNamedHostModuleCheckParityTypesTermSubset
  && elabMeetRejectsOldWalkAsNamedHostModuleCheckParityTypesTermSubset
  && elabMeetDrivesNamedHostModuleCheckParityTypesTermSubset


/-! ### ELAB-MEET-THEOREM (honesty flags; drive theorems live in ElabMeetTheorems) -/

theorem slakeOwnsPackageTypecheck_false : slakeOwnsPackageTypecheck = false := by
  native_decide

theorem elabMeetFullHostElaborateRemains_false :
    elabMeetFullHostElaborateRemains = false := by
  native_decide

set_option maxRecDepth 8192 in
theorem elabMeetReady_true : elabMeetReady = true := by
  native_decide

/-
  ELAB-MEET-SMOKE examples live in SystemsLean.ElabMeetDefSrc
  so this file stays under the line cap.
-/

example : slakeOwnsPackageTypecheck = false := rfl
example : elabMeetFullHostElaborateRemains = false := rfl
set_option maxRecDepth 8192 in
example : elabMeetReady = true := rfl

end SystemsLean.ElabMeet
