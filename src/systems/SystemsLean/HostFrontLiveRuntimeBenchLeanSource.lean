/-
  SYSTEMS_LEAN_HOST partial -- dual-pin of RuntimeBenchLean.lean bytes.
  liveRuntimeBenchLeanSource is the exact bytes of
  src/systems/SystemsLean/RuntimeBenchLean.lean.
  Module: SystemsLean.HostFrontLiveRuntimeBenchLeanSource
  Not FullHost. Not a runtime bench claim. Not a new measurement C file.
  Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveRuntimeBenchLeanSource.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRuntimeBenchLean

def liveRuntimeBenchLeanSource : String := r#"/-
  SYSTEMS_LEAN_HOST measurement -- classic Lean managed-runtime runtime bench.
  Arm C contrast for just bench-runtime. Times process run only (not cold
  elaborate). Not freestanding product wire. Not PROVABLY-as-speed.
  Not residual free / complete / FullHost forge.

  L9 step twin (HOST-COST-STEP-TWIN): protocol Nat steps align with
  SystemsLean.HostCost costMintConsumeSequential (2 per op). Wall-clock
  measure remains empirical; structural twin is not freestanding speed proof.

  Stack live-flag C twin (same mint/consume protocol, C stopwatch) lives in
  SystemsLean.RuntimeBenchStackTwin. This module is the Lean managed-runtime
  IO loop only. Do not replace the C twin timer with runOpsIO.

  Greppable: RuntimeBenchLean, slake-runtime-bench-lean, R-lean,
  lean_managed_runtime, mint_consume, BENCH-RUNTIME, Arm C,
  HOST-COST-STEP-TWIN, stepTwinMintConsume, stepTwinTotal.
  Module: SystemsLean.RuntimeBenchLean
  SKELETON host measurement (not freestanding unit).
  Module must stay ASCII. Sub-1-KLOC. Measurement role only.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostCost
import SystemsLean.HostCostTheorems

namespace SystemsLean.RuntimeBenchLean

open SystemsLean.HostCost (
  costMintConsumeSequential costStepTwinMintConsume costStepTwinTotal
  costMintStep costConsumeStep
  costStepTwinMintConsume_eq costStepTwinTotal_eq
)

/-! ### HOST-COST-STEP-TWIN protocol (L9; align with HostCost, not freestanding) -/

/-- Structural steps for one mint+consume op (HostCost protocol twin).
    Equals costMintConsumeSequential / costStepTwinMintConsume (= 2).
    Greppable: stepTwinMintConsume, HOST-COST-STEP-TWIN. Not freestanding ns/op. -/
def stepTwinMintConsume : Nat := costStepTwinMintConsume

/-- Total structural steps for n timed ops (Nat twin of the measure loop).
    Greppable: stepTwinTotal, HOST-COST-STEP-TWIN. Not wall-clock. -/
def stepTwinTotal (n : Nat) : Nat := costStepTwinTotal n

/-- One op twin is two unit steps (mint + consume).
    Greppable: stepTwinMintConsume_eq, HOST-COST-STEP-TWIN. -/
theorem stepTwinMintConsume_eq : stepTwinMintConsume = 2 :=
  costStepTwinMintConsume_eq

/-- Twin total scales as n * 2 (HostCost costStepTwinTotal_eq).
    Greppable: stepTwinTotal_eq, HOST-COST-STEP-TWIN. -/
theorem stepTwinTotal_eq (n : Nat) : stepTwinTotal n = n * 2 :=
  costStepTwinTotal_eq n

/-- Protocol surface: twin matches HostCost mint/consume unit costs.
    Greppable: stepTwinOk, HOST-COST-STEP-TWIN. -/
def stepTwinOk : Bool :=
  decide (stepTwinMintConsume = 2)
    && decide (stepTwinMintConsume = costMintConsumeSequential)
    && decide (costMintStep = 1)
    && decide (costConsumeStep = 1)
    && decide (stepTwinTotal 3 = 6)

/-- stepTwinOk holds by construction.
    Greppable: stepTwinOk_true, HOST-COST-STEP-TWIN. -/
theorem stepTwinOk_true : stepTwinOk = true := by native_decide

/-- Small heap object: allocate then discard each op (managed RT / GC path).
    Contrast: HostCost LinearHost is Bool+Nat only (no-heap model, L6).
    This arm intentionally uses ByteArray to exercise managed runtime / GC. -/
structure MintCell where
  id : UInt64
  bytes : ByteArray

@[inline] def mint (id : UInt64) : MintCell :=
  { id := id, bytes := ByteArray.mk #[0, 1, 2, 3, 4, 5, 6, 7] }

@[inline] def consume (c : MintCell) : UInt64 :=
  c.id + c.bytes.size.toUInt64

/--
  Impure loop so each call actually runs (pure tail loops get CSE'd across
  warmup vs timed sections and would report fake near-zero wall time).
  Protocol: each iteration is one mint+consume op (stepTwinMintConsume = 2).
-/
def runOpsIO (n : Nat) : IO UInt64 := do
  let mut acc : UInt64 := 0
  let mut i : Nat := 0
  while i < n do
    let c := mint (UInt64.ofNat (i + 1))
    acc := acc + consume c
    i := i + 1
  pure acc

/-- Default N: smaller than freestanding 2e8; ~0.3-1 s wall on typical hosts. -/
def defaultN : Nat := 50000000

def parseN (args : List String) : Except String Nat :=
  match args with
  | [] => .ok defaultN
  | s :: _ =>
    match s.toNat? with
    | none => .error "usage: slake-runtime-bench-lean [N>0]"
    | some 0 => .error "N must be > 0"
    | some n => .ok n

/-- Print key=value metrics matching C runtime bench drivers.
    Also prints structural step twin (HOST-COST-STEP-TWIN) for protocol align. -/
def main (args : List String) : IO UInt32 := do
  match parseN args with
  | .error msg =>
    IO.eprintln msg
    return 64
  | .ok n =>
    IO.println "arm=R-lean"
    IO.println "workload=Lean managed runtime mint ByteArray then discard (GC path)"
    IO.println "job_class=mint_consume"
    IO.println s!"N={n}"
    IO.println "baseline=lean_managed_runtime"
    IO.println "baseline_not=freestanding_c"
    IO.println s!"step_twin_per_op={stepTwinMintConsume}"
    IO.println s!"step_twin_total={stepTwinTotal n}"
    IO.println "step_twin_not=wall_clock"
    let sink0 <- runOpsIO n
    if sink0 == 0 then
      IO.eprintln "warmup FAIL sink=0"
      return 11
    IO.println "warmup=ok"
    let t0 <- IO.monoNanosNow
    let sink <- runOpsIO n
    let t1 <- IO.monoNanosNow
    let elapsedNs : Nat := t1 - t0
    let nF := Float.ofNat n
    let eF := Float.ofNat elapsedNs
    let wall := eF / 1e9
    let nsPerOp := if n == 0 then 0.0 else eF / nF
    let opsPerS := if elapsedNs == 0 then 0.0 else nF * 1e9 / eF
    IO.println s!"wall_seconds={wall}"
    IO.println s!"ns_per_op={nsPerOp}"
    IO.println s!"ops_per_s={opsPerS}"
    IO.println s!"sink={sink}"
    IO.println "status=ok"
    return 0

end SystemsLean.RuntimeBenchLean
"#

end SystemsLean.HostFrontLiveRuntimeBenchLean
