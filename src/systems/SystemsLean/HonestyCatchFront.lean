/-
  Module: SystemsLean.HonestyCatchFront
  A namespace with no import. String literal defs, a String alias,
  one `def name : Bool := false`, and `theorem name : lhs = rhs := rfl`.
  `def name : UInt32 := <digit>` is kept for that rfl and is not emitted.
  HostType has no UInt32. It is not stored as Bool.
  An IO def is skipped. It is not emitted as Bool true.
  `def name : Bool := true` is none. A false Bool stays false.
  `def main` and `example` are none.
  The namespace is the one written. The file name is not hardcoded.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyCompose

namespace SystemsLean.HonestyCatchFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyCompose (tok TMode)

def skipFuel : Nat := 8192

abbrev Env := List (Prod String Term)

structure Step where
  cmds : List Cmd
  env : Env
  sawFalse : Bool
  sawThm : Bool
  rest : List String

def lookup (env : Env) (name : String) : Option Term :=
  match env with
  | [] => none
  | (nm, t) :: rest =>
    if nm == name then some t else lookup rest name

def unfold (fuel : Nat) (env : Env) (t : Term) : Term :=
  match fuel, t with
  | 0, _ => t
  | Nat.succ k, Term.var x =>
    match lookup env x.raw with
    | some body => unfold k env body
    | none => t
  | Nat.succ k, Term.const x =>
    match lookup env x.raw with
    | some body => unfold k env body
    | none => t
  | _, _ => t
termination_by fuel

def sameVal (a b : Term) : Bool :=
  match a, b with
  | Term.litBool x, Term.litBool y => x == y
  | Term.litString x, Term.litString y => x == y
  | Term.litNat x, Term.litNat y => x == y
  | _, _ => false

def natOf (s : String) : Option Nat :=
  match s with
  | "0" => some 0
  | "1" => some 1
  | "2" => some 2
  | "3" => some 3
  | "4" => some 4
  | "5" => some 5
  | "6" => some 6
  | "7" => some 7
  | "8" => some 8
  | "9" => some 9
  | _ => none

def parseSide (ts : List String) : Option (Prod Term (List String)) :=
  match ts with
  | "false" :: rest => some (Term.litBool false, rest)
  | "true" :: rest => some (Term.litBool true, rest)
  | tok :: rest =>
    match unquote tok with
    | some s => some (Term.litString s, rest)
    | none =>
      match natOf tok with
      | some k => some (Term.litNat k, rest)
      | none =>
        if isIdent tok then some (Term.var (n tok), rest) else none
  | [] => none

def rflCmd (nm : String) (lhs rhs : Term) : Cmd :=
  let eqt := Term.app (Term.app (Term.const (n "Eq")) lhs) rhs
  let body := Term.app (Term.const (n "rfl")) eqt
  Cmd.def_ (n nm) (some (HostType.named (n "Prop"))) body

def skipBody (fuel : Nat) (ts : List String) : Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => none
  | _, "def" :: _ => some ts
  | _, "theorem" :: _ => some ts
  | _, "end" :: _ => some ts
  | _, "example" :: _ => none
  | Nat.succ k, _ :: rest => skipBody k rest
termination_by fuel

def strStep (env : Env) (name : String) (body : Term) (cmd : Cmd)
    (rest : List String) : Step :=
  {
    cmds := [cmd]
    env := (name, body) :: env
    sawFalse := false
    sawThm := false
    rest := rest
  }

def parseOne (env : Env) (ts : List String) : Option Step :=
  match ts with
  | "def" :: "main" :: _ => none
  | "example" :: _ => none
  | "theorem" :: name :: ":" :: rest =>
    if isIdent name then
      match parseSide rest with
      | some (lhs, "=" :: rest1) =>
        match parseSide rest1 with
        | some (rhs, ":=" :: "rfl" :: rest2) =>
          let l := unfold parseFuel env lhs
          let r := unfold parseFuel env rhs
          if sameVal l r then
            some {
              cmds := [rflCmd name l r]
              env := env
              sawFalse := false
              sawThm := true
              rest := rest2
            }
          else
            none
        | _ => none
      | _ => none
    else
      none
  | "def" :: name :: ":" :: "String" :: ":=" :: tok :: rest =>
    if isIdent name then
      match unquote tok with
      | some s =>
        let body := Term.litString s
        let cmd := Cmd.def_ (n name) (some HostType.string) body
        some (strStep env name body cmd rest)
      | none =>
        if isIdent tok then
          match unfold parseFuel env (Term.var (n tok)) with
          | Term.litString _ =>
            let body := Term.const (n tok)
            let cmd := Cmd.def_ (n name) (some HostType.string) body
            some (strStep env name body cmd rest)
          | _ => none
        else
          none
    else
      none
  | "def" :: name :: ":" :: "Bool" :: ":=" :: "false" :: rest =>
    if isIdent name then
      let body := Term.litBool false
      let cmd := Cmd.def_ (n name) (some HostType.bool) body
      some {
        cmds := [cmd]
        env := (name, body) :: env
        sawFalse := true
        sawThm := false
        rest := rest
      }
    else
      none
  | "def" :: _ :: ":" :: "Bool" :: ":=" :: "true" :: _ => none
  | "def" :: name :: ":" :: "UInt32" :: ":=" :: num :: rest =>
    if isIdent name then
      match natOf num with
      | some k =>
        some {
          cmds := []
          env := (name, Term.litNat k) :: env
          sawFalse := false
          sawThm := false
          rest := rest
        }
      | none => none
    else
      none
  | "def" :: _ :: rest =>
    match skipBody skipFuel rest with
    | some rest2 =>
      some {
        cmds := []
        env := env
        sawFalse := false
        sawThm := false
        rest := rest2
      }
    | none => none
  | _ => none

def push (cs acc : List Cmd) : List Cmd :=
  match cs with
  | [] => acc
  | c :: rest => push rest (c :: acc)

structure Parsed where
  cmds : List Cmd
  rest : List String

def parseItems (fuel : Nat) (env : Env) (acc : List Cmd)
    (sawFalse sawThm : Bool) (ts : List String) : Option Parsed :=
  match fuel, ts with
  | _, "end" :: _ =>
    if sawFalse && sawThm then
      some { cmds := acc.reverse, rest := ts }
    else
      none
  | 0, _ => none
  | Nat.succ k, _ =>
    match parseOne env ts with
    | none => none
    | some step =>
      parseItems k step.env (push step.cmds acc)
        (sawFalse || step.sawFalse) (sawThm || step.sawThm) step.rest
termination_by fuel

def endMatch (ns : String) (ts : List String) : Bool :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) => nm == ns && rest2.isEmpty
    | none => false
  | _ => false

def finish (ns : String) (items : List Cmd) (ts : List String) :
    Option Module :=
  if endMatch ns ts then
    let cmds :=
      [Cmd.namespace (n ns)] ++ items ++ [Cmd.endNamespace (n ns)]
    let m : Module := { name := n ns, commands := cmds }
    if isWellFormed m then some m else none
  else
    none

def parseToks (ts : List String) : Option Module :=
  match ts with
  | "namespace" :: nsRest =>
    match parseDotted parseFuel nsRest with
    | none => none
    | some (ns, rest2) =>
      match parseItems parseFuel [] [] false false rest2 with
      | none => none
      | some parsed => finish ns parsed.cmds parsed.rest
  | _ => none

def parseHonestyCatchText (src : String) : Option Module :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

def toySrc : String :=
  "namespace SystemsLean.DemoCatch\n" ++
  "def throwMsg : String := \"NO\"\n" ++
  "def catchEprint : String := throwMsg\n" ++
  "def catchCode : UInt32 := 1\n" ++
  "def onCatch (e : IO.Error) : IO UInt32 := do\n" ++
  "  pure catchCode\n" ++
  "def flag : Bool := false\n" ++
  "theorem flag_eq : flag = false := rfl\n" ++
  "theorem code_eq : catchCode = 1 := rfl\n" ++
  "theorem msg_eq : catchEprint = throwMsg := rfl\n" ++
  "end SystemsLean.DemoCatch\n"

def hasFalseFlag (m : Module) : Bool :=
  m.commands.any (fun c =>
    match c with
    | Cmd.def_ nm (some HostType.bool) (Term.litBool false) =>
      nm.raw == "flag"
    | _ => false)

def hasTrueLit (m : Module) : Bool :=
  m.commands.any (fun c =>
    match c with
    | Cmd.def_ _ _ (Term.litBool true) => true
    | _ => false)

def toyAccepts : Bool :=
  match parseHonestyCatchText toySrc with
  | some m => hasFalseFlag m && !hasTrueLit m
  | none => false

def trueSrc : String :=
  "namespace SystemsLean.DemoCatch\n" ++
  "def flag : Bool := true\n" ++
  "theorem flag_eq : flag = true := rfl\n" ++
  "end SystemsLean.DemoCatch\n"

def trueMisses : Bool :=
  match parseHonestyCatchText trueSrc with
  | none => true
  | some _ => false

def mainSrc : String :=
  "namespace SystemsLean.DemoCatch\n" ++
  "def flag : Bool := false\n" ++
  "def main : IO Unit := pure ()\n" ++
  "theorem flag_eq : flag = false := rfl\n" ++
  "end SystemsLean.DemoCatch\n"

def mainMisses : Bool :=
  match parseHonestyCatchText mainSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyCatchFront
