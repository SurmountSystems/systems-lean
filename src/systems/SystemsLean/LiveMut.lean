/-
  Module: SystemsLean.LiveMut
  Shape: three live-family imports, a mutual block, Bool false,
  Bool true, and def main. No theorem or example.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LiveMut

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def liveMutOk (sc : TopScan) : Bool :=
  is3 sc.imps && liveFamily sc.imps && sc.sawMut
    && sc.sawF && sc.fNm != "" && sc.sawT && sc.tNm != ""
    && sc.sawMain && !sc.sawThm && !sc.sawEx && !sc.sawRaw
    && closedNs sc

def liveMutCmds (sc : TopScan) : List Cmd :=
  takeImps 3 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- Mutual live family. The mutual block itself is not emitted. -/
def parseLiveMut (src : String) : Option Module :=
  let sc := scanTop src
  if liveMutOk sc then modOf sc.ns (liveMutCmds sc) else none

def liveMutToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "mutual\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "end\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveMutRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveMutKeepsFalse : Bool :=
  match parseLiveMut liveMutToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def liveMutRejectsPlain : Bool :=
  match parseLiveMut liveMutRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LiveMut
