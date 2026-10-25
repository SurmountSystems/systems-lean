/-
  Module: SystemsLean.ThmForm
  Shape: one import. The namespace equals that import and matches end.
  A theorem form, no example.
  The file name is not stored.
  none on every other shape.
  A same-line Bool false is emitted as litBool false, never as true.
  The theorem is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple
import SystemsLean.ThmOne

namespace SystemsLean.ThmForm

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def linP : String := "SystemsLean.LinearUseFail"

def elfP : String := "SystemsLean.SlakeHostToolElf"

def thmFormOk (sc : TopScan) : Bool :=
  let imp := headImp sc.imps
  is1 sc.imps && sc.ns == imp && closedNs sc && sc.sawThm
    && !sc.sawEx && !sc.sawMain && !sc.sawStr && !sc.sawStruct
    && !sc.sawInd && !sc.sawMut && !sc.sawRaw
    && !(SystemsLean.ThmOne.heldImport imp)
    && !imp.startsWith linP && sc.ns != linP
    && !imp.startsWith elfP && !sc.ns.startsWith elfP

def thmFormCmds (sc : TopScan) : List Cmd :=
  takeImps 1 sc.imps ++ [nsCmd sc.ns] ++ optBools sc
    ++ [endCmd sc.ns]

/-- One import, namespace equal to it, a theorem, and no example. -/
def parseThmForm (src : String) : Option Module :=
  let sc := scanTop src
  if thmFormOk sc then modOf sc.ns (thmFormCmds sc) else none

def srcOf (imp ns body : String) : String :=
  "import " ++ imp ++ "\n" ++ "namespace " ++ ns ++ "\n"
    ++ body ++ "end " ++ ns ++ "\n"

def thmFormToy : String :=
  srcOf "SystemsLean.OfficialPath" "SystemsLean.OfficialPath"
    ("def flag : Bool := false\n"
      ++ "theorem t : True := by trivial\n")

def thmFormKeepsFalse : Bool :=
  match parseThmForm thmFormToy with
  | some m =>
    hasLitBool false m.commands && !hasLitBool true m.commands
      && isWellFormed m
  | none => false

def isNone (src : String) : Bool :=
  match parseThmForm src with
  | none => true
  | some _ => false

def exToy : String :=
  srcOf "SystemsLean.OfficialPath" "SystemsLean.OfficialPath"
    ("theorem stageId_eq : True := by trivial\n"
      ++ "example : True := by trivial\n")

def heldToy : String :=
  srcOf "SystemsLean.DualEqWriteParity" "SystemsLean.DualEqWriteParity"
    "theorem pin_false : True := by trivial\n"

def linearToy : String :=
  srcOf "SystemsLean.LinearUseFail" "SystemsLean.LinearUseFail"
    "theorem t : True := by trivial\n"

def elfToy : String :=
  srcOf "SystemsLean.SlakeHostToolElfX" "SystemsLean.SlakeHostToolElfX"
    "theorem t : True := by trivial\n"

def mainToy : String :=
  srcOf "SystemsLean.OfficialPath" "SystemsLean.OfficialPath"
    ("def main : IO Unit := pure ()\n"
      ++ "theorem t : True := by trivial\n")

def noThmToy : String :=
  srcOf "SystemsLean.OfficialPath" "SystemsLean.OfficialPath"
    "def flag : Bool := false\n"

def twoToy : String :=
  "import SystemsLean.OfficialPath\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.OfficialPath\n"
  ++ "theorem t : True := by trivial\n"
  ++ "end SystemsLean.OfficialPath\n"

def structToy : String :=
  srcOf "SystemsLean.OfficialPath" "SystemsLean.OfficialPath"
    ("structure S where\n  x : Nat\n"
      ++ "theorem t : True := by trivial\n")

def rejectsEx : Bool := isNone exToy

def rejectsHeld : Bool := isNone heldToy

def rejectsLinear : Bool := isNone linearToy

def rejectsElf : Bool := isNone elfToy

def rejectsMain : Bool := isNone mainToy

def rejectsNoThm : Bool := isNone noThmToy

def rejectsTwo : Bool := isNone twoToy

def rejectsStruct : Bool := isNone structToy

end SystemsLean.ThmForm
