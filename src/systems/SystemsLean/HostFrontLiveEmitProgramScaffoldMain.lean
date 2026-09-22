/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD.
  Root for optional lean --run of live EmitProgramScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitProgramScaffold.
  Unique needles (trailing newline so EmitProgram wrap is not a prefix):
  HostFrontLiveEmitProgramScaffoldMain
  PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-PROGRAM-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitProgramScaffoldMain,
  parseLiveEmitProgramScaffoldSource,
  kernelCheckLiveEmitProgramScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitProgramScaffoldMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitProgramScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitProgramScaffold.main args
