/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet older one-command probes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeet so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  Command helpers plus the first four probes live here.
  Compile walks stay in SystemsLean.ElabMeetCompile.
  Snippets stay in SystemsLean.ElabMeetProbe.

  Spec (readable):
  - tryElabCommandString drives one command string.
  - tryElabImportedModuleString drives header import plus body.
  - tryElabFileFromDisk reads one tiny file then reuses
    the import helper.
  - #elabMeetProbe records one good def and one ill-typed def.
  - #elabMeetTheoremProbe records one good theorem and one
    ill-typed theorem.
  - #elabMeetImportProbe records one good import sequence
    and one missing-module sequence.
  - #elabMeetFileProbe records one good file and one bad file.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryElabCommandString, tryElabImportedModuleString,
  tryElabFileFromDisk, #elabMeetProbe, #elabMeetTheoremProbe,
  #elabMeetImportProbe, #elabMeetFileProbe,
  elabMeetDrivesOneModule, elabMeetDrivesOneTheorem,
  elabMeetDrivesOneImportedModule, elabMeetDrivesOneFileFromDisk,
  ElabMeetEarly, SystemsLean.ElabMeetEarly,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetEarly
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetEarly; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Drive Lean 4 command elaboration on one source string.
    Restores full command state. Turns off incremental snapshot reporting
    so a nested theorem type error does not leak as a file error.
    Fail-closed on parse or elab error.
    Greppable: tryElabCommandString. -/
def tryElabCommandString (input : String) : CommandElabM Bool := do
  let s0 <- get
  let restore : CommandElabM Unit := set s0
  match Parser.runParserCategory s0.env `command input with
  | .error _ =>
    restore
    pure false
  | .ok stx =>
    try
      withoutCommandIncrementality true do
        elabCommand stx
      let ok := !(<- get).messages.hasErrors
      restore
      pure ok
    catch _ =>
      restore
      pure false

/-- Drive Lean 4 header import plus remaining commands on one source string.
    Mid-file `import` is rejected by the command elaborator, so this helper
    parses the module header, loads those imports, then elaborates the body.
    Fail-closed on header, import, parse, or elab error.
    Greppable: tryElabImportedModuleString. -/
def tryElabImportedModuleString (input : String) : CommandElabM Bool := do
  try
    liftIO (tryElabImportedModuleStringIOSafe input)
  catch _ =>
    pure false

/-- Read one tiny `.lean` file and drive header+body elaboration.
    Thin wrapper: `IO.FS.readFile` then `tryElabImportedModuleString`.
    Fail-closed if the path cannot be read or elab fails.
    Greppable: tryElabFileFromDisk. -/
def tryElabFileFromDisk (path : System.FilePath) : CommandElabM Bool := do
  try
    let input <- liftIO (IO.FS.readFile path)
    tryElabImportedModuleString input
  catch _ =>
    pure false

/-- Record accept / reject from the real Lean 4 elaborator.
    Payload strings match goodSnippet / badSnippet. -/
elab "#elabMeetProbe" : command => do
  let good <- tryElabCommandString "def n : Nat := 0"
  let bad <- tryElabCommandString "def n : Nat := true"
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGood
  let rN := mkIdent `elabMeetRejectsBad
  let dN := mkIdent `elabMeetDrivesOneModule
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetProbe

/-- Record accept / reject for one theorem command.
    Payload strings match goodTheoremSnippet / badTheoremSnippet. -/
elab "#elabMeetTheoremProbe" : command => do
  let good <- tryElabCommandString "theorem t : 1 = 1 := rfl"
  let bad <- tryElabCommandString "theorem t : 1 = 2 := rfl"
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodTheorem
  let rN := mkIdent `elabMeetRejectsBadTheorem
  let dN := mkIdent `elabMeetDrivesOneTheorem
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetTheoremProbe

/-- Record accept / reject for one imported-module command sequence.
    Payload strings match goodImportSnippet / badImportSnippet. -/
elab "#elabMeetImportProbe" : command => do
  let good <- tryElabImportedModuleString
    "import Init.Data.Nat.Basic\ndef k : Nat := Nat.succ 0"
  let bad <- tryElabImportedModuleString
    "import ElabMeet.NoSuchModule\ndef k : Nat := 0"
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodImport
  let rN := mkIdent `elabMeetRejectsBadImport
  let dN := mkIdent `elabMeetDrivesOneImportedModule
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetImportProbe

/-- Record accept / reject for one tiny file read from disk.
    Payload strings match goodFileSnippet / badFileSnippet. -/
elab "#elabMeetFileProbe" : command => do
  let dir <- liftIO IO.FS.createTempDir
  let goodPath := dir / "good.lean"
  let badPath := dir / "bad.lean"
  liftIO (IO.FS.writeFile goodPath goodFileSnippet)
  liftIO (IO.FS.writeFile badPath badFileSnippet)
  let good <- tryElabFileFromDisk goodPath
  let bad <- tryElabFileFromDisk badPath
  try
    liftIO (IO.FS.removeDirAll dir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodFile
  let rN := mkIdent `elabMeetRejectsBadFile
  let dN := mkIdent `elabMeetDrivesOneFileFromDisk
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetFileProbe

end SystemsLean.ElabMeet
