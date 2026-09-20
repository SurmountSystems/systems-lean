/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesTheoremsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-TYPESTHEOREMS,
  liveTypesTheoremsSource, HOST-FRONT-LIVE-TYPESTHEOREMS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveTypesTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesTheorems

/-- Dual-pinned live TypesTheorems.lean bytes (must match on-disk file).
    Greppable: liveTypesTheoremsSource, PARSE-LIVE-TYPESTHEOREMS. -/
def liveTypesTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Types TYPES-THEOREM / HOST-TYPES-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.Types: theorems live here; TypeTag,
  NodeKind, kindMultOk, ofKindTag?, isValidKindTag, IrNode, mkNode?,
  mkNodeFromTags? stay in Types. Same namespace SystemsLean.Types so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - TYPES-THEOREM / HOST-TYPES-THEOREM: ofKindTag? known tags 0/1/2;
    ofKindTag?_fail_closed / isValidKindTag_fail_closed (n > 2);
    isValidKindTag_eq_ofKindTag?_isSome; kindMultOk known pairings and
    mismatch family; mkNode?_mismatch_none / mkNode?_ok;
    expectedMult_value / linear / erased; isWellTyped_eq_kindMultOk;
    mkNodeFromTags?_unknown_mult / unknown_kind;
    mkNodeFromTags?_value_omega_some / linear_one_some / erased_zero_some.

  These Types theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Types != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not a full elaborator. Not a control-flow graph.
  - Lake example smokes are NOT full proofs (none required here).

  Greppable: SYSTEMS_LEAN_HOST, COMMON-UNIVERSE, HOST-RESIDUAL, PRODUCT-WIRE-RESIDUAL,
  TYPED_IR_V0, FAIL-CLOSED-UNKNOWN-KIND, MULT-0, MULT-1, MULT-OMEGA,
  TYPES-THEOREM, HOST-TYPES-THEOREM, ofKindTag?_fail_closed, isValidKindTag_fail_closed,
  ofKindTag?_zero, ofKindTag?_one, ofKindTag?_two, isValidKindTag_eq_ofKindTag?_isSome,
  isValidKindTag_zero, isValidKindTag_one, isValidKindTag_two,
  kindMultOk_value_omega, kindMultOk_linear_one, kindMultOk_erased_zero,
  kindMultOk_value_not_one, kindMultOk_value_not_zero, kindMultOk_linear_not_omega,
  kindMultOk_linear_not_zero, kindMultOk_erased_not_omega, kindMultOk_erased_not_one,
  mkNode?_mismatch_none, expectedMult_value, expectedMult_linear, expectedMult_erased,
  isWellTyped_eq_kindMultOk, mkNode?_ok, mkNodeFromTags?_unknown_mult,
  mkNodeFromTags?_unknown_kind, mkNodeFromTags?_value_omega_some,
  mkNodeFromTags?_linear_one_some, mkNodeFromTags?_erased_zero_some,
  TypesTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.TypesTheorems
  Red/green: just systems-host; lake build SystemsLean.TypesTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.MultTheorems
import SystemsLean.Types

namespace SystemsLean.Types

open SystemsLean.Mult (Mult)

/-! ### TYPES-THEOREM / HOST-TYPES-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is NodeKind tags
  and FAIL-CLOSED-UNKNOWN-KIND only. Does not complete SpecProof; does not
  claim residual free / freestanding product self-host complete / PROVABLY.
-/

/-- Known raw tag 0 decodes to VALUE. Greppable: ofKindTag?_zero, TYPES-THEOREM. -/
theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := rfl

/-- Known raw tag 1 decodes to LINEAR. Greppable: ofKindTag?_one, TYPES-THEOREM. -/
theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl

/-- Known raw tag 2 decodes to ERASED. Greppable: ofKindTag?_two, TYPES-THEOREM. -/
theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl

/-- FAIL-CLOSED-UNKNOWN-KIND: raw tags with n > 2 reject to none (no coerce).
    Greppable: ofKindTag?_fail_closed, FAIL-CLOSED-UNKNOWN-KIND, TYPES-THEOREM,
    HOST-TYPES-THEOREM. -/
theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by
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

/-- isValidKindTag is definitionally ofKindTag? isSome.
    Greppable: isValidKindTag_eq_ofKindTag?_isSome, TYPES-THEOREM. -/
theorem isValidKindTag_eq_ofKindTag?_isSome (n : Nat) :
    isValidKindTag n = (ofKindTag? n).isSome := rfl

/-- Known tags 0/1/2 are valid raw kind tags.
    Greppable: isValidKindTag_zero, isValidKindTag_one, isValidKindTag_two, TYPES-THEOREM. -/
theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl
theorem isValidKindTag_one : isValidKindTag 1 = true := rfl
theorem isValidKindTag_two : isValidKindTag 2 = true := rfl

/-- FAIL-CLOSED-UNKNOWN-KIND on isValidKindTag: n > 2 is false.
    Greppable: isValidKindTag_fail_closed, FAIL-CLOSED-UNKNOWN-KIND, TYPES-THEOREM,
    HOST-TYPES-THEOREM. -/
theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by
  unfold isValidKindTag
  rw [ofKindTag?_fail_closed n h]
  rfl

/-- Known kind/mult pairings hold (VALUE/omega, LINEAR/1, ERASED/0).
    Greppable: kindMultOk_value_omega, kindMultOk_linear_one, kindMultOk_erased_zero,
    TYPES-THEOREM. -/
theorem kindMultOk_value_omega : kindMultOk NodeKind.value Mult.multOmega = true := rfl
theorem kindMultOk_linear_one : kindMultOk NodeKind.linear Mult.mult1 = true := rfl
theorem kindMultOk_erased_zero : kindMultOk NodeKind.erased Mult.mult0 = true := rfl

/-- Wrong kind/mult pairings reject (fail-closed pairing table).
    Greppable: kindMultOk_value_not_one, kindMultOk_value_not_zero,
    kindMultOk_linear_not_omega, kindMultOk_linear_not_zero,
    kindMultOk_erased_not_omega, kindMultOk_erased_not_one, TYPES-THEOREM,
    HOST-TYPES-THEOREM. -/
theorem kindMultOk_value_not_one : kindMultOk NodeKind.value Mult.mult1 = false := rfl
theorem kindMultOk_value_not_zero : kindMultOk NodeKind.value Mult.mult0 = false := rfl
theorem kindMultOk_linear_not_omega : kindMultOk NodeKind.linear Mult.multOmega = false := rfl
theorem kindMultOk_linear_not_zero : kindMultOk NodeKind.linear Mult.mult0 = false := rfl
theorem kindMultOk_erased_not_omega : kindMultOk NodeKind.erased Mult.multOmega = false := rfl
theorem kindMultOk_erased_not_one : kindMultOk NodeKind.erased Mult.mult1 = false := rfl

/-- mkNode? fails closed when kind/mult pairing is false (any type tag).
    Greppable: mkNode?_mismatch_none, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNode?_mismatch_none (tag : Nat) (m : Mult) (k : NodeKind)
    (h : kindMultOk k m = false) : mkNode? tag m k = none := by
  unfold mkNode?
  rw [h]
  rfl

/-- expectedMult table: VALUE expects MULT-OMEGA.
    Greppable: expectedMult_value, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem expectedMult_value :
    NodeKind.expectedMult NodeKind.value = Mult.multOmega := rfl

/-- expectedMult table: LINEAR expects MULT-1.
    Greppable: expectedMult_linear, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem expectedMult_linear :
    NodeKind.expectedMult NodeKind.linear = Mult.mult1 := rfl

/-- expectedMult table: ERASED expects MULT-0.
    Greppable: expectedMult_erased, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem expectedMult_erased :
    NodeKind.expectedMult NodeKind.erased = Mult.mult0 := rfl

/-- IrNode.isWellTyped is definitionally kindMultOk on kind and mult.
    Greppable: isWellTyped_eq_kindMultOk, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem isWellTyped_eq_kindMultOk (n : IrNode) :
    n.isWellTyped = kindMultOk n.kind n.mult := rfl

/-- mkNode? success path: kindMultOk true yields some with matching fields.
    Greppable: mkNode?_ok, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNode?_ok (tag : Nat) (m : Mult) (k : NodeKind)
    (h : kindMultOk k m = true) :
    mkNode? tag m k =
      some { ty := typeTagInit tag, mult := m, kind := k } := by
  unfold mkNode?
  rw [h]
  rfl

/-- mkNodeFromTags? fails closed on unknown mult tag (n > 2).
    Greppable: mkNodeFromTags?_unknown_mult, FAIL-CLOSED-UNKNOWN-GRADE,
    TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNodeFromTags?_unknown_mult (typeTag kindTag multTag : Nat)
    (h : 2 < multTag) : mkNodeFromTags? typeTag multTag kindTag = none := by
  unfold mkNodeFromTags?
  have hm : Mult.ofNat? multTag = none := Mult.ofNat?_fail_closed multTag h
  simp [hm]

/-- mkNodeFromTags? fails closed on unknown kind tag (n > 2).
    Greppable: mkNodeFromTags?_unknown_kind, FAIL-CLOSED-UNKNOWN-KIND,
    TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNodeFromTags?_unknown_kind (typeTag multTag kindTag : Nat)
    (h : 2 < kindTag) : mkNodeFromTags? typeTag multTag kindTag = none := by
  unfold mkNodeFromTags?
  have hk : ofKindTag? kindTag = none := ofKindTag?_fail_closed kindTag h
  simp [hk]

/-- Known good tags (mult 2, kind 0) build VALUE/MULT-OMEGA node.
    Greppable: mkNodeFromTags?_value_omega_some, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNodeFromTags?_value_omega_some (typeTag : Nat) :
    mkNodeFromTags? typeTag 2 0 =
      some {
        ty := typeTagInit typeTag
        mult := Mult.multOmega
        kind := NodeKind.value
      } := rfl

/-- Known good tags (mult 1, kind 1) build LINEAR/MULT-1 node.
    Greppable: mkNodeFromTags?_linear_one_some, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNodeFromTags?_linear_one_some (typeTag : Nat) :
    mkNodeFromTags? typeTag 1 1 =
      some {
        ty := typeTagInit typeTag
        mult := Mult.mult1
        kind := NodeKind.linear
      } := rfl

/-- Known good tags (mult 0, kind 2) build ERASED/MULT-0 node.
    Greppable: mkNodeFromTags?_erased_zero_some, TYPES-THEOREM, HOST-TYPES-THEOREM. -/
theorem mkNodeFromTags?_erased_zero_some (typeTag : Nat) :
    mkNodeFromTags? typeTag 0 2 =
      some {
        ty := typeTagInit typeTag
        mult := Mult.mult0
        kind := NodeKind.erased
      } := rfl

end SystemsLean.Types
"#

end SystemsLean.HostFrontLiveTypesTheorems
