/-
  Module: SystemsLean.CallistoLiveSurface
  Shape: HostFrontLiveHostTerm then HostKernel. A structure, an
  inductive, and def main. No Bool literal and no raw string.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoLiveSurface

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def surfaceOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: [] =>
    a == liveTerm && b == hostKernel && sc.sawStruct && sc.sawInd
      && sc.sawMain && !sc.sawF && !sc.sawT && !sc.sawRaw
      && !sc.sawThm && !sc.sawEx && !sc.sawMut && closedNs sc
  | _ => false

def surfaceCmds (sc : TopScan) : List Cmd :=
  [impCmd liveTerm, impCmd hostKernel, nsCmd sc.ns]
    ++ optStr sc ++ [endCmd sc.ns]

/-- Structure plus inductive. Structure and inductive are not emitted. -/
def parseLiveSurface (src : String) : Option Module :=
  let sc := scanTop src
  if surfaceOk sc then modOf sc.ns (surfaceCmds sc) else none

def surfaceToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "structure Walk where\n"
  ++ "  x : Nat\n"
  ++ "inductive Got where\n"
  ++ "  | a\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def surfaceRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def src : String := r#\"body\"#\n"
  ++ "def flag : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveSurfaceAccepts : Bool :=
  match parseLiveSurface surfaceToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def liveSurfaceRejectsPair : Bool :=
  match parseLiveSurface surfaceRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoLiveSurface
