/-
  SYSTEMS_LEAN_HOST partial -- IrProgram IR-PROGRAM-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.IrProgram: theorems live here; Program
  structure, programCap, push, isWellTyped, foldWellTyped, and checkFailClosed
  stay in IrProgram. Same namespace SystemsLean.IrProgram so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - IR-PROGRAM-THEOREM / HOST-IR-PROGRAM-THEOREM: empty_isEmpty /
    empty_length_zero / programCap_eq_eight / isWellTyped_empty_false /
    empty_not_well_typed / checkFailClosed_eq_isWellTyped /
    foldWellTyped_ill_typed_none / foldWellTyped_empty_none / push_bad_node /
    push_value_one_ok / length_single_value / isWellTyped_single_value /
    foldWellTyped_single_value_some / isWellTyped_two_values / length_two_values /
    foldWellTyped_two_values_some / push_second_value_ok / push_full_at_cap.

  These IrProgram theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on IrProgram != host proof complete != residual free.

  Intentional non-claims:
  - Ordered IR program EMPTY-PROGRAM-FAIL-CLOSED + cheap push/fold only.
  - NOT freestanding residual free.
  - NOT PROVABLY. NOT llvm unlock.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED,
  IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM, isWellTyped_empty_false,
  empty_not_well_typed, empty_isEmpty, empty_length_zero,
  checkFailClosed_eq_isWellTyped, foldWellTyped_empty_none,
  foldWellTyped_ill_typed_none, push_bad_node, programCap_eq_eight,
  push_value_one_ok, length_single_value, isWellTyped_single_value,
  foldWellTyped_single_value_some, isWellTyped_two_values, length_two_values,
  foldWellTyped_two_values_some, push_second_value_ok, push_full_at_cap,
  IrProgramTheorems, SLAKE_IR_PROGRAM_CAP, MULT-0, MULT-1, MULT-OMEGA, TYPED_IR_V0
  UNIT_SURFACE host surface. Module: SystemsLean.IrProgramTheorems
  Red/green: just systems-host; lake build SystemsLean.IrProgramTheorems.
  Module must stay ASCII.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding product. Not freestanding emit residual free.
  Not llvm unlocked. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram

namespace SystemsLean.IrProgram

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)

/-! ### IR-PROGRAM-THEOREM / HOST-IR-PROGRAM-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is ordered IR
  program EMPTY-PROGRAM-FAIL-CLOSED and cheap push/fold contracts only.
  Does not complete SpecProof; does not claim residual free / freestanding
  product self-host complete / PROVABLY.
-/

/-- Empty program has no live nodes. Greppable: empty_isEmpty, IR-PROGRAM-THEOREM. -/
theorem empty_isEmpty : isEmpty empty = true := rfl

/-- Empty program live count is zero. Greppable: empty_length_zero, IR-PROGRAM-THEOREM. -/
theorem empty_length_zero : length empty = 0 := rfl

/-- Capacity honesty: programCap matches emit SLAKE_IR_PROGRAM_CAP.
    Greppable: programCap_eq_eight, SLAKE_IR_PROGRAM_CAP, IR-PROGRAM-THEOREM. -/
theorem programCap_eq_eight : programCap = 8 := rfl

/-- EMPTY-PROGRAM-FAIL-CLOSED core: empty program is not well-typed as a program.
    Greppable: isWellTyped_empty_false, EMPTY-PROGRAM-FAIL-CLOSED, IR-PROGRAM-THEOREM,
    HOST-IR-PROGRAM-THEOREM. -/
theorem isWellTyped_empty_false : isWellTyped empty = false := rfl

/-- Alias of isWellTyped_empty_false (readable empty reject name).
    Greppable: empty_not_well_typed, EMPTY-PROGRAM-FAIL-CLOSED, IR-PROGRAM-THEOREM. -/
theorem empty_not_well_typed : isWellTyped empty = false := isWellTyped_empty_false

/-- checkFailClosed is definitionally isWellTyped.
    Greppable: checkFailClosed_eq_isWellTyped, IR-PROGRAM-THEOREM. -/
theorem checkFailClosed_eq_isWellTyped (p : Program) :
    checkFailClosed p = isWellTyped p := rfl

/-- Fail closed fold: ill-typed programs yield none (no partial fold).
    Greppable: foldWellTyped_ill_typed_none, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem foldWellTyped_ill_typed_none {alpha : Type} (p : Program) (init : alpha)
    (f : alpha -> IrNode -> alpha) (h : isWellTyped p = false) :
    foldWellTyped p init f = none := by
  unfold foldWellTyped
  rw [h]
  rfl

/-- EMPTY-PROGRAM-FAIL-CLOSED on fold: empty program does not fold.
    Greppable: foldWellTyped_empty_none, EMPTY-PROGRAM-FAIL-CLOSED, IR-PROGRAM-THEOREM. -/
theorem foldWellTyped_empty_none {alpha : Type} (init : alpha)
    (f : alpha -> IrNode -> alpha) :
    foldWellTyped empty init f = none :=
  foldWellTyped_ill_typed_none empty init f isWellTyped_empty_false

/-- push fails closed on a node that is not well-typed (badNode; original p kept).
    Greppable: push_bad_node, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem push_bad_node (p : Program) (n : IrNode) (h : n.isWellTyped = false) :
    push p n = PushResult.badNode := by
  unfold push
  rw [h]
  rfl

/-! ### Single well-typed node program (beyond EMPTY-PROGRAM-FAIL-CLOSED) -/

private def thmValueNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.multOmega, kind := NodeKind.value }

/-- push empty with a well-typed VALUE node yields a one-node program.
    Greppable: push_value_one_ok, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem push_value_one_ok :
    push empty thmValueNode =
      PushResult.ok { nodes := [thmValueNode] } := rfl

/-- One well-typed VALUE node has length 1.
    Greppable: length_single_value, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem length_single_value :
    length { nodes := [thmValueNode] } = 1 := rfl

/-- One well-typed VALUE node is a well-typed program (EMPTY-PROGRAM contrast).
    Greppable: isWellTyped_single_value, IR-PROGRAM-THEOREM,
    HOST-IR-PROGRAM-THEOREM. -/
theorem isWellTyped_single_value :
    isWellTyped { nodes := [thmValueNode] } = true := rfl

/-- foldWellTyped success path: single well-typed VALUE node folds to some count.
    Contrasts foldWellTyped_empty_none / foldWellTyped_ill_typed_none.
    Greppable: foldWellTyped_single_value_some, IR-PROGRAM-THEOREM,
    HOST-IR-PROGRAM-THEOREM. -/
theorem foldWellTyped_single_value_some :
    foldWellTyped { nodes := [thmValueNode] } (0 : Nat) (fun acc _ => acc + 1) =
      some 1 := rfl

/-! ### Multi-node well-typed + capacity fail-closed (beyond single-node) -/

private def thmValueNodeB : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def thmTwoValues : Program :=
  { nodes := [thmValueNode, thmValueNodeB] }

/-- Two well-typed VALUE nodes form a well-typed program.
    Greppable: isWellTyped_two_values, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem isWellTyped_two_values :
    isWellTyped thmTwoValues = true := rfl

/-- Two-node program has length 2.
    Greppable: length_two_values, IR-PROGRAM-THEOREM. -/
theorem length_two_values : length thmTwoValues = 2 := rfl

/-- foldWellTyped success path on two well-typed VALUE nodes.
    Greppable: foldWellTyped_two_values_some, IR-PROGRAM-THEOREM,
    HOST-IR-PROGRAM-THEOREM. -/
theorem foldWellTyped_two_values_some :
    foldWellTyped thmTwoValues (0 : Nat) (fun acc _ => acc + 1) = some 2 := rfl

/-- push of a second well-typed VALUE onto a one-node program succeeds.
    Greppable: push_second_value_ok, IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM. -/
theorem push_second_value_ok :
    push { nodes := [thmValueNode] } thmValueNodeB =
      PushResult.ok thmTwoValues := rfl

/-- Full program at programCap rejects further push (FAIL-CLOSED full).
    Greppable: push_full_at_cap, SLAKE_IR_PROGRAM_CAP, IR-PROGRAM-THEOREM,
    HOST-IR-PROGRAM-THEOREM. -/
theorem push_full_at_cap :
    push {
      nodes := [
        thmValueNode, thmValueNodeB, thmValueNode, thmValueNodeB,
        thmValueNode, thmValueNodeB, thmValueNode, thmValueNodeB
      ]
    } thmValueNode = PushResult.full := rfl

end SystemsLean.IrProgram
