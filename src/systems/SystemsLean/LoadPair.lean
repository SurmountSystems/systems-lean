/-
  Module: SystemsLean.LoadPair
  Shape: two HostFrontLive imports, ending SourceA then SourceB.
  A depth-0 raw string. Namespace stays under HostFrontLive.
  No Bool literal, def main, theorem, or example.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LoadPair

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def frontP : String := "SystemsLean.HostFrontLive"

def loadOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: [] =>
    a.startsWith frontP && a.endsWith "SourceA"
      && b.startsWith frontP && b.endsWith "SourceB"
      && sc.sawRaw && !sc.sawF && !sc.sawT && !sc.sawMain
      && !sc.sawThm && !sc.sawEx && sc.ns.startsWith frontP
      && closedNs sc
  | _ => false

def loadCmds (sc : TopScan) : List Cmd :=
  takeImps 2 sc.imps ++ [nsCmd sc.ns] ++ optStr sc
    ++ [endCmd sc.ns]

/-- SourceA and SourceB. none on the zero-import raw shape. -/
def parseLoadPair (src : String) : Option Module :=
  let sc := scanTop src
  if loadOk sc then modOf sc.ns (loadCmds sc) else none

def loadToy : String :=
  "import SystemsLean.HostFrontLiveDemoSourceA\n"
  ++ "import SystemsLean.HostFrontLiveDemoSourceB\n"
  ++ "namespace SystemsLean.HostFrontLiveDemo\n"
  ++ "def src : String := r#\"body\"#\n"
  ++ "end SystemsLean.HostFrontLiveDemo\n"

def loadRejectToy : String :=
  "namespace SystemsLean.HostFrontLiveDemo\n"
  ++ "def src : String := r#\"body\"#\n"
  ++ "end SystemsLean.HostFrontLiveDemo\n"

def loadPairAccepts : Bool :=
  match parseLoadPair loadToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def loadPairRejectsRaw : Bool :=
  match parseLoadPair loadRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LoadPair
