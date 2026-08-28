/-
  SYSTEMS_LEAN_HOST measurement -- thin Lake exe main for Arm C Lean managed
  runtime bench. Root for lake exe slake-runtime-bench-lean.
  Body: SystemsLean.RuntimeBenchLean.
  Greppable: RuntimeBenchLeanMain, slake-runtime-bench-lean, R-lean,
  lean_managed_runtime, BENCH-RUNTIME.
  Module: SystemsLean.RuntimeBenchLeanMain
  SKELETON host measurement entry (not freestanding unit).
  Module must stay ASCII. Not freestanding product. Not PROVABLY-as-speed.
-/

import SystemsLean.RuntimeBenchLean

/-- Lake / lean --run entry: forward argv (optional N). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.RuntimeBenchLean.main args
