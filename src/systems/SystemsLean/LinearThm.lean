/-
  Module: SystemsLean.LinearThm
  Shape: namespace SystemsLean.LinearUseFail, a theorem, and no example.
  The first import starts with SystemsLean.LinearUseFail.
  No Bool literal and no def main. At most eight imports are emitted.
  The file name is not stored. none on every other shape.
  Theorems are not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LinearThm

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def linearNs : String := "SystemsLean.LinearUseFail"

def linearThmOk (sc : TopScan) : Bool :=
  sc.ns == linearNs && sc.sawThm && !sc.sawEx && !sc.sawStruct
    && !sc.sawF && !sc.sawT && !sc.sawMain
    && (headImp sc.imps).startsWith linearNs
    && closedNs sc

def linearThmCmds (sc : TopScan) : List Cmd :=
  takeImps 8 sc.imps ++ [nsCmd sc.ns, endCmd sc.ns]

/-- LinearUseFail theorems. A file that also has an example stays none. -/
def parseLinearThm (src : String) : Option Module :=
  let sc := scanTop src
  if linearThmOk sc then modOf sc.ns (linearThmCmds sc) else none

def linearThmToy : String :=
  "import SystemsLean.LinearUseFail\n"
  ++ "namespace SystemsLean.LinearUseFail\n"
  ++ "theorem t : True := by trivial\n"
  ++ "end SystemsLean.LinearUseFail\n"

def linearThmRejectToy : String :=
  "import SystemsLean.LinearUseFail\n"
  ++ "namespace SystemsLean.LinearUseFail\n"
  ++ "theorem t : True := by trivial\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.LinearUseFail\n"

def linearThmAccepts : Bool :=
  match parseLinearThm linearThmToy with
  | some m => isWellFormed m && m.commands.length == 3
  | none => false

def linearThmRejectsExample : Bool :=
  match parseLinearThm linearThmRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LinearThm
