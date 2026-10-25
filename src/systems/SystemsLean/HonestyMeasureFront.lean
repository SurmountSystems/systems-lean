/-
  Module: SystemsLean.HonestyMeasureFront
  A namespace of string and Bool defs, then one IO Unit measure.
  The measure name is the def ident. The file name is not read.
  Prints are IO.println of a quoted string or an s! hole.
  The if condition is a Bool that already reduces true.
  Else is eprintln and throw of a hole-free string.
  One Bool def follows. main calls that measure name.
  Catch prints `{e}` and exits 1. The ok path exits 0.
  The measure term is not Bool true.
  A false Bool stays false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HonestyCapable
import SystemsLean.HostKernelMeasure

namespace SystemsLean.HonestyMeasureFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode isIdent unquote parseDotted
  parseFuel)
open SystemsLean.HonestyCompose (tok TMode)
open SystemsLean.HonestyCapable
open SystemsLean.HostKernelMeasure (measureBody ioUnit)

def catchLit : String := "\"{e}\""

def quotedArg (allow : List String) (holes : Bool) (ts : List String) :
    Option (Prod String (List String)) :=
  match ts with
  | "s" :: "!" :: lit :: rest =>
    match unquote lit with
    | some s =>
      if holes && holesOk allow s.toList HoleMode.text then
        some (s, rest)
      else
        none
    | none => none
  | lit :: rest =>
    match unquote lit with
    | some s =>
      if holesOk [] s.toList HoleMode.text then some (s, rest) else none
    | none => none
  | _ => none

def onePrint (allow : List String) (ts : List String) :
    Option (Prod String (List String)) :=
  match ts with
  | "IO" :: "." :: "println" :: rest => quotedArg allow true rest
  | _ => none

def takePrints (fuel : Nat) (allow : List String) (acc : List String)
    (ts : List String) : Option (Prod (List String) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match onePrint allow ts with
    | some (s, rest) => takePrints k allow (s :: acc) rest
    | none =>
      if acc.isEmpty then none else some (acc.reverse, ts)
termination_by fuel

structure MeasureBits where
  cond : String
  lines : List String
  errS : String
  throwS : String
  rest : List String

/-- The if name is whatever Bool is already true. Not a fixed ident. -/
def parseMeasureIf (env : CapEnv) (allow : List String)
    (lines : List String) (ts : List String) : Option MeasureBits :=
  match ts with
  | "if" :: cond :: "then" :: rest =>
    if isIdent cond && lookupBool env.bools cond == some true then
      match onePrint allow rest with
      | none => none
      | some (th, rest2) =>
        match rest2 with
        | "else" :: "IO" :: "." :: "eprintln" :: rest3 =>
          match quotedArg allow true rest3 with
          | none => none
          | some (errS, rest4) =>
            match rest4 with
            | "throw" :: "(" :: "IO" :: "." :: "userError" :: lit
                :: ")" :: rest5 =>
              match unquote lit with
              | some throwS =>
                if holesOk [] throwS.toList HoleMode.text then
                  some {
                    cond := cond
                    lines := lines ++ [th]
                    errS := errS
                    throwS := throwS
                    rest := rest5
                  }
                else
                  none
              | none => none
            | _ => none
        | _ => none
    else
      none
  | _ => none

def measureHead (ts : List String) : Option (Prod String (List String)) :=
  match ts with
  | "def" :: name :: ":" :: "IO" :: "Unit" :: ":=" :: "do" :: rest =>
    if isIdent name && name != "main" then some (name, rest) else none
  | _ => none

/-- Ok path exits 0. Catch prints `{e}` and exits 1. Callee is stored. -/
def parseMeasureMain (callee : String) (ts : List String) :
    Option (List String) :=
  match ts with
  | "def" :: "main" :: "(" :: "_args" :: ":" :: "List" :: "String" :: ")"
      :: ":" :: "IO" :: "UInt32" :: ":=" :: "do" :: "try"
      :: c :: "pure" :: "0" :: "catch" :: "e" :: "=>"
      :: "IO" :: "." :: "eprintln" :: "s" :: "!" :: lit
      :: "pure" :: "1" :: rest =>
    if c == callee && lit == catchLit then some rest else none
  | _ => none

def measureCmd (b : MeasureBits) (mname : String) : Cmd :=
  Cmd.def_ (n mname) (some ioUnit)
    (measureBody b.cond b.lines b.errS b.throwS)

def parseTail (ns : String) (defs : List Cmd) (env : CapEnv)
    (ts : List String) : Option Module :=
  match measureHead ts with
  | none => none
  | some (mname, rest) =>
    let allow := allowNames env
    match takePrints parseFuel allow [] rest with
    | none => none
    | some (lines, rest2) =>
      match parseMeasureIf env allow lines rest2 with
      | none => none
      | some bits =>
        match bits.rest with
        | "def" :: _ :: ":" :: "Bool" :: ":=" :: _ =>
          match parseDef env bits.rest with
          | none => none
          | some (bcmd, _, rest3) =>
            match parseMeasureMain mname rest3 with
            | none => none
            | some rest4 =>
              finish ns (defs ++ [measureCmd bits mname, bcmd, mainCmd])
                rest4
        | _ => none

/-- none unless the whole measure shape is present. The file name is not read. -/
def parseMeasureText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "namespace" :: rest =>
        match parseDotted parseFuel rest with
        | none => none
        | some (ns, rest2) =>
          match parseDefs parseFuel emptyEnv [] rest2 with
          | none => none
          | some (defs, env, rest3) =>
            if defs.isEmpty then none else parseTail ns defs env rest3
      | _ => none

end SystemsLean.HonestyMeasureFront
