/-
  Module: SystemsLean.ImportOnly
  Shape: eight or more imports, each starting with
  SystemsLean.HostModuleCheck. No namespace, no end, and no form.
  At most eight imports are emitted. The module name is the first import.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.ImportOnly

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def checkP : String := "SystemsLean.HostModuleCheck"

def allCheck : List String -> Bool
  | [] => true
  | s :: rest => s.startsWith checkP && allCheck rest

def importQuiet (sc : TopScan) : Bool :=
  !sc.sawNs && !sc.sawEnd && !sc.sawStr && !sc.sawF && !sc.sawT
    && !sc.sawMain && !sc.sawThm && !sc.sawEx && !sc.sawMut
    && !sc.sawRaw && !sc.sawStruct && !sc.sawInd && sc.closed

def importOk (sc : TopScan) : Bool :=
  atLeast8 sc.imps && allCheck sc.imps && importQuiet sc

/-- Import block with no namespace. The name is the first import. -/
def parseImportOnly (src : String) : Option Module :=
  let sc := scanTop src
  if importOk sc then
    modOf (headImp sc.imps) (takeImps 8 sc.imps)
  else
    none

def importToy : String :=
  "import SystemsLean.HostModuleCheckA\n"
  ++ "import SystemsLean.HostModuleCheckB\n"
  ++ "import SystemsLean.HostModuleCheckC\n"
  ++ "import SystemsLean.HostModuleCheckD\n"
  ++ "import SystemsLean.HostModuleCheckE\n"
  ++ "import SystemsLean.HostModuleCheckF\n"
  ++ "import SystemsLean.HostModuleCheckG\n"
  ++ "import SystemsLean.HostModuleCheckH\n"

def importRejectToy : String :=
  importToy
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def importOnlyAccepts : Bool :=
  match parseImportOnly importToy with
  | some m =>
    isWellFormed m && m.commands.length == 8
      && !hasLitBool false m.commands
  | none => false

def importOnlyRejectsNs : Bool :=
  match parseImportOnly importRejectToy with
  | none => true
  | some _ => false

end SystemsLean.ImportOnly
