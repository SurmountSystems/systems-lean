/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-MULT-SCAFFOLD.
  Root for optional lean --run of live EmitMultScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitMultScaffold.
  Unique needles (trailing newline so HostFrontLiveEmit is not a prefix):
  HostFrontLiveEmitMultScaffoldMain
  PARSE-LIVE-EMIT-MULT-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_MULT_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitMultScaffoldMain,
  parseLiveEmitMultScaffoldSource,
  kernelCheckLiveEmitMultScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitMultScaffoldMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitMultScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitMultScaffold.main args
