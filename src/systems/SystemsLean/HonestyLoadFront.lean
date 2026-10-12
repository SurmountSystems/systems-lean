/-
  Module: SystemsLean.HonestyLoadFront
  Imports, then a namespace, String literal defs, and at least one
  `structure Name where` of `field : String` ending at `deriving Repr`.
  Other defs are skipped. They are not emitted as Bool true.
  A false Bool stays false. There is no Bool literal path.
  `def main`, `theorem`, and `example` are none.
  The namespace is the one written. The file name is not hardcoded.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyCompose
import SystemsLean.HonestyCapable

namespace SystemsLean.HonestyLoadFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyCompose (tok TMode)

def skipFuel : Nat := 8192

def takeImports (fuel : Nat) (acc : List String) (ts : List String) :
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

def skipBody (fuel : Nat) (ts : List String) : Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => none
  | _, "def" :: _ => some ts
  | _, "structure" :: _ => some ts
  | _, "end" :: _ => some ts
  | _, "theorem" :: _ => none
  | _, "example" :: _ => none
  | Nat.succ k, _ :: rest => skipBody k rest
termination_by fuel

def hasStruct : List Cmd -> Bool
  | [] => false
  | Cmd.structure_ _ _ _ :: _ => true
  | _ :: rest => hasStruct rest

def push (cs acc : List Cmd) : List Cmd :=
  match cs with
  | [] => acc
  | c :: rest => push rest (c :: acc)

def stringDef (ts : List String) : Option (Prod Cmd (List String)) :=
  match ts with
  | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
    if isIdent name then
      match unquote lit with
      | some raw =>
        let body := Term.litString raw
        let cmd := Cmd.def_ (n name) (some HostType.string) body
        some (cmd, rest)
      | none => none
    else
      none
  | _ => none

def parseOne (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match ts with
  | "def" :: "main" :: _ => none
  | "theorem" :: _ => none
  | "example" :: _ => none
  | "structure" :: _ =>
    match SystemsLean.HonestyCapable.parseStruct ts with
    | some (cmd, rest) => some ([cmd], rest)
    | none => none
  | "def" :: _ =>
    match stringDef ts with
    | some (cmd, rest) => some ([cmd], rest)
    | none =>
      match ts with
      | "def" :: _ :: rest =>
        match skipBody skipFuel rest with
        | some rest2 => some ([], rest2)
        | none => none
      | _ => none
  | _ => none

def parseItems (fuel : Nat) (acc : List Cmd) (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match fuel, ts with
  | _, "end" :: _ =>
    if hasStruct acc then some (acc.reverse, ts) else none
  | 0, _ => none
  | Nat.succ k, _ =>
    match parseOne ts with
    | none => none
    | some (cs, rest) => parseItems k (push cs acc) rest
termination_by fuel

def endMatch (ns : String) (ts : List String) : Bool :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) => nm == ns && rest2.isEmpty
    | none => false
  | _ => false

def finish (imps : List String) (ns : String) (items : List Cmd)
    (ts : List String) : Option Module :=
  if endMatch ns ts then
    let cmds :=
      importCmds imps ++ [Cmd.namespace (n ns)] ++ items
        ++ [Cmd.endNamespace (n ns)]
    let m : Module := { name := n ns, commands := cmds }
    if isWellFormed m then some m else none
  else
    none

def parseToks (ts : List String) : Option Module :=
  match takeImports parseFuel [] ts with
  | none => none
  | some (imps, rest) =>
    match rest with
    | "namespace" :: nsRest =>
      match parseDotted parseFuel nsRest with
      | none => none
      | some (ns, rest2) =>
        match parseItems parseFuel [] rest2 with
        | none => none
        | some (items, rest3) => finish imps ns items rest3
    | _ => none

def parseHonestyLoadText (src : String) : Option Module :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

def toySrc : String :=
  "import SystemsLean.EmitBanner\n" ++
  "namespace SystemsLean.DemoLoad\n" ++
  "def stageId : String := \"STAGE\"\n" ++
  "structure Spec where\n" ++
  "  base : String\n" ++
  "  deriving Repr\n" ++
  "def containsStr (s needle : String) : Bool :=\n" ++
  "  s == needle\n" ++
  "end SystemsLean.DemoLoad\n"

def toyAccepts : Bool :=
  match parseHonestyLoadText toySrc with
  | some _ => true
  | none => false

def mainSrc : String :=
  "import SystemsLean.EmitBanner\n" ++
  "namespace SystemsLean.DemoLoad\n" ++
  "structure Spec where\n" ++
  "  base : String\n" ++
  "  deriving Repr\n" ++
  "def main : IO Unit := pure ()\n" ++
  "end SystemsLean.DemoLoad\n"

def mainMisses : Bool :=
  match parseHonestyLoadText mainSrc with
  | none => true
  | some _ => false

def noStructSrc : String :=
  "import SystemsLean.EmitBanner\n" ++
  "namespace SystemsLean.DemoLoad\n" ++
  "def stageId : String := \"STAGE\"\n" ++
  "end SystemsLean.DemoLoad\n"

def noStructMisses : Bool :=
  match parseHonestyLoadText noStructSrc with
  | none => true
  | some _ => false

def boolSrc : String :=
  "import SystemsLean.EmitBanner\n" ++
  "namespace SystemsLean.DemoLoad\n" ++
  "def flag : Bool := true\n" ++
  "structure Spec where\n" ++
  "  base : String\n" ++
  "  deriving Repr\n" ++
  "end SystemsLean.DemoLoad\n"

def boolSkipped : Bool :=
  match parseHonestyLoadText boolSrc with
  | some m => !m.commands.any (fun c =>
      match c with
      | Cmd.def_ _ _ (Term.litBool _) => true
      | _ => false)
  | none => false

end SystemsLean.HonestyLoadFront
