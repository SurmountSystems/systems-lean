/-
  Import-loading check for SystemsLean.BootstrapHonestyTheorems.
  A real Lean import loads that module and SystemsLean.BootstrapHonesty.
  kernelFuel stays 64. This driver does not parse text and does not edit HostKernel.
-/

import SystemsLean.BootstrapHonestyTheorems

open SystemsLean.BootstrapHonesty

/-- Command fuel cap for this check. Stays 64. -/
def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := productPathHostLakeBootstrapPartialReady_true
  if kernelFuel != 64 || productPathHostLakeBootstrapPartialReady == false then
    IO.eprintln "import load refused: fuel or PartialReady"
    return
  IO.println "importLoad=SystemsLean.BootstrapHonestyTheorems"
  IO.println "importLoaded=SystemsLean.BootstrapHonesty"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
