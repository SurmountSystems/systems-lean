/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL consume/keep canSeq duals
  (same namespace). Side: classic Lean elaborator under src/systems/
  (not freestanding C). Role helper: consume then keep, and keep then
  consume. canSeq iff lives in SystemsLean.LinearUseFail.CanSeq.
  Keep/keep algebra lives in SystemsLean.LinearUseFail.Keep.
  Consume/consume decide facts live in SystemsLean.LinearUseFail.Decide.
  Bind and canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow): consume/keep and keep/consume true,
  mismatch false, iff, eq, neq, decide, decide_eq, neq_true, true_neq,
  false_eq.

  These theorems do NOT set SpecProof.proofCompleteClaimed true.
  Indexed MULT-1 fail-to-check != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Not all-types use-check.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, SystemsLean.LinearUseFail,
  theorem canSeq_consume_keep_true, theorem canSeq_keep_consume_true,
  theorem canSeq_consume_keep_decide, theorem canSeq_keep_consume_decide,
  theorem canSeq_consume_keep_decide_eq, theorem canSeq_keep_consume_decide_eq,
  theorem canSeq_consume_keep_neq_true, theorem canSeq_keep_consume_neq_true,
  theorem canSeq_consume_keep_true_neq, theorem canSeq_keep_consume_true_neq,
  theorem canSeq_consume_keep_false_eq, theorem canSeq_keep_consume_false_eq,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail.Consume
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail
import SystemsLean.LinearUseFail.CanSeq

namespace SystemsLean.LinearUseFail

/-- consume then keep sequences: post remaining 0 equals keep pre 0.
    Dual of canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_true :
    canSeq consume (keep : LinearStep 0 0) = true := rfl

/-- keep (remaining 1) then consume sequences: post 1 equals consume pre 1.
    Dual of canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_true :
    canSeq (keep : LinearStep 1 1) consume = true := rfl

/-- keep remaining 0 then consume does not sequence: post 0 != consume pre 1.
    Dual of canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_zero_consume_false :
    canSeq (keep : LinearStep 0 0) consume = false := rfl

/-- consume then keep remaining 1 does not sequence: post 0 != keep pre 1.
    Dual of canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_one_false :
    canSeq consume (keep : LinearStep 1 1) = false := rfl

/-- consume then keep remaining k sequences iff k = 0.
    Spec CanSeqConsumeKeepTrueIff. LINEAR-USE-FAIL. Joins
    canSeq_consume_keep_true and canSeq_consume_keep_one_false
    for general k. CanSeq is 0 = k; k = 0 is Eq.comm. -/
theorem canSeq_consume_keep_true_iff {k : Nat} :
    CanSeqConsumeKeepTrueIff k :=
  Iff.trans
    (canSeq_iff consume (keep : LinearStep k k))
    Eq.comm

/-- keep remaining k then consume sequences iff k = 1.
    Spec CanSeqKeepConsumeTrueIff. LINEAR-USE-FAIL. Joins
    canSeq_keep_consume_true and canSeq_keep_zero_consume_false
    for general k. Dual of canSeq_consume_keep_true_iff.
    CanSeq is k = 1 by unfolding. -/
theorem canSeq_keep_consume_true_iff {k : Nat} :
    CanSeqKeepConsumeTrueIff k :=
  canSeq_iff (keep : LinearStep k k) consume

/-- keep remaining k then consume does not sequence iff Not (k = 1).
    Spec CanSeqKeepConsumeFalseIff. LINEAR-USE-FAIL. Dual of
    canSeq_keep_consume_true_iff (false side). Joins
    canSeq_keep_zero_consume_false for general k. CanSeq is
    k = 1 by unfolding. -/
theorem canSeq_keep_consume_false_iff {k : Nat} :
    CanSeqKeepConsumeFalseIff k :=
  canSeq_false_iff (keep : LinearStep k k) consume

/-- consume then keep remaining k does not sequence iff Not (k = 0).
    Spec CanSeqConsumeKeepFalseIff. LINEAR-USE-FAIL. Dual of
    canSeq_consume_keep_true_iff (false side). Dual of
    canSeq_keep_consume_false_iff (swap order). Joins
    canSeq_consume_keep_one_false for general k. CanSeq is
    0 = k; Not (k = 0) is Not of Eq.comm. -/
theorem canSeq_consume_keep_false_iff {k : Nat} :
    CanSeqConsumeKeepFalseIff k :=
  Iff.trans
    (canSeq_false_iff consume (keep : LinearStep k k))
    (Iff.intro (fun h eq => h eq.symm) (fun h eq => h eq.symm))

/-- consume then keep remaining k does not sequence when k != 0.
    Dual of canSeq_keep_keep_neq_false for consume then keep.
    Joins canSeq_consume_keep_one_false for general k.
    Matching remaining 0 is canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_neq_false {k : Nat} (h : Not (k = 0)) :
    canSeq consume (keep : LinearStep k k) = false :=
  (canSeq_consume_keep_false_iff).mpr h

/-- keep remaining k then consume does not sequence when k != 1.
    Dual of canSeq_consume_keep_neq_false (swap order). Dual of
    canSeq_keep_keep_neq_false for keep then consume.
    Joins canSeq_keep_zero_consume_false for general k.
    Matching remaining 1 is canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_neq_false {k : Nat} (h : Not (k = 1)) :
    canSeq (keep : LinearStep k k) consume = false :=
  (canSeq_keep_consume_false_iff).mpr h

/-- consume then keep remaining k sequences when k = 0.
    Dual of canSeq_consume_keep_neq_false (true side).
    Joins canSeq_consume_keep_true for general k = 0.
    Mismatch is canSeq_consume_keep_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_eq_true {k : Nat} (h : k = 0) :
    canSeq consume (keep : LinearStep k k) = true :=
  (canSeq_consume_keep_true_iff).mpr h

/-- keep remaining k then consume sequences when k = 1.
    Dual of canSeq_keep_consume_neq_false (true side). Dual of
    canSeq_consume_keep_eq_true (swap order). Joins
    canSeq_keep_consume_true for general k = 1.
    Mismatch is canSeq_keep_consume_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_eq_true {k : Nat} (h : k = 1) :
    canSeq (keep : LinearStep k k) consume = true :=
  (canSeq_keep_consume_true_iff).mpr h

/-- consume then keep remaining k does not sequence only if Not (k = 0).
    Dual of canSeq_keep_keep_false_neq for consume then keep. Dual of
    canSeq_consume_keep_neq_false (converse). Joins
    canSeq_consume_keep_false_iff mp. Matching remaining 0 is
    canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_false_neq {k : Nat}
    (h : canSeq consume (keep : LinearStep k k) = false) :
    Not (k = 0) :=
  (canSeq_consume_keep_false_iff).mp h

/-- keep remaining k then consume does not sequence only if Not (k = 1).
    Dual of canSeq_consume_keep_false_neq (swap order). Dual of
    canSeq_keep_consume_neq_false (converse). Joins
    canSeq_keep_consume_false_iff mp. Matching remaining 1 is
    canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_false_neq {k : Nat}
    (h : canSeq (keep : LinearStep k k) consume = false) :
    Not (k = 1) :=
  (canSeq_keep_consume_false_iff).mp h

/-- consume then keep remaining k sequences only if k = 0.
    Dual of canSeq_consume_keep_eq_true (converse). Dual of
    canSeq_keep_keep_true_eq for consume then keep. Joins
    canSeq_consume_keep_true_iff mp. Mismatch is
    canSeq_consume_keep_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_true_eq {k : Nat}
    (h : canSeq consume (keep : LinearStep k k) = true) :
    k = 0 :=
  (canSeq_consume_keep_true_iff).mp h

/-- keep remaining k then consume sequences only if k = 1.
    Dual of canSeq_keep_consume_eq_true (converse). Dual of
    canSeq_consume_keep_true_eq (swap order). Dual of
    canSeq_keep_keep_true_eq for keep then consume. Joins
    canSeq_keep_consume_true_iff mp. Mismatch is
    canSeq_keep_consume_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_true_eq {k : Nat}
    (h : canSeq (keep : LinearStep k k) consume = true) :
    k = 1 :=
  (canSeq_keep_consume_true_iff).mp h

/-- consume then keep remaining k has canSeq equal to decide (k = 0).
    Dual of canSeq_keep_keep_decide for consume then keep. Joins
    canSeq_consume_keep_true_iff with decide_eq_true_iff.
    Matching remaining 0 is canSeq_consume_keep_true. Keep then
    consume stays canSeq_keep_consume_true_iff (k = 1). LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_decide {k : Nat} :
    canSeq consume (keep : LinearStep k k) = decide (k = 0) :=
  Bool.eq_iff_iff.mpr
    (Iff.trans canSeq_consume_keep_true_iff (Iff.symm decide_eq_true_iff))

/-- keep remaining k then consume has canSeq equal to decide (k = 1).
    Dual of canSeq_consume_keep_decide (swap order). Joins
    canSeq_keep_consume_true_iff with decide_eq_true_iff.
    Matching remaining 1 is canSeq_keep_consume_true. Consume then
    keep stays canSeq_consume_keep_decide (k = 0). LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_decide {k : Nat} :
    canSeq (keep : LinearStep k k) consume = decide (k = 1) :=
  Bool.eq_iff_iff.mpr
    (Iff.trans canSeq_keep_consume_true_iff (Iff.symm decide_eq_true_iff))

/-- consume then keep remaining k has decide (k = 0) equal to canSeq
    (swapped). Dual of canSeq_consume_keep_decide (Eq.symm). Dual of
    canSeq_keep_keep_decide_eq for consume then keep.
    Matching remaining 0 is canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_decide_eq {k : Nat} :
    decide (k = 0) = canSeq consume (keep : LinearStep k k) :=
  Eq.symm canSeq_consume_keep_decide

/-- keep remaining k then consume has decide (k = 1) equal to canSeq
    (swapped). Dual of canSeq_keep_consume_decide (Eq.symm). Dual of
    canSeq_consume_keep_decide_eq (swap order). Matching remaining 1
    is canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_decide_eq {k : Nat} :
    decide (k = 1) = canSeq (keep : LinearStep k k) consume :=
  Eq.symm canSeq_keep_consume_decide

/-- consume then keep remaining k is not true when k != 0.
    Dual of canSeq_consume_keep_eq_true (Not of true). Dual of
    canSeq_keep_keep_neq_true for consume then keep.
    Matching remaining 0 is canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_neq_true {k : Nat} (h : Not (k = 0)) :
    Not (canSeq consume (keep : LinearStep k k) = true) :=
  fun ht => h (canSeq_consume_keep_true_eq ht)

/-- keep remaining k then consume is not true when k != 1.
    Dual of canSeq_keep_consume_eq_true (Not of true). Dual of
    canSeq_consume_keep_neq_true (swap order). Matching remaining 1
    is canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_neq_true {k : Nat} (h : Not (k = 1)) :
    Not (canSeq (keep : LinearStep k k) consume = true) :=
  fun ht => h (canSeq_keep_consume_true_eq ht)

/-- consume then keep remaining k is not true (swapped equality)
    when k != 0. Dual of canSeq_consume_keep_neq_true.
    Dual of canSeq_keep_keep_true_neq for consume then keep.
    Matching remaining 0 is canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_true_neq {k : Nat} (h : Not (k = 0)) :
    Not (true = canSeq consume (keep : LinearStep k k)) :=
  fun ht => h (canSeq_consume_keep_true_eq (Eq.symm ht))

/-- keep remaining k then consume is not true (swapped equality)
    when k != 1. Dual of canSeq_keep_consume_neq_true.
    Dual of canSeq_consume_keep_true_neq (swap order). Matching remaining 1
    is canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_true_neq {k : Nat} (h : Not (k = 1)) :
    Not (true = canSeq (keep : LinearStep k k) consume) :=
  fun ht => h (canSeq_keep_consume_true_eq (Eq.symm ht))

/-- consume then keep remaining k has false equal to canSeq when k != 0
    (swapped). Dual of canSeq_consume_keep_neq_false (Eq.symm). Dual of
    canSeq_keep_keep_false_eq for consume then keep.
    Matching remaining 0 is canSeq_consume_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_consume_keep_false_eq {k : Nat} (h : Not (k = 0)) :
    false = canSeq consume (keep : LinearStep k k) :=
  Eq.symm (canSeq_consume_keep_neq_false h)

/-- keep remaining k then consume has false equal to canSeq when k != 1
    (swapped). Dual of canSeq_keep_consume_neq_false (Eq.symm). Dual of
    canSeq_consume_keep_false_eq (swap order). Matching remaining 1
    is canSeq_keep_consume_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_consume_false_eq {k : Nat} (h : Not (k = 1)) :
    false = canSeq (keep : LinearStep k k) consume :=
  Eq.symm (canSeq_keep_consume_neq_false h)

end SystemsLean.LinearUseFail
