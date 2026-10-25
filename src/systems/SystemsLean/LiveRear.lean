/-
  Module: SystemsLean.LiveRear
  Shape: HostFrontLiveHostTerm, then HostKernel, then an import
  that ends with SourceText. Bool false, Bool true, and def main.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LiveRear

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def rearOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: c :: [] =>
    a == liveTerm && b == hostKernel && c.endsWith "SourceText"
      && sc.sawF && sc.fNm != "" && sc.sawT && sc.tNm != ""
      && sc.sawMain && !sc.sawMut && !sc.sawThm && !sc.sawEx
      && !sc.sawRaw && closedNs sc
  | _ => false

def rearCmds (sc : TopScan) : List Cmd :=
  takeImps 3 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- Kernel in the middle, SourceText last. none on the Source middle. -/
def parseLiveRear (src : String) : Option Module :=
  let sc := scanTop src
  if rearOk sc then modOf sc.ns (rearCmds sc) else none

def rearToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.DemoSourceText\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def rearRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveRearKeepsFalse : Bool :=
  match parseLiveRear rearToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def liveRearRejectsFamily : Bool :=
  match parseLiveRear rearRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LiveRear
