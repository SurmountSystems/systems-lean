/-
  Module: SystemsLean.RejectDecideBang
  KeptWalk.firstIdent stops at `!`, so `by decide!` records
  tacticName `decide`. typedPass then treats bang as decide.
  This helper fail-closes the bang token. Plain `by decide`
  stays allowed. native_decide already records as native_decide.
  HostTerm.Cmd is not extended.
  slakeOwnsPackageTypecheck stays false. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectDecideBang

open SystemsLean.MutualForm (stripCR)
open SystemsLean.KeptWalk (words)

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- Word is `decide` immediately followed by `!`. -/
def isDecideBang (w : String) : Bool :=
  match w.toList with
  | 'd' :: 'e' :: 'c' :: 'i' :: 'd' :: 'e' :: '!' :: _ => true
  | _ => false

def wordsOfLines : List String -> List String
  | [] => []
  | line :: rest =>
    words (stripCR line).toList [] [] ++ wordsOfLines rest

/-- First word after `by`, including a following line. -/
def wordAfterBy : List String -> Option String
  | [] => none
  | "by" :: [] => none
  | "by" :: w :: rest =>
    if w == "" then wordAfterBy rest else some w
  | _ :: rest => wordAfterBy rest

def tacticWord (src : String) : Option String :=
  wordAfterBy (wordsOfLines (src.splitOn "\n"))

/-- Same four forms as optionHostToy, tactic is `decide!`. -/
def bangToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : True := by decide!\n" ++
  "end N\n"

/-- Next-line bang. firstIdent still records `decide`. -/
def bangNextToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : True := by\n" ++
  "  decide!\n" ++
  "end N\n"

/-- Plain decide. Must stay allowed. -/
def decideToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- True when the tactic word is `decide!`. -/
def rejects (src : String) : Bool :=
  match tacticWord src with
  | some w => isDecideBang w
  | none => false

/-- Bang tactic fails closed. -/
def rejectDecideBang : Bool := rejects bangToy

/-- Next-line bang fails closed. -/
def rejectBangNext : Bool := rejects bangNextToy

/-- Plain `by decide` is still allowed. -/
def acceptDecide : Bool :=
  match tacticWord decideToy with
  | some w => w == "decide" && !isDecideBang w && !rejects decideToy
  | none => false

def pinsOk : Bool :=
  rejectDecideBang && rejectBangNext && acceptDecide
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectDecideBang
