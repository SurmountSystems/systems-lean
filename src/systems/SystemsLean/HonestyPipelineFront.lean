/-
  Module: SystemsLean.HonestyPipelineFront
  One or more imports, then a namespace of string and Bool pins,
  one `(name : System.FilePath) : IO Unit` pipeline that prints,
  the stored filterArgs clauses, more Bool pins, and main.
  The namespace is the one written. The file name is not hardcoded.
  The pipeline def name is not hardcoded.
  A false Bool stays false. Bool true is not that pin.
  The pipeline def is not emitted as Bool true.
  filterArgs is the stored list match, not a Bool.
  A chain that does not reduce is none.
  A namespace file with no import is none.
  A thin forwarding main is none.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyCapable
import SystemsLean.HonestyCompose

namespace SystemsLean.HonestyPipelineFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip parseDotted parseFuel isIdent)
open SystemsLean.HonestyCompose (tok TMode parseFilter SpecParse)
open SystemsLean.HonestyCapable (CapEnv emptyEnv parseDefs)

def hasTok : List String -> String -> Bool
  | [], _ => false
  | t :: ts, w => t == w || hasTok ts w

def skipUntil (fuel : Nat) (acc : List String)
    (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, "def" :: _ => some (acc.reverse, ts)
  | _, "end" :: _ => some (acc.reverse, ts)
  | Nat.succ k, t :: rest => skipUntil k (t :: acc) rest
  | _, [] => none
termination_by fuel

def takeImports (fuel : Nat) (acc : List String)
    (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | Nat.succ k, "import" :: rest =>
    match parseDotted parseFuel rest with
    | some (imp, rest2) => takeImports k (imp :: acc) rest2
    | none => none
  | _, _ =>
    if acc.isEmpty then none else some (acc.reverse, ts)
termination_by fuel

def importCmds : List String -> List Cmd
  | [] => []
  | imp :: rest => Cmd.importModule (n imp) :: importCmds rest

def ioHeader (ts : List String) : Option (List String) :=
  match ts with
  | "def" :: name :: "(" :: root :: ":" :: "System" :: "."
      :: "FilePath" :: ")" :: ":" :: "IO" :: "Unit"
      :: ":=" :: "do" :: rest =>
    if isIdent name && isIdent root then some rest else none
  | _ => none

def mainHeader (ts : List String) : Option (List String) :=
  match ts with
  | "def" :: "main" :: "(" :: args :: ":" :: "List" :: "String"
      :: ")" :: ":" :: "IO" :: "UInt32" :: ":=" :: "do"
      :: rest =>
    if isIdent args then some rest else none
  | _ => none

def endOk (ns : String) (ts : List String) : Bool :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, []) => nm == ns
    | _ => false
  | _ => false

def finishMod (ns : String) (imps : List String)
    (pins1 : List Cmd) (filt : Cmd) (pins2 : List Cmd)
    (ts : List String) : Option Module :=
  if pins1.isEmpty || pins2.isEmpty then
    none
  else if endOk ns ts then
    let cmds :=
      importCmds imps
        ++ [Cmd.namespace (n ns)]
        ++ pins1 ++ [filt] ++ pins2
        ++ [Cmd.endNamespace (n ns)]
    let m : Module := { name := n ns, commands := cmds }
    if isWellFormed m then some m else none
  else
    none

def afterFilter (ns : String) (imps : List String)
    (pins1 : List Cmd) (filt : Cmd) (env : CapEnv)
    (ts : List String) : Option Module :=
  match parseDefs parseFuel env [] ts with
  | none => none
  | some (pins2, _, rest) =>
    match mainHeader rest with
    | none => none
    | some bodyTs =>
      match skipUntil parseFuel [] bodyTs with
      | some (body, restE) =>
        if hasTok body "catch" && hasTok body "0"
            && hasTok body "1" then
          finishMod ns imps pins1 filt pins2 restE
        else
          none
      | none => none

def afterPins (ns : String) (imps : List String)
    (pins1 : List Cmd) (env : CapEnv) (ts : List String) :
    Option Module :=
  match ioHeader ts with
  | none => none
  | some bodyTs =>
    match skipUntil parseFuel [] bodyTs with
    | none => none
    | some (body, restIo) =>
      if !hasTok body "println" then
        none
      else
        match parseFilter restIo with
        | SpecParse.got filt restF =>
          afterFilter ns imps pins1 filt env restF
        | _ => none

def parseNs (imps : List String) (ts : List String) :
    Option Module :=
  match ts with
  | "namespace" :: rest =>
    match parseDotted parseFuel rest with
    | some (ns, restNs) =>
      match parseDefs parseFuel emptyEnv [] restNs with
      | some (pins1, env, restP) =>
        if pins1.isEmpty then
          none
        else
          afterPins ns imps pins1 env restP
      | none => none
    | none => none
  | _ => none

def parseToks (ts : List String) : Option Module :=
  match takeImports parseFuel [] ts with
  | some (imps, rest) => parseNs imps rest
  | none => none

/-- Imports, then the written namespace. none is not this shape. -/
def parseHonestyPipelineText (src : String) : Option Module :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

def filterText : String :=
  "def filterArgs : List String -> List String\n" ++
  "  | [] => []\n" ++
  "  | \"--\" :: rest => filterArgs rest\n" ++
  "  | a :: rest => a :: filterArgs rest\n"

def pipeToy : String :=
  "import SystemsLean.Other\n" ++
  "namespace SystemsLean.PipeToy\n" ++
  "def stageId : String := \"S\"\n" ++
  "def full : Bool := false\n" ++
  "def ok : Bool := (stageId == \"S\") && (full == false)\n" ++
  "def run (root : System.FilePath) : IO Unit := do\n" ++
  "  IO.println \"go\"\n" ++
  filterText ++
  "def ready : Bool := ok && !full\n" ++
  "def main (args : List String) : IO UInt32 := do\n" ++
  "  catch e => pure 0 pure 1\n" ++
  "end SystemsLean.PipeToy\n"

def toy : Bool :=
  match parseHonestyPipelineText pipeToy with
  | some _ => true
  | none => false

def falseToy : String :=
  "import SystemsLean.Other\n" ++
  "namespace SystemsLean.PipeToy\n" ++
  "def full : Bool := false\n" ++
  "def bad : Bool := (full == true)\n" ++
  "def run (root : System.FilePath) : IO Unit := do\n" ++
  "  IO.println \"go\"\n" ++
  filterText ++
  "def ready : Bool := !full\n" ++
  "def main (args : List String) : IO UInt32 := do\n" ++
  "  catch e => pure 0 pure 1\n" ++
  "end SystemsLean.PipeToy\n"

def falseRejects : Bool :=
  match parseHonestyPipelineText falseToy with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyPipelineText
      "namespace SystemsLean.PipeToy\n" with
  | none => true
  | some _ => false

def thinMisses : Bool :=
  match parseHonestyPipelineText
      ("import SystemsLean.PipeToy\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.PipeToy.main args\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyPipelineFront
