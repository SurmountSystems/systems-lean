/-
  Module: SystemsLean.CallistoLiveFour
  Shape: four live-family imports, Bool false, Bool true, and def main.
  No mutual, theorem, or example.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoLiveFour

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def liveFourOk (sc : TopScan) : Bool :=
  is4 sc.imps && liveFamily sc.imps && sc.sawF && sc.fNm != ""
    && sc.sawT && sc.tNm != "" && sc.sawMain
    && !sc.sawMut && !sc.sawThm && !sc.sawEx && !sc.sawRaw
    && closedNs sc

def liveFourCmds (sc : TopScan) : List Cmd :=
  takeImps 4 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- Four-import live family. none on the three-import shape. -/
def parseLiveFour (src : String) : Option Module :=
  let sc := scanTop src
  if liveFourOk sc then modOf sc.ns (liveFourCmds sc) else none

def liveFourToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.DemoExtra\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveFourRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveFourKeepsFalse : Bool :=
  match parseLiveFour liveFourToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def liveFourRejectsTriple : Bool :=
  match parseLiveFour liveFourRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoLiveFour
