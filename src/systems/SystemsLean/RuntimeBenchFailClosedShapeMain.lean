/-
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
