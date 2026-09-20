/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL theorems (same namespace).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.LinearUseFail: theorems live here;
  OnceRes, mint, consume, canSeq, CanSeq, IllegalSeq, bind, keep,
  BindLeftUnit, BindRightUnit, BindAssoc, ConsumeThenKeepEq,
  KeepThenConsumeEq, ConsumeKeepCommute, BindCongr, CanSeqIff,
  CanSeqFalseIff, CanSeqKeepKeepTrueIff, CanSeqKeepKeepFalseIff,
  CanSeqConsumeKeepTrueIff,
  CanSeqKeepConsumeTrueIff, CanSeqKeepConsumeFalseIff,
  CanSeqConsumeKeepFalseIff, onceUse stay in LinearUseFail.
  Later canSeq iff lives in SystemsLean.LinearUseFail.CanSeq;
  keep/keep algebra in SystemsLean.LinearUseFail.Keep;
  consume/keep duals in SystemsLean.LinearUseFail.Consume;
  consume/consume decide facts in SystemsLean.LinearUseFail.Decide.
  This file imports those role helpers. Bind, onceUse, illegalSeq,
  canSeq_consume_consume_false, and illegalLinearUseFailReady_true
  stay here.

  Spec (readable; proofs follow):
  - onceUse_ok: mint then consume once returns the payload.
  - canSeq_consume_consume_false: two consume steps do not sequence
    (first post remaining 0 != second pre remaining 1).
  - bind_consume_keep_ok: legal bind consume keep returns the payload.
  - illegalSeq_uninh: IllegalSeq (CanSeq consume consume) is uninhabited.
  - bind_left_unit: BindLeftUnit s (keep is a left identity for bind).
  - bind_right_unit: BindRightUnit s (keep is a right identity for
    bind on remaining snd; bind discards the first Nat).
  - bind_assoc: BindAssoc s1 s2 s3 (bind is associative on run;
    full Prod equality; not a full Kleisli monad).
  - bind_consume_keep_eq_consume: ConsumeThenKeepEq (consume then
    keep is consume; full Prod). Keep-keep is BindLeftUnit keep.
  - bind_keep_consume_eq_consume: KeepThenConsumeEq (keep then
    consume is consume; full Prod). Dual of ConsumeThenKeepEq;
    BindLeftUnit already covers a general left keep.
  - bind_consume_keep_commute: ConsumeKeepCommute (consume then
    keep has the same run as keep then consume; both equal
    consume.run). Consume/keep only.
  - bind_congr: BindCongr (run-equal steps bind to run-equal
    steps; full Prod on the composite). BindRightUnit stays
    snd-only. Not a full Kleisli monad.
  - Later canSeq iff: SystemsLean.LinearUseFail.CanSeq.
  - Later keep/keep algebra: SystemsLean.LinearUseFail.Keep.
  - Later consume/keep duals: SystemsLean.LinearUseFail.Consume.
  - Later consume/consume decide: SystemsLean.LinearUseFail.Decide.
  - illegalLinearUseFailReady_true: dialect ready pin is true.

  These theorems do NOT set SpecProof.proofCompleteClaimed true.
  Indexed MULT-1 fail-to-check != host proof complete != residual free.
  Not UseCheck log classification. Not Linear.Token axioms.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Not all-types use-check.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, SystemsLean.LinearUseFail,
  theorem onceUse_ok, theorem canSeq_consume_consume_false,
  theorem bind_consume_keep_ok, theorem illegalSeq_uninh,
  theorem bind_left_unit, theorem bind_right_unit,
  theorem bind_assoc, theorem bind_consume_keep_eq_consume,
  theorem bind_keep_consume_eq_consume,
  theorem bind_consume_keep_commute,
  theorem bind_congr,
  theorem illegalLinearUseFailReady_true,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFailTheorems
  Red/green: just systems-host.
  Named lake prove of LinearUseFailTheorems is Status
  wontfix-this-slice because SSH to nixbuilder@surmount-1 is down.
  Host-presence GREEN is not lake GREEN. Gate remains just
  systems-host. FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.LinearUseFail
import SystemsLean.LinearUseFail.CanSeq
import SystemsLean.LinearUseFail.Keep
import SystemsLean.LinearUseFail.Consume
import SystemsLean.LinearUseFail.Decide

namespace SystemsLean.LinearUseFail

/-- Legal mint-then-consume-once returns the payload. LINEAR-USE-FAIL. -/
theorem onceUse_ok (n : Nat) : (onceUse n).fst = n := rfl

/-- Two consume steps cannot sequence: post 0 != pre 1. ILLEGAL-LINEAR-USE-FAIL. -/
theorem canSeq_consume_consume_false :
    canSeq consume consume = false := rfl

/-- Legal bind consume then keep remaining 0 returns the payload. -/
theorem bind_consume_keep_ok (n : Nat) :
    ((bind consume keep).run (mint n)).fst = n := rfl

/-- IllegalSeq is uninhabited: consume then consume needs 0 = 1. -/
theorem illegalSeq_uninh (h : IllegalSeq) : False :=
  Nat.noConfusion h

/-- keep then s is the same step as s. Spec BindLeftUnit. LINEAR-USE-FAIL. -/
theorem bind_left_unit {pre post : Nat} (s : LinearStep pre post) :
    BindLeftUnit s :=
  fun _r => rfl

/-- s then keep leaves remaining unchanged. Spec BindRightUnit. LINEAR-USE-FAIL. -/
theorem bind_right_unit {pre post : Nat} (s : LinearStep pre post) :
    BindRightUnit s :=
  fun _r => rfl

/-- bind (bind s1 s2) s3 has the same run as bind s1 (bind s2 s3).
    Spec BindAssoc. LINEAR-USE-FAIL. Not a full Kleisli monad. -/
theorem bind_assoc {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid)
    (s2 : LinearStep mid mid')
    (s3 : LinearStep mid' post) :
    BindAssoc s1 s2 s3 :=
  fun _r => rfl

/-- consume then keep is the same run as consume. Full Prod.
    Spec ConsumeThenKeepEq. LINEAR-USE-FAIL. BindRightUnit stays
    snd-only for a general step. Keep-keep is BindLeftUnit keep. -/
theorem bind_consume_keep_eq_consume : ConsumeThenKeepEq :=
  fun _r => rfl

/-- keep then consume is the same run as consume. Full Prod.
    Spec KeepThenConsumeEq. LINEAR-USE-FAIL. Dual of
    ConsumeThenKeepEq. BindLeftUnit already covers a general
    left keep. -/
theorem bind_keep_consume_eq_consume : KeepThenConsumeEq :=
  fun _r => rfl

/-- consume then keep has the same run as keep then consume.
    Spec ConsumeKeepCommute. LINEAR-USE-FAIL. Both equal
    consume.run. Consume/keep only. General-step run
    congruence is bind_congr. -/
theorem bind_consume_keep_commute : ConsumeKeepCommute :=
  fun r =>
    Eq.trans (bind_consume_keep_eq_consume r)
      (Eq.symm (bind_keep_consume_eq_consume r))

/-- Run-equal steps bind to run-equal steps. Spec BindCongr.
    LINEAR-USE-FAIL. Full Prod on the composite. BindRightUnit
    stays snd-only for a general step. Not a full Kleisli monad. -/
theorem bind_congr {pre mid post : Nat}
    (s1 s1' : LinearStep pre mid)
    (s2 s2' : LinearStep mid post) :
    BindCongr s1 s1' s2 s2' :=
  fun h1 h2 r =>
    Eq.trans (h2 (s1.run r).snd)
      (congrArg (fun p => s2'.run p.snd) (h1 r))

-- Later canSeq iff: SystemsLean.LinearUseFail.CanSeq.
-- Later keep/keep: SystemsLean.LinearUseFail.Keep.
-- Later consume/keep: SystemsLean.LinearUseFail.Consume.
-- Later consume/consume decide: SystemsLean.LinearUseFail.Decide.

/-- Dialect ready pin is true (legal once plus illegal seq rejected). -/
theorem illegalLinearUseFailReady_true :
    illegalLinearUseFailReady = true := rfl

end SystemsLean.LinearUseFail
