/-
  Import-loading check for SystemsLean.ElabMeetCompile.
  Lean 4.32 loads the module from its olean. kernelFuel stays 64.
-/

import SystemsLean.ElabMeetCompile

def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := SystemsLean.ElabMeet.followImportHopBound
  if kernelFuel != 64 then
    IO.eprintln "import load refused: fuel"
    return
  IO.println "importLoad=SystemsLean.ElabMeetCompile"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
