/-
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
