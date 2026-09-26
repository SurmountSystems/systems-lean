/-
  Import-loading check for SystemsLean.DualEqWriteCapableGap.
  Lean 4.32 loads the module from its olean. kernelFuel stays 64.
-/

import SystemsLean.DualEqWriteCapableGap

def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := SystemsLean.DualEqWriteCapableGap.stageId
  if kernelFuel != 64 then
    IO.eprintln "import load refused: fuel"
    return
  IO.println "importLoad=SystemsLean.DualEqWriteCapableGap"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
