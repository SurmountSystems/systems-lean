/-
  Module: SystemsLean.KeptDrop
  Drop-fail for a theorem, a tactic, a mutual block, and a linear def.
  Reuses SystemsLean.KeptForm. Does not duplicate those records.
  finish that keeps only namespace and end is hollow and fails.
  Cmd has no theorem or tactic. Those forms fail closed.
  A linear def is retained only as def_ or defBind with that name.
  A mutual form is retained when both names are retained as defs.
  No IO. No Lake. Does not call Lean.Elab.processCommands.
  HostFront maps none to reject. This module does not import HostFront.
  ASCII only. Flag stays false.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptForm
import SystemsLean.HostTerm

namespace SystemsLean.KeptDrop

open SystemsLean.KeptForm
open SystemsLean.HostTerm

/-- Tactic proof, recorded by the theorem name and the tactic ident. -/
structure TacticForm where
  theoremName : String
  tacticName : String

/-- One kept form. Mutual, theorem, and linear def come from KeptForm. -/
inductive Kept where
  | mutual_ : MutualForm -> Kept
  | theorem : TheoremForm -> Kept
  | linearDef : LinearDefForm -> Kept
  | tactic : TacticForm -> Kept

/-- Greppable reject token for a dropped kept form. -/
def reasonDropped : String := "KEPT-FORM-DROPPED"

/-- Honesty: this module does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\t' || c == '\r'

def trimLeft (cs : List Char) : List Char :=
  match cs with
  | [] => []
  | c :: rest =>
    if isWs c then trimLeft rest else cs

def trim (s : String) : String :=
  String.mk (trimLeft (trimLeft s.toList).reverse).reverse

def stripCR (s : String) : String :=
  match s.toList.reverse with
  | '\r' :: rest => String.mk rest.reverse
  | _ => s

def startsWord (s word : String) : Bool :=
  if s.startsWith word then
    if s.length == word.length then true
    else
      let c := ((s.drop word.length).copy).front
      isWs c
  else
    false

def identGo (acc : List Char) : List Char -> String
  | [] => String.mk acc.reverse
  | c :: rest =>
    if isIdentChar c then identGo (c :: acc) rest
    else String.mk acc.reverse

def identAt (cs : List Char) : String :=
  identGo [] cs

def afterWord (s word : String) : String :=
  trim ((s.drop word.length).copy)

/-- Bare end: the line is end, then only spaces or tabs. -/
def spacesOnly : List Char -> Bool
  | [] => true
  | c :: rest => isWs c && spacesOnly rest

def isBareEnd (s : String) : Bool :=
  s.startsWith "end" && spacesOnly ((s.drop 3).copy).toList

/-- Linear / linear substring in a def name. -/
def hasLinear : List Char -> Bool
  | [] => false
  | 'l' :: 'i' :: 'n' :: 'e' :: 'a' :: 'r' :: _ => true
  | 'L' :: 'i' :: 'n' :: 'e' :: 'a' :: 'r' :: _ => true
  | _ :: rest => hasLinear rest

def nameHasLinear (nm : String) : Bool :=
  hasLinear nm.toList

/-- Tokens on one line. Whitespace splits. -/
def toksGo (cur : List Char) (acc : List String) : List Char -> List String
  | [] =>
    if cur.isEmpty then acc.reverse
    else (String.mk cur.reverse :: acc).reverse
  | c :: rest =>
    if isWs c then
      if cur.isEmpty then toksGo [] acc rest
      else toksGo [] (String.mk cur.reverse :: acc) rest
    else
      toksGo (c :: cur) acc rest

def toks (s : String) : List String :=
  toksGo [] [] s.toList

/-- Rest after the word by. none if by is missing. some "" if by is last. -/
def afterBy : List String -> Option String
  | [] => none
  | "by" :: [] => some ""
  | "by" :: t :: _ => some t
  | _ :: rest => afterBy rest

/-- Block-comment depth change on one line. -/
def blkDelta (d : Nat) : List Char -> Nat
  | [] => d
  | '/' :: '-' :: rest => blkDelta (d + 1) rest
  | '-' :: '/' :: rest =>
    if d == 0 then blkDelta 0 rest else blkDelta (d - 1) rest
  | _ :: rest => blkDelta d rest

/-- Hollow: only import, namespace, end, open. No kept body. -/
def hollowCmds : List Cmd -> Bool
  | [] => true
  | Cmd.importModule _ :: rest => hollowCmds rest
  | Cmd.namespace _ :: rest => hollowCmds rest
  | Cmd.endNamespace _ :: rest => hollowCmds rest
  | Cmd.openNs _ :: rest => hollowCmds rest
  | _ => false

/-- Empty name is vacuously retained. Missing means the Option was none. -/
def hasDefName (cmds : List Cmd) (nm : String) : Bool :=
  if nm == "" then true
  else
    cmds.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == nm
      | Cmd.defBind x _ _ _ => x.raw == nm
      | _ => false

/-- Cmd has no theorem or tactic constructor. Those fail closed. -/
def retains (m : Module) : Kept -> Bool
  | Kept.mutual_ f =>
    hasDefName m.commands f.leftName
      && hasDefName m.commands f.rightName
  | Kept.theorem _ => false
  | Kept.linearDef f => hasDefName m.commands f.defName
  | Kept.tactic _ => false

def retainsAll (m : Module) : List Kept -> Bool
  | [] => true
  | k :: rest => retains m k && retainsAll m rest

structure Acc where
  forms : List Kept
  inMut : Bool
  mutL : String
  mutR : String
  waitTac : String

def emptyAcc : Acc :=
  { forms := [], inMut := false, mutL := "", mutR := "", waitTac := "" }

def push (st : Acc) (k : Kept) : Acc :=
  { st with forms := k :: st.forms }

def closeMut (st : Acc) : Acc :=
  if st.inMut then
    let f : MutualForm := { leftName := st.mutL, rightName := st.mutR }
    { (push st (Kept.mutual_ f)) with
      inMut := false, mutL := "", mutR := "" }
  else
    st

def fillMut (st : Acc) (nm : String) : Acc :=
  if st.mutL == "" then { st with mutL := nm }
  else if st.mutR == "" then { st with mutR := nm }
  else st

def noteDef (st : Acc) (nm : String) : Acc :=
  let st1 := if st.inMut then fillMut st nm else st
  if nameHasLinear nm then
    push st1 (Kept.linearDef { defName := nm })
  else
    st1

def noteTac (st : Acc) (thm tac : String) : Acc :=
  if tac == "" then { st with waitTac := thm }
  else
    { (push st (Kept.tactic { theoremName := thm, tacticName := tac }))
      with waitTac := "" }

def noteThm (st : Acc) (s : String) : Acc :=
  let rest := afterWord s "theorem"
  let nm := identAt rest.toList
  let proof := afterWord rest nm
  let st1 := push st (Kept.theorem { theoremName := nm, proofText := proof })
  match afterBy (toks s) with
  | none => st1
  | some tac => noteTac st1 nm tac

def classify (st : Acc) (s : String) : Acc :=
  if startsWord s "theorem" then noteThm st s
  else if startsWord s "mutual" then
    { (closeMut st) with inMut := true, mutL := "", mutR := "" }
  else if startsWord s "def" then
    noteDef st (identAt (afterWord s "def").toList)
  else if isBareEnd s || startsWord s "end" then
    closeMut st
  else
    st

def onIndent (st : Acc) (s : String) : Acc :=
  let t := trim s
  if st.waitTac != "" then
    let tac := identAt t.toList
    if tac == "" then st
    else
      { (push st (Kept.tactic { theoremName := st.waitTac, tacticName := tac }))
        with waitTac := "" }
  else if st.inMut && startsWord t "def" then
    noteDef st (identAt (afterWord t "def").toList)
  else
    st

def onLine (st : Acc) (blk : Nat) (raw : String) : Prod Acc Nat :=
  let s := stripCR raw
  if blk > 0 then
    (st, blkDelta blk s.toList)
  else if s == "" then
    (st, 0)
  else if s.startsWith "--" then
    (st, 0)
  else if s.startsWith "/-" then
    (st, blkDelta 0 s.toList)
  else if s.front == ' ' || s.front == '\t' then
    (onIndent st s, 0)
  else
    (classify st s, 0)

def fold (st : Acc) (blk : Nat) : List String -> Acc
  | [] => closeMut { st with waitTac := "" }
  | line :: rest =>
    let (st2, blk2) := onLine st blk line
    fold st2 blk2 rest

/-- Kept forms in source order. -/
def scanKept (src : String) : List Kept :=
  (fold emptyAcc 0 (src.splitOn "\n")).forms.reverse

/-- None when finish is missing, hollow, ill-formed, or a form is absent. -/
def dropFailForms (forms : List Kept) (finish : Option Module) :
    Option Module :=
  match finish with
  | none => none
  | some m =>
    if !isWellFormed m then none
    else if hollowCmds m.commands then none
    else if retainsAll m forms then some m
    else none

/-- Drop-fail over source and a finish Module. -/
def dropFail (src : String) (finish : Option Module) : Option Module :=
  dropFailForms (scanKept src) finish

/-- Drop-fail over a KeptForm triple. Reuses keptTriple's records. -/
def dropFailTriple (t : KeptTriple) (finish : Option Module) :
    Option Module :=
  dropFailForms
    [ Kept.mutual_ t.mutualForm
    , Kept.theorem t.theoremForm
    , Kept.linearDef t.linearDef ]
    finish

/-- True when drop-fail returns none. -/
def wouldDrop (src : String) (finish : Option Module) : Bool :=
  match dropFail src finish with
  | none => true
  | some _ => false

/-- Kept list from a present triple. -/
def keptFromTriple (t : KeptTriple) : List Kept :=
  [ Kept.mutual_ t.mutualForm
  , Kept.theorem t.theoremForm
  , Kept.linearDef t.linearDef ]

def hollowMod : Module :=
  { name := n "SystemsLean.MutForm"
    commands :=
      [ Cmd.namespace (n "SystemsLean.MutForm")
      , Cmd.endNamespace (n "SystemsLean.MutForm") ] }

def linMod : Module :=
  { name := n "SystemsLean.CompilePath"
    commands :=
      [ Cmd.namespace (n "SystemsLean.CompilePath")
      , Cmd.def_ (n "linearFixtureMintId") none (Term.litNat 7)
      , Cmd.endNamespace (n "SystemsLean.CompilePath") ] }

def hollowSrc : String :=
  "import SystemsLean.HostTerm\n" ++
  "namespace SystemsLean.MutForm\n" ++
  "end SystemsLean.MutForm\n"

def linSrc : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def linearFixtureMintId : Nat := 7\n" ++
  "end SystemsLean.CompilePath\n"

def thmSrc : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "theorem t : True := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def mutSrc : String :=
  "namespace SystemsLean.MutForm\n" ++
  "mutual\n" ++
  "  def linearFixtureLiveView : Bool := false\n" ++
  "  def linearFixtureSpentView : Bool := false\n" ++
  "end\n" ++
  "end SystemsLean.MutForm\n"

def mutKeptMod : Module :=
  { name := n "SystemsLean.MutForm"
    commands :=
      [ Cmd.namespace (n "SystemsLean.MutForm")
      , Cmd.def_ (n "linearFixtureLiveView") none (Term.litBool false)
      , Cmd.def_ (n "linearFixtureSpentView") none (Term.litBool false)
      , Cmd.endNamespace (n "SystemsLean.MutForm") ] }

/-- Hollow namespace and end is not a kept form. -/
def hollowFails : Bool :=
  match dropFail hollowSrc (some hollowMod) with
  | none => true
  | some _ => false

/-- Missing finish fails closed. -/
def noneFinishFails : Bool :=
  match dropFail linSrc none with
  | none => true
  | some _ => false

/-- Linear def retained as def_ succeeds. -/
def linKeeps : Bool :=
  match dropFail linSrc (some linMod) with
  | some m =>
    isWellFormed m && hasDefName m.commands "linearFixtureMintId"
  | none => false

/-- Theorem cannot inhabit Cmd. Drop-fail stays none. -/
def thmDrops : Bool :=
  match dropFail thmSrc (some linMod) with
  | none => true
  | some _ => false

/-- Mutual emitted as namespace and end only fails. -/
def mutHollowFails : Bool :=
  match dropFail mutSrc (some hollowMod) with
  | none => true
  | some _ => false

/-- Mutual retained when both def names are kept. -/
def mutKeeps : Bool :=
  match dropFail mutSrc (some mutKeptMod) with
  | some m =>
    hasDefName m.commands "linearFixtureLiveView"
      && hasDefName m.commands "linearFixtureSpentView"
  | none => false

/-- keptTriple reused; a theorem in the triple still fails closed. -/
def tripleReused : Bool :=
  match keptTriple
      (some { leftName := "linearFixtureLiveView"
              rightName := "linearFixtureSpentView" })
      (some { theoremName := "t", proofText := "by decide" })
      (some { defName := "linearFixtureMintId" }) with
  | none => false
  | some t =>
    match dropFailTriple t (some linMod) with
    | none => true
    | some _ => false

def pinsOk : Bool :=
  hollowFails && noneFinishFails && linKeeps && thmDrops
    && mutHollowFails && mutKeeps && tripleReused && !flag
    && !slakeOwnsPackageTypecheck

end SystemsLean.KeptDrop
