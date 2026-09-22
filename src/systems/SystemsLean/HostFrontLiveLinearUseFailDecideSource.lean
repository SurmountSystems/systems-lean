/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearUseFail/Decide.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFailDecideSource. Not occupancy name 50. Not mill 70.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailDecideSource
  PARSE-LIVE-LINEAR-USE-FAIL-DECIDE
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE
  Greppable: SYSTEMS_LEAN_HOST, liveLinearUseFailDecideSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearUseFailDecideSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearUseFailDecide

/-- Dual-pinned live LinearUseFail/Decide.lean bytes (must match on-disk file).
    Greppable: liveLinearUseFailDecideSource, PARSE-LIVE-LINEAR-USE-FAIL-DECIDE. -/
def liveLinearUseFailDecideSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL consume/consume canSeq
  decide facts (same namespace). Side: classic Lean elaborator under
  src/systems/ (not freestanding C). Role helper: consume then consume
  as decide (0 = 1). canSeq iff lives in SystemsLean.LinearUseFail.CanSeq.
  Keep/keep algebra lives in SystemsLean.LinearUseFail.Keep.
  Consume/keep duals live in SystemsLean.LinearUseFail.Consume.
  Bind and canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow): consume/consume decide, true/false
  iff, eq, neq, decide_comm, one_zero (1 = 0 duals, true/false iff,
  neq_false / eq_true, true_eq / false_neq, one_zero_comm, one_zero_true_symm,
  one_zero_false_symm, one_zero_trans, one_zero_trans_false,
  one_zero_rtrans, one_zero_rtrans_false, one_zero_comm_iff,
  one_zero_comm_false_iff, one_zero_comm_iff_symm,
  one_zero_comm_false_iff_symm, one_zero_comm_congr,
  one_zero_comm_congr_symm, one_zero_comm_congr_iff,
  one_zero_comm_congr_iff_symm, one_zero_comm_congr_not_iff,
  one_zero_comm_congr_not_iff_symm, one_zero_comm_congr_eq_not,
  one_zero_comm_congr_eq_not_symm, one_zero_comm_congr_not_eq,
  one_zero_comm_congr_not_eq_symm, one_zero_comm_congr_not_inj,
  one_zero_comm_congr_not_inj_symm, one_zero_comm_congr_not_not,
  one_zero_comm_congr_not_not_symm, one_zero_comm_congr_eq_not_not,
  one_zero_comm_congr_eq_not_not_symm, one_zero_comm_congr_not_not_eq,
  one_zero_comm_congr_not_not_eq_symm, one_zero_comm_congr_not_eq_not).
  consume/consume stays false.

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
  theorem canSeq_consume_consume_decide_comm,
  theorem canSeq_consume_consume_one_zero,
  theorem canSeq_consume_consume_one_zero_eq,
  theorem canSeq_consume_consume_one_zero_eq_false,
  theorem canSeq_consume_consume_one_zero_false_eq,
  theorem canSeq_consume_consume_one_zero_true_neq,
  theorem canSeq_consume_consume_one_zero_neq_true,
  theorem canSeq_consume_consume_one_zero_true_iff,
  theorem canSeq_consume_consume_one_zero_false_iff,
  theorem canSeq_consume_consume_one_zero_neq_false,
  theorem canSeq_consume_consume_one_zero_eq_true,
  theorem canSeq_consume_consume_one_zero_true_eq,
  theorem canSeq_consume_consume_one_zero_false_neq,
  theorem canSeq_consume_consume_one_zero_comm,
  theorem canSeq_consume_consume_one_zero_true_symm,
  theorem canSeq_consume_consume_one_zero_false_symm,
  theorem canSeq_consume_consume_one_zero_trans,
  theorem canSeq_consume_consume_one_zero_trans_false,
  theorem canSeq_consume_consume_one_zero_rtrans,
  theorem canSeq_consume_consume_one_zero_rtrans_false,
  theorem canSeq_consume_consume_one_zero_comm_iff,
  theorem canSeq_consume_consume_one_zero_comm_false_iff,
  theorem canSeq_consume_consume_one_zero_comm_iff_symm,
  theorem canSeq_consume_consume_one_zero_comm_false_iff_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr,
  theorem canSeq_consume_consume_one_zero_comm_congr_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_iff,
  theorem canSeq_consume_consume_one_zero_comm_congr_iff_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_iff,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_iff_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_eq_not,
  theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_inj,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_inj_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_not,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_not_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_not,
  theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_not_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_not_eq,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_not_eq_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not,
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

/-- consume then consume has decide (0 = 1) equal to decide (1 = 0).
    Dual of canSeq_consume_consume_decide (swapped remaining equality).
    Dual of canSeq_keep_keep_comm for consume then consume (Bool decide,
    not keep operands). Joins canSeq_consume_consume_decide_eq_false
    with decide (1 = 0) = false. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_decide_comm :
    decide (0 = 1) = decide (1 = 0) :=
  Eq.trans
    canSeq_consume_consume_decide_eq_false
    (Eq.symm
      ((decide_eq_false_iff_not :
          decide (1 = 0) = false <-> Not (1 = 0)).mpr
        (fun h => Nat.noConfusion h)))

/-- consume then consume has canSeq equal to decide (1 = 0).
    Dual of canSeq_consume_consume_decide (1 = 0 vs 0 = 1). Joins
    decide with decide_comm. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero :
    canSeq consume consume = decide (1 = 0) :=
  Eq.trans canSeq_consume_consume_decide canSeq_consume_consume_decide_comm

/-- consume then consume has decide (1 = 0) equal to canSeq (swapped).
    Dual of canSeq_consume_consume_one_zero (Eq.symm). Dual of
    canSeq_consume_consume_decide_eq for 1 = 0. Joins
    canSeq_consume_consume_one_zero. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_eq :
    decide (1 = 0) = canSeq consume consume :=
  Eq.symm canSeq_consume_consume_one_zero

/-- consume then consume has decide (1 = 0) equal to false.
    Dual of canSeq_consume_consume_decide_eq_false for 1 = 0. Joins
    one_zero_eq with consume/consume false. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_eq_false :
    decide (1 = 0) = false :=
  Eq.trans
    canSeq_consume_consume_one_zero_eq
    ((canSeq_consume_consume_false_iff).mpr (fun h => Nat.noConfusion h))

/-- consume then consume has false equal to decide (1 = 0) (swapped).
    Dual of canSeq_consume_consume_one_zero_eq_false (Eq.symm). Dual of
    canSeq_consume_consume_decide_false_eq for 1 = 0. Joins
    canSeq_consume_consume_one_zero_eq_false. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_false_eq :
    false = decide (1 = 0) :=
  Eq.symm canSeq_consume_consume_one_zero_eq_false

/-- consume then consume has decide (1 = 0) not equal to true (swapped).
    Dual of canSeq_consume_consume_one_zero_false_eq (Not (true = decide)
    vs false = decide). Dual of canSeq_consume_consume_decide_true_neq
    for 1 = 0. Joins canSeq_consume_consume_true_neq with
    canSeq_consume_consume_one_zero_eq. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_true_neq :
    Not (true = decide (1 = 0)) :=
  fun h =>
    canSeq_consume_consume_true_neq
      (Eq.trans h canSeq_consume_consume_one_zero_eq)

/-- consume then consume has decide (1 = 0) not equal to true (unswapped).
    Dual of canSeq_consume_consume_one_zero_true_neq (Not (decide = true)
    vs Not (true = decide)). Dual of canSeq_consume_consume_decide_neq_true
    for 1 = 0. Joins canSeq_consume_consume_neq_true with
    canSeq_consume_consume_one_zero. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_neq_true :
    Not (decide (1 = 0) = true) :=
  fun h =>
    canSeq_consume_consume_neq_true
      (Eq.trans canSeq_consume_consume_one_zero h)

/-- consume then consume has decide (1 = 0) equal to true iff 1 = 0.
    Dual of canSeq_consume_consume_one_zero_neq_true (Prop iff vs
    Not (decide = true)). Dual of canSeq_consume_consume_decide_true_iff
    for 1 = 0. Joins canSeq_consume_consume_one_zero_eq with
    canSeq_consume_consume_true_iff. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_true_iff :
    decide (1 = 0) = true <-> 1 = 0 :=
  Iff.trans
    (iff_of_eq (congrArg (fun b => b = true) canSeq_consume_consume_one_zero_eq))
    (Iff.trans canSeq_consume_consume_true_iff
      (Iff.intro (fun h => Eq.symm h) (fun h => Eq.symm h)))

/-- consume then consume has decide (1 = 0) equal to false iff Not (1 = 0).
    Dual of canSeq_consume_consume_one_zero_true_iff (false side). Dual of
    canSeq_consume_consume_decide_false_iff for 1 = 0. Joins
    canSeq_consume_consume_one_zero_eq with canSeq_consume_consume_false_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_false_iff :
    decide (1 = 0) = false <-> Not (1 = 0) :=
  Iff.trans
    (iff_of_eq (congrArg (fun b => b = false) canSeq_consume_consume_one_zero_eq))
    (Iff.trans canSeq_consume_consume_false_iff
      (Iff.intro
        (fun h heq => h (Eq.symm heq))
        (fun h heq => h (Eq.symm heq))))

/-- consume then consume has decide (1 = 0) equal to false when Not (1 = 0).
    Dual of canSeq_consume_consume_decide_neq_false for 1 = 0.
    Dual of canSeq_consume_consume_one_zero_false_iff (mpr). Joins
    canSeq_consume_consume_one_zero_false_iff mpr. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_neq_false (h : Not (1 = 0)) :
    decide (1 = 0) = false :=
  (canSeq_consume_consume_one_zero_false_iff).mpr h

/-- consume then consume has decide (1 = 0) equal to true when 1 = 0.
    Dual of canSeq_consume_consume_decide_eq_true for 1 = 0.
    Dual of canSeq_consume_consume_one_zero_neq_false (true side).
    Joins canSeq_consume_consume_one_zero_true_iff mpr. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_eq_true (h : 1 = 0) :
    decide (1 = 0) = true :=
  (canSeq_consume_consume_one_zero_true_iff).mpr h

/-- consume then consume has decide (1 = 0) equal to true only if 1 = 0.
    Dual of canSeq_consume_consume_one_zero_eq_true (converse). Dual of
    canSeq_consume_consume_decide_true_eq for 1 = 0. Joins
    canSeq_consume_consume_one_zero_true_iff mp. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_true_eq
    (h : decide (1 = 0) = true) :
    1 = 0 :=
  (canSeq_consume_consume_one_zero_true_iff).mp h

/-- consume then consume has decide (1 = 0) equal to false only if
    Not (1 = 0). Dual of canSeq_consume_consume_one_zero_true_eq (false
    side). Dual of canSeq_consume_consume_decide_false_neq for 1 = 0.
    Joins canSeq_consume_consume_one_zero_false_iff mp.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_false_neq
    (h : decide (1 = 0) = false) :
    Not (1 = 0) :=
  (canSeq_consume_consume_one_zero_false_iff).mp h

/-- consume then consume has decide (1 = 0) equal to decide (0 = 1).
    Dual of canSeq_consume_consume_decide_comm (Eq.symm). Joins
    decide (1 = 0) with decide (0 = 1). consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm :
    decide (1 = 0) = decide (0 = 1) :=
  Eq.symm canSeq_consume_consume_decide_comm

/-- consume then consume has decide (1 = 0) equal to true when 0 = 1
    (swapped remaining). Dual of canSeq_consume_consume_one_zero_eq_true
    with Eq.symm on the hypothesis (keep-style true_symm). Joins
    canSeq_consume_consume_one_zero_eq_true with Eq.symm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_true_symm (h : 0 = 1) :
    decide (1 = 0) = true :=
  canSeq_consume_consume_one_zero_eq_true (Eq.symm h)

/-- consume then consume has decide (1 = 0) equal to false when Not (0 = 1)
    (swapped remaining). Dual of canSeq_consume_consume_one_zero_true_symm
    (false side). Dual of canSeq_consume_consume_one_zero_neq_false with
    mt Eq.symm on the hypothesis (keep-style false_symm). Joins
    canSeq_consume_consume_one_zero_neq_false with mt Eq.symm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_false_symm (h : Not (0 = 1)) :
    decide (1 = 0) = false :=
  canSeq_consume_consume_one_zero_neq_false (mt Eq.symm h)

/-- consume then consume has decide (1 = 0) equal to true when
    decide (0 = 1) is true (transport along comm). Dual of keep-style
    trans for the 1 = 0 decide family (Bool). Joins
    canSeq_consume_consume_one_zero_comm with Eq.trans.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_trans
    (h : decide (0 = 1) = true) :
    decide (1 = 0) = true :=
  Eq.trans canSeq_consume_consume_one_zero_comm h

/-- consume then consume has decide (1 = 0) equal to false when
    decide (0 = 1) is false (transport along comm). Dual of
    canSeq_consume_consume_one_zero_trans (false side). Joins
    canSeq_consume_consume_one_zero_comm with Eq.trans.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_trans_false
    (h : decide (0 = 1) = false) :
    decide (1 = 0) = false :=
  Eq.trans canSeq_consume_consume_one_zero_comm h

/-- consume then consume has decide (0 = 1) equal to true when
    decide (1 = 0) is true (reverse transport along comm). Dual of
    canSeq_consume_consume_one_zero_trans (Eq.symm comm). Joins
    canSeq_consume_consume_one_zero_comm with Eq.trans Eq.symm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_rtrans
    (h : decide (1 = 0) = true) :
    decide (0 = 1) = true :=
  Eq.trans (Eq.symm canSeq_consume_consume_one_zero_comm) h

/-- consume then consume has decide (0 = 1) equal to false when
    decide (1 = 0) is false (reverse transport along comm). Dual of
    canSeq_consume_consume_one_zero_rtrans (false side). Dual of
    canSeq_consume_consume_one_zero_trans_false (Eq.symm comm).
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_rtrans_false
    (h : decide (1 = 0) = false) :
    decide (0 = 1) = false :=
  Eq.trans (Eq.symm canSeq_consume_consume_one_zero_comm) h

/-- consume then consume has decide (1 = 0) true iff decide (0 = 1)
    true (comm true sides). Dual of keep-style iff join of trans and
    rtrans (true sides). Joins canSeq_consume_consume_one_zero_rtrans
    and canSeq_consume_consume_one_zero_trans. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_iff :
    (decide (1 = 0) = true) <-> (decide (0 = 1) = true) :=
  Iff.intro canSeq_consume_consume_one_zero_rtrans
    canSeq_consume_consume_one_zero_trans

/-- consume then consume has decide (1 = 0) false iff decide (0 = 1)
    false (comm false sides). Dual of
    canSeq_consume_consume_one_zero_comm_iff (false sides). Dual of
    keep-style iff join of trans_false and rtrans_false. Joins
    canSeq_consume_consume_one_zero_rtrans_false and
    canSeq_consume_consume_one_zero_trans_false. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_false_iff :
    (decide (1 = 0) = false) <-> (decide (0 = 1) = false) :=
  Iff.intro canSeq_consume_consume_one_zero_rtrans_false
    canSeq_consume_consume_one_zero_trans_false

/-- consume then consume has decide (0 = 1) true iff decide (1 = 0)
    true (Iff.symm of comm true sides). Dual of
    canSeq_consume_consume_one_zero_comm_iff (Eq.symm / Iff.symm).
    Joins canSeq_consume_consume_one_zero_comm_iff. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_iff_symm :
    (decide (0 = 1) = true) <-> (decide (1 = 0) = true) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_iff

/-- consume then consume has decide (0 = 1) false iff decide (1 = 0)
    false (Iff.symm of comm false sides). Dual of
    canSeq_consume_consume_one_zero_comm_iff_symm (false sides). Dual of
    canSeq_consume_consume_one_zero_comm_false_iff (Iff.symm).
    Joins canSeq_consume_consume_one_zero_comm_false_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_false_iff_symm :
    (decide (0 = 1) = false) <-> (decide (1 = 0) = false) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_false_iff

/-- consume then consume has decide (1 = 0) equal to b when
    decide (0 = 1) equals b (transport along comm, any Bool). Dual of
    canSeq_consume_consume_one_zero_trans / trans_false generalized.
    Joins canSeq_consume_consume_one_zero_comm with Eq.trans.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr {b : Bool}
    (h : decide (0 = 1) = b) :
    decide (1 = 0) = b :=
  Eq.trans canSeq_consume_consume_one_zero_comm h

/-- consume then consume has decide (0 = 1) equal to b when
    decide (1 = 0) equals b (reverse transport along comm, any Bool). Dual of
    canSeq_consume_consume_one_zero_comm_congr (Eq.symm comm). Dual of
    canSeq_consume_consume_one_zero_rtrans / rtrans_false generalized.
    Joins canSeq_consume_consume_one_zero_comm with Eq.symm Eq.trans.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_symm {b : Bool}
    (h : decide (1 = 0) = b) :
    decide (0 = 1) = b :=
  Eq.trans (Eq.symm canSeq_consume_consume_one_zero_comm) h

/-- consume then consume has decide (1 = 0) equal to b iff
    decide (0 = 1) equals b (Bool equality both ways). Dual of
    keep-style iff join of congr and congr_symm. Joins
    canSeq_consume_consume_one_zero_comm_congr_symm and
    canSeq_consume_consume_one_zero_comm_congr. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_iff {b : Bool} :
    (decide (1 = 0) = b) <-> (decide (0 = 1) = b) :=
  Iff.intro canSeq_consume_consume_one_zero_comm_congr_symm
    canSeq_consume_consume_one_zero_comm_congr

/-- consume then consume has decide (0 = 1) equal to b iff
    decide (1 = 0) equals b (Iff.symm of Bool equality both ways). Dual of
    canSeq_consume_consume_one_zero_comm_congr_iff (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_iff_symm generalized to any Bool.
    Joins canSeq_consume_consume_one_zero_comm_congr_iff. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_iff_symm {b : Bool} :
    (decide (0 = 1) = b) <-> (decide (1 = 0) = b) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_iff

/-- consume then consume has Not (decide (1 = 0) = b) iff
    Not (decide (0 = 1) = b) (Bool inequality both ways). Dual of
    canSeq_consume_consume_one_zero_comm_congr_iff (Iff.not / mt).
    Joins canSeq_consume_consume_one_zero_comm_congr and
    canSeq_consume_consume_one_zero_comm_congr_symm. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_iff {b : Bool} :
    Not (decide (1 = 0) = b) <-> Not (decide (0 = 1) = b) :=
  Iff.intro
    (mt canSeq_consume_consume_one_zero_comm_congr)
    (mt canSeq_consume_consume_one_zero_comm_congr_symm)

/-- consume then consume has Not (decide (0 = 1) = b) iff
    Not (decide (1 = 0) = b) (Iff.symm of Bool inequality both ways). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_iff (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_iff_symm on the negated
    equalities. Joins canSeq_consume_consume_one_zero_comm_congr_not_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_iff_symm {b : Bool} :
    Not (decide (0 = 1) = b) <-> Not (decide (1 = 0) = b) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_iff

/-- consume then consume has decide (1 = 0) equal to not b iff
    Not (decide (0 = 1) = b) (Bool not-eq mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_iff (eq-not vs Not-eq).
    Joins Bool.eq_not with canSeq_consume_consume_one_zero_comm_congr_not_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_eq_not {b : Bool} :
    (decide (1 = 0) = (!b)) <-> Not (decide (0 = 1) = b) :=
  Iff.trans Bool.eq_not canSeq_consume_consume_one_zero_comm_congr_not_iff

/-- consume then consume has Not (decide (0 = 1) = b) iff
    decide (1 = 0) equals not b (Iff.symm of Bool eq-not mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_iff_symm on the eq-not
    mix. Joins canSeq_consume_consume_one_zero_comm_congr_eq_not.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_symm {b : Bool} :
    Not (decide (0 = 1) = b) <-> (decide (1 = 0) = (!b)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_eq_not

/-- consume then consume has not decide (1 = 0) equal to b iff
    Not (decide (0 = 1) = b) (Bool not-eq mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not (not-eq vs eq-not).
    Joins Bool.not_eq with canSeq_consume_consume_one_zero_comm_congr_not_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq {b : Bool} :
    ((! (decide (1 = 0))) = b) <-> Not (decide (0 = 1) = b) :=
  Iff.trans Bool.not_eq canSeq_consume_consume_one_zero_comm_congr_not_iff

/-- consume then consume has Not (decide (0 = 1) = b) iff
    not decide (1 = 0) equals b (Iff.symm of Bool not-eq mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not_symm on the not-eq mix.
    Joins canSeq_consume_consume_one_zero_comm_congr_not_eq.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_symm {b : Bool} :
    Not (decide (0 = 1) = b) <-> ((! (decide (1 = 0))) = b) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq

/-- consume then consume has not decide (1 = 0) equal to not b iff
    decide (0 = 1) equals b (Bool not-inj mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq (not-inj vs not-eq).
    Joins Bool.not_inj_iff with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_inj {b : Bool} :
    ((! (decide (1 = 0))) = (!b)) <-> (decide (0 = 1) = b) :=
  Iff.trans Bool.not_inj_iff canSeq_consume_consume_one_zero_comm_congr_iff

/-- consume then consume has decide (0 = 1) equal to b iff
    not decide (1 = 0) equals not b (Iff.symm of Bool not-inj mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_inj (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_symm on the not-inj mix.
    Joins canSeq_consume_consume_one_zero_comm_congr_not_inj.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_inj_symm {b : Bool} :
    (decide (0 = 1) = b) <-> ((! (decide (1 = 0))) = (!b)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_inj

/-- consume then consume has not-not decide (1 = 0) equal to b iff
    decide (0 = 1) equals b (Bool not-not mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_inj (not-not vs not-inj).
    Joins Bool.not_not with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_not {b : Bool} :
    ((! (! (decide (1 = 0)))) = b) <-> (decide (0 = 1) = b) :=
  Iff.trans (iff_of_eq (congrArg (fun x => x = b) (Bool.not_not (decide (1 = 0)))))
    canSeq_consume_consume_one_zero_comm_congr_iff

/-- consume then consume has decide (0 = 1) equal to b iff
    not-not decide (1 = 0) equals b (Iff.symm of Bool not-not mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_inj_symm on the not-not mix.
    Joins canSeq_consume_consume_one_zero_comm_congr_not_not.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_not_symm {b : Bool} :
    (decide (0 = 1) = b) <-> ((! (! (decide (1 = 0)))) = b) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_not

/-- consume then consume has decide (1 = 0) equal to not-not b iff
    decide (0 = 1) equals b (Bool not-not on the right-hand Bool mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not (not-not on b vs not-not on decide).
    Joins Bool.not_not with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_not {b : Bool} :
    (decide (1 = 0) = (! (! b))) <-> (decide (0 = 1) = b) :=
  Iff.trans (iff_of_eq (congrArg (fun x => decide (1 = 0) = x) (Bool.not_not b)))
    canSeq_consume_consume_one_zero_comm_congr_iff

/-- consume then consume has decide (0 = 1) equal to b iff
    decide (1 = 0) equals not-not b (Iff.symm of Bool not-not on the right-hand
    Bool mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not_not (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not_symm on the eq-not-not
    mix. Joins canSeq_consume_consume_one_zero_comm_congr_eq_not_not.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_eq_not_not_symm {b : Bool} :
    (decide (0 = 1) = b) <-> (decide (1 = 0) = (! (! b))) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_eq_not_not

/-- consume then consume has Not (not decide (1 = 0) equal to b) iff
    decide (0 = 1) equals b (Bool not-not-eq mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not_not (not-not-eq vs eq-not-not).
    Joins Bool.not_not_eq with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_not_eq {b : Bool} :
    Not ((! (decide (1 = 0))) = b) <-> (decide (0 = 1) = b) :=
  Iff.trans Bool.not_not_eq canSeq_consume_consume_one_zero_comm_congr_iff

/-- consume then consume has decide (0 = 1) equal to b iff
    Not (not decide (1 = 0) equal to b) (Iff.symm of Bool not-not-eq mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not_eq (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_eq_not_not_symm on the not-not-eq mix.
    Joins canSeq_consume_consume_one_zero_comm_congr_not_not_eq.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_not_eq_symm {b : Bool} :
    (decide (0 = 1) = b) <-> Not ((! (decide (1 = 0))) = b) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_not_eq

/-- consume then consume has Not (decide (1 = 0) equal to not b) iff
    decide (0 = 1) equals b (Bool not-eq-not mixed with comm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not_eq (not-eq-not vs not-not-eq).
    Joins Bool.not_eq_not with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not {b : Bool} :
    Not (decide (1 = 0) = (! b)) <-> (decide (0 = 1) = b) :=
  Iff.trans Bool.not_eq_not canSeq_consume_consume_one_zero_comm_congr_iff

end SystemsLean.LinearUseFail
"#

end SystemsLean.HostFrontLiveLinearUseFailDecide
