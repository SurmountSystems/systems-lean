/-
  Module: SystemsLean.CheckDriver
  Shape: eight or more imports, namespace HostModuleCheck, and def main.
  No Bool literal, theorem, or example. At most eight imports are emitted.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.CheckDriver

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def driverOk (sc : TopScan) : Bool :=
  atLeast8 sc.imps && sc.ns == hmcNs && sc.sawMain
    && !sc.sawF && !sc.sawT && !sc.sawThm && !sc.sawEx
    && closedNs sc

def driverCmds (sc : TopScan) : List Cmd :=
  takeImps 8 sc.imps ++ [nsCmd sc.ns] ++ optStr sc
    ++ [endCmd sc.ns]

/-- HostModuleCheck driver. Imports past eight are not emitted. -/
def parseCheckDriver (src : String) : Option Module :=
  let sc := scanTop src
  if driverOk sc then modOf sc.ns (driverCmds sc) else none

def driverToy : String :=
  "import SystemsLean.A\n"
  ++ "import SystemsLean.B\n"
  ++ "import SystemsLean.C\n"
  ++ "import SystemsLean.D\n"
  ++ "import SystemsLean.E\n"
  ++ "import SystemsLean.F\n"
  ++ "import SystemsLean.G\n"
  ++ "import SystemsLean.H\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def driverRejectToy : String :=
  "import SystemsLean.A\n"
  ++ "import SystemsLean.B\n"
  ++ "import SystemsLean.C\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def checkDriverAccepts : Bool :=
  match parseCheckDriver driverToy with
  | some m =>
    isWellFormed m && !hasLitBool false m.commands
      && m.commands.length == 10
  | none => false

def checkDriverRejectsShort : Bool :=
  match parseCheckDriver driverRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CheckDriver
