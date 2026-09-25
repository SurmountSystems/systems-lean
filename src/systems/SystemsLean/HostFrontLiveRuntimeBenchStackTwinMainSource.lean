/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live RuntimeBenchStackTwinMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveRuntimeBenchStackTwinMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is RuntimeBenchStackTwinMain.lean. It is not RuntimeBenchStackTwin.lean.
  Not a speed claim.
  liveRel is the bare basename RuntimeBenchStackTwinMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveRuntimeBenchStackTwinMainSource,
  HOST-FRONT-LIVE-RUNTIME-BENCH-STACK-TWIN-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse

/-- Dual-pinned live RuntimeBenchStackTwinMain.lean bytes (must match on-disk file).
    Greppable: liveRuntimeBenchStackTwinMainSource,
    HOST-FRONT-LIVE-RUNTIME-BENCH-STACK-TWIN-MAIN. -/
def liveRuntimeBenchStackTwinMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST measurement -- thin Lake exe main for Lean-owned
  stack live-flag twin C write. Root for lake exe slake-runtime-bench-stack-twin.
  Body: SystemsLean.RuntimeBenchStackTwin.
  Greppable: RuntimeBenchStackTwinMain, slake-runtime-bench-stack-twin,
  R-stack-twin, RUNTIME-BENCH-STACK-TWIN.
  Module: SystemsLean.RuntimeBenchStackTwinMain
  SKELETON host measurement entry (not freestanding unit).
  Module must stay ASCII. Not freestanding product. Not PROVABLY-as-speed.
  Not freestanding residual free. Not freestanding emit residual free.
-/

import SystemsLean.RuntimeBenchStackTwin

/-- Lake / lean --run entry: optional repo root. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.RuntimeBenchStackTwin.main args
"#

end SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse
