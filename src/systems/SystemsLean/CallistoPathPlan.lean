/-
  Module: SystemsLean.CallistoPathPlan
  Shape: no import. Namespace starts with SystemsLean.ProductPath.
  A structure, a Bool true, and def main. No Bool false.
  The file name is not stored. none on every other shape.
  Bool true is emitted as litBool true. No false is invented.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoPathPlan

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def pathOk (sc : TopScan) : Bool :=
  sc.imps.isEmpty && sc.sawT && sc.tNm != "" && !sc.sawF
    && sc.sawMain && sc.sawStruct && !sc.sawThm && !sc.sawEx
    && !sc.sawMut && !sc.sawRaw
    && sc.ns.startsWith "SystemsLean.ProductPath"
    && closedNs sc

def pathCmds (sc : TopScan) : List Cmd :=
  [nsCmd sc.ns] ++ optStr sc ++ optBools sc ++ [endCmd sc.ns]

/-- Product path plan. A same-line false stays none. -/
def parsePathPlan (src : String) : Option Module :=
  let sc := scanTop src
  if pathOk sc then modOf sc.ns (pathCmds sc) else none

def pathToy : String :=
  "namespace SystemsLean.ProductPathDemo\n"
  ++ "structure Spec where\n"
  ++ "  x : Nat\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def flag : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.ProductPathDemo\n"

def pathRejectToy : String :=
  "namespace SystemsLean.ProductPathDemo\n"
  ++ "structure Spec where\n"
  ++ "  x : Nat\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.ProductPathDemo\n"

def pathPlanKeepsTrue : Bool :=
  match parsePathPlan pathToy with
  | some m =>
    hasLitBool true m.commands && !hasLitBool false m.commands
      && isWellFormed m
  | none => false

def pathPlanRejectsFalse : Bool :=
  match parsePathPlan pathRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoPathPlan
