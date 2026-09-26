import SystemsLean.CapableFullBarMain

def loaded : List String -> IO UInt32 :=
  main

def isColumn0Import (line : String) : Bool :=
  line.startsWith "import " || line == "import" ||
    line.startsWith "public import " ||
    line.startsWith "private import " ||
    line.startsWith "meta import "

def column0ImportCount (src : String) : Nat :=
  (src.splitOn "\n").foldl (fun n line =>
    if isColumn0Import line then n + 1 else n) 0

#eval do
  let _loaded := loaded
  let src <- IO.FS.readFile "src/systems/SystemsLean/CapableFullBarMain.lean"
  let n := column0ImportCount src
  IO.println "liveRel=CapableFullBarMain.lean"
  IO.println s!"imports={n}"
  if n != 1 then
    throw (IO.userError "import count")
