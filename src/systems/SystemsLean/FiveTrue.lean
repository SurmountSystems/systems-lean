/-
  Module: SystemsLean.FiveTrue
  Shape: five imports. The first is HostKernel. Namespace is
  HostModuleCheck. A Bool true. No Bool false and no def main.
  The file name is not stored. none on every other shape.
  Bool true is emitted as litBool true. No false is invented.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.FiveTrue

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def fiveOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: c :: d :: e :: [] =>
    a == hostKernel && dottedOk b && dottedOk c && dottedOk d
      && dottedOk e && sc.ns == hmcNs && sc.sawT && sc.tNm != ""
      && !sc.sawF && !sc.sawMain && !sc.sawThm && !sc.sawEx
      && closedNs sc
  | _ => false

def fiveCmds (sc : TopScan) : List Cmd :=
  takeImps 5 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- Five imports and one Bool true. none on the two-import kernel shape. -/
def parseFiveTrue (src : String) : Option Module :=
  let sc := scanTop src
  if fiveOk sc then modOf sc.ns (fiveCmds sc) else none

def fiveToy : String :=
  "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.HostFront\n"
  ++ "import SystemsLean.HostFrontLiveMult\n"
  ++ "import SystemsLean.HostModuleCheckSurface\n"
  ++ "import SystemsLean.HostModuleCheckMultTerm\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def flag : Bool := true\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def fiveRejectToy : String :=
  "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.HostFront\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def flag : Bool := true\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def fiveTrueKeepsTrue : Bool :=
  match parseFiveTrue fiveToy with
  | some m =>
    hasLitBool true m.commands && !hasLitBool false m.commands
      && isWellFormed m
  | none => false

def fiveTrueRejectsPair : Bool :=
  match parseFiveTrue fiveRejectToy with
  | none => true
  | some _ => false

end SystemsLean.FiveTrue
