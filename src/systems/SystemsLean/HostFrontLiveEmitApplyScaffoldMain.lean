/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-APPLY-SCAFFOLD.
  Root for optional lean --run of live EmitApplyScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitApplyScaffold.
  Unique needles (trailing newline so HostFrontLiveEmitApply is not a prefix):
  HostFrontLiveEmitApplyScaffoldMain
  PARSE-LIVE-EMIT-APPLY-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitApplyScaffoldMain,
  parseLiveEmitApplyScaffoldSource,
  kernelCheckLiveEmitApplyScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitApplyScaffoldMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitApplyScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitApplyScaffold.main args
