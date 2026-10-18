/-
  Module: SystemsLean.ElfThm
  Shape: namespace starts with SystemsLean.SlakeHostToolElf.
  Zero or one import, a theorem, and no example or def main.
  The file name is not stored. none on every other shape.
  A same-line Bool false is emitted as litBool false.
  The theorem is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.ElfThm

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def elfP : String := "SystemsLean.SlakeHostToolElf"

def elfOk (sc : TopScan) : Bool :=
  sc.ns.startsWith elfP && sc.sawThm && !sc.sawEx && !sc.sawMain
    && !sc.sawMut && (sc.imps.isEmpty || is1 sc.imps)
    && closedNs sc

def elfCmds (sc : TopScan) : List Cmd :=
  takeImps 1 sc.imps ++ [nsCmd sc.ns] ++ optStr sc ++ optBools sc
    ++ [endCmd sc.ns]

/-- Slake host-tool ELF theorem. An example stays none. -/
def parseElfThm (src : String) : Option Module :=
  let sc := scanTop src
  if elfOk sc then modOf sc.ns (elfCmds sc) else none

def elfToy : String :=
  "import SystemsLean.CatchReturn\n"
  ++ "namespace SystemsLean.SlakeHostToolElfMainCatch\n"
  ++ "def flag : Bool := false\n"
  ++ "theorem t : True := by trivial\n"
  ++ "end SystemsLean.SlakeHostToolElfMainCatch\n"

def elfRejectToy : String :=
  "namespace SystemsLean.SlakeHostToolElfLink\n"
  ++ "theorem t : True := by trivial\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.SlakeHostToolElfLink\n"

def elfThmKeepsFalse : Bool :=
  match parseElfThm elfToy with
  | some m =>
    hasLitBool false m.commands && !hasLitBool true m.commands
      && isWellFormed m
  | none => false

def elfThmRejectsExample : Bool :=
  match parseElfThm elfRejectToy with
  | none => true
  | some _ => false

end SystemsLean.ElfThm
