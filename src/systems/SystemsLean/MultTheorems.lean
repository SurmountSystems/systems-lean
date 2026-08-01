/-
  SYSTEMS_LEAN_HOST partial -- Mult MULT-THEOREM / HOST-MULT-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.Mult: theorems live here; Mult inductive,
  name, isValid, ofNat?, isValidTag, multIsValid stay in Mult. Same namespace
  SystemsLean.Mult so theorem names stay unqualified under that namespace.

  Spec (readable):
  - MULT-THEOREM / HOST-MULT-THEOREM: ofNat? known tags 0/1/2;
    ofNat?_fail_closed / isValidTag_fail_closed (n > 2);
    isValidTag_eq_ofNat?_isSome; isValid_true; multIsValid_eq_isValid;
    name_mult0 / name_mult1 / name_multOmega;
    ofNat?_some_implies_isValidTag;
    ofNat?_name_zero / ofNat?_name_one / ofNat?_name_two /
    ofNat?_name_fail_closed.

  These Mult theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Mult != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Lake example smokes are NOT full proofs (none required here).

  Greppable: SYSTEMS_LEAN_HOST, MULT-0, MULT-1, MULT-OMEGA,
  FAIL-CLOSED-UNKNOWN-GRADE, MULT-THEOREM, HOST-MULT-THEOREM,
  ofNat?_fail_closed, isValidTag_fail_closed,
  ofNat?_zero, ofNat?_one, ofNat?_two, isValid_true,
  isValidTag_eq_ofNat?_isSome, name_mult0, name_mult1, name_multOmega,
  ofNat?_some_implies_isValidTag,
  ofNat?_name_zero, ofNat?_name_one, ofNat?_name_two, ofNat?_name_fail_closed,
  MultTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.MultTheorems
  Red/green: just systems-host; lake build SystemsLean.MultTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult

namespace SystemsLean.Mult

/-! ### MULT-THEOREM / HOST-MULT-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Mult grades
  and FAIL-CLOSED-UNKNOWN-GRADE only. Does not complete SpecProof; does not
  claim residual free / freestanding product self-host complete / PROVABLY.
-/

/-- Known raw tag 0 decodes to MULT-0. Greppable: ofNat?_zero, MULT-THEOREM. -/
theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := rfl

/-- Known raw tag 1 decodes to MULT-1. Greppable: ofNat?_one, MULT-THEOREM. -/
theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl

/-- Known raw tag 2 decodes to MULT-OMEGA. Greppable: ofNat?_two, MULT-THEOREM. -/
theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl

/-- FAIL-CLOSED-UNKNOWN-GRADE: raw tags with n > 2 reject to none (no coerce).
    Greppable: ofNat?_fail_closed, FAIL-CLOSED-UNKNOWN-GRADE, MULT-THEOREM,
    HOST-MULT-THEOREM. -/
theorem ofNat?_fail_closed (n : Nat) (h : 2 < n) : ofNat? n = none := by
  cases n with
  | zero =>
    -- h : 2 < 0 is false; ASCII Not (no Unicode not-sign).
    exact absurd h (by decide : Not (2 < 0))
  | succ n1 =>
    cases n1 with
    | zero =>
      exact absurd h (by decide : Not (2 < 1))
    | succ n2 =>
      cases n2 with
      | zero =>
        exact absurd h (by decide : Not (2 < 2))
      | succ _ =>
        rfl

/-- isValidTag is definitionally ofNat? isSome.
    Greppable: isValidTag_eq_ofNat?_isSome, MULT-THEOREM. -/
theorem isValidTag_eq_ofNat?_isSome (n : Nat) :
    isValidTag n = (ofNat? n).isSome := rfl

/-- Known tags 0/1/2 are valid raw tags. Greppable: isValidTag_known, MULT-THEOREM. -/
theorem isValidTag_zero : isValidTag 0 = true := rfl
theorem isValidTag_one : isValidTag 1 = true := rfl
theorem isValidTag_two : isValidTag 2 = true := rfl

/-- FAIL-CLOSED-UNKNOWN-GRADE on isValidTag: n > 2 is false.
    Greppable: isValidTag_fail_closed, FAIL-CLOSED-UNKNOWN-GRADE, MULT-THEOREM,
    HOST-MULT-THEOREM. -/
theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by
  unfold isValidTag
  rw [ofNat?_fail_closed n h]
  rfl

/-- Typed Mult is always valid (closed inductive; unknown grades cannot inhabit).
    Greppable: isValid_true, MULT-THEOREM. -/
theorem isValid_true (m : Mult) : isValid m = true := by
  cases m <;> rfl

/-- multIsValid tracks isValid. Greppable: multIsValid_eq_isValid, MULT-THEOREM. -/
theorem multIsValid_eq_isValid (m : Mult) : multIsValid m = isValid m := rfl

/-- Grade string honesty: mult0 names MULT-0.
    Greppable: name_mult0, MULT-0, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem name_mult0 : name Mult.mult0 = "MULT-0" := rfl

/-- Grade string honesty: mult1 names MULT-1.
    Greppable: name_mult1, MULT-1, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem name_mult1 : name Mult.mult1 = "MULT-1" := rfl

/-- Grade string honesty: multOmega names MULT-OMEGA.
    Greppable: name_multOmega, MULT-OMEGA, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem name_multOmega : name Mult.multOmega = "MULT-OMEGA" := rfl

/-- Successful ofNat? decode implies isValidTag true (no soft unknown pass).
    Greppable: ofNat?_some_implies_isValidTag, FAIL-CLOSED-UNKNOWN-GRADE,
    MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem ofNat?_some_implies_isValidTag (n : Nat) (m : Mult)
    (h : ofNat? n = some m) : isValidTag n = true := by
  unfold isValidTag
  rw [h]
  rfl

/-- ofNat? success composes with name for known tag 0 (MULT-0 string honesty).
    Greppable: ofNat?_name_zero, MULT-0, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem ofNat?_name_zero :
    Option.map name (ofNat? 0) = some "MULT-0" := rfl

/-- ofNat? success composes with name for known tag 1 (MULT-1 string honesty).
    Greppable: ofNat?_name_one, MULT-1, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem ofNat?_name_one :
    Option.map name (ofNat? 1) = some "MULT-1" := rfl

/-- ofNat? success composes with name for known tag 2 (MULT-OMEGA string honesty).
    Greppable: ofNat?_name_two, MULT-OMEGA, MULT-THEOREM, HOST-MULT-THEOREM. -/
theorem ofNat?_name_two :
    Option.map name (ofNat? 2) = some "MULT-OMEGA" := rfl

/-- ofNat? fail-closed composes with name map (unknown tag yields none, not "").
    Greppable: ofNat?_name_fail_closed, FAIL-CLOSED-UNKNOWN-GRADE, MULT-THEOREM. -/
theorem ofNat?_name_fail_closed :
    Option.map name (ofNat? 3) = none := rfl

end SystemsLean.Mult
