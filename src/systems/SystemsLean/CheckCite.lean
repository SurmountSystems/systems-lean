/-
  Module: SystemsLean.CheckCite
  Shape: one import, SystemsLean.HostModuleCheck, and that namespace.
  Either a theorem or an example, not both. No Bool literal and no def main.
  The file name is not stored. none on every other shape.
  Theorems and examples are not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.CheckCite

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def citeOk (sc : TopScan) : Bool :=
  match sc.imps with
  | imp :: [] =>
    imp == hmcNs && sc.ns == hmcNs
      && (sc.sawThm || sc.sawEx) && !(sc.sawThm && sc.sawEx)
      && !sc.sawF && !sc.sawT && !sc.sawMain && closedNs sc
  | _ => false

/-- Theorem or example, not both. A file with both stays none. -/
def parseCheckCite (src : String) : Option Module :=
  let sc := scanTop src
  if citeOk sc then
    modOf sc.ns [impCmd hmcNs, nsCmd sc.ns, endCmd sc.ns]
  else
    none

def citeToy : String :=
  "import SystemsLean.HostModuleCheck\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def citeRejectToy : String :=
  "import SystemsLean.HostModuleCheck\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "theorem t : True := by trivial\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def checkCiteAccepts : Bool :=
  match parseCheckCite citeToy with
  | some m => isWellFormed m && m.commands.length == 3
  | none => false

def checkCiteRejectsBoth : Bool :=
  match parseCheckCite citeRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CheckCite
