/-
  Algorithm id: FailClosedGrade
  Side: Lean 4 (classic) dual -- behavioral sketch + contracts
  Pair: Idris native FailClosedGrade at src/idris2/examples/FailClosedGrade.idr
  Trust: examples/TRUST.md -- classic ahead-of-time still has managed runtime residual.
  Not freestanding. Not product C emit. Not PROVABLY.

  Spec (readable, separate from any future proof):
  - Focus FAIL-CLOSED-UNKNOWN-GRADE: raw Mult tags accept only 0 / 1 / 2.
  - ofTag decodes freestanding C-aligned tags; unknown returns none.
  - isValidTag is ofTag isSome (known 0/1/2 only).
  - isValid is true for every typed Mult (closed inductive; no unknown inhabit).
  - name maps Mult0/Mult1/MultOmega to MULT-0/MULT-1/MULT-OMEGA strings.
  - Host map: SystemsLean.Mult.ofNat? / isValidTag / FAIL-CLOSED-UNKNOWN-GRADE.
  - Classic Lean dual is a behavioral sketch; freestanding product wire enforces
    the closed grade set under src/systems/.

  Red/green: just lean-side presence gate; Lake when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.LeanBridge.FailClosedGrade

/-- Product freestanding grades only (MULT-0 / MULT-1 / MULT-OMEGA). -/
inductive Mult where
  | mult0
  | mult1
  | multOmega
  deriving DecidableEq, Repr

/-- Greppable grade names (contract surface). -/
def name : Mult -> String
  | Mult.mult0 => "MULT-0"
  | Mult.mult1 => "MULT-1"
  | Mult.multOmega => "MULT-OMEGA"

/--
  Decode freestanding C-aligned tags: 0 = MULT-0, 1 = MULT-1, 2 = MULT-OMEGA.
  FAIL-CLOSED-UNKNOWN-GRADE: unknown tags return none (no coerce).
-/
def ofTag : Nat -> Option Mult
  | 0 => some Mult.mult0
  | 1 => some Mult.mult1
  | 2 => some Mult.multOmega
  | _ => none

/-- True only for known raw tags 0 / 1 / 2. -/
def isValidTag (n : Nat) : Bool := (ofTag n).isSome

/-- Typed Mult is always valid (closed inductive). -/
def isValid : Mult -> Bool
  | Mult.mult0 => true
  | Mult.mult1 => true
  | Mult.multOmega => true

/-- Demo: known tags decode to expected names. -/
def demoKnownNames : Bool :=
  (Option.map name (ofTag 0) == some "MULT-0")
    && (Option.map name (ofTag 1) == some "MULT-1")
    && (Option.map name (ofTag 2) == some "MULT-OMEGA")

/-- Demo: unknown tags reject (fail closed). -/
def demoUnknownReject : Bool :=
  (ofTag 3 == none)
    && (ofTag 99 == none)
    && (isValidTag 3 == false)
    && (isValidTag 0 == true)

/-- Bundle demo: known names + unknown reject. -/
def demoFailClosed : Bool := demoKnownNames && demoUnknownReject

end SystemsLean.LeanBridge.FailClosedGrade
