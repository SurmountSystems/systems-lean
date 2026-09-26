import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm

def kernelFuel : Nat := 64

def main : IO Unit := do
  let _ := SystemsLean.ElabMeet.findLiveHostModuleCheckKernelProgramTermPath
  if kernelFuel != 64 then
    IO.eprintln "import load refused: fuel"
    return
  IO.println "importLoad=SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm"
  IO.println s!"kernelFuel={kernelFuel}"
  IO.println "EXIT:0"
