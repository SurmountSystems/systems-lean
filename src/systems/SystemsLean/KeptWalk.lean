/-
  Module: SystemsLean.KeptWalk
  Living walk over source text. Keeps a theorem, a tactic, a mutual
  block, and a linear def.
  Reuses SystemsLean.KeptForm records. Does not clone those types.
  Tactic is the extra walk result; KeptForm has no tactic field.
  Hollow namespace and end is none. Does not return a HostTerm.Module.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptForm
import SystemsLean.MutualForm

namespace SystemsLean.KeptWalk

open SystemsLean.KeptForm
open SystemsLean.MutualForm (
  Scan startScan eat flushPending endLine
  startsWord trim stripCR isBareEnd isIdentChar isLetter)

/-- Tactic ident from `by <ident>`. Not a KeptForm constructor. -/
structure TacticForm where
  tacticName : String

/-- KeptForm triple plus the tactic that triple does not store. -/
structure KeptHit where
  triple : KeptTriple
  tactic : TacticForm

structure Acc where
  inMut : Bool
  leftN : String
  rightN : String
  thmN : String
  proof : String
  defN : String
  tacN : String
  waitBy : Bool

def empty : Acc :=
  { inMut := false, leftN := "", rightN := "", thmN := ""
    , proof := "", defN := "", tacN := "", waitBy := false }

def identStart (c : Char) : Bool :=
  isLetter c || c == '_'

def isKw (w : String) : Bool :=
  w == "theorem" || w == "def" || w == "example" || w == "mutual"
    || w == "end" || w == "namespace" || w == "import" || w == "open"
    || w == "structure" || w == "inductive" || w == "instance"
    || w == "class" || w == "where" || w == "set_option"
    || w == "if" || w == "then" || w == "else" || w == "match"
    || w == "fun" || w == "do" || w == "let" || w == "have"

def firstIdent (s : String) : String :=
  go s.toList [] false
where
  go (cs : List Char) (acc : List Char) (had : Bool) : String :=
    match cs with
    | [] => String.mk acc.reverse
    | c :: rest =>
      if had then
        if isIdentChar c then go rest (c :: acc) true
        else String.mk acc.reverse
      else if identStart c then go rest [c] true
      else if c == ' ' || c == '\t' then go rest [] false
      else ""

def dropWord (s word : String) : String :=
  trim ((s.drop word.length).copy)

def skipMods (fuel : Nat) (s : String) : String :=
  match fuel with
  | 0 => s
  | Nat.succ k =>
    let t := trim s
    if startsWord t "noncomputable" then skipMods k ((t.drop 13).copy)
    else if startsWord t "protected" then skipMods k ((t.drop 9).copy)
    else if startsWord t "private" then skipMods k ((t.drop 7).copy)
    else if startsWord t "partial" then skipMods k ((t.drop 7).copy)
    else if startsWord t "unsafe" then skipMods k ((t.drop 6).copy)
    else t

def words : List Char -> List Char -> List String -> List String
  | [], cur, acc =>
    let acc2 :=
      if cur.isEmpty then acc else String.mk cur.reverse :: acc
    acc2.reverse
  | c :: rest, cur, acc =>
    if c == ' ' || c == '\t' then
      if cur.isEmpty then words rest [] acc
      else words rest [] (String.mk cur.reverse :: acc)
    else
      words rest (c :: cur) acc

/-- Some "" means `by` with no ident yet (next line). -/
def identAfterBy : List String -> Option String
  | [] => none
  | "by" :: [] => some ""
  | "by" :: w :: _ =>
    if w == "" then some ""
    else if identStart w.front then some (firstIdent w)
    else none
  | _ :: rest => identAfterBy rest

def takeBy (s : String) : Option String :=
  identAfterBy (words s.toList [] [])

def addMut (st : Acc) (nm : String) : Acc :=
  if !st.inMut || nm == "" then st
  else if st.leftN == "" then { st with leftN := nm }
  else if st.rightN == "" then { st with rightN := nm }
  else st

def withTac (st : Acc) (w : String) : Acc :=
  if w == "" then { st with waitBy := true }
  else
    let proof := if st.proof == "" then "by " ++ w else st.proof
    let tac := if st.tacN == "" then w else st.tacN
    { st with proof := proof, tacN := tac, waitBy := false }

def onTheorem (st : Acc) (rest : String) : Acc :=
  let nm := firstIdent rest
  let st1 :=
    if st.thmN == "" && nm != "" then { st with thmN := nm } else st
  let st2 := addMut st1 nm
  match takeBy rest with
  | none => st2
  | some w => withTac st2 w

def onDef (st : Acc) (rest : String) : Acc :=
  let nm := firstIdent rest
  if nm == "" then st
  else
    let st1 :=
      if st.defN == "" then { st with defN := nm } else st
    addMut st1 nm

def onExample (st : Acc) (rest : String) : Acc :=
  match takeBy rest with
  | none => st
  | some w => withTac st w

def classify (st : Acc) (raw : String) : Acc :=
  let s := trim (stripCR raw)
  if s == "" then st
  else if st.waitBy then
    let w := firstIdent s
    if w == "" || isKw w then { st with waitBy := false }
    else withTac { st with waitBy := false } w
  else if startsWord s "mutual" then
    { st with inMut := true }
  else if isBareEnd s then
    if st.inMut then { st with inMut := false } else st
  else
    let t := skipMods 8 s
    if startsWord t "theorem" then onTheorem st (dropWord t "theorem")
    else if startsWord t "def" then onDef st (dropWord t "def")
    else if startsWord t "example" then onExample st (dropWord t "example")
    else if startsWord t "by" then
      match takeBy t with
      | none => st
      | some w => withTac st w
    else
      match takeBy t with
      | none => st
      | some w => withTac st w

def onLine (st : Acc) (sc : Scan) (line : String) : Prod Acc Scan :=
  let started := sc.mode == 0
  let sc1 := eat { sc with taking := started, pre := [] } line.toList
  let sc2 := flushPending sc1
  let st2 :=
    if started then classify st (String.mk sc2.pre.reverse) else st
  (st2, endLine sc2)

def fold (st : Acc) (sc : Scan) : List String -> Prod Acc Scan
  | [] => (st, sc)
  | line :: rest =>
    let (st2, sc2) := onLine st sc line
    fold st2 sc2 rest

/-- None unless theorem, tactic, two mutual names, and a linear def
    are all present. Does not accept namespace and end alone. -/
def finish (sc : Scan) (st : Acc) : Option KeptHit :=
  if sc.mode != 0 then none
  else if st.leftN == "" || st.rightN == "" then none
  else if st.thmN == "" || st.defN == "" then none
  else if st.tacN == "" then none
  else
    let mf : MutualForm :=
      { leftName := st.leftN, rightName := st.rightN }
    let tf : TheoremForm :=
      { theoremName := st.thmN, proofText := st.proof }
    let df : LinearDefForm := { defName := st.defN }
    match keptTriple (some mf) (some tf) (some df) with
    | none => none
    | some tr =>
      some { triple := tr, tactic := { tacticName := st.tacN } }

/-- Named walk over source. HostFront can import this later. -/
def walkKept (src : String) : Option KeptHit :=
  let (st, sc) := fold empty startScan (src.splitOn "\n")
  finish sc st

def keptToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Nat := 1\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

def hollowToy : String :=
  "namespace N\n" ++
  "end N\n"

def commentToy : String :=
  "namespace N\n" ++
  "-- mutual\n" ++
  "-- theorem th : True := by decide\n" ++
  "-- def linearN : Nat := 0\n" ++
  "end N\n"

def strToy : String :=
  "namespace N\n" ++
  "def s : String := \"theorem th := by decide mutual def\"\n" ++
  "end N\n"

def byNextToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Nat := 1\n" ++
  "end\n" ++
  "theorem th : True := by\n" ++
  "  native_decide\n" ++
  "end N\n"

def thmOnlyToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

def hitOk (h : KeptHit) : Bool :=
  h.triple.mutualForm.leftName == "leftN"
    && h.triple.mutualForm.rightName == "rightN"
    && h.triple.theoremForm.theoremName == "th"
    && h.triple.theoremForm.proofText == "by decide"
    && h.triple.linearDef.defName == "linearN"
    && h.tactic.tacticName == "decide"

def keptWalkToySome : Bool :=
  match walkKept keptToy with
  | some h => hitOk h
  | none => false

def keptWalkHollowNone : Bool :=
  match walkKept hollowToy with
  | none => true
  | some _ => false

def keptWalkCommentNone : Bool :=
  match walkKept commentToy with
  | none => true
  | some _ => false

def keptWalkStrNone : Bool :=
  match walkKept strToy with
  | none => true
  | some _ => false

def keptWalkByNextSome : Bool :=
  match walkKept byNextToy with
  | some h =>
    h.triple.theoremForm.theoremName == "th"
      && h.tactic.tacticName == "native_decide"
      && h.triple.linearDef.defName == "linearN"
  | none => false

def keptWalkThmOnlyNone : Bool :=
  match walkKept thmOnlyToy with
  | none => true
  | some _ => false

end SystemsLean.KeptWalk
