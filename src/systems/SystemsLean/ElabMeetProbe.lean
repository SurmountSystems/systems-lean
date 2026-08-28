/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet probe snippets.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeet: payload strings for probes.
  Compile helpers stay in SystemsLean.ElabMeetCompile. Probes and
  theorems stay in ElabMeet. Same namespace SystemsLean.ElabMeet.

  Spec (readable):
  - Snippet strings only. No elaborator. No second compile walk.
  - Cycle-reject payloads: acyclic mid is a plain library; cyclic mid
    imports the tip. Description names only the tip.
  - Package-theorem payloads: listed module holds theorem t : 1 = 1
    := rfl (accept) or theorem t : 1 = 2 := rfl (reject).
  - Library-theorem payloads: library holds theorem libFact : 1 = 1
    := rfl; importer theorem useFact uses libFact (accept) or
    useFact : 1 = 2 := libFact (reject).
  - Olean-reuse payloads: library holds def reuseFromDisk; importer
    uses that constant after the compiled .olean is reused.
  - Rebuild-when-changed payloads: library holds def rebuildWhen;
    unchanged source reuses the .olean; changed source rebuilds.
  - Dependent-rebuild payloads: library holds def depLib; importer
    uses it; changing the library rebuilds the importer.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  goodSnippet, badSnippet, goodTheoremSnippet, badTheoremSnippet,
  goodImportSnippet, badImportSnippet, goodFileSnippet, badFileSnippet,
  onDiskLibSnippet, goodOnDiskImportSnippet, badOnDiskImportSnippet,
  compiledLibSnippet, goodCompiledImportSnippet, badCompiledLibSnippet,
  twoModuleLibSnippet, goodTwoModuleImporterSnippet,
  badTwoModuleImporterSnippet, goodPackageDescText, badPackageDescText,
  packageDescLibSnippet, goodPackageDescImporterSnippet,
  goodOrderDescText, orderLibSnippet, goodOrderImporterSnippet,
  badOrderLibSnippet, omitLibSnippet, goodFollowImporterSnippet,
  goodFollowDescText, chainBaseSnippet, goodChainMidSnippet,
  goodChainTipSnippet, goodChainDescText, cycleMidLibSnippet,
  goodCycleTipSnippet, goodCycleDescText, badCycleMidSnippet,
  pkgTheoremLibSnippet, goodPkgTheoremSnippet, badPkgTheoremSnippet,
  goodPkgTheoremDescText, libFactSnippet, goodUseFactSnippet,
  badUseFactSnippet, goodLibFactDescText, oleanReuseLibSnippet,
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
  ElabMeetExeTwoSrcA, ElabMeetExeTwoSrcB, ElabMeetExeTwoSrcMissing,
  ElabMeetDefExeSrcA, ElabMeetDefExeSrcB, ElabMeetDefExeSrcMissing,
  ElabMeetExeSrcMain, ElabMeetExeSrcMissing,
  ElabMeetExeImpSrcLib, ElabMeetExeImpSrcMain,
  ElabMeetExeImpSrcMissing,
  ElabMeetExeMultiSrcLibA, ElabMeetExeMultiSrcLibB,
  ElabMeetExeMultiSrcMain, ElabMeetExeMultiSrcMissing,
  ElabMeetProbe, SystemsLean.ElabMeetProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetProbe; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

namespace SystemsLean.ElabMeet

/-- Well-typed Lean 4 definition payload (one command). -/
def goodSnippet : String := "def n : Nat := 0"

/-- Ill-typed Lean 4 definition payload (Nat vs Bool). -/
def badSnippet : String := "def n : Nat := true"

/-- Well-typed Lean 4 theorem payload (one command). -/
def goodTheoremSnippet : String := "theorem t : 1 = 1 := rfl"

/-- Ill-typed Lean 4 theorem payload (1 = 2 is false). -/
def badTheoremSnippet : String := "theorem t : 1 = 2 := rfl"

/-- Well-typed import-using command sequence (header plus one def). -/
def goodImportSnippet : String :=
  "import Init.Data.Nat.Basic\ndef k : Nat := Nat.succ 0"

/-- Ill-typed import-using command sequence (module does not exist). -/
def badImportSnippet : String :=
  "import ElabMeet.NoSuchModule\ndef k : Nat := 0"

/-- Well-typed tiny file body written then read from disk. -/
def goodFileSnippet : String :=
  "import Init.Data.Nat.Basic\ndef k : Nat := Nat.succ 0"

/-- Ill-typed tiny file body written then read from disk (Nat vs Bool). -/
def badFileSnippet : String := "def n : Nat := true"

/-- Library module Slake writes to disk for the on-disk import probe. -/
def onDiskLibSnippet : String := "def fromDisk : Nat := 1"

/-- Importer that names the on-disk library (not only Init.*). -/
def goodOnDiskImportSnippet : String :=
  "import ElabMeetOnDisk\ndef k : Nat := fromDisk"

/-- Importer that names a sibling module that is not on disk. -/
def badOnDiskImportSnippet : String :=
  "import ElabMeetOnDiskMissing\ndef k : Nat := 0"

/-- Library source written to disk, then compiled to an `.olean`. -/
def compiledLibSnippet : String := "def compiledFromDisk : Nat := 2"

/-- Importer that names the compiled on-disk module (not only Init.*). -/
def goodCompiledImportSnippet : String :=
  "import ElabMeetCompiled\ndef k : Nat := compiledFromDisk"

/-- Ill-typed library source. Compile must fail-closed. -/
def badCompiledLibSnippet : String := "def n : Nat := true"

/-- Library module for the two-module package compile probe. -/
def twoModuleLibSnippet : String := "def pkgLib : Nat := 3"

/-- Importer that names the compiled library and uses pkgLib. -/
def goodTwoModuleImporterSnippet : String :=
  "import ElabMeetPkgLib\ndef k : Nat := pkgLib"

/-- Ill-typed importer. Package compile must fail-closed. -/
def badTwoModuleImporterSnippet : String :=
  "import ElabMeetPkgLib\ndef k : Nat := true"

/-- Tiny package description: names a library plus an importer.
    Plain text. Not a Lake lakefile. -/
def goodPackageDescText : String :=
  "module ElabMeetDescLib\nmodule ElabMeetDescImp"

/-- Same shape, but the second name has no source file. -/
def badPackageDescText : String :=
  "module ElabMeetDescLib\nmodule ElabMeetDescMissing"

/-- Library named by the good package description. -/
def packageDescLibSnippet : String := "def descLib : Nat := 4"

/-- Importer named by the good package description; uses descLib. -/
def goodPackageDescImporterSnippet : String :=
  "import ElabMeetDescLib\ndef k : Nat := descLib"

/-- Library for the compile-order probe. -/
def orderLibSnippet : String := "def orderLib : Nat := 4"

/-- Importer that uses orderLib. Description lists this first. -/
def goodOrderImporterSnippet : String :=
  "import ElabMeetOrderLib\ndef k : Nat := orderLib"

/-- Ill-typed library. Ordered compile must fail-closed. -/
def badOrderLibSnippet : String := "def n : Nat := true"

/-- Description lists importer first, then library. -/
def goodOrderDescText : String :=
  "module ElabMeetOrderImp\nmodule ElabMeetOrderLib"

/-- Library the follow-imports probe must compile even though the
    description does not name it. -/
def omitLibSnippet : String := "def omitLib : Nat := 5"

/-- Importer that uses omitLib. Description names only this module. -/
def goodFollowImporterSnippet : String :=
  "import ElabMeetOmitLib\ndef k : Nat := omitLib"

/-- Description names only the importer (omitted library is a follow). -/
def goodFollowDescText : String := "module ElabMeetOmitImp"

/-- Deepest library in the follow-import-chain probe. -/
def chainBaseSnippet : String := "def chainBase : Nat := 5"

/-- Mid library: imports the base and defines chainMid from chainBase. -/
def goodChainMidSnippet : String :=
  "import ElabMeetChainBase\ndef chainMid : Nat := chainBase"

/-- Tip importer: uses chainMid. Description names only this module. -/
def goodChainTipSnippet : String :=
  "import ElabMeetChainMid\ndef k : Nat := chainMid"

/-- Description names only the tip (mid and base are a follow chain). -/
def goodChainDescText : String := "module ElabMeetChainTip"

/-- Library the cycle-reject probe compiles when there is no cycle. -/
def cycleMidLibSnippet : String := "def cycleLib : Nat := 5"

/-- Tip importer: uses cycleLib. Description names only this module. -/
def goodCycleTipSnippet : String :=
  "import ElabMeetCycleMid\ndef k : Nat := cycleLib"

/-- Description names only the tip (mid is omitted). -/
def goodCycleDescText : String := "module ElabMeetCycleTip"

/-- Mid library that imports the tip (the cycle). -/
def badCycleMidSnippet : String :=
  "import ElabMeetCycleTip\ndef cycleLib : Nat := 5"

/-- Library named beside the package-theorem module. -/
def pkgTheoremLibSnippet : String := "def pkgThmLib : Nat := 6"

/-- Package module that holds a well-typed theorem. -/
def goodPkgTheoremSnippet : String :=
  "import ElabMeetPkgThmLib\ntheorem t : 1 = 1 := rfl"

/-- Package module that holds an ill-typed theorem. -/
def badPkgTheoremSnippet : String :=
  "import ElabMeetPkgThmLib\ntheorem t : 1 = 2 := rfl"

/-- Tiny package description: library plus the theorem module. -/
def goodPkgTheoremDescText : String :=
  "module ElabMeetPkgThmLib\nmodule ElabMeetPkgThm"

/-- Library that proves a theorem the importer may use. -/
def libFactSnippet : String := "theorem libFact : 1 = 1 := rfl"

/-- Importer theorem that uses the compiled library fact. -/
def goodUseFactSnippet : String :=
  "import ElabMeetLibFact\ntheorem useFact : 1 = 1 := libFact"

/-- Importer theorem whose type does not match libFact. -/
def badUseFactSnippet : String :=
  "import ElabMeetLibFact\ntheorem useFact : 1 = 2 := libFact"

/-- Tiny package description: library plus the importer. -/
def goodLibFactDescText : String :=
  "module ElabMeetLibFact\nmodule ElabMeetUseFact"

/-- Library compiled once; second load must reuse this constant. -/
def oleanReuseLibSnippet : String := "def reuseFromDisk : Nat := 7"

/-- Importer that uses the compiled reuseFromDisk constant. -/
def goodOleanReuseImporterSnippet : String :=
  "import ElabMeetOleanReuse\ndef k : Nat := reuseFromDisk"

/-- Library compiled once; second compile must reuse when unchanged. -/
def rebuildWhenLibSnippet : String := "def rebuildWhen : Nat := 3"

/-- Same library after a well-typed source-byte change. -/
def rebuildWhenChangedLibSnippet : String := "def rebuildWhen : Nat := 4"

/-- Importer that uses rebuildWhen after an unchanged second compile. -/
def goodRebuildWhenImporterSnippet : String :=
  "import ElabMeetRebuildWhen\ndef k : Nat := rebuildWhen"

/-- Importer that sees the rebuilt meaning (4, not 3). -/
def goodRebuildWhenChangedImporterSnippet : String :=
  "import ElabMeetRebuildWhen\nexample : rebuildWhen = 4 := rfl"

/-- Library compiled first; importer depends on this constant. -/
def depLibSnippet : String := "def depLib : Nat := 3"

/-- Same library after a well-typed source-byte change. -/
def depLibChangedSnippet : String := "def depLib : Nat := 4"

/-- Importer compiled against the library `.olean`; uses depLib. -/
def goodDepLibImporterSnippet : String :=
  "import ElabMeetDepLib\ndef k : Nat := depLib"

/-- Stale-check / rebuilt check: importer must see the new meaning. -/
def goodDepLibChangedImporterSnippet : String :=
  "import ElabMeetDepLib\nexample : depLib = 4 := rfl"

/-- Library named by the richer library-target stanza. -/
def richLibSnippet : String := "def richLib : Nat := 9"

/-- Importer that uses richLib. Description names this under the target. -/
def goodRichImporterSnippet : String :=
  "import ElabMeetRichLib\ndef k : Nat := richLib"

/-- Richer description: a library target plus the modules under it.
    Not only `module Name` lines. Not a Lake lakefile. -/
def goodRicherPackageDescText : String :=
  "lean_lib ElabMeetRichLib\nmodule ElabMeetRichLib\nmodule ElabMeetRichImp"

/-- Same stanza shape, but the library target has no on-disk module.
    Reject token ElabMeetRichMissing is not ElabMeetDescMissing. -/
def badRicherPackageDescText : String :=
  "lean_lib ElabMeetRichMissing\nmodule ElabMeetRichMissing\nmodule ElabMeetRichImp"

/-- Module-only text that names the same richer modules. Name 103
    would accept this when both sources exist. Not a richer accept. -/
def moduleOnlyRicherPackageDescText : String :=
  "module ElabMeetRichLib\nmodule ElabMeetRichImp"

/-- First named library target. Stanza name is the module. -/
def libASnippet : String := "def libA : Nat := 1"

/-- Second named library target. Stanza name is the module. -/
def libBSnippet : String := "def libB : Nat := 2"

/-- Two `lean_lib` stanzas. Not a Lake lakefile. Not one-library richer. -/
def goodNamedLibraryTargetsText : String :=
  "lean_lib ElabMeetLibA\nlean_lib ElabMeetLibB"

/-- Same two-stanza shape, but the second target has no on-disk module.
    Reject token ElabMeetLibMissing is not ElabMeetRichMissing. -/
def badNamedLibraryTargetsText : String :=
  "lean_lib ElabMeetLibA\nlean_lib ElabMeetLibMissing"

/-- First default-library target. Distinct from Name 114 ElabMeetLibA. -/
def defLibASnippet : String := "def defLibA : Nat := 1"

/-- Second default-library target. Distinct from Name 114 ElabMeetLibB. -/
def defLibBSnippet : String := "def defLibB : Nat := 2"

/-- Two `lean_lib` stanzas plus a default. Not a Name 114 request walk. -/
def goodDefaultLibraryTargetText : String :=
  "lean_lib ElabMeetDefLibA\nlean_lib ElabMeetDefLibB\ndefault ElabMeetDefLibA"

/-- Same two-stanza shape, but the default names a missing target.
    Reject token ElabMeetDefMissing is not ElabMeetLibMissing. -/
def badDefaultLibraryTargetText : String :=
  "lean_lib ElabMeetDefLibA\nlean_lib ElabMeetDefLibB\ndefault ElabMeetDefMissing"

/-- Library that lives under the listed source directory. -/
def srcLibSnippet : String := "def srcLib : Nat := 8"

/-- One `lean_lib`, one `srcDir`, one module. Not cwd-only. -/
def goodSourceDirectoryText : String :=
  "lean_lib ElabMeetSrcLib\nsrcDir src\nmodule ElabMeetSrcLib"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetSrcMissing is not ElabMeetDefMissing. -/
def badSourceDirectoryText : String :=
  "lean_lib ElabMeetSrcMissing\nsrcDir ElabMeetSrcMissing\nmodule ElabMeetSrcMissing"

/-- Executable module named by `lean_exe`. Not a library. -/
def exeMainSnippet : String := "def exeMain : Nat := 9"

/-- One `lean_exe` plus the executable module. Not a library-only walk. -/
def goodExecutableTargetText : String :=
  "lean_exe ElabMeetExeMain\nmodule ElabMeetExeMain"

/-- Same shape, but the executable module is missing.
    Reject token ElabMeetExeMissing is not ElabMeetSrcMissing. -/
def badExecutableTargetText : String :=
  "lean_exe ElabMeetExeMissing\nmodule ElabMeetExeMissing"

/-- Library the executable-import probe compiles first. -/
def exeImpLibSnippet : String := "def exeImpLib : Nat := 3"

/-- Executable that imports the compiled library and uses exeImpLib. -/
def goodExeImpMainSnippet : String :=
  "import ElabMeetExeImpLib\ndef exeImpMain : Nat := exeImpLib"

/-- One `lean_lib` plus one `lean_exe`. Not a Name 117 exe-only walk. -/
def goodExecutableImportText : String :=
  "lean_lib ElabMeetExeImpLib\nlean_exe ElabMeetExeImpMain\nmodule ElabMeetExeImpLib\nmodule ElabMeetExeImpMain"

/-- Same shape, but the library module is missing.
    Reject token ElabMeetExeImpLibMissing is not ElabMeetExeMissing. -/
def badExecutableImportLibText : String :=
  "lean_lib ElabMeetExeImpLibMissing\nlean_exe ElabMeetExeImpMain\nmodule ElabMeetExeImpLibMissing\nmodule ElabMeetExeImpMain"

/-- Same shape, but the executable module is missing.
    Reject token ElabMeetExeImpMissing is not ElabMeetExeMissing. -/
def badExecutableImportExeText : String :=
  "lean_lib ElabMeetExeImpLib\nlean_exe ElabMeetExeImpMissing\nmodule ElabMeetExeImpLib\nmodule ElabMeetExeImpMissing"

/-- First library the executable-multi-lib probe compiles. -/
def exeMultiLibASnippet : String := "def exeMultiLibA : Nat := 1"

/-- Second library the executable-multi-lib probe compiles. -/
def exeMultiLibBSnippet : String := "def exeMultiLibB : Nat := 2"

/-- Executable that imports both compiled libraries and uses them. -/
def goodExeMultiMainSnippet : String :=
  "import ElabMeetExeMultiLibA\n" ++
    "import ElabMeetExeMultiLibB\n" ++
    "def exeMultiMain : Nat := exeMultiLibA + exeMultiLibB"

/-- Two `lean_lib` plus one `lean_exe`. Not a Name 118 one-library walk. -/
def goodExecutableMultiLibText : String :=
  "lean_lib ElabMeetExeMultiLibA\n" ++
    "lean_lib ElabMeetExeMultiLibB\n" ++
    "lean_exe ElabMeetExeMultiMain\n" ++
    "module ElabMeetExeMultiLibA\n" ++
    "module ElabMeetExeMultiLibB\n" ++
    "module ElabMeetExeMultiMain"

/-- Same shape, but library A is missing.
    Reject token ElabMeetExeMultiLibAMissing is not ElabMeetExeImpLibMissing. -/
def badExecutableMultiLibText : String :=
  "lean_lib ElabMeetExeMultiLibAMissing\n" ++
    "lean_lib ElabMeetExeMultiLibB\n" ++
    "lean_exe ElabMeetExeMultiMain\n" ++
    "module ElabMeetExeMultiLibAMissing\n" ++
    "module ElabMeetExeMultiLibB\n" ++
    "module ElabMeetExeMultiMain"

/-- First standalone executable. Distinct from Name 117 ElabMeetExeMain. -/
def exeTwoASnippet : String := "def exeTwoA : Nat := 1"

/-- Second standalone executable. Distinct from Name 117 ElabMeetExeMain. -/
def exeTwoBSnippet : String := "def exeTwoB : Nat := 2"

/-- Two `lean_exe` plus two module lines. Not a Name 117 one-exe walk. -/
def goodExecutableTargetsText : String :=
  "lean_exe ElabMeetExeTwoA\n" ++
    "module ElabMeetExeTwoA\n" ++
    "lean_exe ElabMeetExeTwoB\n" ++
    "module ElabMeetExeTwoB"

/-- Same two-exe shape, but the second executable is missing.
    Reject token ElabMeetExeTwoMissing is not ElabMeetExeMissing. -/
def badExecutableTargetsText : String :=
  "lean_exe ElabMeetExeTwoA\n" ++
    "module ElabMeetExeTwoA\n" ++
    "lean_exe ElabMeetExeTwoMissing\n" ++
    "module ElabMeetExeTwoMissing"

/-- First default-executable target. Distinct from Name 120 ElabMeetExeTwoA. -/
def defExeASnippet : String := "def defExeA : Nat := 1"

/-- Second default-executable target. Distinct from Name 120 ElabMeetExeTwoB. -/
def defExeBSnippet : String := "def defExeB : Nat := 2"

/-- Two `lean_exe` plus a default. Not a Name 120 no-default walk. -/
def goodDefaultExecutableTargetText : String :=
  "lean_exe ElabMeetDefExeA\n" ++
    "module ElabMeetDefExeA\n" ++
    "lean_exe ElabMeetDefExeB\n" ++
    "module ElabMeetDefExeB\n" ++
    "default ElabMeetDefExeA"

/-- Same two-exe shape, but the default names a missing target.
    Reject token ElabMeetDefExeMissing is not ElabMeetExeTwoMissing. -/
def badDefaultExecutableTargetText : String :=
  "lean_exe ElabMeetDefExeA\n" ++
    "module ElabMeetDefExeA\n" ++
    "lean_exe ElabMeetDefExeB\n" ++
    "module ElabMeetDefExeB\n" ++
    "default ElabMeetDefExeMissing"

/-- Executable that lives under the listed source directory.
    Distinct from ElabMeetExeMain and ElabMeetSrcLib. -/
def exeSrcMainSnippet : String := "def exeSrcMain : Nat := 8"

/-- One `lean_exe`, one `srcDir`, one module. Not cwd-only. -/
def goodExecutableSourceDirectoryText : String :=
  "lean_exe ElabMeetExeSrcMain\nsrcDir src\nmodule ElabMeetExeSrcMain"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetExeSrcMissing is not ElabMeetSrcMissing
    and not ElabMeetExeMissing. -/
def badExecutableSourceDirectoryText : String :=
  "lean_exe ElabMeetExeSrcMissing\nsrcDir ElabMeetExeSrcMissing\nmodule ElabMeetExeSrcMissing"

/-- Library the executable-import source-directory probe compiles first.
    Distinct from ElabMeetExeImpLib. -/
def exeImpSrcLibSnippet : String := "def exeImpSrcLib : Nat := 3"

/-- Executable that imports that library from the same source directory. -/
def goodExeImpSrcMainSnippet : String :=
  "import ElabMeetExeImpSrcLib\ndef exeImpSrcMain : Nat := exeImpSrcLib"

/-- One `lean_lib`, one `lean_exe`, one `srcDir`. Not cwd-only Name 118. -/
def goodExecutableImportSourceDirectoryText : String :=
  "lean_lib ElabMeetExeImpSrcLib\n" ++
    "lean_exe ElabMeetExeImpSrcMain\n" ++
    "srcDir src\n" ++
    "module ElabMeetExeImpSrcLib\n" ++
    "module ElabMeetExeImpSrcMain"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetExeImpSrcMissing is not ElabMeetExeSrcMissing,
    not ElabMeetExeImpLibMissing, and not ElabMeetSrcMissing. -/
def badExecutableImportSourceDirectoryText : String :=
  "lean_lib ElabMeetExeImpSrcMissing\n" ++
    "lean_exe ElabMeetExeImpSrcMain\n" ++
    "srcDir ElabMeetExeImpSrcMissing\n" ++
    "module ElabMeetExeImpSrcMissing\n" ++
    "module ElabMeetExeImpSrcMain"

/-- First library the multi-lib source-directory probe compiles.
    Distinct from ElabMeetExeMultiLibA and ElabMeetExeImpSrcLib. -/
def exeMultiSrcLibASnippet : String := "def exeMultiSrcLibA : Nat := 1"

/-- Second library the multi-lib source-directory probe compiles.
    Distinct from ElabMeetExeMultiLibB. -/
def exeMultiSrcLibBSnippet : String := "def exeMultiSrcLibB : Nat := 2"

/-- Executable that imports both libraries from the same source directory. -/
def goodExeMultiSrcMainSnippet : String :=
  "import ElabMeetExeMultiSrcLibA\n" ++
    "import ElabMeetExeMultiSrcLibB\n" ++
    "def exeMultiSrcMain : Nat := exeMultiSrcLibA + exeMultiSrcLibB"

/-- Two `lean_lib`, one `lean_exe`, one `srcDir`. Not cwd-only Name 119. -/
def goodExecutableMultiLibSourceDirectoryText : String :=
  "lean_lib ElabMeetExeMultiSrcLibA\n" ++
    "lean_lib ElabMeetExeMultiSrcLibB\n" ++
    "lean_exe ElabMeetExeMultiSrcMain\n" ++
    "srcDir src\n" ++
    "module ElabMeetExeMultiSrcLibA\n" ++
    "module ElabMeetExeMultiSrcLibB\n" ++
    "module ElabMeetExeMultiSrcMain"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetExeMultiSrcMissing is not
    ElabMeetExeImpSrcMissing, not ElabMeetExeMultiLibAMissing,
    and not ElabMeetExeSrcMissing. -/
def badExecutableMultiLibSourceDirectoryText : String :=
  "lean_lib ElabMeetExeMultiSrcMissing\n" ++
    "lean_lib ElabMeetExeMultiSrcLibB\n" ++
    "lean_exe ElabMeetExeMultiSrcMain\n" ++
    "srcDir ElabMeetExeMultiSrcMissing\n" ++
    "module ElabMeetExeMultiSrcMissing\n" ++
    "module ElabMeetExeMultiSrcLibB\n" ++
    "module ElabMeetExeMultiSrcMain"

/-- First standalone executable under the listed source directory.
    Distinct from Name 120 ElabMeetExeTwoA and Name 122 ElabMeetExeSrcMain. -/
def exeTwoSrcASnippet : String := "def exeTwoSrcA : Nat := 1"

/-- Second standalone executable under the listed source directory.
    Distinct from Name 120 ElabMeetExeTwoB and Name 122 ElabMeetExeSrcMain. -/
def exeTwoSrcBSnippet : String := "def exeTwoSrcB : Nat := 2"

/-- Two `lean_exe`, one `srcDir`. Not cwd-only Name 120. -/
def goodExecutableTargetsSourceDirectoryText : String :=
  "lean_exe ElabMeetExeTwoSrcA\n" ++
    "lean_exe ElabMeetExeTwoSrcB\n" ++
    "srcDir src\n" ++
    "module ElabMeetExeTwoSrcA\n" ++
    "module ElabMeetExeTwoSrcB"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetExeTwoSrcMissing is not
    ElabMeetExeTwoMissing, not ElabMeetExeSrcMissing,
    not ElabMeetExeMultiSrcMissing, and not ElabMeetExeImpSrcMissing. -/
def badExecutableTargetsSourceDirectoryText : String :=
  "lean_exe ElabMeetExeTwoSrcA\n" ++
    "lean_exe ElabMeetExeTwoSrcB\n" ++
    "srcDir ElabMeetExeTwoSrcMissing\n" ++
    "module ElabMeetExeTwoSrcA\n" ++
    "module ElabMeetExeTwoSrcB"

/-- First default-executable under the listed source directory.
    Distinct from Name 121 ElabMeetDefExeA and Name 125 ElabMeetExeTwoSrcA. -/
def defExeSrcASnippet : String := "def defExeSrcA : Nat := 1"

/-- Second default-executable under the listed source directory.
    Distinct from Name 121 ElabMeetDefExeB and Name 125 ElabMeetExeTwoSrcB. -/
def defExeSrcBSnippet : String := "def defExeSrcB : Nat := 2"

/-- Two `lean_exe`, one `srcDir`, one `default`. Not Name 125 (no default)
    and not Name 121 (no srcDir). -/
def goodDefaultExecutableSourceDirectoryText : String :=
  "lean_exe ElabMeetDefExeSrcA\n" ++
    "lean_exe ElabMeetDefExeSrcB\n" ++
    "srcDir src\n" ++
    "default ElabMeetDefExeSrcA\n" ++
    "module ElabMeetDefExeSrcA\n" ++
    "module ElabMeetDefExeSrcB"

/-- Same shape, but the source directory does not exist.
    Reject token ElabMeetDefExeSrcMissing is not ElabMeetDefExeMissing,
    not ElabMeetExeTwoSrcMissing, and not ElabMeetExeSrcMissing. -/
def badDefaultExecutableSourceDirectoryText : String :=
  "lean_exe ElabMeetDefExeSrcA\n" ++
    "lean_exe ElabMeetDefExeSrcB\n" ++
    "srcDir ElabMeetDefExeSrcMissing\n" ++
    "default ElabMeetDefExeSrcA\n" ++
    "module ElabMeetDefExeSrcA\n" ++
    "module ElabMeetDefExeSrcB"

/-- Same two-exe plus srcDir shape, but the default names a missing target.
    Reject token ElabMeetDefExeSrcMissing is the same new token. -/
def missingDefaultExecutableSourceDirectoryText : String :=
  "lean_exe ElabMeetDefExeSrcA\n" ++
    "lean_exe ElabMeetDefExeSrcB\n" ++
    "srcDir src\n" ++
    "default ElabMeetDefExeSrcMissing\n" ++
    "module ElabMeetDefExeSrcA\n" ++
    "module ElabMeetDefExeSrcB"

end SystemsLean.ElabMeet
