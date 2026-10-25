/-
  Module: SystemsLean.CheckBarrel
  Shape: three or more imports, namespace HostModuleCheck, no def main,
  no Bool literal, no theorem, and no example.
  At most eight imports are emitted.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.CheckBarrel

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def barrelOk (sc : TopScan) : Bool :=
  atLeast3 sc.imps && sc.ns == hmcNs && !sc.sawMain
    && !sc.sawF && !sc.sawT && !sc.sawThm && !sc.sawEx
    && !sc.sawMut && closedNs sc

def barrelCmds (sc : TopScan) : List Cmd :=
  takeImps 8 sc.imps ++ [nsCmd sc.ns] ++ optStr sc
    ++ [endCmd sc.ns]

/-- HostModuleCheck barrel. A def main stays none here. -/
def parseCheckBarrel (src : String) : Option Module :=
  let sc := scanTop src
  if barrelOk sc then modOf sc.ns (barrelCmds sc) else none

def barrelToy : String :=
  "import SystemsLean.HostModuleCheckFixtures\n"
  ++ "import SystemsLean.HostModuleCheckSurface\n"
  ++ "import SystemsLean.HostModuleCheckSeeds\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def barrelRejectToy : String :=
  "import SystemsLean.HostModuleCheckFixtures\n"
  ++ "import SystemsLean.HostModuleCheckSurface\n"
  ++ "import SystemsLean.HostModuleCheckSeeds\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def checkBarrelAccepts : Bool :=
  match parseCheckBarrel barrelToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def checkBarrelRejectsMain : Bool :=
  match parseCheckBarrel barrelRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CheckBarrel
