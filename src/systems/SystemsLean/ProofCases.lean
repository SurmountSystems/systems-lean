/-
  Module: SystemsLean.ProofCases
  Shape: import SystemsLean.LessThan, namespace SystemsLean.ProofByCases,
  a structure, and an inductive. No theorem, Bool literal, or def main.
  The file name is not stored. none on every other shape.
  Structure and inductive are not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.ProofCases

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def lessThan : String := "SystemsLean.LessThan"

def proofOk (sc : TopScan) : Bool :=
  match sc.imps with
  | imp :: [] =>
    imp == lessThan && sc.ns == "SystemsLean.ProofByCases"
      && sc.sawStruct && sc.sawInd && !sc.sawThm && !sc.sawEx
      && !sc.sawF && !sc.sawT && !sc.sawMain && closedNs sc
  | _ => false

/-- LessThan import with structure and inductive. -/
def parseProofCases (src : String) : Option Module :=
  let sc := scanTop src
  if proofOk sc then
    modOf sc.ns [impCmd lessThan, nsCmd sc.ns, endCmd sc.ns]
  else
    none

def proofToy : String :=
  "import SystemsLean.LessThan\n"
  ++ "namespace SystemsLean.ProofByCases\n"
  ++ "structure Step where\n"
  ++ "  x : Nat\n"
  ++ "inductive NameApp where\n"
  ++ "  | a\n"
  ++ "end SystemsLean.ProofByCases\n"

def proofRejectToy : String :=
  "import SystemsLean.Mult\n"
  ++ "namespace SystemsLean.ProofByCases\n"
  ++ "structure Step where\n"
  ++ "  x : Nat\n"
  ++ "inductive NameApp where\n"
  ++ "  | a\n"
  ++ "end SystemsLean.ProofByCases\n"

def proofCasesAccepts : Bool :=
  match parseProofCases proofToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def proofCasesRejectsOther : Bool :=
  match parseProofCases proofRejectToy with
  | none => true
  | some _ => false

end SystemsLean.ProofCases
