/-
  Algorithm id: RuntimeExtract
  Side: Lean 4 (classic) dual -- behavioral sketch + contracts
  Pair: Idris native RuntimeExtract at src/idris2/examples/RuntimeExtract.idr
  Trust: examples/TRUST.md -- classic ahead-of-time still has managed runtime residual.
  Not freestanding. Not product C emit. Not PROVABLY.

  Spec (readable, separate from any future proof):
  - Focus: RUNTIME-FS vs RUNTIME-CLASSIC / EDGE-RUNTIME extract honesty.
  - Stock hosts leave managed runtime (RUNTIME-CLASSIC / EDGE-RUNTIME).
  - Product extract accepts only RUNTIME-FS freestanding goal.
  - ofRuntimeTag decodes 0/1/2; unknown rejects fail closed.
  - Host map: SystemsLean.Extract.RuntimeClaim / checkFailClosed / ofRuntimeTag?.
  - Classic Lean dual is a sketch; freestanding product wire enforces under
    src/systems/. Claiming stock Lean is freestanding is forbidden.

  Red/green: just lean-side presence gate; Lake when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.LeanBridge.RuntimeExtract

/-- Closed runtime claim set (freestanding goal vs stock-host residual). -/
inductive RuntimeClaim where
  | runtimeFs
  | runtimeClassic
  | edgeRuntime
  deriving DecidableEq, Repr

/-- Greppable claim names (contract surface). -/
def name : RuntimeClaim -> String
  | RuntimeClaim.runtimeFs => "RUNTIME-FS"
  | RuntimeClaim.runtimeClassic => "RUNTIME-CLASSIC"
  | RuntimeClaim.edgeRuntime => "EDGE-RUNTIME"

/-- True only for freestanding product goal (RUNTIME-FS). -/
def isFreestandingGoal : RuntimeClaim -> Bool
  | RuntimeClaim.runtimeFs => true
  | RuntimeClaim.runtimeClassic => false
  | RuntimeClaim.edgeRuntime => false

/-- Decode raw tags: 0 = RUNTIME-FS, 1 = RUNTIME-CLASSIC, 2 = EDGE-RUNTIME. -/
def ofRuntimeTag : Nat -> Option RuntimeClaim
  | 0 => some RuntimeClaim.runtimeFs
  | 1 => some RuntimeClaim.runtimeClassic
  | 2 => some RuntimeClaim.edgeRuntime
  | _ => none

/-- True only for known raw tags 0 / 1 / 2. -/
def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag n).isSome

/-- Product extract accepts freestanding goal only. -/
def extractAccepts (c : RuntimeClaim) : Bool := isFreestandingGoal c

/-- Demo: stock-host claims reject; freestanding accepts. -/
def demoClassicReject : Bool :=
  (extractAccepts RuntimeClaim.runtimeClassic == false)
    && (extractAccepts RuntimeClaim.edgeRuntime == false)
    && (extractAccepts RuntimeClaim.runtimeFs == true)

/-- Demo: tag decode + unknown reject. -/
def demoTagDecode : Bool :=
  (Option.map name (ofRuntimeTag 0) == some "RUNTIME-FS")
    && (Option.map name (ofRuntimeTag 1) == some "RUNTIME-CLASSIC")
    && (Option.map name (ofRuntimeTag 2) == some "EDGE-RUNTIME")
    && (ofRuntimeTag 3 == none)
    && (isValidRuntimeTag 0 == true)
    && (isValidRuntimeTag 3 == false)

/-- Bundle demo: freestanding accept + stock reject + tag decode. -/
def demoRuntimeExtract : Bool := demoClassicReject && demoTagDecode

end SystemsLean.LeanBridge.RuntimeExtract
