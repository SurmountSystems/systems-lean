/-
  Module: SystemsLean.CallistoMultFront
  Shape: namespace starts with SystemsLean.MultFront. One or two imports,
  the first SystemsLean.HostTerm, and a mutual block.
  No Bool literal, String def, def main, theorem, or example.
  The file name is not stored. none on every other shape.
  The mutual block is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.CallistoLiveTriple

namespace SystemsLean.CallistoMultFront

open SystemsLean.HostTerm
open SystemsLean.CallistoLiveTriple

def hostTermImp : String := "SystemsLean.HostTerm"

def multOk (sc : TopScan) : Bool :=
  sc.ns.startsWith "SystemsLean.MultFront" && sc.sawMut
    && !sc.sawF && !sc.sawT && !sc.sawStr && !sc.sawMain
    && !sc.sawThm && !sc.sawEx && closedNs sc
    && (match sc.imps with
      | a :: [] => a == hostTermImp
      | a :: b :: [] => a == hostTermImp && dottedOk b
      | _ => false)

def multCmds (sc : TopScan) : List Cmd :=
  takeImps 2 sc.imps ++ [nsCmd sc.ns, endCmd sc.ns]

/-- MultFront mutual block. The mutual block is not emitted. -/
def parseMultFront (src : String) : Option Module :=
  let sc := scanTop src
  if multOk sc then modOf sc.ns (multCmds sc) else none

def multToy : String :=
  "import SystemsLean.HostTerm\n"
  ++ "namespace SystemsLean.MultFrontBinders\n"
  ++ "mutual\n"
  ++ "def a : Nat := 0\n"
  ++ "end\n"
  ++ "end SystemsLean.MultFrontBinders\n"

def multRejectToy : String :=
  "import SystemsLean.HostTerm\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "mutual\n"
  ++ "def a : Nat := 0\n"
  ++ "end\n"
  ++ "end SystemsLean.Demo\n"

def multFrontAccepts : Bool :=
  match parseMultFront multToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def multFrontRejectsOther : Bool :=
  match parseMultFront multRejectToy with
  | none => true
  | some _ => false

end SystemsLean.CallistoMultFront
