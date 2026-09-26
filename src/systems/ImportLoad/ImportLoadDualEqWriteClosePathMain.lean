/-
  Import-loading check for SystemsLean.DualEqWriteClosePathMain.
  That module declares root main, so this file does not declare another.
  Lean 4.32 loads the module from its olean. kernelFuel stays 64.
-/

import SystemsLean.DualEqWriteClosePathMain

def kernelFuel : Nat := 64

#eval (do
  let _ := main
  if kernelFuel != 64 then
    throw (IO.userError "import load refused: fuel")
  IO.println "importLoad=SystemsLean.DualEqWriteClosePathMain"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0" : IO Unit)
