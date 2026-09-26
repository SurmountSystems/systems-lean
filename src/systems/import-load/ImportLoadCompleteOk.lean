import SystemsLean.CompleteOk

/-- Column-0 import: exact `import`, or a prefix the package walker counts. -/
def isCol0Import (line : String) : Bool :=
  line == "import"
    || line.startsWith "import "
    || line.startsWith "public import "
    || line.startsWith "private import "
    || line.startsWith "meta import "

/-- Count column-0 import lines in the product source text. -/
def countCol0Imports (text : String) : Nat :=
  (text.splitOn "\n").foldl (fun n line => if isCol0Import line then n + 1 else n) 0

def main : IO UInt32 := do
  let stage : String := SystemsLean.CompleteOk.stageId
  let text ← IO.FS.readFile
    "/home/hunter/Projects/ai/iso/src/systems/SystemsLean/CompleteOk.lean"
  let n := countCol0Imports text
  IO.println "liveRel=CompleteOk.lean"
  IO.println s!"imports={n}"
  if stage.isEmpty || n != 0 then
    return 1
  return 0
