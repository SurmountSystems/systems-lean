/-
  Module: SystemsLean.HonestyWriteFront
  Imports include SystemsLean.CapableWriteHcLoad, then the
  written namespace, string and Bool pins, one FilePath IO
  Unit writer, filterArgs, more Bool pins, rfl-free decide
  theorems, and main. The file name is not hardcoded.
  stageId and dualEqualityGateId are seeded from that import.
  A false Bool stays false. Passing decide emits Bool true
  only after both sides reduce to the same value.
  The writer def is not emitted as Bool true.
  A namespace file with no import is none.
  A thin forwarding main is none.
  A miss of this writer shape tries the tactic form.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyCapable
import SystemsLean.HonestyCompose
import SystemsLean.HonestyThmFront
import SystemsLean.HonestyPipelineFront
import SystemsLean.DiaphenesTacticForm

namespace SystemsLean.HonestyWriteFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip parseDotted parseFuel isIdent)
open SystemsLean.HonestyCompose (tok TMode parseFilter SpecParse)
open SystemsLean.HonestyCapable (CapEnv emptyEnv addStr parseDefs)
open SystemsLean.HonestyThmFront (parseDecide cmdRejects)
open SystemsLean.HonestyPipelineFront
  (takeImports importCmds ioHeader skipUntil hasTok
    mainHeader endOk)

def loadImport : String := "SystemsLean.CapableWriteHcLoad"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"

def gateLit : String := "DUAL-SSOT-EQUALITY"

def hasLoad : List String -> Bool
  | [] => false
  | s :: rest => s == loadImport || hasLoad rest

def seedEnv : CapEnv :=
  addStr (addStr emptyEnv "stageId" stageLit) "dualEqualityGateId" gateLit

def seedCmd (name lit : String) : Cmd :=
  Cmd.def_ (n name) (some HostType.string) (Term.litString lit)

def seedCmds : List Cmd :=
  [ seedCmd "stageId" stageLit
  , seedCmd "dualEqualityGateId" gateLit ]

def parseThms (fuel : Nat)
    (defs : SystemsLean.HostKernelReduce.DefEnv) (acc : List Cmd)
    (ts : List String) : Option (Prod (List Cmd) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: name :: ":" :: rest =>
      if isIdent name then
        match parseDecide defs name rest with
        | some (cmd, rest2) => parseThms k defs (cmd :: acc) rest2
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match parseDecide defs "example" rest with
      | some (cmd, rest2) => parseThms k defs (cmd :: acc) rest2
      | none => none
    | "def" :: _ =>
      if acc.isEmpty then none else some (acc.reverse, ts)
    | _ => none
termination_by fuel

def finish (ns : String) (imps : List String) (pins1 : List Cmd)
    (filt : Cmd) (pins2 : List Cmd) (thms : List Cmd)
    (ts : List String) : Option Module :=
  if pins1.isEmpty || pins2.isEmpty || thms.isEmpty then
    none
  else if endOk ns ts then
    let cmds :=
      importCmds imps ++ [Cmd.namespace (n ns)] ++ pins1
        ++ [filt] ++ seedCmds ++ pins2 ++ thms
        ++ [Cmd.endNamespace (n ns)]
    let m : Module := { name := n ns, commands := cmds }
    if isWellFormed m then some m else none
  else
    none

def afterThms (ns : String) (imps : List String) (pins1 : List Cmd)
    (filt : Cmd) (pins2 : List Cmd) (thms : List Cmd)
    (ts : List String) : Option Module :=
  match mainHeader ts with
  | none => none
  | some bodyTs =>
    match skipUntil parseFuel [] bodyTs with
    | some (body, restE) =>
      if hasTok body "catch" && hasTok body "0" && hasTok body "1" then
        finish ns imps pins1 filt pins2 thms restE
      else
        none
    | none => none

def afterPins2 (ns : String) (imps : List String) (pins1 : List Cmd)
    (filt : Cmd) (env : CapEnv) (ts : List String) : Option Module :=
  match parseDefs parseFuel env [] ts with
  | none => none
  | some (pins2, env2, rest) =>
    match parseThms 64 env2.defs [] rest with
    | some (thms, restT) =>
      afterThms ns imps pins1 filt pins2 thms restT
    | none => none

def afterIo (ns : String) (imps : List String) (pins1 : List Cmd)
    (env : CapEnv) (ts : List String) : Option Module :=
  match ioHeader ts with
  | none => none
  | some bodyTs =>
    match skipUntil 4096 [] bodyTs with
    | none => none
    | some (body, restIo) =>
      if !hasTok body "println" then
        none
      else
        match parseFilter restIo with
        | SpecParse.got filt restF =>
          afterPins2 ns imps pins1 filt env restF
        | _ => none

def parseNs (imps : List String) (ts : List String) : Option Module :=
  if !hasLoad imps then
    none
  else
    match ts with
    | "namespace" :: rest =>
      match parseDotted parseFuel rest with
      | some (ns, restNs) =>
        match parseDefs parseFuel seedEnv [] restNs with
        | some (pins1, env, restP) =>
          if pins1.isEmpty then none else afterIo ns imps pins1 env restP
        | none => none
      | none => none
    | _ => none

def parseToks (ts : List String) : Option Module :=
  match takeImports parseFuel [] ts with
  | some (imps, rest) => parseNs imps rest
  | none => none

/-- Load import, then the written namespace.
    A miss calls the tactic-form reader. -/
def parseHonestyWriteText (src : String) : Option Module :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none =>
    SystemsLean.DiaphenesTacticForm.parseTacticForm src
  | some kept =>
    match tok kept TMode.norm [] with
    | none =>
      SystemsLean.DiaphenesTacticForm.parseTacticForm src
    | some ts =>
      match parseToks ts with
      | some m => some m
      | none =>
        SystemsLean.DiaphenesTacticForm.parseTacticForm src

def filterText : String :=
  "def filterArgs : List String -> List String\n" ++
  "  | [] => []\n" ++
  "  | \"--\" :: rest => filterArgs rest\n" ++
  "  | a :: rest => a :: filterArgs rest\n"

def toy : String :=
  "import SystemsLean.CapableWriteHcLoad\n" ++
  "namespace SystemsLean.WriteToy\n" ++
  "def full : Bool := false\n" ++
  "def run (root : System.FilePath) : IO Unit := do\n" ++
  "  IO.println \"go\"\n" ++
  filterText ++
  "def ok : Bool := (stageId == \"" ++ stageLit ++ "\")\n" ++
  "  && (dualEqualityGateId == \"" ++ gateLit ++ "\")\n" ++
  "  && (full == false)\n" ++
  "def ready : Bool := ok && !full\n" ++
  "theorem ready_true : ready = true := by\n" ++
  "  decide\n" ++
  "example : ready = true := by\n" ++
  "  decide\n" ++
  "def main (args : List String) : IO UInt32 := do\n" ++
  "  catch e => pure 0 pure 1\n" ++
  "end SystemsLean.WriteToy\n"

def toyAccepts : Bool :=
  match parseHonestyWriteText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

def falseToy : String :=
  "import SystemsLean.CapableWriteHcLoad\n" ++
  "namespace SystemsLean.WriteToy\n" ++
  "def full : Bool := true\n" ++
  "def run (root : System.FilePath) : IO Unit := do\n" ++
  "  IO.println \"go\"\n" ++
  filterText ++
  "def ok : Bool := (full == false)\n" ++
  "def ready : Bool := !full\n" ++
  "theorem ready_true : ready = true := by\n" ++
  "  decide\n" ++
  "def main (args : List String) : IO UInt32 := do\n" ++
  "  catch e => pure 0 pure 1\n" ++
  "end SystemsLean.WriteToy\n"

def falseMisses : Bool :=
  match parseHonestyWriteText falseToy with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyWriteText "namespace SystemsLean.WriteToy\n" with
  | none => true
  | some _ => false

def otherImportMisses : Bool :=
  match parseHonestyWriteText
      ("import SystemsLean.Capable\n" ++
        "namespace SystemsLean.Capable\n" ++
        "def full : Bool := false\n" ++
        "end SystemsLean.Capable\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyWriteFront
