import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm

def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := SystemsLean.ElabMeet.findLiveHostModuleCheckKernelEmitTermPath
  if kernelFuel != 64 then
    IO.eprintln "import load refused: fuel"
    return
  IO.println "importLoad=SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
