/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL keep/keep canSeq algebra
  (same namespace). Side: classic Lean elaborator under src/systems/
  (not freestanding C). Role helper: keep remaining k then keep remaining m.
  canSeq iff lives in SystemsLean.LinearUseFail.CanSeq. Consume/keep duals
  live in SystemsLean.LinearUseFail.Consume. Consume/consume decide facts
  live in SystemsLean.LinearUseFail.Decide. Bind and
  canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow): keep/keep true, mismatch false, iff,
  eq, neq, symm, comm, trans, cancel, congr, decide.

  These theorems do NOT set SpecProof.proofCompleteClaimed true.
  Indexed MULT-1 fail-to-check != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Not all-types use-check.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, SystemsLean.LinearUseFail,
  theorem canSeq_keep_keep_true, theorem canSeq_keep_keep_decide,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail.Keep
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail
import SystemsLean.LinearUseFail.CanSeq

namespace SystemsLean.LinearUseFail

/-- keep then keep sequences: post remaining k equals keep pre k.
    Dual of canSeq_consume_consume_false on matching remaining. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_true {k : Nat} :
    canSeq (keep : LinearStep k k) (keep : LinearStep k k) = true :=
  decide_eq_true (Eq.refl k)

/-- keep remaining 0 then keep remaining 1 does not sequence: post 0 != keep pre 1.
    Dual of canSeq_keep_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_zero_keep_one_false :
    canSeq (keep : LinearStep 0 0) (keep : LinearStep 1 1) = false := rfl

/-- keep remaining 1 then keep remaining 0 does not sequence: post 1 != keep pre 0.
    Dual of canSeq_keep_zero_keep_one_false (swapped operands). LINEAR-USE-FAIL. -/
theorem canSeq_keep_one_keep_zero_false :
    canSeq (keep : LinearStep 1 1) (keep : LinearStep 0 0) = false := rfl

/-- keep remaining k then keep remaining m does not sequence when k != m.
    Generalizes canSeq_keep_zero_keep_one_false and
    canSeq_keep_one_keep_zero_false. Matching remaining is
    canSeq_keep_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_neq_false {k m : Nat} (h : Not (k = m)) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false :=
  (canSeq_false_iff (keep : LinearStep k k) (keep : LinearStep m m)).mpr h

/-- keep remaining k then keep remaining m sequences iff k = m.
    Spec CanSeqKeepKeepTrueIff. LINEAR-USE-FAIL. Joins
    canSeq_keep_keep_true and canSeq_keep_keep_neq_false. -/
theorem canSeq_keep_keep_true_iff {k m : Nat} :
    CanSeqKeepKeepTrueIff k m :=
  canSeq_iff (keep : LinearStep k k) (keep : LinearStep m m)

/-- keep remaining k then keep remaining m does not sequence iff Not (k = m).
    Spec CanSeqKeepKeepFalseIff. LINEAR-USE-FAIL. Dual of
    canSeq_keep_keep_true_iff (false side). Joins
    canSeq_keep_keep_neq_false. Matching remaining is
    canSeq_keep_keep_true. -/
theorem canSeq_keep_keep_false_iff {k m : Nat} :
    CanSeqKeepKeepFalseIff k m :=
  canSeq_false_iff (keep : LinearStep k k) (keep : LinearStep m m)

/-- keep remaining k then keep remaining m sequences when k = m.
    Dual of canSeq_keep_keep_neq_false (true side). Joins
    canSeq_keep_keep_true for general k = m.
    Mismatch is canSeq_keep_keep_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_eq_true {k m : Nat} (h : k = m) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true :=
  (canSeq_keep_keep_true_iff).mpr h

/-- keep remaining k then keep remaining m sequences only if k = m.
    Dual of canSeq_keep_keep_eq_true (converse). Joins
    canSeq_keep_keep_true_iff mp. Mismatch is
    canSeq_keep_keep_neq_false. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_true_eq {k m : Nat}
    (h : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true) :
    k = m :=
  (canSeq_keep_keep_true_iff).mp h

/-- keep remaining k then keep remaining m does not sequence only if
    Not (k = m). Dual of canSeq_keep_keep_true_eq (false side). Dual
    of canSeq_keep_keep_neq_false (converse). Joins
    canSeq_keep_keep_false_iff mp. Matching remaining is
    canSeq_keep_keep_true. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_false_neq {k m : Nat}
    (h : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false) :
    Not (k = m) :=
  (canSeq_keep_keep_false_iff).mp h

/-- keep remaining k then keep remaining m sequences when swapped if it sequences.
    Dual of canSeq_keep_keep_true_eq (swap operands). Joins
    canSeq_keep_keep_eq_true with Eq.symm. Consume then keep
    is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_true_symm {k m : Nat}
    (h : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep m m) (keep : LinearStep k k) = true :=
  canSeq_keep_keep_eq_true (canSeq_keep_keep_true_eq h).symm

/-- keep remaining k then keep remaining m does not sequence when swapped
    if it does not sequence. Dual of canSeq_keep_keep_true_symm (false
    side). Joins canSeq_keep_keep_neq_false with Not of Eq.symm.
    Matching remaining is canSeq_keep_keep_true. Consume then keep
    is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_false_symm {k m : Nat}
    (h : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false) :
    canSeq (keep : LinearStep m m) (keep : LinearStep k k) = false :=
  canSeq_keep_keep_neq_false (mt Eq.symm (canSeq_keep_keep_false_neq h))

/-- keep remaining k then keep remaining m has the same canSeq as swapped
    operands (Bool). Dual of canSeq_keep_keep_true_symm and
    canSeq_keep_keep_false_symm (Bool equality). Joins both.
    Matching remaining is canSeq_keep_keep_true. Consume then keep
    is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_comm {k m : Nat} :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
    canSeq (keep : LinearStep m m) (keep : LinearStep k k) :=
  Bool.eq_iff_iff.mpr
    (Iff.intro canSeq_keep_keep_true_symm canSeq_keep_keep_true_symm)

/-- keep remaining k then keep remaining n sequences if keep k sequences
    with keep m and keep m sequences with keep n. Dual of
    canSeq_keep_keep_comm (transitivity). Joins
    canSeq_keep_keep_eq_true with Eq.trans. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_trans {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true)
    (hmn : canSeq (keep : LinearStep m m) (keep : LinearStep n n) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) = true :=
  canSeq_keep_keep_eq_true
    (Eq.trans (canSeq_keep_keep_true_eq hkm) (canSeq_keep_keep_true_eq hmn))

/-- keep remaining m then keep remaining n sequences if keep k sequences
    with keep m and keep k sequences with keep n. Dual of
    canSeq_keep_keep_trans (left cancel). Joins
    canSeq_keep_keep_eq_true with Eq.symm and Eq.trans. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_cancel {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true)
    (hkn : canSeq (keep : LinearStep k k) (keep : LinearStep n n) = true) :
    canSeq (keep : LinearStep m m) (keep : LinearStep n n) = true :=
  canSeq_keep_keep_eq_true
    (Eq.trans (Eq.symm (canSeq_keep_keep_true_eq hkm)) (canSeq_keep_keep_true_eq hkn))

/-- keep remaining k then keep remaining n sequences if keep k sequences
    with keep m and keep n sequences with keep m. Dual of
    canSeq_keep_keep_cancel (right cancel). Joins
    canSeq_keep_keep_cancel with canSeq_keep_keep_true_symm. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rcancel {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true)
    (hnm : canSeq (keep : LinearStep n n) (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) = true :=
  canSeq_keep_keep_cancel
    (canSeq_keep_keep_true_symm hkm) (canSeq_keep_keep_true_symm hnm)

/-- keep remaining k then keep remaining n does not sequence if keep k
    does not sequence with keep m and keep n sequences with keep m.
    Dual of canSeq_keep_keep_rcancel (false side). Joins
    canSeq_keep_keep_neq_false with Not of remaining equality.
    Matching remaining is canSeq_keep_keep_true. Consume then keep
    is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rcancel_false {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false)
    (hnm : canSeq (keep : LinearStep n n) (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) = false :=
  canSeq_keep_keep_neq_false
    (fun hkn =>
      canSeq_keep_keep_false_neq hkm
        (Eq.trans hkn (canSeq_keep_keep_true_eq hnm)))

/-- keep remaining m then keep remaining n does not sequence if keep k
    does not sequence with keep m and keep k sequences with keep n.
    Dual of canSeq_keep_keep_cancel (false side). Dual of
    canSeq_keep_keep_rcancel_false (left cancel). Joins
    canSeq_keep_keep_rcancel_false with canSeq_keep_keep_false_symm
    and canSeq_keep_keep_true_symm. Matching remaining is
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_cancel_false {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false)
    (hkn : canSeq (keep : LinearStep k k) (keep : LinearStep n n) = true) :
    canSeq (keep : LinearStep m m) (keep : LinearStep n n) = false :=
  canSeq_keep_keep_rcancel_false
    (canSeq_keep_keep_false_symm hkm) (canSeq_keep_keep_true_symm hkn)

/-- keep remaining k then keep remaining n does not sequence if keep k
    does not sequence with keep m and keep m sequences with keep n.
    Dual of canSeq_keep_keep_trans (false side). Dual of
    canSeq_keep_keep_cancel_false (transitivity). Joins
    canSeq_keep_keep_rcancel_false with canSeq_keep_keep_true_symm.
    Matching remaining is canSeq_keep_keep_true. Consume then keep
    is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_trans_false {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false)
    (hmn : canSeq (keep : LinearStep m m) (keep : LinearStep n n) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) = false :=
  canSeq_keep_keep_rcancel_false hkm (canSeq_keep_keep_true_symm hmn)

/-- keep remaining k then keep remaining n does not sequence if keep k
    sequences with keep m and keep m does not sequence with keep n.
    Dual of canSeq_keep_keep_trans_false (right false). Dual of
    canSeq_keep_keep_trans (false side, second hypothesis). Joins
    canSeq_keep_keep_trans_false with canSeq_keep_keep_false_symm
    and canSeq_keep_keep_true_symm. Matching remaining is
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rtrans_false {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true)
    (hmn : canSeq (keep : LinearStep m m) (keep : LinearStep n n) = false) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) = false :=
  canSeq_keep_keep_false_symm
    (canSeq_keep_keep_trans_false
      (canSeq_keep_keep_false_symm hmn)
      (canSeq_keep_keep_true_symm hkm))

/-- keep remaining k then keep remaining n has the same canSeq as keep m
    then keep n if keep k sequences with keep m (Bool). Dual of
    canSeq_keep_keep_rtrans_false (congruence). Joins
    canSeq_keep_keep_cancel and canSeq_keep_keep_trans. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_congr {k m n : Nat}
    (hkm : canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep n n) =
      canSeq (keep : LinearStep m m) (keep : LinearStep n n) :=
  Bool.eq_iff_iff.mpr
    (Iff.intro (canSeq_keep_keep_cancel hkm) (canSeq_keep_keep_trans hkm))

/-- keep remaining k then keep remaining m has the same canSeq as keep k
    then keep n if keep m sequences with keep n (Bool). Dual of
    canSeq_keep_keep_congr (right argument). Joins
    canSeq_keep_keep_trans and canSeq_keep_keep_rcancel. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rcongr {k m n : Nat}
    (hmn : canSeq (keep : LinearStep m m) (keep : LinearStep n n) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
      canSeq (keep : LinearStep k k) (keep : LinearStep n n) :=
  Bool.eq_iff_iff.mpr
    (Iff.intro
      (fun hkm => canSeq_keep_keep_trans hkm hmn)
      (fun hkn => canSeq_keep_keep_rcancel hkn hmn))

/-- keep remaining k then keep remaining m has the same canSeq as keep k'
    then keep m' if keep k sequences with keep k' and keep m sequences
    with keep m' (Bool). Dual of canSeq_keep_keep_congr and
    canSeq_keep_keep_rcongr (both arguments). Joins both. Matching remaining
    is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_congr2 {k k' m m' : Nat}
    (hkk : canSeq (keep : LinearStep k k) (keep : LinearStep k' k') = true)
    (hmm : canSeq (keep : LinearStep m m) (keep : LinearStep m' m') = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
      canSeq (keep : LinearStep k' k') (keep : LinearStep m' m') :=
  Eq.trans (canSeq_keep_keep_congr hkk) (canSeq_keep_keep_rcongr hmm)

/-- keep remaining k then keep remaining m has the same canSeq as keep k'
    then keep m' if keep k' sequences with keep k and keep m' sequences
    with keep m (Bool). Dual of canSeq_keep_keep_congr2 (right-handed:
    reverse remaining equalities). Joins canSeq_keep_keep_congr2 with
    canSeq_keep_keep_true_symm. Matching remaining is canSeq_keep_keep_true.
    Consume then keep is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rcongr2 {k k' m m' : Nat}
    (hkk : canSeq (keep : LinearStep k' k') (keep : LinearStep k k) = true)
    (hmm : canSeq (keep : LinearStep m' m') (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
      canSeq (keep : LinearStep k' k') (keep : LinearStep m' m') :=
  canSeq_keep_keep_congr2
    (canSeq_keep_keep_true_symm hkk) (canSeq_keep_keep_true_symm hmm)

/-- keep remaining k then keep remaining m has the same canSeq as keep k'
    then keep m' if keep k sequences with keep k' and keep m' sequences
    with keep m (Bool). Mixed dual of canSeq_keep_keep_congr2 (left-handed
    remaining equality) and canSeq_keep_keep_rcongr2 (right-handed remaining
    equality). Joins canSeq_keep_keep_congr2 with canSeq_keep_keep_true_symm
    on the right argument only. Matching remaining is canSeq_keep_keep_true.
    Consume then keep is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_lrcongr2 {k k' m m' : Nat}
    (hkk : canSeq (keep : LinearStep k k) (keep : LinearStep k' k') = true)
    (hmm : canSeq (keep : LinearStep m' m') (keep : LinearStep m m) = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
      canSeq (keep : LinearStep k' k') (keep : LinearStep m' m') :=
  canSeq_keep_keep_congr2 hkk (canSeq_keep_keep_true_symm hmm)

/-- keep remaining k then keep remaining m has the same canSeq as keep k'
    then keep m' if keep k' sequences with keep k and keep m sequences
    with keep m' (Bool). Mixed dual of canSeq_keep_keep_rcongr2 (left-handed
    remaining equality) and canSeq_keep_keep_congr2 (right-handed remaining
    equality). Joins canSeq_keep_keep_congr2 with canSeq_keep_keep_true_symm
    on the left argument only. Matching remaining is canSeq_keep_keep_true.
    Consume then keep is not symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_rlcongr2 {k k' m m' : Nat}
    (hkk : canSeq (keep : LinearStep k' k') (keep : LinearStep k k) = true)
    (hmm : canSeq (keep : LinearStep m m) (keep : LinearStep m' m') = true) :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) =
      canSeq (keep : LinearStep k' k') (keep : LinearStep m' m') :=
  canSeq_keep_keep_congr2 (canSeq_keep_keep_true_symm hkk) hmm

/-- keep remaining k then keep remaining m has canSeq equal to decide (k = m).
    Dual of the mixed-congr family (those substitute remaining equality
    through canSeq; this names canSeq keep keep as remaining equality
    itself). Joins canSeq_keep_keep_true_iff with decide_eq_true_iff.
    Matching remaining is canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. LINEAR-USE-FAIL. -/
theorem canSeq_keep_keep_decide {k m : Nat} :
    canSeq (keep : LinearStep k k) (keep : LinearStep m m) = decide (k = m) :=
  Bool.eq_iff_iff.mpr
    (Iff.trans canSeq_keep_keep_true_iff (Iff.symm decide_eq_true_iff))

end SystemsLean.LinearUseFail
