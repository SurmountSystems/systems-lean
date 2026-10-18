/-
  Module: SystemsLean.LiveTrue
  Shape: three or four imports. HostFrontLiveHostTerm, then a name
  that ends with Source, and HostKernel last. Bool true and def main.
  No same-line Bool false, theorem, example, mutual, or raw string.
  The file name is not stored. none on every other shape.
  Bool true is emitted as litBool true. No false is invented.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LiveTrue

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def liveTrueOk (sc : TopScan) : Bool :=
  (is3 sc.imps || is4 sc.imps) && liveFamily sc.imps && !sc.sawF
    && sc.sawT && sc.tNm != "" && sc.sawMain
    && !sc.sawThm && !sc.sawEx && !sc.sawMut && !sc.sawRaw
    && closedNs sc

def liveTrueCmds (sc : TopScan) : List Cmd :=
  takeImps 4 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- True-only live family. none when a same-line false is present. -/
def parseLiveTrue (src : String) : Option Module :=
  let sc := scanTop src
  if liveTrueOk sc then modOf sc.ns (liveTrueCmds sc) else none

def liveTrueToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def flag : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveTrueRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveTrueKeepsTrue : Bool :=
  match parseLiveTrue liveTrueToy with
  | some m =>
    hasLitBool true m.commands && !hasLitBool false m.commands
      && isWellFormed m
  | none => false

def liveTrueRejectsFalse : Bool :=
  match parseLiveTrue liveTrueRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LiveTrue
