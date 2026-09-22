/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearUseFail/NotEqNot.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFailNotEqNotSource. Not occupancy name 50. Not mill 70.
  Unique needles (trailing newline so LinearUseFail and Decide wraps are not a prefix):
  HostFrontLiveLinearUseFailNotEqNotSource
  PARSE-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT
  Greppable: SYSTEMS_LEAN_HOST, liveLinearUseFailNotEqNotSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearUseFailNotEqNotSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearUseFailNotEqNot

/-- Dual-pinned live LinearUseFail/NotEqNot.lean bytes (must match on-disk file).
    Greppable: liveLinearUseFailNotEqNotSource, PARSE-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT. -/
def liveLinearUseFailNotEqNotSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL consume/consume canSeq
  not-eq-not mix (same namespace). Side: classic Lean elaborator under
  src/systems/ (not freestanding C). Role helper: not-eq-not duals of
  the living mix in SystemsLean.LinearUseFail.Decide. canSeq iff lives
  in SystemsLean.LinearUseFail.CanSeq. Keep/keep algebra lives in
  SystemsLean.LinearUseFail.Keep. Consume/keep duals live in
  SystemsLean.LinearUseFail.Consume. Consume/consume decide facts live
  in SystemsLean.LinearUseFail.Decide. Bind and
  canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow): not_eq_not_symm, not_eq_not_comm,
  not_eq_not_comm_symm, not_eq_not_iff, not_eq_not_iff_symm, not_eq_not_true,
  not_eq_not_false, not_eq_not_true_symm, not_eq_not_false_symm,
  not_eq_not_comm_true, not_eq_not_comm_false, not_eq_not_comm_true_symm,
  not_eq_not_comm_false_symm, not_eq_not_iff_true, not_eq_not_iff_false,
  not_eq_not_iff_true_symm, not_eq_not_iff_false_symm, not_eq_not_eq,
  not_eq_not_eq_symm, not_eq_not_eq_comm, not_eq_not_eq_comm_symm,
  not_eq_not_eq_true, not_eq_not_eq_false, not_eq_not_eq_true_symm,
  not_eq_not_eq_false_symm, not_eq_not_eq_comm_true,
  not_eq_not_eq_comm_false, not_eq_not_eq_comm_true_symm,
  not_eq_not_eq_comm_false_symm, not_eq_not_eq_not, not_eq_not_eq_not_symm,
  not_eq_not_eq_comm_not, not_eq_not_eq_comm_not_symm, not_eq_not_eq_not_true,
  not_eq_not_eq_not_false, not_eq_not_eq_not_true_symm, not_eq_not_eq_not_false_symm,
  not_eq_not_eq_comm_not_true, not_eq_not_eq_comm_not_false,
  not_eq_not_eq_comm_not_true_symm, not_eq_not_eq_comm_not_false_symm,
  not_eq_not_eq_not_not, not_eq_not_eq_not_not_symm,
  not_eq_not_eq_comm_not_not, not_eq_not_eq_comm_not_not_symm,
  not_eq_not_eq_not_not_true, not_eq_not_eq_not_not_false,
  not_eq_not_eq_not_not_true_symm, not_eq_not_eq_not_not_false_symm,
  not_eq_not_eq_comm_not_not_true, not_eq_not_eq_comm_not_not_false,
  not_eq_not_eq_comm_not_not_true_symm, not_eq_not_eq_comm_not_not_false_symm,
  not_eq_not_eq_not_not_not.
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
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff_symm,
  theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_true,
  theorem not_eq_not_false, theorem not_eq_not_true_symm,
  theorem not_eq_not_false_symm, theorem not_eq_not_comm_true,
  theorem not_eq_not_comm_false, theorem not_eq_not_comm_true_symm,
  theorem not_eq_not_comm_false_symm, theorem not_eq_not_iff_true,
  theorem not_eq_not_iff_false, theorem not_eq_not_iff_true_symm,
  theorem not_eq_not_iff_false_symm, theorem not_eq_not_eq,
  theorem not_eq_not_eq_symm, theorem not_eq_not_eq_comm,
  theorem not_eq_not_eq_comm_symm, theorem not_eq_not_eq_true,
  theorem not_eq_not_eq_false, theorem not_eq_not_eq_true_symm,
  theorem not_eq_not_eq_false_symm, theorem not_eq_not_eq_comm_true,
  theorem not_eq_not_eq_comm_false, theorem not_eq_not_eq_comm_true_symm,
  theorem not_eq_not_eq_comm_false_symm, theorem not_eq_not_eq_not,
  theorem not_eq_not_eq_not_symm, theorem not_eq_not_eq_comm_not,
  theorem not_eq_not_eq_comm_not_symm, theorem not_eq_not_eq_not_true,
  theorem not_eq_not_eq_not_false, theorem not_eq_not_eq_not_true_symm,
  theorem not_eq_not_eq_not_false_symm, theorem not_eq_not_eq_comm_not_true,
  theorem not_eq_not_eq_comm_not_false, theorem not_eq_not_eq_comm_not_true_symm,
  theorem not_eq_not_eq_comm_not_false_symm, theorem not_eq_not_eq_not_not,
  theorem not_eq_not_eq_not_not_symm, theorem not_eq_not_eq_comm_not_not,
  theorem not_eq_not_eq_comm_not_not_symm, theorem not_eq_not_eq_not_not_true,
  theorem not_eq_not_eq_not_not_false, theorem not_eq_not_eq_not_not_true_symm,
  theorem not_eq_not_eq_not_not_false_symm, theorem not_eq_not_eq_comm_not_not_true,
  theorem not_eq_not_eq_comm_not_not_false, theorem not_eq_not_eq_comm_not_not_true_symm,
  theorem not_eq_not_eq_comm_not_not_false_symm, theorem not_eq_not_eq_not_not_not,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail.NotEqNot
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail
import SystemsLean.LinearUseFail.CanSeq
import SystemsLean.LinearUseFail.Decide

namespace SystemsLean.LinearUseFail

/-- consume then consume has decide (0 = 1) equal to b iff
    Not (decide (1 = 0) equal to not b). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_not_eq_symm on the not-eq-not mix.
    Joins canSeq_consume_consume_one_zero_comm_congr_not_eq_not.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_symm {b : Bool} :
    (decide (0 = 1) = b) <-> Not (decide (1 = 0) = (! b)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq_not

/-- consume then consume has Not (decide (0 = 1) equal to not b) iff
    decide (1 = 0) equals b (Bool not-eq-not mixed with comm the other way). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not (swap 0=1 / 1=0).
    Joins Bool.not_eq_not with canSeq_consume_consume_one_zero_comm_congr_iff_symm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm {b : Bool} :
    Not (decide (0 = 1) = (! b)) <-> (decide (1 = 0) = b) :=
  Iff.trans Bool.not_eq_not canSeq_consume_consume_one_zero_comm_congr_iff_symm

/-- consume then consume has decide (1 = 0) equal to b iff
    Not (decide (0 = 1) equal to not b). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm (Iff.symm). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not_symm on the comm mix.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm_symm {b : Bool} :
    (decide (1 = 0) = b) <-> Not (decide (0 = 1) = (! b)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm

/-- consume then consume has Not (decide (1 = 0) equal to not b) iff
    Not (decide (0 = 1) equal to not b). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_iff on the not-eq-not mix.
    Joins not_eq_not with comm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff {b : Bool} :
    Not (decide (1 = 0) = (! b)) <-> Not (decide (0 = 1) = (! b)) :=
  Iff.trans (Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq_not_symm)
    (Iff.trans canSeq_consume_consume_one_zero_comm_congr_iff_symm
      canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm_symm)

/-- consume then consume has Not (decide (0 = 1) equal to not b) iff
    Not (decide (1 = 0) equal to not b). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff (Iff.symm).
    Joins not_eq_not with comm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff_symm {b : Bool} :
    Not (decide (0 = 1) = (! b)) <-> Not (decide (1 = 0) = (! b)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff

/-- consume then consume has Not (decide (1 = 0) equal to not true) iff
    decide (0 = 1) equals true. Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not at b := true.
    Joins the living Decide mix at true. (! true) is defeq false.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_true :
    Not (decide (1 = 0) = (! true)) <-> (decide (0 = 1) = true) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not (b := true)

/-- consume then consume has Not (decide (1 = 0) equal to not false) iff
    decide (0 = 1) equals false. Dual of not_eq_not_true at b := false.
    Joins the living Decide mix at false. (! false) is defeq true.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_false :
    Not (decide (1 = 0) = (! false)) <-> (decide (0 = 1) = false) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not (b := false)

/-- consume then consume has decide (0 = 1) equal to true iff
    Not (decide (1 = 0) equal to not true). Dual of not_eq_not_true (Iff.symm).
    Joins the living Decide mix at true in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_true_symm :
    (decide (0 = 1) = true) <-> Not (decide (1 = 0) = (! true)) :=
  Iff.symm canSeq_consume_consume_one_zero_comm_congr_not_eq_not_true

/-- consume then consume has decide (0 = 1) equal to false iff
    Not (decide (1 = 0) equal to not false). Dual of not_eq_not_false (Iff.symm).
    Joins the living Decide mix at false in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_false_symm :
    (decide (0 = 1) = false) <-> Not (decide (1 = 0) = (! false)) :=
  Iff.symm not_eq_not_false

/-- consume then consume has Not (decide (0 = 1) equal to not true) iff
    decide (1 = 0) equals true. Dual of not_eq_not_comm at b := true.
    Joins the living comm mix at true. (! true) is defeq false.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_comm_true :
    Not (decide (0 = 1) = (! true)) <-> (decide (1 = 0) = true) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm (b := true)

/-- consume then consume has Not (decide (0 = 1) equal to not false) iff
    decide (1 = 0) equals false. Dual of not_eq_not_comm at b := false.
    Joins the living comm mix at false. (! false) is defeq true.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_comm_false :
    Not (decide (0 = 1) = (! false)) <-> (decide (1 = 0) = false) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm (b := false)

/-- consume then consume has decide (1 = 0) equal to true iff
    Not (decide (0 = 1) equal to not true). Dual of not_eq_not_comm_true (Iff.symm).
    Joins the living comm mix at true in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_comm_true_symm :
    (decide (1 = 0) = true) <-> Not (decide (0 = 1) = (! true)) :=
  Iff.symm not_eq_not_comm_true

/-- consume then consume has decide (1 = 0) equal to false iff
    Not (decide (0 = 1) equal to not false). Dual of not_eq_not_comm_false (Iff.symm).
    Joins the living comm mix at false in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_comm_false_symm :
    (decide (1 = 0) = false) <-> Not (decide (0 = 1) = (! false)) :=
  Iff.symm not_eq_not_comm_false

/-- consume then consume has Not (decide (1 = 0) equal to not true) iff
    Not (decide (0 = 1) equal to not true). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff at b := true.
    Joins the living not-eq-not iff mix at true. (! true) is defeq false.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_iff_true :
    Not (decide (1 = 0) = (! true)) <-> Not (decide (0 = 1) = (! true)) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff (b := true)

/-- consume then consume has Not (decide (1 = 0) equal to not false) iff
    Not (decide (0 = 1) equal to not false). Dual of
    canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff at b := false.
    Dual of not_eq_not_iff_true at false. Joins the living not-eq-not iff mix
    at false. (! false) is defeq true.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_iff_false :
    Not (decide (1 = 0) = (! false)) <-> Not (decide (0 = 1) = (! false)) :=
  canSeq_consume_consume_one_zero_comm_congr_not_eq_not_iff (b := false)

/-- consume then consume has Not (decide (0 = 1) equal to not true) iff
    Not (decide (1 = 0) equal to not true). Dual of not_eq_not_iff_true
    (Iff.symm). Joins the living not-eq-not iff mix at true in the other
    rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_iff_true_symm :
    Not (decide (0 = 1) = (! true)) <-> Not (decide (1 = 0) = (! true)) :=
  Iff.symm not_eq_not_iff_true

/-- consume then consume has Not (decide (0 = 1) equal to not false) iff
    Not (decide (1 = 0) equal to not false). Dual of not_eq_not_iff_false
    (Iff.symm). Joins the living not-eq-not iff mix at false in the other
    rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_iff_false_symm :
    Not (decide (0 = 1) = (! false)) <-> Not (decide (1 = 0) = (! false)) :=
  Iff.symm not_eq_not_iff_false

/-- consume then consume has Not (decide (1 = 0) equal to not b) iff
    decide (1 = 0) equals b (Bool not-eq-not on the same decide, mixed with comm).
    Dual of canSeq_consume_consume_one_zero_comm_congr_not_eq_not on the same-side eq.
    Joins the living Decide mix with canSeq_consume_consume_one_zero_comm_congr_iff.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq {b : Bool} :
    Not (decide (1 = 0) = (! b)) <-> (decide (1 = 0) = b) :=
  Iff.trans canSeq_consume_consume_one_zero_comm_congr_not_eq_not
    (Iff.symm canSeq_consume_consume_one_zero_comm_congr_iff)

/-- Dual of not_eq_not_eq (Iff.symm). Same-side not-eq-not on decide (1 = 0)
    in the other rewrite direction. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_symm {b : Bool} :
    (decide (1 = 0) = b) <-> Not (decide (1 = 0) = (! b)) :=
  Iff.symm not_eq_not_eq

/-- Dual of not_eq_not_eq on the 0=1 same-side. Joins the living comm mix
    with the living comm iff. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm {b : Bool} :
    Not (decide (0 = 1) = (! b)) <-> (decide (0 = 1) = b) :=
  Iff.trans canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm
    canSeq_consume_consume_one_zero_comm_congr_iff

/-- Dual of not_eq_not_eq_comm (Iff.symm). Same-side not-eq-not on decide (0 = 1)
    in the other rewrite direction. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_symm {b : Bool} :
    (decide (0 = 1) = b) <-> Not (decide (0 = 1) = (! b)) :=
  Iff.symm not_eq_not_eq_comm

/-- consume then consume has Not (decide (1 = 0) equal to not true) iff
    decide (1 = 0) equals true. Dual of not_eq_not_eq at b := true.
    Joins the living same-side mix at true. (! true) is defeq false.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_true :
    Not (decide (1 = 0) = (! true)) <-> (decide (1 = 0) = true) :=
  not_eq_not_eq (b := true)

/-- consume then consume has Not (decide (1 = 0) equal to not false) iff
    decide (1 = 0) equals false. Dual of living not_eq_not_eq at b := false.
    Dual of not_eq_not_eq_true at false. Joins the living same-side mix
    at false. (! false) is defeq true.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_false :
    Not (decide (1 = 0) = (! false)) <-> (decide (1 = 0) = false) :=
  not_eq_not_eq (b := false)

/-- consume then consume has decide (1 = 0) equal to true iff
    Not (decide (1 = 0) equal to not true). Dual of not_eq_not_eq_true (Iff.symm).
    Same-side not-eq-not on decide (1 = 0) at true in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_true_symm :
    (decide (1 = 0) = true) <-> Not (decide (1 = 0) = (! true)) :=
  Iff.symm not_eq_not_eq_true

/-- consume then consume has decide (1 = 0) equal to false iff
    Not (decide (1 = 0) equal to not false). Dual of not_eq_not_eq_false (Iff.symm).
    Same-side not-eq-not on decide (1 = 0) at false in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_false_symm :
    (decide (1 = 0) = false) <-> Not (decide (1 = 0) = (! false)) :=
  Iff.symm not_eq_not_eq_false

/-- consume then consume has Not (decide (0 = 1) equal to not true) iff
    decide (0 = 1) equals true. Dual of not_eq_not_eq_comm at b := true.
    Joins the living same-side mix at true. (! true) is defeq false.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_true :
    Not (decide (0 = 1) = (! true)) <-> (decide (0 = 1) = true) :=
  not_eq_not_eq_comm (b := true)

/-- consume then consume has Not (decide (0 = 1) equal to not false) iff
    decide (0 = 1) equals false. Dual of living not_eq_not_eq_comm at b := false.
    Dual of not_eq_not_eq_comm_true at false. Joins the living same-side mix
    at false. (! false) is defeq true.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_false :
    Not (decide (0 = 1) = (! false)) <-> (decide (0 = 1) = false) :=
  not_eq_not_eq_comm (b := false)

/-- consume then consume has decide (0 = 1) equal to true iff
    Not (decide (0 = 1) equal to not true). Dual of not_eq_not_eq_comm_true (Iff.symm).
    Same-side not-eq-not on decide (0 = 1) at true in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_true_symm :
    (decide (0 = 1) = true) <-> Not (decide (0 = 1) = (! true)) :=
  Iff.symm not_eq_not_eq_comm_true

/-- consume then consume has decide (0 = 1) equal to false iff
    Not (decide (0 = 1) equal to not false). Dual of not_eq_not_eq_comm_false (Iff.symm).
    Same-side not-eq-not on decide (0 = 1) at false in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_false_symm :
    (decide (0 = 1) = false) <-> Not (decide (0 = 1) = (! false)) :=
  Iff.symm not_eq_not_eq_comm_false

/-- consume then consume has Not (decide (1 = 0) equal to not (not b)) iff
    decide (1 = 0) equals not b. Dual of living not_eq_not_eq at b := ! b.
    Same-side not-eq-not on decide (1 = 0) at not b. (! (! b)) is not defeq b.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not {b : Bool} :
    Not (decide (1 = 0) = (! (! b))) <-> (decide (1 = 0) = (! b)) :=
  not_eq_not_eq (b := ! b)

/-- consume then consume has decide (1 = 0) equal to not b iff
    Not (decide (1 = 0) equal to not (not b)). Dual of not_eq_not_eq_not (Iff.symm).
    Same-side not-eq-not on decide (1 = 0) at not b in the other rewrite direction.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_symm {b : Bool} :
    (decide (1 = 0) = (! b)) <-> Not (decide (1 = 0) = (! (! b))) :=
  Iff.symm not_eq_not_eq_not

/-- consume then consume has Not (decide (0 = 1) equal to not (not b)) iff
    decide (0 = 1) equals not b. Dual of living not_eq_not_eq_comm at b := ! b.
    Dual of not_eq_not_eq_not on the 0=1 same-side. Same-side not-eq-not on
    decide (0 = 1) at not b. (! (! b)) is not defeq b.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not {b : Bool} :
    Not (decide (0 = 1) = (! (! b))) <-> (decide (0 = 1) = (! b)) :=
  not_eq_not_eq_comm (b := ! b)

/-- consume then consume has decide (0 = 1) equal to not b iff
    Not (decide (0 = 1) equal to not (not b)). Dual of not_eq_not_eq_comm_not (Iff.symm).
    Same-side not-eq-not on decide (0 = 1) at not b in the other rewrite direction.
    Dual of not_eq_not_eq_not_symm on the 0=1 same-side. Completes the not-b
    4-pack: not / not_symm / comm_not / comm_not_symm.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_symm {b : Bool} :
    (decide (0 = 1) = (! b)) <-> Not (decide (0 = 1) = (! (! b))) :=
  Iff.symm not_eq_not_eq_comm_not

/-- consume then consume has Not (decide (1 = 0) equal to not (not true)) iff
    decide (1 = 0) equals not true. Dual of living not_eq_not_eq_not at b := true.
    Joins the living same-side mix at not true. (! true) is defeq false;
    keep (! (! true)) in the type because (! (! b)) is not defeq b on the
    generic lemma. Starts the not-b true specialization.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_true :
    Not (decide (1 = 0) = (! (! true))) <-> (decide (1 = 0) = (! true)) :=
  not_eq_not_eq_not (b := true)

/-- consume then consume has Not (decide (1 = 0) equal to not (not false)) iff
    decide (1 = 0) equals not false. Dual of living not_eq_not_eq_not at b := false.
    Dual of not_eq_not_eq_not_true at false. Joins the living same-side mix
    at not false. (! false) is defeq true. Keep (! (! false)) in the type
    because (! (! b)) is not defeq b on the generic lemma. Completes the
    not-b true/false pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_false :
    Not (decide (1 = 0) = (! (! false))) <-> (decide (1 = 0) = (! false)) :=
  not_eq_not_eq_not (b := false)

/-- consume then consume has decide (1 = 0) equal to not true iff
    Not (decide (1 = 0) equal to not (not true)). Dual of not_eq_not_eq_not_true
    (Iff.symm). Same-side not-eq-not on decide (1 = 0) at not true in the other
    rewrite direction. Starts the not-b true/false symm pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_true_symm :
    (decide (1 = 0) = (! true)) <-> Not (decide (1 = 0) = (! (! true))) :=
  Iff.symm not_eq_not_eq_not_true

/-- consume then consume has decide (1 = 0) equal to not false iff
    Not (decide (1 = 0) equal to not (not false)). Dual of not_eq_not_eq_not_false
    (Iff.symm). Same-side not-eq-not on decide (1 = 0) at not false in the other
    rewrite direction. Completes the not-b true/false symm pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_false_symm :
    (decide (1 = 0) = (! false)) <-> Not (decide (1 = 0) = (! (! false))) :=
  Iff.symm not_eq_not_eq_not_false

/-- consume then consume has Not (decide (0 = 1) equal to not (not true)) iff
    decide (0 = 1) equals not true. Dual of living not_eq_not_eq_comm_not at b := true.
    Dual of not_eq_not_eq_not_true on the 0=1 same-side. Joins the living same-side
    mix at not true. (! true) is defeq false; keep (! (! true)) in the type because
    (! (! b)) is not defeq b on the generic lemma. Starts the comm-not-b true
    specialization.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_true :
    Not (decide (0 = 1) = (! (! true))) <-> (decide (0 = 1) = (! true)) :=
  not_eq_not_eq_comm_not (b := true)

/-- consume then consume has Not (decide (0 = 1) equal to not (not false)) iff
    decide (0 = 1) equals not false. Dual of living not_eq_not_eq_comm_not at b := false.
    Dual of not_eq_not_eq_not_false on the 0=1 same-side. Dual of
    not_eq_not_eq_comm_not_true at false. Joins the living same-side mix
    at not false. (! false) is defeq true. Keep (! (! false)) in the type
    because (! (! b)) is not defeq b on the generic lemma. Completes the
    comm-not-b true/false pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_false :
    Not (decide (0 = 1) = (! (! false))) <-> (decide (0 = 1) = (! false)) :=
  not_eq_not_eq_comm_not (b := false)

/-- consume then consume has decide (0 = 1) equal to not true iff
    Not (decide (0 = 1) equal to not (not true)). Dual of not_eq_not_eq_comm_not_true
    (Iff.symm). Same-side not-eq-not on decide (0 = 1) at not true in the other
    rewrite direction. Dual of not_eq_not_eq_not_true_symm on the 0=1 same-side.
    Starts the comm-not-b true/false symm pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_true_symm :
    (decide (0 = 1) = (! true)) <-> Not (decide (0 = 1) = (! (! true))) :=
  Iff.symm not_eq_not_eq_comm_not_true

/-- consume then consume has decide (0 = 1) equal to not false iff
    Not (decide (0 = 1) equal to not (not false)). Dual of not_eq_not_eq_comm_not_false
    (Iff.symm). Same-side not-eq-not on decide (0 = 1) at not false in the other
    rewrite direction. Dual of not_eq_not_eq_not_false_symm on the 0=1 same-side.
    Completes the comm-not-b true/false symm pair.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_false_symm :
    (decide (0 = 1) = (! false)) <-> Not (decide (0 = 1) = (! (! false))) :=
  Iff.symm not_eq_not_eq_comm_not_false

/-- consume then consume has Not (decide (1 = 0) equal to not (not (not b))) iff
    decide (1 = 0) equals not (not b). Dual of living not_eq_not_eq_not at b := ! b.
    Same-side not-eq-not on decide (1 = 0) at not (not b). (! (! (! b))) is not
    defeq (! b). Keep the stacked nots in the type because they are not defeq
    on the generic lemma. Starts the not-not-b generic.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not {b : Bool} :
    Not (decide (1 = 0) = (! (! (! b)))) <-> (decide (1 = 0) = (! (! b))) :=
  not_eq_not_eq_not (b := ! b)

/-- consume then consume has decide (1 = 0) equal to not (not b) iff
    Not (decide (1 = 0) equal to not (not (not b))). Dual of living
    not_eq_not_eq_not_not (Iff.symm). Same-side not-eq-not on decide (1 = 0)
    at not (not b) in the other rewrite direction. Completes the not-not-b
    generic pair. Keep the stacked nots in the type because they are not
    defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_symm {b : Bool} :
    (decide (1 = 0) = (! (! b))) <-> Not (decide (1 = 0) = (! (! (! b)))) :=
  Iff.symm not_eq_not_eq_not_not

/-- consume then consume has Not (decide (0 = 1) equal to not (not (not b))) iff
    decide (0 = 1) equals not (not b). Dual of living not_eq_not_eq_comm_not at
    b := ! b. Dual of not_eq_not_eq_not_not on the 0=1 same-side. Same-side
    not-eq-not on decide (0 = 1) at not (not b). Keep the stacked nots in the
    type because they are not defeq on the generic lemma. Starts the comm
    not-not-b generic.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not {b : Bool} :
    Not (decide (0 = 1) = (! (! (! b)))) <-> (decide (0 = 1) = (! (! b))) :=
  not_eq_not_eq_comm_not (b := ! b)

/-- consume then consume has decide (0 = 1) equal to not (not b) iff
    Not (decide (0 = 1) equal to not (not (not b))). Dual of living
    not_eq_not_eq_comm_not_not (Iff.symm). Same-side not-eq-not on decide (0 = 1)
    at not (not b) in the other rewrite direction. Dual of
    not_eq_not_eq_not_not_symm on the 0=1 same-side. Completes the comm
    not-not-b generic pair. Keep the stacked nots in the type because they
    are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not_symm {b : Bool} :
    (decide (0 = 1) = (! (! b))) <-> Not (decide (0 = 1) = (! (! (! b)))) :=
  Iff.symm not_eq_not_eq_comm_not_not

/-- consume then consume has Not (decide (1 = 0) equal to not (not (not true)))
    iff decide (1 = 0) equals not (not true). Dual of living
    not_eq_not_eq_not_not at b := true. Same-side not-eq-not on decide (1 = 0)
    at not (not true). Starts the not-not-b true/false specializations. Keep
    the stacked nots in the type because they are not defeq on the generic
    lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_true :
    Not (decide (1 = 0) = (! (! (! true)))) <-> (decide (1 = 0) = (! (! true))) :=
  not_eq_not_eq_not_not (b := true)

/-- consume then consume has Not (decide (1 = 0) equal to not (not (not false)))
    iff decide (1 = 0) equals not (not false). Dual of living
    not_eq_not_eq_not_not at b := false. Dual of not_eq_not_eq_not_not_true
    at false. Completes the not-not-b true/false pair. Keep the stacked nots
    in the type because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_false :
    Not (decide (1 = 0) = (! (! (! false)))) <-> (decide (1 = 0) = (! (! false))) :=
  not_eq_not_eq_not_not (b := false)

/-- consume then consume has decide (1 = 0) equal to not (not true) iff
    Not (decide (1 = 0) equal to not (not (not true))). Dual of
    not_eq_not_eq_not_not_true (Iff.symm). Same-side not-eq-not on decide
    (1 = 0) at not (not true) in the other rewrite direction. Starts the
    not-not-b true/false symm pair. Keep the stacked nots in the type
    because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_true_symm :
    (decide (1 = 0) = (! (! true))) <-> Not (decide (1 = 0) = (! (! (! true)))) :=
  Iff.symm not_eq_not_eq_not_not_true

/-- consume then consume has decide (1 = 0) equal to not (not false) iff
    Not (decide (1 = 0) equal to not (not (not false))). Dual of
    not_eq_not_eq_not_not_false (Iff.symm). Same-side not-eq-not on decide
    (1 = 0) at not (not false) in the other rewrite direction. Completes the
    not-not-b true/false symm pair. Keep the stacked nots in the type
    because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_false_symm :
    (decide (1 = 0) = (! (! false))) <-> Not (decide (1 = 0) = (! (! (! false)))) :=
  Iff.symm not_eq_not_eq_not_not_false

/-- consume then consume has Not (decide (0 = 1) equal to not (not (not true)))
    iff decide (0 = 1) equals not (not true). Dual of living
    not_eq_not_eq_comm_not_not at b := true. Dual of not_eq_not_eq_not_not_true
    on the 0=1 same-side. Same-side not-eq-not on decide (0 = 1) at not
    (not true). Starts the comm not-not-b true/false specializations. Keep
    the stacked nots in the type because they are not defeq on the generic
    lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not_true :
    Not (decide (0 = 1) = (! (! (! true)))) <-> (decide (0 = 1) = (! (! true))) :=
  not_eq_not_eq_comm_not_not (b := true)

/-- consume then consume has Not (decide (0 = 1) equal to not (not (not false)))
    iff decide (0 = 1) equals not (not false). Dual of living
    not_eq_not_eq_comm_not_not at b := false. Dual of not_eq_not_eq_comm_not_not_true
    at false. Completes the comm not-not-b true/false pair. Keep the stacked nots
    in the type because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not_false :
    Not (decide (0 = 1) = (! (! (! false)))) <-> (decide (0 = 1) = (! (! false))) :=
  not_eq_not_eq_comm_not_not (b := false)

/-- consume then consume has decide (0 = 1) equal to not (not true) iff
    Not (decide (0 = 1) equal to not (not (not true))). Dual of
    not_eq_not_eq_comm_not_not_true (Iff.symm). Same-side not-eq-not on decide
    (0 = 1) at not (not true) in the other rewrite direction. Starts the
    comm not-not-b true/false symm pair. Keep the stacked nots in the type
    because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not_true_symm :
    (decide (0 = 1) = (! (! true))) <-> Not (decide (0 = 1) = (! (! (! true)))) :=
  Iff.symm not_eq_not_eq_comm_not_not_true

/-- consume then consume has decide (0 = 1) equal to not (not false) iff
    Not (decide (0 = 1) equal to not (not (not false))). Dual of not_eq_not_eq_comm_not_not_false
    (Iff.symm). Same-side not-eq-not on decide (0 = 1) at not (not false) in the other
    rewrite direction. Dual of not_eq_not_eq_not_not_false_symm on the 0=1 same-side.
    Completes the comm not-not-b true/false symm pair. Keep the stacked nots in the type
    because they are not defeq on the generic lemma.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_comm_not_not_false_symm :
    (decide (0 = 1) = (! (! false))) <-> Not (decide (0 = 1) = (! (! (! false)))) :=
  Iff.symm not_eq_not_eq_comm_not_not_false

/-- consume then consume has Not (decide (1 = 0) equal to not (not (not (not b)))) iff
    decide (1 = 0) equals not (not (not b)). Dual of living not_eq_not_eq_not_not at b := ! b.
    Same-side not-eq-not on decide (1 = 0) at not (not (not b)). (! (! (! (! b)))) is not
    defeq (! (! b)). Keep the stacked nots in the type because they are not defeq
    on the generic lemma. Starts the not-not-not-b generic.
    consume/consume stays canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem not_eq_not_eq_not_not_not {b : Bool} :
    Not (decide (1 = 0) = (! (! (! (! b))))) <-> (decide (1 = 0) = (! (! (! b)))) :=
  not_eq_not_eq_not_not (b := ! b)

end SystemsLean.LinearUseFail
"#

end SystemsLean.HostFrontLiveLinearUseFailNotEqNot
