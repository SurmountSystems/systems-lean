/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPOSE-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live ComposeSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveComposeSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveComposeSubsetEmitMain is not a prefix):
  HostFrontLiveComposeSubsetEmitMainMain
  PARSE-LIVE-COMPOSE-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_EMIT_MAIN_V0
  COMPOSE-SUBSET-EMIT-MAIN
  HOST-COMPOSE-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveComposeSubsetEmitMainMain,
  parseLiveComposeSubsetEmitMainSource,
  kernelCheckLiveComposeSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveComposeSubsetEmitMainMain
  not a remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveComposeSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveComposeSubsetEmitMain.main args
