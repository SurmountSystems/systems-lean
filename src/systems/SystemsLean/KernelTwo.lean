/-
  Module: SystemsLean.KernelTwo
  Shape: two imports. First is SystemsLean.HostKernel.
  Namespace is SystemsLean.HostModuleCheck and matches end.
  A String def and a Bool true. No def main, theorem, or raw string.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.KernelTwo

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def kernOk (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: [] =>
    a == hostKernel && dottedOk b
      && sc.ns == "SystemsLean.HostModuleCheck"
      && sc.sawEnd && sc.endNs == sc.ns
      && sc.sawStr && sc.strNm != ""
      && sc.sawT && sc.tNm != ""
      && !sc.sawMain && !sc.sawThm && !sc.sawRaw
      && sc.closed
  | _ => false

def kernCmds (sc : TopScan) : List Cmd :=
  let head :=
    [ impCmd hostKernel
    , impCmd (midImp sc.imps)
    , nsCmd sc.ns
    , strCmd sc.strNm
    , boolCmd sc.tNm true ]
  let withF :=
    if sc.sawF then head ++ [boolCmd sc.fNm false] else head
  withF ++ [endCmd sc.ns]

/-- HostKernel plus one module, namespace HostModuleCheck. -/
def parseKernelTwo (src : String) : Option Module :=
  let sc := scanTop src
  if kernOk sc then modOf sc.ns (kernCmds sc) else none

def kernToy : String :=
  "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.HostFrontLiveCheckers\n"
  ++ "namespace SystemsLean.HostModuleCheck\n"
  ++ "def bar : String := \"KERNEL-CHECK\"\n"
  ++ "def pin : Bool := false\n"
  ++ "def ok : Bool := true\n"
  ++ "end SystemsLean.HostModuleCheck\n"

def kernRejectToy : String :=
  "import SystemsLean.HostKernel\n"
  ++ "import SystemsLean.HostFrontLiveCheckers\n"
  ++ "namespace SystemsLean.Other\n"
  ++ "def bar : String := \"KERNEL-CHECK\"\n"
  ++ "def ok : Bool := true\n"
  ++ "end SystemsLean.Other\n"

def kernKeepsFalse : Bool :=
  match parseKernelTwo kernToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def kernRejects : Bool :=
  match parseKernelTwo kernRejectToy with
  | none => true
  | some _ => false

end SystemsLean.KernelTwo
