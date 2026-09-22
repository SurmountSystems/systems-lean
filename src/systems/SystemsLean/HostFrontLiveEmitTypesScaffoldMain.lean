/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-TYPES-SCAFFOLD.
  Root for optional lean --run of live EmitTypesScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitTypesScaffold.
  Unique needles (trailing newline so HostFrontLiveEmitTypes is not a prefix):
  HostFrontLiveEmitTypesScaffoldMain
  PARSE-LIVE-EMIT-TYPES-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-TYPES-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_TYPES_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitTypesScaffoldMain,
  parseLiveEmitTypesScaffoldSource,
  kernelCheckLiveEmitTypesScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitTypesScaffoldMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitTypesScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitTypesScaffold.main args
