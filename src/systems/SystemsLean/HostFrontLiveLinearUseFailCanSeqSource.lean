/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearUseFail/CanSeq.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFailCanSeqSource. Not occupancy name 50. Not mill 70.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailCanSeqSource
  PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-CAN-SEQ
  Greppable: SYSTEMS_LEAN_HOST, liveLinearUseFailCanSeqSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearUseFailCanSeqSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearUseFailCanSeq

/-- Dual-pinned live LinearUseFail/CanSeq.lean bytes (must match on-disk file).
    Greppable: liveLinearUseFailCanSeqSource, PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ. -/
def liveLinearUseFailCanSeqSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL canSeq iff (same namespace).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role helper: Bool canSeq vs Prop CanSeq. Keep/keep algebra lives in
  SystemsLean.LinearUseFail.Keep. Consume/keep duals live in
  SystemsLean.LinearUseFail.Consume. Consume/consume decide facts live
  in SystemsLean.LinearUseFail.Decide. Bind and
  canSeq_consume_consume_false stay in LinearUseFailTheorems.

  Spec (readable; proofs follow):
  - canSeq_iff: CanSeqIff (Bool canSeq is true iff Prop CanSeq).
  - canSeq_false_iff: CanSeqFalseIff (Bool canSeq is false iff
    not Prop CanSeq). Dual of canSeq_iff.
  - canSeq_decide / canSeq_decide_eq: Bool canSeq is decide of
    remaining-index equality (and Eq.symm).
  - canSeq_true_eq / canSeq_eq_true: mp and mpr of canSeq_iff.
  - canSeq_false_neq / canSeq_neq_false: mp and mpr of
    canSeq_false_iff.

  These theorems do NOT set SpecProof.proofCompleteClaimed true.
  Indexed MULT-1 fail-to-check != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Not all-types use-check.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, SystemsLean.LinearUseFail,
  theorem canSeq_iff, theorem canSeq_false_iff,
  theorem canSeq_decide, theorem canSeq_decide_eq,
  theorem canSeq_true_eq, theorem canSeq_eq_true,
  theorem canSeq_false_neq, theorem canSeq_neq_false,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail.CanSeq
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail

namespace SystemsLean.LinearUseFail

/-- Bool canSeq is true iff Prop CanSeq. Spec CanSeqIff.
    LINEAR-USE-FAIL. consume/consume stays false. Not map. -/
theorem canSeq_iff {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) :
    CanSeqIff s1 s2 :=
  decide_eq_true_iff

/-- Bool canSeq is false iff not Prop CanSeq. Spec CanSeqFalseIff.
    LINEAR-USE-FAIL. Dual of canSeq_iff. consume/consume stays
    false. Not map. -/
theorem canSeq_false_iff {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) :
    CanSeqFalseIff s1 s2 :=
  decide_eq_false_iff_not

/-- Bool canSeq is decide of remaining-index equality.
    Dual of canSeq_keep_keep_decide for a general step pair.
    Joins the definition of canSeq. consume/consume stays
    canSeq_consume_consume_false. LINEAR-USE-FAIL. -/
theorem canSeq_decide {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) :
    canSeq s1 s2 = decide (mid = mid') :=
  rfl

/-- Remaining equality decide equals Bool canSeq (swapped).
    Dual of canSeq_decide (Eq.symm). Dual of
    canSeq_consume_consume_decide_eq for a general step pair.
    LINEAR-USE-FAIL. -/
theorem canSeq_decide_eq {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) :
    decide (mid = mid') = canSeq s1 s2 :=
  Eq.symm (canSeq_decide s1 s2)

/-- Bool canSeq is true only if Prop CanSeq.
    Dual of canSeq_iff (mp). Dual of canSeq_keep_keep_true_eq
    for a general step pair. LINEAR-USE-FAIL. -/
theorem canSeq_true_eq {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post)
    (h : canSeq s1 s2 = true) :
    CanSeq s1 s2 :=
  (canSeq_iff s1 s2).mp h

/-- Prop CanSeq implies Bool canSeq is true.
    Dual of canSeq_true_eq (converse). Dual of
    canSeq_keep_keep_eq_true for a general step pair.
    LINEAR-USE-FAIL. -/
theorem canSeq_eq_true {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post)
    (h : CanSeq s1 s2) :
    canSeq s1 s2 = true :=
  (canSeq_iff s1 s2).mpr h

/-- Bool canSeq is false only if not Prop CanSeq.
    Dual of canSeq_false_iff (mp). Dual of
    canSeq_keep_keep_false_neq for a general step pair.
    LINEAR-USE-FAIL. -/
theorem canSeq_false_neq {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post)
    (h : canSeq s1 s2 = false) :
    Not (CanSeq s1 s2) :=
  (canSeq_false_iff s1 s2).mp h

/-- Not Prop CanSeq implies Bool canSeq is false.
    Dual of canSeq_false_neq (converse). Dual of
    canSeq_keep_keep_neq_false for a general step pair.
    LINEAR-USE-FAIL. -/
theorem canSeq_neq_false {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post)
    (h : Not (CanSeq s1 s2)) :
    canSeq s1 s2 = false :=
  (canSeq_false_iff s1 s2).mpr h

end SystemsLean.LinearUseFail
"#

end SystemsLean.HostFrontLiveLinearUseFailCanSeq
