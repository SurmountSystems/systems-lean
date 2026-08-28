/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet older executable and
  disk-import probes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetExe and SystemsLean.ElabMeet
  so those files stay under the line cap. Same namespace
  SystemsLean.ElabMeet. Parsers and compile walks stay in
  SystemsLean.ElabMeetExe / SystemsLean.ElabMeetCompile.
  Snippets stay in SystemsLean.ElabMeetProbe.

  Spec (readable):
  - #elabMeetOnDiskImportProbe and #elabMeetCompiledImportProbe
    live here (extracted from ElabMeet).
  - #elabMeetExecutableTargetProbe and
    #elabMeetExecutableImportProbe live here (extracted from
    ElabMeetExe).
  - #elabMeetExecutableMultiLibProbe and
    #elabMeetExecutableTargetsProbe live here (extracted
    from ElabMeetExe).
  - #elabMeetDefaultExecutableTargetProbe records default-A-only
    (B `.olean` absent), missing ElabMeetDefExeMissing reject,
    and Name 120 request-A-only reject.
  - #elabMeetExecutableSourceDirectoryProbe records accept
    from `src/ElabMeetExeSrcMain.lean`, missing-dir reject,
    and Name 117 cwd-only reject.
  - #elabMeetExecutableImportSourceDirectoryProbe records
    accept from `src/ElabMeetExeImpSrcLib.lean` plus
    `src/ElabMeetExeImpSrcMain.lean`, missing-dir reject,
    and Name 118 cwd-only reject.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  #elabMeetOnDiskImportProbe, #elabMeetCompiledImportProbe,
  #elabMeetExecutableTargetProbe, #elabMeetExecutableImportProbe,
  #elabMeetExecutableMultiLibProbe, #elabMeetExecutableTargetsProbe,
  #elabMeetDefaultExecutableTargetProbe,
  #elabMeetExecutableSourceDirectoryProbe,
  #elabMeetExecutableImportSourceDirectoryProbe,
  parseExecutableSourceDirectory, tryCompileExecutableSourceDirectory,
  elabMeetDrivesExecutableSourceDirectory,
  elabMeetAcceptsGoodExecutableSourceDirectory,
  elabMeetRejectsMissingExecutableSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableSourceDirectory,
  ElabMeetExeSrcMain, ElabMeetExeSrcMissing,
  parseExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectory,
  elabMeetDrivesExecutableImportSourceDirectory,
  elabMeetAcceptsGoodExecutableImportSourceDirectory,
  elabMeetRejectsMissingExecutableImportSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory,
  ElabMeetExeImpSrcLib, ElabMeetExeImpSrcMain,
  ElabMeetExeImpSrcMissing,
  parseDefaultExecutableTarget, tryCompileDefaultExecutableTarget,
  elabMeetDrivesDefaultExecutableTarget,
  elabMeetAcceptsGoodDefaultExecutableTarget,
  elabMeetRejectsMissingDefaultExecutableTarget,
  elabMeetRejectsRequestOnlyAsDefaultExecutable,
  ElabMeetDefExeA, ElabMeetDefExeB, ElabMeetDefExeMissing,
  ElabMeetExeProbe, SystemsLean.ElabMeetExeProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetExeProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetExeProbe; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetExe
import SystemsLean.ElabMeetImpSrc

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for one on-disk library plus importer pair.
    Payload strings match onDiskLibSnippet / goodOnDiskImportSnippet /
    badOnDiskImportSnippet. Search path finds the library Slake wrote. -/
elab "#elabMeetOnDiskImportProbe" : command => do
  let dir <- liftIO IO.FS.createTempDir
  let libPath := dir / "ElabMeetOnDisk.lean"
  let goodPath := dir / "importer.lean"
  let badPath := dir / "importer-bad.lean"
  liftIO (IO.FS.writeFile libPath onDiskLibSnippet)
  liftIO (IO.FS.writeFile goodPath goodOnDiskImportSnippet)
  liftIO (IO.FS.writeFile badPath badOnDiskImportSnippet)
  let (good, bad) <-
    tryElabOnDiskImportFiles onDiskLibSnippet `ElabMeetOnDisk
      goodPath badPath dir
  try
    liftIO (IO.FS.removeDirAll dir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodOnDiskImport
  let rN := mkIdent `elabMeetRejectsBadOnDiskImport
  let dN := mkIdent `elabMeetDrivesOnDiskImport
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetOnDiskImportProbe

/-- Record accept / reject for compile-then-import.
    Writes library source, compiles that file to `.olean`, then imports
    the compiled module. Reject is compile-fail of ill-typed source.
    Payload strings match compiledLibSnippet / goodCompiledImportSnippet /
    badCompiledLibSnippet. -/
elab "#elabMeetCompiledImportProbe" : command => do
  let dir <- liftIO IO.FS.createTempDir
  let libPath := dir / "ElabMeetCompiled.lean"
  let badLibPath := dir / "ElabMeetCompiledBad.lean"
  let goodPath := dir / "importer.lean"
  liftIO (IO.FS.writeFile libPath compiledLibSnippet)
  liftIO (IO.FS.writeFile badLibPath badCompiledLibSnippet)
  liftIO (IO.FS.writeFile goodPath goodCompiledImportSnippet)
  let (good, bad) <-
    tryCompileThenImportFiles libPath badLibPath goodPath dir `ElabMeetCompiled
  try
    liftIO (IO.FS.removeDirAll dir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodCompiledImport
  let rN := mkIdent `elabMeetRejectsBadCompiledImport
  let dN := mkIdent `elabMeetDrivesCompiledImport
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetCompiledImportProbe

/-- Record accept / reject for a listed executable target.
    Accept writes `lean_exe ElabMeetExeMain` plus
    `ElabMeetExeMain.lean` (not a library). Reject names
    `lean_exe ElabMeetExeMissing` with no such module.
    A Name 113 library-only richer walk compiles as a
    library and is not an executable accept. Drive is
    good && !bad && libraryOnlyRejected. -/
elab "#elabMeetExecutableTargetProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirLib <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let exePath := Lean.modToFilePath dirGood `ElabMeetExeMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile exePath exeMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badExecutableTargetText)
  let writeLib : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirLib `ElabMeetRichLib "lean"
    let impPath := Lean.modToFilePath dirLib `ElabMeetRichImp "lean"
    let descPath := dirLib / "package.txt"
    liftIO (IO.FS.writeFile libPath richLibSnippet)
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodRicherPackageDescText)
  writeGood
  writeBad
  writeLib
  let exeOk <-
    tryCompileExecutable (dirGood / "package.txt") dirGood
  let exeOlean := Lean.modToFilePath dirGood `ElabMeetExeMain "olean"
  let exeOleanOk <- liftIO exeOlean.pathExists
  let good := exeOk && exeOleanOk
  let miss <-
    tryCompileExecutable (dirBad / "package.txt") dirBad
  let bad := miss
  let richerOk <-
    tryCompileRicherPackageDesc (dirLib / "package.txt") dirLib
  let exeOnLib <-
    tryCompileExecutable (dirLib / "package.txt") dirLib
  let parseNone :=
    match parseExecutableTarget goodRicherPackageDescText with
    | none => true
    | some _ => false
  let srcParseNone :=
    match parseExecutableTarget goodSourceDirectoryText with
    | none => true
    | some _ => false
  let libraryOnlyRejected :=
    parseNone && srcParseNone && richerOk && !exeOnLib
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirLib)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let lStx <- if libraryOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && libraryOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableTarget
  let rN := mkIdent `elabMeetRejectsMissingExecutableTarget
  let lN := mkIdent `elabMeetRejectsLibraryOnlyAsExecutable
  let dN := mkIdent `elabMeetDrivesExecutableTarget
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $lN : Bool := $lStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableTargetProbe

/-- Record accept / reject for an executable that imports a
    compiled library. Accept writes `lean_lib ElabMeetExeImpLib`
    plus `lean_exe ElabMeetExeImpMain` plus both modules
    (library defines `exeImpLib`; executable uses it).
    Reject names `lean_lib ElabMeetExeImpLibMissing` with no
    such library, or `lean_exe ElabMeetExeImpMissing` with no
    such executable. A Name 117 standalone `lean_exe` walk
    compiles as an executable and is not this accept.
    Drive is good && !bad && exeOnlyRejected. -/
elab "#elabMeetExecutableImportProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBadLib <- liftIO IO.FS.createTempDir
  let dirBadExe <- liftIO IO.FS.createTempDir
  let dirExeOnly <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirGood `ElabMeetExeImpLib "lean"
    let exePath := Lean.modToFilePath dirGood `ElabMeetExeImpMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpLibSnippet)
    liftIO (IO.FS.writeFile exePath goodExeImpMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableImportText)
  let writeBadLib : CommandElabM Unit := do
    let exePath := Lean.modToFilePath dirBadLib `ElabMeetExeImpMain "lean"
    let descPath := dirBadLib / "package.txt"
    liftIO (IO.FS.writeFile exePath goodExeImpMainSnippet)
    liftIO (IO.FS.writeFile descPath badExecutableImportLibText)
  let writeBadExe : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirBadExe `ElabMeetExeImpLib "lean"
    let descPath := dirBadExe / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpLibSnippet)
    liftIO (IO.FS.writeFile descPath badExecutableImportExeText)
  let writeExeOnly : CommandElabM Unit := do
    let exePath := Lean.modToFilePath dirExeOnly `ElabMeetExeMain "lean"
    let descPath := dirExeOnly / "package.txt"
    liftIO (IO.FS.writeFile exePath exeMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetText)
  writeGood
  writeBadLib
  writeBadExe
  writeExeOnly
  let impOk <-
    tryCompileExecutableImport (dirGood / "package.txt") dirGood
  let libOlean := Lean.modToFilePath dirGood `ElabMeetExeImpLib "olean"
  let exeOlean := Lean.modToFilePath dirGood `ElabMeetExeImpMain "olean"
  let libOleanOk <- liftIO libOlean.pathExists
  let exeOleanOk <- liftIO exeOlean.pathExists
  let good := impOk && libOleanOk && exeOleanOk
  let missLib <-
    tryCompileExecutableImport (dirBadLib / "package.txt") dirBadLib
  let missExe <-
    tryCompileExecutableImport (dirBadExe / "package.txt") dirBadExe
  let bad := missLib || missExe
  let parseNone :=
    match parseExecutableImport goodExecutableTargetText with
    | none => true
    | some _ => false
  let exeOnlyOk <-
    tryCompileExecutable (dirExeOnly / "package.txt") dirExeOnly
  let impOnExeOnly <-
    tryCompileExecutableImport (dirExeOnly / "package.txt") dirExeOnly
  let exeOnlyRejected := parseNone && exeOnlyOk && !impOnExeOnly
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBadLib)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBadExe)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirExeOnly)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rLibStx <- if !missLib then `(true) else `(false)
  let rExeStx <- if !missExe then `(true) else `(false)
  let eStx <- if exeOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && exeOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableImport
  let rLibN := mkIdent `elabMeetRejectsMissingExeImpLib
  let rExeN := mkIdent `elabMeetRejectsMissingExeImp
  let eN := mkIdent `elabMeetRejectsExeOnlyAsExecutableImport
  let dN := mkIdent `elabMeetDrivesExecutableImport
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rLibN : Bool := $rLibStx))
  elabCommand (<- `(def $rExeN : Bool := $rExeStx))
  elabCommand (<- `(def $eN : Bool := $eStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableImportProbe

/-- Record accept / reject for an executable that imports two
    compiled libraries. Accept writes `lean_lib ElabMeetExeMultiLibA`
    plus `lean_lib ElabMeetExeMultiLibB` plus
    `lean_exe ElabMeetExeMultiMain` plus all three modules
    (libraries define `exeMultiLibA` / `exeMultiLibB`;
    executable uses both). Reject names
    `lean_lib ElabMeetExeMultiLibAMissing` with no such library.
    A Name 118 one-library walk compiles as an executable-import
    and is not this accept.
    Drive is good && !bad && oneLibRejected. -/
elab "#elabMeetExecutableMultiLibProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirOneLib <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let libAPath := Lean.modToFilePath dirGood `ElabMeetExeMultiLibA "lean"
    let libBPath := Lean.modToFilePath dirGood `ElabMeetExeMultiLibB "lean"
    let exePath := Lean.modToFilePath dirGood `ElabMeetExeMultiMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libAPath exeMultiLibASnippet)
    liftIO (IO.FS.writeFile libBPath exeMultiLibBSnippet)
    liftIO (IO.FS.writeFile exePath goodExeMultiMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableMultiLibText)
  let writeBad : CommandElabM Unit := do
    let libBPath := Lean.modToFilePath dirBad `ElabMeetExeMultiLibB "lean"
    let exePath := Lean.modToFilePath dirBad `ElabMeetExeMultiMain "lean"
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile libBPath exeMultiLibBSnippet)
    liftIO (IO.FS.writeFile exePath goodExeMultiMainSnippet)
    liftIO (IO.FS.writeFile descPath badExecutableMultiLibText)
  let writeOneLib : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirOneLib `ElabMeetExeImpLib "lean"
    let exePath := Lean.modToFilePath dirOneLib `ElabMeetExeImpMain "lean"
    let descPath := dirOneLib / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpLibSnippet)
    liftIO (IO.FS.writeFile exePath goodExeImpMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableImportText)
  writeGood
  writeBad
  writeOneLib
  let multiOk <-
    tryCompileExecutableMultiLib (dirGood / "package.txt") dirGood
  let libAOlean := Lean.modToFilePath dirGood `ElabMeetExeMultiLibA "olean"
  let libBOlean := Lean.modToFilePath dirGood `ElabMeetExeMultiLibB "olean"
  let exeOlean := Lean.modToFilePath dirGood `ElabMeetExeMultiMain "olean"
  let libAOleanOk <- liftIO libAOlean.pathExists
  let libBOleanOk <- liftIO libBOlean.pathExists
  let exeOleanOk <- liftIO exeOlean.pathExists
  let good := multiOk && libAOleanOk && libBOleanOk && exeOleanOk
  let missLib <-
    tryCompileExecutableMultiLib (dirBad / "package.txt") dirBad
  let bad := missLib
  let parseNone :=
    match parseExecutableMultiLib goodExecutableImportText with
    | none => true
    | some _ => false
  let oneLibOk <-
    tryCompileExecutableImport (dirOneLib / "package.txt") dirOneLib
  let multiOnOneLib <-
    tryCompileExecutableMultiLib (dirOneLib / "package.txt") dirOneLib
  let oneLibRejected := parseNone && oneLibOk && !multiOnOneLib
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirOneLib)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let oStx <- if oneLibRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && oneLibRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableMultiLib
  let rN := mkIdent `elabMeetRejectsMissingExeMultiLib
  let oN := mkIdent `elabMeetRejectsOneLibAsExecutableMultiLib
  let dN := mkIdent `elabMeetDrivesExecutableMultiLib
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $oN : Bool := $oStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableMultiLibProbe

/-- Record accept / reject for two standalone executable
    targets. Accept writes `lean_exe ElabMeetExeTwoA` plus
    `lean_exe ElabMeetExeTwoB` with both sources on disk:
    request A compiles only A, request B compiles only B,
    omitted request compiles both in order. Reject names
    `lean_exe ElabMeetExeTwoMissing` with no matching
    on-disk module. A Name 117 one-exe walk compiles as
    an executable and is not this accept.
    Drive is good && !bad && oneExeRejected. -/
elab "#elabMeetExecutableTargetsProbe" : command => do
  let dirA <- liftIO IO.FS.createTempDir
  let dirB <- liftIO IO.FS.createTempDir
  let dirBoth <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirOneExe <- liftIO IO.FS.createTempDir
  let writePair (dir : System.FilePath) : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dir `ElabMeetExeTwoA "lean"
    let bPath := Lean.modToFilePath dir `ElabMeetExeTwoB "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile aPath exeTwoASnippet)
    liftIO (IO.FS.writeFile bPath exeTwoBSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetsText)
  let writeBad : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dirBad `ElabMeetExeTwoA "lean"
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile aPath exeTwoASnippet)
    liftIO (IO.FS.writeFile descPath badExecutableTargetsText)
  let writeOneExe : CommandElabM Unit := do
    let exePath := Lean.modToFilePath dirOneExe `ElabMeetExeMain "lean"
    let descPath := dirOneExe / "package.txt"
    liftIO (IO.FS.writeFile exePath exeMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetText)
  writePair dirA
  writePair dirB
  writePair dirBoth
  writeBad
  writeOneExe
  let reqA <-
    tryCompileExecutableTarget
      (dirA / "package.txt") dirA (some "ElabMeetExeTwoA")
  let aOleanA := Lean.modToFilePath dirA `ElabMeetExeTwoA "olean"
  let aOleanB := Lean.modToFilePath dirA `ElabMeetExeTwoB "olean"
  let aExists <- liftIO aOleanA.pathExists
  let bAfterA <- liftIO aOleanB.pathExists
  let onlyA := reqA && aExists && !bAfterA
  let reqB <-
    tryCompileExecutableTarget
      (dirB / "package.txt") dirB (some "ElabMeetExeTwoB")
  let bOleanA := Lean.modToFilePath dirB `ElabMeetExeTwoA "olean"
  let bOleanB := Lean.modToFilePath dirB `ElabMeetExeTwoB "olean"
  let bExists <- liftIO bOleanB.pathExists
  let aAfterB <- liftIO bOleanA.pathExists
  let onlyB := reqB && bExists && !aAfterB
  let both <-
    tryCompileExecutableTargets (dirBoth / "package.txt") dirBoth
  let bothA := Lean.modToFilePath dirBoth `ElabMeetExeTwoA "olean"
  let bothB := Lean.modToFilePath dirBoth `ElabMeetExeTwoB "olean"
  let bothAOk <- liftIO bothA.pathExists
  let bothBOk <- liftIO bothB.pathExists
  let bothOk := both && bothAOk && bothBOk
  let parseOneNone :=
    match parseExecutableTarget goodExecutableTargetsText with
    | none => true
    | some _ => false
  let good := onlyA && onlyB && bothOk && parseOneNone
  let miss <-
    tryCompileExecutableTarget
      (dirBad / "package.txt") dirBad (some "ElabMeetExeTwoMissing")
  let missBoth <-
    tryCompileExecutableTargets (dirBad / "package.txt") dirBad
  let bad := miss || missBoth
  let parseNone :=
    match parseExecutableTargets goodExecutableTargetText with
    | none => true
    | some _ => false
  let oneExeOk <-
    tryCompileExecutable (dirOneExe / "package.txt") dirOneExe
  let twoOnOneExe <-
    tryCompileExecutableTargets (dirOneExe / "package.txt") dirOneExe
  let oneExeRejected := parseNone && oneExeOk && !twoOnOneExe
  try
    liftIO (IO.FS.removeDirAll dirA)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirB)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBoth)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirOneExe)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let oStx <- if oneExeRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && oneExeRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableTargets
  let rN := mkIdent `elabMeetRejectsMissingExeTwo
  let oN := mkIdent `elabMeetRejectsOneExeAsExecutableTargets
  let dN := mkIdent `elabMeetDrivesExecutableTargets
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $oN : Bool := $oStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableTargetsProbe

/-- Record accept / reject for a default executable target.
    Accept writes `lean_exe ElabMeetDefExeA` plus `lean_exe
    ElabMeetDefExeB` plus `default ElabMeetDefExeA`: compile
    writes only A `.olean`. Reject names `default
    ElabMeetDefExeMissing`. A Name 120 request-A-only walk
    (two `lean_exe`, no default line) compiles A and is
    not a default accept. Drive is good && !bad &&
    requestOnlyRejected. -/
elab "#elabMeetDefaultExecutableTargetProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirReq <- liftIO IO.FS.createTempDir
  let writeDef (dir : System.FilePath) (desc : String) : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dir `ElabMeetDefExeA "lean"
    let bPath := Lean.modToFilePath dir `ElabMeetDefExeB "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile aPath defExeASnippet)
    liftIO (IO.FS.writeFile bPath defExeBSnippet)
    liftIO (IO.FS.writeFile descPath desc)
  let writeReq : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dirReq `ElabMeetExeTwoA "lean"
    let bPath := Lean.modToFilePath dirReq `ElabMeetExeTwoB "lean"
    let descPath := dirReq / "package.txt"
    liftIO (IO.FS.writeFile aPath exeTwoASnippet)
    liftIO (IO.FS.writeFile bPath exeTwoBSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetsText)
  writeDef dirGood goodDefaultExecutableTargetText
  writeDef dirBad badDefaultExecutableTargetText
  writeReq
  let defOk <-
    tryCompileDefaultExecutableTarget (dirGood / "package.txt") dirGood
  let aOlean := Lean.modToFilePath dirGood `ElabMeetDefExeA "olean"
  let bOlean := Lean.modToFilePath dirGood `ElabMeetDefExeB "olean"
  let aExists <- liftIO aOlean.pathExists
  let bExists <- liftIO bOlean.pathExists
  let namedParseNone :=
    match parseExecutableTargets goodDefaultExecutableTargetText with
    | none => true
    | some _ => false
  let good := defOk && aExists && !bExists && namedParseNone
  let miss <-
    tryCompileDefaultExecutableTarget (dirBad / "package.txt") dirBad
  let bad := miss
  let reqA <-
    tryCompileExecutableTarget
      (dirReq / "package.txt") dirReq (some "ElabMeetExeTwoA")
  let reqAOlean := Lean.modToFilePath dirReq `ElabMeetExeTwoA "olean"
  let reqBOlean := Lean.modToFilePath dirReq `ElabMeetExeTwoB "olean"
  let reqAExists <- liftIO reqAOlean.pathExists
  let reqBExists <- liftIO reqBOlean.pathExists
  let onlyA := reqA && reqAExists && !reqBExists
  let defOnReq <-
    tryCompileDefaultExecutableTarget (dirReq / "package.txt") dirReq
  let parseNone :=
    match parseDefaultExecutableTarget goodExecutableTargetsText with
    | none => true
    | some _ => false
  let requestOnlyRejected := parseNone && onlyA && !defOnReq
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirReq)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let qStx <- if requestOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && requestOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodDefaultExecutableTarget
  let rN := mkIdent `elabMeetRejectsMissingDefaultExecutableTarget
  let qN := mkIdent `elabMeetRejectsRequestOnlyAsDefaultExecutable
  let dN := mkIdent `elabMeetDrivesDefaultExecutableTarget
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $qN : Bool := $qStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetDefaultExecutableTargetProbe

/-- Record accept / reject for an executable compiled from a
    listed source directory. Accept writes `srcDir src` plus
    `src/ElabMeetExeSrcMain.lean` (not at cwd). Reject names
    `srcDir ElabMeetExeSrcMissing` with no such directory.
    A Name 117 cwd-only executable walk compiles at cwd and
    is not a source-directory accept.
    Drive is good && !bad && cwdOnlyRejected. -/
elab "#elabMeetExecutableSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirCwd <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exePath := Lean.modToFilePath srcRoot `ElabMeetExeSrcMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile exePath exeSrcMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badExecutableSourceDirectoryText)
  let writeCwd : CommandElabM Unit := do
    let exePath := Lean.modToFilePath dirCwd `ElabMeetExeMain "lean"
    let descPath := dirCwd / "package.txt"
    liftIO (IO.FS.writeFile exePath exeMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetText)
  writeGood
  writeBad
  writeCwd
  let srcOk <-
    tryCompileExecutableSourceDirectory (dirGood / "package.txt") dirGood
  let srcOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeSrcMain "olean"
  let cwdOlean := Lean.modToFilePath dirGood `ElabMeetExeSrcMain "olean"
  let srcOleanOk <- liftIO srcOlean.pathExists
  let cwdOleanOk <- liftIO cwdOlean.pathExists
  let exeParseNone :=
    match parseExecutableTarget goodExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let libParseNone :=
    match parseSourceDirectory goodExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let good :=
    srcOk && srcOleanOk && !cwdOleanOk && exeParseNone && libParseNone
  let miss <-
    tryCompileExecutableSourceDirectory (dirBad / "package.txt") dirBad
  let bad := miss
  let exeOk <-
    tryCompileExecutable (dirCwd / "package.txt") dirCwd
  let srcOnCwd <-
    tryCompileExecutableSourceDirectory (dirCwd / "package.txt") dirCwd
  let parseNone :=
    match parseExecutableSourceDirectory goodExecutableTargetText with
    | none => true
    | some _ => false
  let cwdOnlyRejected := parseNone && exeOk && !srcOnCwd
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirCwd)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let cStx <- if cwdOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && cwdOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingExecutableSourceDirectory
  let cN := mkIdent `elabMeetRejectsCwdOnlyAsExecutableSourceDirectory
  let dN := mkIdent `elabMeetDrivesExecutableSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $cN : Bool := $cStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableSourceDirectoryProbe

/-- Record accept / reject for an executable that imports a
    compiled library from a listed source directory. Accept
    writes `srcDir src` plus `src/ElabMeetExeImpSrcLib.lean`
    plus `src/ElabMeetExeImpSrcMain.lean` (not at cwd).
    Reject names `srcDir ElabMeetExeImpSrcMissing` with no
    such directory. A Name 118 cwd-only import walk compiles
    at cwd and is not this accept.
    Drive is good && !bad && cwdOnlyRejected. -/
elab "#elabMeetExecutableImportSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirCwd <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let libPath := Lean.modToFilePath srcRoot `ElabMeetExeImpSrcLib "lean"
    let exePath := Lean.modToFilePath srcRoot `ElabMeetExeImpSrcMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpSrcLibSnippet)
    liftIO (IO.FS.writeFile exePath goodExeImpSrcMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableImportSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badExecutableImportSourceDirectoryText)
  let writeCwd : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirCwd `ElabMeetExeImpLib "lean"
    let exePath := Lean.modToFilePath dirCwd `ElabMeetExeImpMain "lean"
    let descPath := dirCwd / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpLibSnippet)
    liftIO (IO.FS.writeFile exePath goodExeImpMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableImportText)
  writeGood
  writeBad
  writeCwd
  let srcOk <-
    tryCompileExecutableImportSourceDirectory
      (dirGood / "package.txt") dirGood
  let libOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeImpSrcLib "olean"
  let exeOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeImpSrcMain "olean"
  let cwdLibOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeImpSrcLib "olean"
  let cwdExeOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeImpSrcMain "olean"
  let libOleanOk <- liftIO libOlean.pathExists
  let exeOleanOk <- liftIO exeOlean.pathExists
  let cwdLibOk <- liftIO cwdLibOlean.pathExists
  let cwdExeOk <- liftIO cwdExeOlean.pathExists
  let impParseNone :=
    match parseExecutableImport goodExecutableImportSourceDirectoryText with
    | none => true
    | some _ => false
  let exeSrcParseNone :=
    match parseExecutableSourceDirectory
      goodExecutableImportSourceDirectoryText with
    | none => true
    | some _ => false
  let libSrcParseNone :=
    match parseSourceDirectory goodExecutableImportSourceDirectoryText with
    | none => true
    | some _ => false
  let good :=
    srcOk && libOleanOk && exeOleanOk && !cwdLibOk && !cwdExeOk &&
      impParseNone && exeSrcParseNone && libSrcParseNone
  let miss <-
    tryCompileExecutableImportSourceDirectory
      (dirBad / "package.txt") dirBad
  let bad := miss
  let impOk <-
    tryCompileExecutableImport (dirCwd / "package.txt") dirCwd
  let srcOnCwd <-
    tryCompileExecutableImportSourceDirectory
      (dirCwd / "package.txt") dirCwd
  let parseNone :=
    match parseExecutableImportSourceDirectory goodExecutableImportText with
    | none => true
    | some _ => false
  let cwdOnlyRejected := parseNone && impOk && !srcOnCwd
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirCwd)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let cStx <- if cwdOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && cwdOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableImportSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingExecutableImportSourceDirectory
  let cN := mkIdent `elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory
  let dN := mkIdent `elabMeetDrivesExecutableImportSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $cN : Bool := $cStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableImportSourceDirectoryProbe

/-! ### Extracted executable-family smoke (from ElabMeet) -/

example : elabMeetDrivesExecutableTarget = true := rfl
example : elabMeetAcceptsGoodExecutableTarget = true := rfl
example : elabMeetRejectsMissingExecutableTarget = true := rfl
example : elabMeetRejectsLibraryOnlyAsExecutable = true := rfl
example : elabMeetDrivesExecutableImport = true := rfl
example : elabMeetAcceptsGoodExecutableImport = true := rfl
example : elabMeetRejectsMissingExeImpLib = true := rfl
example : elabMeetRejectsMissingExeImp = true := rfl
example : elabMeetRejectsExeOnlyAsExecutableImport = true := rfl
example : elabMeetDrivesExecutableMultiLib = true := rfl
example : elabMeetAcceptsGoodExecutableMultiLib = true := rfl
example : elabMeetRejectsMissingExeMultiLib = true := rfl
example : elabMeetRejectsOneLibAsExecutableMultiLib = true := rfl
example : elabMeetDrivesExecutableTargets = true := rfl
example : elabMeetAcceptsGoodExecutableTargets = true := rfl
example : elabMeetRejectsMissingExeTwo = true := rfl
example : elabMeetRejectsOneExeAsExecutableTargets = true := rfl
example : elabMeetDrivesDefaultExecutableTarget = true := rfl
example : elabMeetAcceptsGoodDefaultExecutableTarget = true := rfl
example : elabMeetRejectsMissingDefaultExecutableTarget = true := rfl
example : elabMeetRejectsRequestOnlyAsDefaultExecutable = true := rfl
example : elabMeetDrivesExecutableImportSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableImportSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableImportSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory = true := rfl

end SystemsLean.ElabMeet
