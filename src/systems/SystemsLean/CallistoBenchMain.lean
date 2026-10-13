/-
  Module: SystemsLean.CallistoBenchMain
  Shape: no import. Namespace starts with SystemsLean.RuntimeBench.
  A theorem and def main. No Bool literal and no example.
  The file name is not stored. none on every other shape.
  The theorem is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoBenchMain

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def benchOk (sc : TopScan) : Bool :=
  sc.imps.isEmpty && sc.sawMain && sc.sawThm && !sc.sawEx
    && !sc.sawF && !sc.sawT && !sc.sawMut
    && sc.ns.startsWith "SystemsLean.RuntimeBench"
    && closedNs sc

def benchCmds (sc : TopScan) : List Cmd :=
  [nsCmd sc.ns] ++ optStr sc ++ [endCmd sc.ns]

/-- Runtime bench main. The theorem is not emitted. -/
def parseBenchMain (src : String) : Option Module :=
  let sc := scanTop src
  if benchOk sc then modOf sc.ns (benchCmds sc) else none

def benchToy : String :=
  "namespace SystemsLean.RuntimeBenchDemo\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "theorem t : True := by trivial\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.RuntimeBenchDemo\n"

def benchRejectToy : String :=
  "namespace SystemsLean.RuntimeBenchDemo\n"
  ++ "def flag : Bool := false\n"
  ++ "theorem t : True := by trivial\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.RuntimeBenchDemo\n"

def benchMainAccepts : Bool :=
  match parseBenchMain benchToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def benchMainRejectsFalse : Bool :=
  match parseBenchMain benchRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoBenchMain
