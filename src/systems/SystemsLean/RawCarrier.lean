/-
  Module: SystemsLean.RawCarrier
  Every namespace starts with SystemsLean.HostFrontLive.
  At least one namespace. At least one String literal def.
  A raw-string def counts. Inner lines stay in that block.
  The raw def is emitted as an empty String literal.
  Later namespaces in the file are emitted empty.
  A false Bool stays false. The module file name is not stored.
  The module name is the first namespace text.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.DriverPins

namespace SystemsLean.RawCarrier

open SystemsLean.HostTerm
open SystemsLean.DriverPins
  (linesOf isBlank col0 joinSp startsWith classify addPin emptyPins)

def livePfx : String := "SystemsLean.HostFrontLive"

def leadingHash : List Char -> Nat
  | '#' :: rest => leadingHash rest + 1
  | _ => 0

def dropHash : Nat -> List Char -> List Char
  | 0, cs => cs
  | Nat.succ k, '#' :: rest => dropHash k rest
  | _, cs => cs

def exactHash : Nat -> List Char -> Bool
  | 0, '#' :: _ => false
  | 0, _ => true
  | Nat.succ k, '#' :: rest => exactHash k rest
  | _, _ => false

def closes (n : Nat) : List Char -> Bool
  | [] => false
  | '"' :: rest =>
    if n >= 1 && exactHash n rest then true else closes n rest
  | _ :: rest => closes n rest

def afterOpen : List Char -> Option (Prod Nat (List Char))
  | [] => none
  | 'r' :: rest =>
    let n := leadingHash rest
    if n >= 1 then
      match dropHash n rest with
      | '"' :: after => some (n, after)
      | _ => afterOpen rest
    else
      afterOpen rest
  | _ :: rest => afterOpen rest

def defName (line : String) : String :=
  match SystemsLean.DriverPins.afterWord "def" line with
  | none => ""
  | some cs =>
    match SystemsLean.DriverPins.readIdent cs with
    | some (nm, _) => nm
    | none => ""

structure W where
  pins : SystemsLean.DriverPins.Pins
  cur : List String
  isRaw : Bool
  rawNm : String
  inRaw : Bool
  rawN : Nat
  inCom : Bool

def emptyW : W :=
  { pins := emptyPins
    cur := []
    isRaw := false
    rawNm := ""
    inRaw := false
    rawN := 0
    inCom := false }

def flushW (w : W) : W :=
  match w.cur with
  | [] => w
  | _ =>
    let block := joinSp w.cur.reverse
    let pin :=
      if w.isRaw then
        if w.rawNm == "" then
          SystemsLean.DriverPins.Kind.skip
        else
          SystemsLean.DriverPins.Kind.str w.rawNm ""
      else
        classify block
    { emptyW with pins := addPin pin w.pins }

def noteOpen (w : W) (line : String) : W :=
  match afterOpen line.toList with
  | none => w
  | some (n, after) =>
    let nm := if w.rawNm == "" then defName line else w.rawNm
    { w with
      isRaw := true
      rawNm := nm
      rawN := n
      inRaw := !closes n after }

def noteClose (w : W) (line : String) : W :=
  if w.inRaw && closes w.rawN line.toList then
    { w with inRaw := false }
  else
    w

def startsCom (line : String) : Bool :=
  startsWith (SystemsLean.DriverPins.trim line) "/-"

def hasEnd (line : String) : Bool :=
  match SystemsLean.DriverPins.findKey ['-', '/']
      line.toList with
  | some _ => true
  | none => false

def step (w : W) (line : String) : W :=
  if w.inRaw then
    noteClose { w with cur := line :: w.cur } line
  else if isBlank line then
    w
  else if w.inCom then
    if hasEnd line then { w with inCom := false } else w
  else if startsWith (SystemsLean.DriverPins.trim line) "--" then
    w
  else if startsCom line then
    if hasEnd line then w else { w with inCom := true }
  else if col0 line then
    let w2 := flushW w
    noteOpen { w2 with cur := [line] } line
  else
    noteOpen { w with cur := line :: w.cur } line

def walk : List String -> W -> W
  | [], w => flushW w
  | l :: rest, w => walk rest (step w l)

def allLive : List String -> Bool
  | [] => true
  | m :: rest => startsWith m livePfx && allLive rest

def nsWrap (ns : String) (body : List Cmd) : List Cmd :=
  [Cmd.namespace (n ns)] ++ body ++ [Cmd.endNamespace (n ns)]

def wrapNs : List String -> List Cmd -> List Cmd
  | [], _ => []
  | ns :: rest, body => nsWrap ns body ++ wrapNs rest []

def strCmd (nm : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.string) (Term.litString "")

def impCmd (m : String) : Cmd :=
  Cmd.importModule (n m)

def mapStr : List (Prod String String) -> List Cmd
  | [] => []
  | (nm, _) :: rest => strCmd nm :: mapStr rest

def mapImp : List String -> List Cmd
  | [] => []
  | m :: rest => impCmd m :: mapImp rest

def finish
    (imps : List String) (nss : List String)
    (strs : List (Prod String String)) : Option Module :=
  match nss.reverse with
  | [] => none
  | ns :: _ =>
    let ordered := nss.reverse
    if !allLive ordered then
      none
    else
      let ss := strs.reverse
      if ss.isEmpty then
        none
      else
        let cmds := mapImp imps.reverse ++ wrapNs ordered (mapStr ss)
        let m : Module := { name := n ns, commands := cmds }
        if isWellFormed m then some m else none

def parseRaw (src : String) : Option Module :=
  let w := walk (linesOf src.toList) emptyW
  finish w.pins.imps w.pins.nss w.pins.strs

end SystemsLean.RawCarrier
