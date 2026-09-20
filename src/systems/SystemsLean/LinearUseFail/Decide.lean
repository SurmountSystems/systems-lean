/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL consume/consume canSeq
  decide facts (same namespace). Side: classic Lean elaborator under
  src/systems/ (not freestanding C). Role helper: consume then consume
  as decide (0 = 1). canSeq iff lives in SystemsLean.LinearUseFail.CanSeq.
  Keep/keep algebra lives in SystemsLean.LinearUseFail.Keep.
  Consume/keep duals live in SystemsLean.LinearUseFail.Consume.
  Bind and canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow): consume/consume decide, true/false
  iff, eq, neq. consume/consume stays false.

  These theorems do NOT set SpecProof.proofCompleteClaimed true.
  Indexed MULT-1 fail-to-check != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Not all-types use-check.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, SystemsLean.LinearUseFail,
  theorem canSeq_consume_consume_decide,
  theorem canSeq_consume_consume_true_iff,
  theorem canSeq_consume_consume_false_iff,
  theorem canSeq_consume_consume_neq_false,
  theorem canSeq_consume_consume_eq_true,
  theorem canSeq_consume_consume_true_eq,
  theorem canSeq_consume_consume_false_neq,
  theorem canSeq_consume_consume_false_eq,
  theorem canSeq_consume_consume_true_neq,
  theorem canSeq_consume_consume_neq_true,
  theorem canSeq_consume_consume_decide_eq,
  theorem canSeq_consume_consume_decide_eq_false,
  theorem canSeq_consume_consume_decide_false_eq,
  theorem canSeq_consume_consume_decide_true_neq,
  theorem canSeq_consume_consume_decide_neq_true,
  theorem canSeq_consume_consume_decide_true_iff,
  theorem canSeq_consume_consume_decide_false_iff,
  theorem canSeq_consume_consume_decide_neq_false,
  theorem canSeq_consume_consume_decide_eq_true,
  theorem canSeq_consume_consume_decide_true_eq,
  theorem canSeq_consume_consume_decide_false_neq,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail.Decide
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail
import SystemsLean.LinearUseFail.CanSeq

namespace SystemsLean.LinearUseFail

/-- consume then consume has canSeq equal to decide (0 = 1).
    Dual of canSeq_keep_consume_decide for consume then consume.
    Joins canSeq_iff with decide_eq_true_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide :
    canSeq consume consume = decide (0 = 1) :=
  Bool.eq_iff_iff.mpr
    (Iff.trans (canSeq_iff consume consume) (Iff.symm decide_eq_true_iff))

/-- consume then consume sequences iff 0 = 1.
    Dual of canSeq_consume_consume_decide (Prop iff vs Bool decide).
    Dual of canSeq_keep_consume_true_iff for consume then consume.
    Joins canSeq_iff. consume/consume stays canSeq_consume_consume_false.
    LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_true_iff :
    canSeq consume consume = true <-> 0 = 1 :=
  canSeq_iff consume consume

/-- consume then consume does not sequence iff Not (0 = 1).
    Dual of canSeq_consume_consume_true_iff (false side).
    Dual of canSeq_keep_consume_false_iff for consume then consume.
    Joins canSeq_false_iff. consume/consume stays canSeq_consume_consume_false.
    LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_false_iff :
    canSeq consume consume = false <-> Not (0 = 1) :=
  canSeq_false_iff consume consume

/-- consume then consume does not sequence when Not (0 = 1).
    Dual of canSeq_keep_consume_neq_false for consume then consume.
    Joins canSeq_consume_consume_false_iff mpr.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_neq_false (h : Not (0 = 1)) :
    canSeq consume consume = false :=
  (canSeq_consume_consume_false_iff).mpr h

/-- consume then consume sequences when 0 = 1.
    Dual of canSeq_consume_consume_neq_false (true side). Dual of
    canSeq_keep_consume_eq_true for consume then consume.
    Joins canSeq_consume_consume_true_iff mpr.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_eq_true (h : 0 = 1) :
    canSeq consume consume = true :=
  (canSeq_consume_consume_true_iff).mpr h

/-- consume then consume sequences only if 0 = 1.
    Dual of canSeq_consume_consume_eq_true (converse). Dual of
    canSeq_keep_consume_true_eq for consume then consume. Joins
    canSeq_consume_consume_true_iff mp. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_true_eq
    (h : canSeq consume consume = true) :
    0 = 1 :=
  (canSeq_consume_consume_true_iff).mp h

/-- consume then consume does not sequence only if Not (0 = 1).
    Dual of canSeq_consume_consume_true_eq (false side). Dual of
    canSeq_consume_consume_neq_false (converse). Dual of
    canSeq_keep_consume_false_neq for consume then consume. Joins
    canSeq_consume_consume_false_iff mp. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_false_neq
    (h : canSeq consume consume = false) :
    Not (0 = 1) :=
  (canSeq_consume_consume_false_iff).mp h

/-- consume then consume is false (swapped equality). Dual of
    canSeq_consume_consume_false (Eq.symm of canSeq = false).
    Dual of canSeq_consume_consume_false_neq (closed Bool, no
    hypothesis). Joins canSeq_consume_consume_false_iff mpr.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_false_eq :
    false = canSeq consume consume :=
  Eq.symm
    ((canSeq_consume_consume_false_iff).mpr (fun h => Nat.noConfusion h))

/-- consume then consume is not true. Dual of
    canSeq_consume_consume_false_eq (Not (true = canSeq) vs
    false = canSeq). Dual of canSeq_consume_consume_true_eq
    (closed Bool, no hypothesis). Joins
    canSeq_consume_consume_true_iff mp. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_true_neq :
    Not (true = canSeq consume consume) :=
  fun h => Nat.noConfusion (canSeq_consume_consume_true_eq (Eq.symm h))

/-- consume then consume is not true (unswapped equality). Dual of
    canSeq_consume_consume_true_neq (Not (canSeq = true) vs
    Not (true = canSeq)). Dual of canSeq_consume_consume_false
    (Not (canSeq = true) vs canSeq = false). Joins
    canSeq_consume_consume_true_eq. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_neq_true :
    Not (canSeq consume consume = true) :=
  fun h => Nat.noConfusion (canSeq_consume_consume_true_eq h)

/-- consume then consume has decide (0 = 1) equal to canSeq (swapped).
    Dual of canSeq_consume_consume_decide (Eq.symm). Dual of
    canSeq_consume_consume_false_eq for the decide family.
    Joins canSeq_consume_consume_decide. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_eq :
    decide (0 = 1) = canSeq consume consume :=
  Eq.symm canSeq_consume_consume_decide

/-- consume then consume has decide (0 = 1) equal to false.
    Dual of canSeq_consume_consume_decide_eq (decide = false vs
    decide = canSeq). Dual of canSeq_consume_consume_false for
    the decide family. Joins canSeq_consume_consume_decide_eq.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_eq_false :
    decide (0 = 1) = false :=
  Eq.trans
    canSeq_consume_consume_decide_eq
    ((canSeq_consume_consume_false_iff).mpr (fun h => Nat.noConfusion h))

/-- consume then consume has false equal to decide (0 = 1) (swapped).
    Dual of canSeq_consume_consume_decide_eq_false (Eq.symm). Dual of
    canSeq_consume_consume_false_eq for the decide family (false =
    decide vs false = canSeq). Joins
    canSeq_consume_consume_decide_eq_false. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_false_eq :
    false = decide (0 = 1) :=
  Eq.symm canSeq_consume_consume_decide_eq_false

/-- consume then consume has decide (0 = 1) not equal to true (swapped).
    Dual of canSeq_consume_consume_decide_false_eq (Not (true = decide)
    vs false = decide). Dual of canSeq_consume_consume_true_neq for
    the decide family. Joins canSeq_consume_consume_true_neq with
    canSeq_consume_consume_decide_eq. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_true_neq :
    Not (true = decide (0 = 1)) :=
  fun h =>
    canSeq_consume_consume_true_neq
      (Eq.trans h canSeq_consume_consume_decide_eq)

/-- consume then consume has decide (0 = 1) not equal to true (unswapped).
    Dual of canSeq_consume_consume_decide_true_neq (Not (decide = true)
    vs Not (true = decide)). Dual of canSeq_consume_consume_neq_true for
    the decide family. Joins canSeq_consume_consume_neq_true with
    canSeq_consume_consume_decide. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_neq_true :
    Not (decide (0 = 1) = true) :=
  fun h =>
    canSeq_consume_consume_neq_true
      (Eq.trans canSeq_consume_consume_decide h)

/-- consume then consume has decide (0 = 1) equal to true iff 0 = 1.
    Dual of canSeq_consume_consume_decide_neq_true (Prop iff vs
    Not (decide = true)). Dual of canSeq_consume_consume_true_iff
    for the decide family. Joins canSeq_consume_consume_decide_eq
    with canSeq_consume_consume_true_iff. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_true_iff :
    decide (0 = 1) = true <-> 0 = 1 :=
  Iff.trans
    (iff_of_eq (congrArg (fun b => b = true) canSeq_consume_consume_decide_eq))
    canSeq_consume_consume_true_iff

/-- consume then consume has decide (0 = 1) equal to false iff Not (0 = 1).
    Dual of canSeq_consume_consume_decide_true_iff (false side). Dual of
    canSeq_consume_consume_false_iff for the decide family. Joins
    canSeq_consume_consume_decide_eq with canSeq_consume_consume_false_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_false_iff :
    decide (0 = 1) = false <-> Not (0 = 1) :=
  Iff.trans
    (iff_of_eq (congrArg (fun b => b = false) canSeq_consume_consume_decide_eq))
    canSeq_consume_consume_false_iff

/-- consume then consume has decide (0 = 1) equal to false when Not (0 = 1).
    Dual of canSeq_consume_consume_neq_false for the decide family.
    Dual of canSeq_consume_consume_decide_false_iff (mpr). Joins
    canSeq_consume_consume_decide_false_iff mpr. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_neq_false (h : Not (0 = 1)) :
    decide (0 = 1) = false :=
  (canSeq_consume_consume_decide_false_iff).mpr h

/-- consume then consume has decide (0 = 1) equal to true when 0 = 1.
    Dual of canSeq_consume_consume_eq_true for the decide family.
    Dual of canSeq_consume_consume_decide_neq_false (true side).
    Joins canSeq_consume_consume_decide_true_iff mpr. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_eq_true (h : 0 = 1) :
    decide (0 = 1) = true :=
  (canSeq_consume_consume_decide_true_iff).mpr h

/-- consume then consume has decide (0 = 1) equal to true only if 0 = 1.
    Dual of canSeq_consume_consume_decide_eq_true (converse). Dual of
    canSeq_consume_consume_true_eq for the decide family. Joins
    canSeq_consume_consume_decide_true_iff mp. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_true_eq
    (h : decide (0 = 1) = true) :
    0 = 1 :=
  (canSeq_consume_consume_decide_true_iff).mp h

/-- consume then consume has decide (0 = 1) equal to false only if
    Not (0 = 1). Dual of canSeq_consume_consume_decide_true_eq (false
    side). Dual of canSeq_consume_consume_false_neq for the decide
    family. Joins canSeq_consume_consume_decide_false_iff mp.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_false_neq
    (h : decide (0 = 1) = false) :
    Not (0 = 1) :=
  (canSeq_consume_consume_decide_false_iff).mp h

end SystemsLean.LinearUseFail
