import SystemsLean.CatchReturn

/-
  Import-load check for SystemsLean.CatchReturn.
  The Lean import loads that module. Its column-0 import count is printed.
  catchCode is referenced as a value. withCatch and onCatch are not called.
  This file is not the package check.
-/

def isColumn0Import (line : String) : Bool :=
  line.startsWith "import " || line == "import" ||
    line.startsWith "public import " ||
    line.startsWith "private import " ||
    line.startsWith "meta import "

def column0ImportCount (src : String) : Nat :=
  (src.splitOn "\n").foldl (fun n line =>
    if isColumn0Import line then n + 1 else n) 0

def main : IO UInt32 := do
  let loaded : UInt32 := SystemsLean.CatchReturn.catchCode
  if loaded != 1 then
    return 1
  let src ← IO.FS.readFile "src/systems/SystemsLean/CatchReturn.lean"
  let n := column0ImportCount src
  IO.println "liveRel=CatchReturn.lean"
  IO.println s!"imports={n}"
  if n == 0 then
    return 0
  else
    return 1
