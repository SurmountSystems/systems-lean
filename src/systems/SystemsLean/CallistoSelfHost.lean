/-
  Module: SystemsLean.CallistoSelfHost
  Shape: import SystemsLean.CatchReturn, namespace
  SystemsLean.SelfHostComplete, a String def, Bool false, Bool true,
  and def main. No theorem.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoSelfHost

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def catchImp : String := "SystemsLean.CatchReturn"

def selfOk (sc : TopScan) : Bool :=
  match sc.imps with
  | imp :: [] =>
    imp == catchImp && sc.ns == "SystemsLean.SelfHostComplete"
      && sc.sawStr && sc.strNm != "" && sc.sawF && sc.fNm != ""
      && sc.sawT && sc.tNm != "" && sc.sawMain && !sc.sawThm
      && !sc.sawEx && closedNs sc
  | _ => false

def selfCmds (sc : TopScan) : List Cmd :=
  [impCmd catchImp, nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- SelfHostComplete. The first same-line false stays false. -/
def parseSelfHost (src : String) : Option Module :=
  let sc := scanTop src
  if selfOk sc then modOf sc.ns (selfCmds sc) else none

def selfToy : String :=
  "import SystemsLean.CatchReturn\n"
  ++ "namespace SystemsLean.SelfHostComplete\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.SelfHostComplete\n"

def selfRejectToy : String :=
  "import SystemsLean.CatchReturn\n"
  ++ "namespace SystemsLean.Other\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Other\n"

def selfHostKeepsFalse : Bool :=
  match parseSelfHost selfToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def selfHostRejectsOther : Bool :=
  match parseSelfHost selfRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoSelfHost
