import SystemsLean.BootstrapHonesty

/-
  Import-load check for SystemsLean.BootstrapHonesty.
  The Lean import loads that module. Its column-0 import count is printed.
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
  let loaded := SystemsLean.BootstrapHonesty.bootstrapHonestyModuleCite
  if loaded != "BootstrapHonesty" then
    return 1
  let src ← IO.FS.readFile "src/systems/SystemsLean/BootstrapHonesty.lean"
  let n := column0ImportCount src
  IO.println "liveRel=BootstrapHonesty.lean"
  IO.println s!"imports={n}"
  if n == 0 then
    return 0
  else
    return 1
