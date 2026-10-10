/-
  Module: SystemsLean.ThinMainFront
  Front for a thin Lake main that forwards argv.
  The file is one import, then def main of that import.
  The imported name is the callee. No module name is hardcoded.
  CapableComposeMain is one file of this shape.
  A third sibling with the same shape parses too.
  A namespace file is not this front.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront

namespace SystemsLean.ThinMainFront

open SystemsLean.HostTerm

def listString : HostType :=
  HostType.named (n "List String")

def ioUInt32 : HostType :=
  HostType.named (n "IO.UInt32")

def forwardTerm (modName args : String) : Term :=
  Term.app
    (Term.const (n ("SystemsLean." ++ modName ++ ".main")))
    (Term.var (n args))

def forwardCmd (modName args : String) : Cmd :=
  Cmd.defBind (n "main")
    [(n args, listString)]
    ioUInt32
    (forwardTerm modName args)

def moduleOf (modName args : String) : Module :=
  {
    name := n ("SystemsLean." ++ modName ++ "Main")
    commands := [
      Cmd.importModule (n ("SystemsLean." ++ modName)),
      forwardCmd modName args
    ]
  }

/-- The body is SystemsLean.M.main applied to the same binder. -/
def parseBody (modName args : String) : List String -> Option Module
  | "SystemsLean" :: "." :: modName2 :: "." :: "main" :: arg2 :: rest =>
    if rest.isEmpty && modName == modName2 && args == arg2 then
      some (moduleOf modName args)
    else
      none
  | _ => none

/-- def main (args : List String) : IO UInt32 := -/
def parseMain (modName : String) : List String -> Option Module
  | "def" :: "main" :: "(" :: args :: ":" :: "List" :: "String" ::
      ")" :: ":" :: "IO" :: "UInt32" :: ":=" :: rest =>
    parseBody modName args rest
  | _ => none

/-- import SystemsLean.M, then that main. Anything else is none. -/
def parseTokens : List String -> Option Module
  | "import" :: "SystemsLean" :: "." :: modName :: rest =>
    parseMain modName rest
  | _ => none

def parseThinMain (src : String) : Option Module :=
  match HonestyFront.strip src.toList HonestyFront.SMode.code [] with
  | none => none
  | some kept =>
    match HonestyFront.tok kept HonestyFront.TMode.norm [] with
    | none => none
    | some ts => parseTokens ts

def composeMainText : String :=
  "import SystemsLean.CapableCompose\n" ++
  "def main (args : List String) : IO UInt32 :=\n" ++
  "  SystemsLean.CapableCompose.main args\n"

def composeMainAccepts : Bool :=
  match parseThinMain composeMainText with
  | some _ => true
  | none => false

def readMainText : String :=
  "import SystemsLean.CapableRead\n" ++
  "def main (args : List String) : IO UInt32 :=\n" ++
  "  SystemsLean.CapableRead.main args\n"

def readMainAccepts : Bool :=
  match parseThinMain readMainText with
  | some _ => true
  | none => false

/-- Third sibling. The callee is Capable, not a hardcoded main file. -/
def capableMainText : String :=
  "import SystemsLean.Capable\n" ++
  "def main (args : List String) : IO UInt32 :=\n" ++
  "  SystemsLean.Capable.main args\n"

def capableMainAccepts : Bool :=
  match parseThinMain capableMainText with
  | some _ => true
  | none => false

/-- A namespace file is not a thin main. -/
def namespaceMisses : Bool :=
  match parseThinMain "namespace SystemsLean.Capable\n" with
  | none => true
  | some _ => false

/-- A different callee is not this import. -/
def swapMisses : Bool :=
  match parseThinMain
      ("import SystemsLean.CapableCompose\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.Capable.main args\n") with
  | none => true
  | some _ => false

end SystemsLean.ThinMainFront
