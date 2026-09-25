/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live RuntimeBenchFailClosedShapeMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveRuntimeBenchFailClosedShapeMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is RuntimeBenchFailClosedShapeMain.lean. It is not RuntimeBenchFailClosedShape.lean.
  Not a speed claim.
  liveRel is the bare basename RuntimeBenchFailClosedShapeMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveRuntimeBenchFailClosedShapeMainSource,
  HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse

/-- Dual-pinned live RuntimeBenchFailClosedShapeMain.lean bytes (must match on-disk file).
    Greppable: liveRuntimeBenchFailClosedShapeMainSource,
    HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE-MAIN. -/
def liveRuntimeBenchFailClosedShapeMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST measurement -- thin lean+leanc main for Lean-owned
  fail-closed-shape twin C write. Without-Lake prove is just first-host-tool
  (lean then leanc), not a Lake invocation on that step. Inventory name:
  slake-runtime-bench-fail-closed-shape.
  Body: SystemsLean.RuntimeBenchFailClosedShape.
  Greppable: RuntimeBenchFailClosedShapeMain,
  slake-runtime-bench-fail-closed-shape, R-fail-closed-shape,
  RUNTIME-BENCH-FAIL-CLOSED-SHAPE.
  Module: SystemsLean.RuntimeBenchFailClosedShapeMain
  SKELETON host measurement entry (not freestanding unit).
  Module must stay ASCII. Not freestanding product. Not PROVABLY-as-speed.
  Not freestanding residual free. Not freestanding emit residual free.
-/

import SystemsLean.RuntimeBenchFailClosedShape

/-- Lake / lean --run entry: optional repo root. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.RuntimeBenchFailClosedShape.main args
"#

end SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse
