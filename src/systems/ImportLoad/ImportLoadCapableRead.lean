/-
  Import-loading check for SystemsLean.CapableRead.
  Lean 4.32 loads the module from its olean. kernelFuel stays 64.
-/

import SystemsLean.CapableRead

def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := SystemsLean.CapableRead.stageId
  if kernelFuel != 64 then
    IO.eprintln "import load refused: fuel"
    return
  IO.println "importLoad=SystemsLean.CapableRead"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
