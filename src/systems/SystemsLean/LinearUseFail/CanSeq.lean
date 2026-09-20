/-
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

end SystemsLean.LinearUseFail
