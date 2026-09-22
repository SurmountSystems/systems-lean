/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-GRAPH-SCAFFOLD.
  Root for optional lean --run of live EmitGraphScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitGraphScaffold.
  Unique needles (trailing newline so HostFrontLiveEmit is not a prefix):
  HostFrontLiveEmitGraphScaffoldMain
  PARSE-LIVE-EMIT-GRAPH-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-GRAPH-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitGraphScaffoldMain,
  parseLiveEmitGraphScaffoldSource,
  kernelCheckLiveEmitGraphScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitGraphScaffoldMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitGraphScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitGraphScaffold.main args
