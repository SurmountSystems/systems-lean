/-
  SYSTEMS_LEAN_HOST partial -- Mult grades on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Mult.slake, mult.md, emit slake_mult_is_valid.
  Side maps (read-only): src/idris2/multiplicity-map.md, src/lean4/multiplicity-map.md.

  Spec (readable, separate from any future proof):
  - Mult is the freestanding product grade set only: MULT-0, MULT-1, MULT-OMEGA.
  - isValid matches all three constructors and returns true (typed Mult is closed;
    unknown grades cannot inhabit Mult -- not a runtime reject path).
  - FAIL-CLOSED-UNKNOWN-GRADE attaches to ofNat? / isValidTag only: unknown raw
    tags decode to none / false (no coerce to omega or zero).
  - No multiplicity zoo.

  Theorems (MULT-THEOREM / HOST-MULT-THEOREM -- partial Mult proofs only):
  - Live in SystemsLean.MultTheorems (same namespace; long-file split).
  - ofNat? known tags 0/1/2 succeed (ofNat?_zero / ofNat?_one / ofNat?_two).
  - ofNat?_fail_closed / isValidTag_fail_closed: n > 2 rejects (FAIL-CLOSED).
  - isValid_true: every typed Mult is valid (closed inductive).
  - isValidTag_eq_ofNat?_isSome: isValidTag is ofNat? isSome.
  - name_mult0 / name_mult1 / name_multOmega: greppable grade string honesty.
  - ofNat?_some_implies_isValidTag: successful decode implies isValidTag true.
  - ofNat?_name_zero / ofNat?_name_one / ofNat?_name_two / ofNat?_name_fail_closed:
    ofNat? composed with name (Option.map) for known tags + unknown reject.
  These Mult theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Mult != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).

  Greppable: SYSTEMS_LEAN_HOST, MULT-0, MULT-1, MULT-OMEGA, FAIL-CLOSED-UNKNOWN-GRADE,
  MULT-THEOREM, HOST-MULT-THEOREM, ofNat?_fail_closed, isValidTag_fail_closed,
  ofNat?_zero, ofNat?_one, ofNat?_two, isValid_true, isValidTag_eq_ofNat?_isSome,
  name_mult0, name_mult1, name_multOmega, ofNat?_some_implies_isValidTag,
  ofNat?_name_zero, ofNat?_name_one, ofNat?_name_two, ofNat?_name_fail_closed,
  MultTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.Mult
  Long-file split: MULT-THEOREM + HOST-MULT-THEOREM in
  SystemsLean.MultTheorems (same namespace). Core Mult dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.Mult

/-- Quantitative Type Theory (QTT) grades for freestanding Slake.
    MULT-0 erased; MULT-1 use-once / linear; MULT-OMEGA unrestricted. -/
inductive Mult where
  | mult0
  | mult1
  | multOmega
  deriving DecidableEq, Repr

/-- Human-facing grade ids (greppable contract surface). -/
def name : Mult -> String
  | Mult.mult0 => "MULT-0"
  | Mult.mult1 => "MULT-1"
  | Mult.multOmega => "MULT-OMEGA"

/-- isValid m -- true for each Mult constructor (closed inductive).
    Explicit match so a future grade must update this table.
    Unknown grades cannot inhabit Mult; raw-tag reject is isValidTag only. -/
def isValid : Mult -> Bool
  | Mult.mult0 => true
  | Mult.mult1 => true
  | Mult.multOmega => true

/-- Raw tag decode aligned with freestanding C enum slake_mult
    (0 = MULT-0, 1 = MULT-1, 2 = MULT-OMEGA).
    FAIL-CLOSED-UNKNOWN-GRADE: unknown tags return none. -/
def ofNat? : Nat -> Option Mult
  | 0 => some Mult.mult0
  | 1 => some Mult.mult1
  | 2 => some Mult.multOmega
  | _ => none

/-- FAIL-CLOSED-UNKNOWN-GRADE on raw tags: true only for known 0/1/2. -/
def isValidTag (n : Nat) : Bool := (ofNat? n).isSome

/-- Map name for emit honesty notes (multIsValid / slake_mult_is_valid). -/
def multIsValid (m : Mult) : Bool := isValid m

/- Theorems live in SystemsLean.MultTheorems
   (same namespace SystemsLean.Mult; long-file split). Parent keeps
   Mult dialect only -- do not import MultTheorems here (import cycle). -/

end SystemsLean.Mult
