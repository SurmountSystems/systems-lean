import SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater

/-
  Import-load check for
  SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater.
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

/-- Name list from the loaded module. A value, not an IO action. -/
def checkersLaterSubsetNames : List String :=
  SystemsLean.ElabMeet.namedClosedHostModuleCheckCheckersLaterSubsetNames

def main : IO UInt32 := do
  let _used := checkersLaterSubsetNames.length
  let src ← IO.FS.readFile
    "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckCheckersLater.lean"
  let n := column0ImportCount src
  IO.println "liveRel=ElabMeetNamedWalkHostModuleCheckCheckersLater.lean"
  IO.println s!"imports={n}"
  if n == 5 then
    return 0
  else
    return 1
