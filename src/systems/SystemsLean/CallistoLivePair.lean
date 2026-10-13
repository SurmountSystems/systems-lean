/-
  Module: SystemsLean.CallistoLivePair
  Shape: two imports, HostFrontLiveHostTerm then HostKernel.
  A depth-0 raw string, a String def, Bool false, Bool true, and def main.
  Namespace matches end. No theorem, example, mutual, structure, or inductive.
  The file name is not stored. none on every other shape.
  A false Bool is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoLivePair

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def pairOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: [] =>
    a == liveTerm && b == hostKernel
      && sc.sawRaw && sc.sawStr && sc.strNm != ""
      && sc.sawF && sc.fNm != ""
      && sc.sawT && sc.tNm != ""
      && sc.sawMain && sc.sawNs && sc.ns != ""
      && sc.sawEnd && sc.endNs == sc.ns
      && !sc.sawThm && !sc.sawEx && !sc.sawMut
      && !sc.sawStruct && !sc.sawInd
      && sc.closed
  | _ => false

/-- Two-import live pair. none on every other shape. -/
def parseLivePair (src : String) : Option Module :=
  let sc := scanTop src
  if pairOk sc then
    modOf sc.ns
      [ impCmd liveTerm
      , impCmd hostKernel
      , nsCmd sc.ns
      , strCmd sc.strNm
      , boolCmd sc.fNm false
      , boolCmd sc.tNm true
      , endCmd sc.ns ]
  else
    none

def pairToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def pin : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def src : String := r#\"inner\"#\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def pairRejectToy : String :=
  "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def pin : Bool := false\n"
  ++ "end SystemsLean.Demo\n"

def pairKeepsFalse : Bool :=
  match parseLivePair pairToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def pairRejects : Bool :=
  match parseLivePair pairRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoLivePair
