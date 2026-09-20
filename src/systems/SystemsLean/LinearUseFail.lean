/-
  SYSTEMS_LEAN_HOST partial -- LINEAR-USE-FAIL / ILLEGAL-LINEAR-USE-FAIL.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Indexed MULT-1 resource: using a linear (Quantitative Type Theory (QTT)
  grade 1) value twice FAILS TO CHECK. Not UseCheck usage-log fixtures.
  Not Linear.Token axioms. Not HostCompose live-flag.

  Spec (readable, separate from the theorems proof script):
  - OnceRes remaining is an indexed MULT-1 resource (remaining 1 live, 0 spent).
  - mint : Nat -> OnceRes 1 mints a live linear resource (grade tag Mult.mult1).
  - consume : LinearStep 1 0. Its run map is OnceRes 1 -> Prod Nat (OnceRes 0).
    consume.run on the spent result (OnceRes 0) is not well-typed. consume
    itself is a step, not a function of OnceRes 1.
  - LinearStep pre post is a monadic step from remaining pre to remaining post.
  - bind s1 s2 (indexed Kleisli compose) exists only when s1 post remaining
    equals s2 pre remaining. bind consume consume does not typecheck
    (post 0 != pre 1). keep is the no-op LinearStep k k for legal bind
    after spend (bind consume keep : LinearStep 1 0).
  - CanSeq s1 s2 is the Prop mid = mid'. IllegalSeq is CanSeq consume
    consume (0 = 1). Theorem illegalSeq_uninh: IllegalSeq -> False.
  - canSeq s1 s2 is true only when s1's post index equals s2's pre index.
    canSeq consume consume is false because post 0 != pre 1.
  - BindLeftUnit s: keep is a left identity for bind. Running
    bind keep s on a resource is running s on that resource.
    Theorem bind_left_unit: BindLeftUnit s. Legal consume.run stays
    inhabited (bind keep consume reduces to consume).
  - BindRightUnit s: keep is a right identity for bind on remaining.
    Running bind s keep leaves (s.run r).snd unchanged. Full Prod
    equality is not claimed: bind threads remaining (snd) and
    discards the first Nat. consume still matches on payload
    (bind_consume_keep_ok). Theorem bind_right_unit: BindRightUnit s.
  - BindAssoc s1 s2 s3: bind is associative on run. Running
    bind (bind s1 s2) s3 on a resource is running
    bind s1 (bind s2 s3) on that resource. Full Prod equality
    holds here because both associations end at s3.run of the
    remaining after s1 then s2. BindRightUnit stays snd-only.
    Not a full Kleisli monad (right unit is remaining-only).
    Theorem bind_assoc: BindAssoc s1 s2 s3.
  - ConsumeThenKeepEq: consume then keep is consume. Running
    bind consume keep on a live resource is running consume
    on that resource. Full Prod equality is honest here:
    consume copies payload into the spent remaining, so
    keep.run of that remaining matches consume.run on both
    fst and snd. BindRightUnit stays snd-only for a general
    step. bind_consume_keep_ok stays the payload (fst) smoke.
    Keep-keep identity is already BindLeftUnit keep; do not
    duplicate that lemma. Theorem bind_consume_keep_eq_consume.
  - KeepThenConsumeEq: keep then consume is consume. Running
    bind keep consume on a live resource is running consume
    on that resource. Full Prod equality is honest here:
    keep is a left identity for any step (BindLeftUnit), and
    this names the consume dual of ConsumeThenKeepEq. Do not
    duplicate BindLeftUnit keep. Theorem bind_keep_consume_eq_consume.
  - ConsumeKeepCommute: consume then keep has the same run as
    keep then consume. Both equal consume.run (ConsumeThenKeepEq
    and KeepThenConsumeEq). Full Prod. Keep-keep is
    BindLeftUnit keep. Theorem bind_consume_keep_commute.
  - BindCongr s1 s1' s2 s2': run-equal steps bind to run-equal
    steps. If s1.run equals s1'.run and s2.run equals s2'.run,
    then (bind s1 s2).run equals (bind s1' s2').run. Full Prod
    on the composite. BindRightUnit stays snd-only for a
    general step. ConsumeKeepCommute stays consume/keep only.
    Not a full Kleisli monad. Theorem bind_congr.
  - CanSeqIff s1 s2: Bool canSeq is true iff Prop CanSeq.
    canSeq is decide of remaining-index equality; CanSeq is
    that equality. consume/consume stays false
    (canSeq_consume_consume_false and illegalSeq_uninh).
    Not a sequencing combinator. Not map. Theorem canSeq_iff.
  - CanSeqFalseIff s1 s2: Bool canSeq is false iff not Prop CanSeq.
    Dual of CanSeqIff. consume/consume stays false
    (canSeq_consume_consume_false and illegalSeq_uninh).
    Not a sequencing combinator. Not map. Theorem canSeq_false_iff.
  - canSeq consume keep is true: consume post remaining 0 equals
    keep pre remaining 0. Dual of canSeq_consume_consume_false.
    Legal bind consume keep already inhabits (bind_consume_keep_ok).
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_true.
  - canSeq keep consume is true when keep is remaining 1: keep
    post remaining 1 equals consume pre remaining 1. Dual of
    canSeq_consume_keep_true. Legal bind keep consume already
    inhabits (bind_keep_consume_eq_consume). Not a sequencing
    combinator. Not map. Theorem canSeq_keep_consume_true.
  - canSeq keep keep is true: keep post remaining k equals keep
    pre remaining k. Dual of canSeq_consume_consume_false on
    matching remaining. Bind keep keep already inhabits
    (BindLeftUnit keep). Not a sequencing combinator. Not map.
    Theorem canSeq_keep_keep_true.
  - canSeq keep consume is false when keep is remaining 0: keep
    post remaining 0 does not equal consume pre remaining 1.
    Dual of canSeq_keep_consume_true (keep remaining 1). Same
    mismatch as canSeq_consume_consume_false (0 != 1). Not a
    sequencing combinator. Not map. Theorem
    canSeq_keep_zero_consume_false.
  - canSeq consume keep is false when keep is remaining 1: consume
    post remaining 0 does not equal keep pre remaining 1. Dual of
    canSeq_consume_keep_true (keep remaining 0). Same mismatch as
    canSeq_consume_consume_false (0 != 1). Not a sequencing
    combinator. Not map. Theorem canSeq_consume_keep_one_false.
  - canSeq keep remaining 0 then keep remaining 1 is false: keep
    post remaining 0 does not equal keep pre remaining 1. Dual of
    canSeq_keep_keep_true (matching remaining). Same mismatch as
    canSeq_consume_consume_false (0 != 1). Not a sequencing
    combinator. Not map. Theorem canSeq_keep_zero_keep_one_false.
  - canSeq keep remaining 1 then keep remaining 0 is false: keep
    post remaining 1 does not equal keep pre remaining 0. Dual of
    canSeq_keep_zero_keep_one_false (swapped operands). Same
    mismatch as canSeq_consume_consume_false (1 != 0). Not a
    sequencing combinator. Not map. Theorem
    canSeq_keep_one_keep_zero_false.
  - canSeq keep remaining k then keep remaining m is false when
    k != m. Generalizes canSeq_keep_zero_keep_one_false and
    canSeq_keep_one_keep_zero_false. Matching remaining stays
    canSeq_keep_keep_true. Not a sequencing combinator. Not map.
    Theorem canSeq_keep_keep_neq_false.
  - canSeq keep remaining k then keep remaining m is true if and
    only if k = m. Joins canSeq_keep_keep_true and
    canSeq_keep_keep_neq_false. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_keep_true_iff.
  - canSeq keep remaining k then keep remaining m is false if and
    only if k != m. Dual of canSeq_keep_keep_true_iff (false
    side). Joins canSeq_keep_keep_neq_false. Matching remaining
    stays canSeq_keep_keep_true. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_keep_false_iff.
  - canSeq consume then keep remaining k is true if and only if
    k = 0. Joins canSeq_consume_keep_true and
    canSeq_consume_keep_one_false (general k). Consume post
    remaining 0 equals keep pre remaining k iff k is spent.
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_true_iff.
  - canSeq keep remaining k then consume is true if and
    only if k = 1. Joins canSeq_keep_consume_true and
    canSeq_keep_zero_consume_false (general k). Keep post
    remaining k equals consume pre remaining 1 iff k is live.
    Dual of canSeq_consume_keep_true_iff (swap order).
    Not a sequencing combinator. Not map. Theorem
    canSeq_keep_consume_true_iff.
  - canSeq keep remaining k then consume is false if and
    only if k != 1. Dual of canSeq_keep_consume_true_iff
    (false side). Joins canSeq_keep_zero_consume_false for
    general k. Keep post remaining k equals consume pre
    remaining 1 iff k is live; the false side is Not (k = 1).
    Not a sequencing combinator. Not map. Theorem
    canSeq_keep_consume_false_iff.
  - canSeq consume then keep remaining k is false if and
    only if k != 0. Dual of canSeq_consume_keep_true_iff
    (false side). Dual of canSeq_keep_consume_false_iff
    (swap order). Joins canSeq_consume_keep_one_false for
    general k. Consume post remaining 0 equals keep pre
    remaining k iff k is spent; the false side is Not (k = 0).
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_false_iff.
  - canSeq consume then keep remaining k is false when k != 0.
    Dual of canSeq_keep_keep_neq_false for consume then keep.
    Joins canSeq_consume_keep_one_false for general k != 0.
    Matching remaining 0 stays canSeq_consume_keep_true.
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_neq_false.
  - canSeq keep remaining k then consume is false when k != 1.
    Dual of canSeq_consume_keep_neq_false (swap order). Dual of
    canSeq_keep_keep_neq_false for keep then consume. Joins
    canSeq_keep_zero_consume_false for general k != 1.
    Matching remaining 1 stays canSeq_keep_consume_true.
    Not a sequencing combinator. Not map. Theorem
    canSeq_keep_consume_neq_false.
  - canSeq consume then keep remaining k is true when k = 0.
    Dual of canSeq_consume_keep_neq_false (true side). Joins
    canSeq_consume_keep_true for general k = 0. Mismatch stays
    canSeq_consume_keep_neq_false. Not a sequencing combinator.
    Not map. Theorem canSeq_consume_keep_eq_true.
  - canSeq keep remaining k then consume is true when k = 1.
    Dual of canSeq_keep_consume_neq_false (true side). Dual of
    canSeq_consume_keep_eq_true (swap order). Joins
    canSeq_keep_consume_true for general k = 1. Mismatch stays
    canSeq_keep_consume_neq_false. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_consume_eq_true.
  - canSeq keep remaining k then keep remaining m is true when
    k = m. Dual of canSeq_keep_keep_neq_false (true side). Dual
    of canSeq_keep_consume_eq_true (keep then keep). Joins
    canSeq_keep_keep_true for general k = m. Mismatch stays
    canSeq_keep_keep_neq_false. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_keep_eq_true.
  - canSeq keep remaining k then keep remaining m is true only
    if k = m. Dual of canSeq_keep_keep_eq_true (converse).
    Joins canSeq_keep_keep_true_iff mp. Mismatch stays
    canSeq_keep_keep_neq_false. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_keep_true_eq.
  - canSeq keep remaining k then keep remaining m is false only
    if Not (k = m). Dual of canSeq_keep_keep_true_eq (false
    side). Dual of canSeq_keep_keep_neq_false (converse).
    Joins canSeq_keep_keep_false_iff mp. Matching remaining
    stays canSeq_keep_keep_true. Not a sequencing combinator.
    Not map. Theorem canSeq_keep_keep_false_neq.
  - canSeq consume then keep remaining k is false only if
    Not (k = 0). Dual of canSeq_keep_keep_false_neq for
    consume then keep. Dual of canSeq_consume_keep_neq_false
    (converse). Joins canSeq_consume_keep_false_iff mp.
    Matching remaining 0 stays canSeq_consume_keep_true.
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_false_neq.
  - canSeq keep remaining k then consume is false only if
    Not (k = 1). Dual of canSeq_consume_keep_false_neq
    (swap order). Dual of canSeq_keep_consume_neq_false
    (converse). Joins canSeq_keep_consume_false_iff mp.
    Matching remaining 1 stays canSeq_keep_consume_true.
    Not a sequencing combinator. Not map. Theorem
    canSeq_keep_consume_false_neq.
  - canSeq consume then keep remaining k is true only
    if k = 0. Dual of canSeq_consume_keep_eq_true
    (converse). Dual of canSeq_keep_keep_true_eq for
    consume then keep. Joins canSeq_consume_keep_true_iff
    mp. Mismatch stays canSeq_consume_keep_neq_false.
    Not a sequencing combinator. Not map. Theorem
    canSeq_consume_keep_true_eq.
  - canSeq keep remaining k then consume is true only
    if k = 1. Dual of canSeq_keep_consume_eq_true
    (converse). Dual of canSeq_consume_keep_true_eq
    (swap order). Dual of canSeq_keep_keep_true_eq for
    keep then consume. Joins canSeq_keep_consume_true_iff
    mp. Mismatch stays canSeq_keep_consume_neq_false.
    Not a sequencing combinator. Not map. Theorem
    canSeq_keep_consume_true_eq.
  - canSeq keep remaining k then keep remaining m is true
    when swapped if it is true. Dual of
    canSeq_keep_keep_true_eq (swap operands). Joins
    canSeq_keep_keep_eq_true with Eq.symm. Consume then
    keep is not symmetric with keep then consume (k = 0
    vs k = 1). Not a sequencing combinator. Not map.
    Theorem canSeq_keep_keep_true_symm.
  - canSeq keep remaining k then keep remaining m is false
    when swapped if it is false. Dual of
    canSeq_keep_keep_true_symm (false side). Joins
    canSeq_keep_keep_neq_false with Not of Eq.symm.
    Matching remaining stays canSeq_keep_keep_true.
    Consume then keep is not symmetric with keep then
    consume. Not a sequencing combinator. Not map.
    Theorem canSeq_keep_keep_false_symm.
  - canSeq keep remaining k then keep remaining m equals
    canSeq keep remaining m then keep remaining k (Bool).
    Dual of canSeq_keep_keep_true_symm and
    canSeq_keep_keep_false_symm (Bool equality). Joins both.
    Matching remaining stays canSeq_keep_keep_true.
    Consume then keep is not symmetric with keep then
    consume. Not a sequencing combinator. Not map.
    Theorem canSeq_keep_keep_comm.
  - canSeq keep remaining k then keep remaining n is true if
    keep k sequences with keep m and keep m sequences with
    keep n. Dual of canSeq_keep_keep_comm (transitivity of
    remaining-index equality). Joins canSeq_keep_keep_eq_true
    with Eq.trans. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_trans.
  - canSeq keep remaining m then keep remaining n is true if
    keep k sequences with keep m and keep k sequences with
    keep n. Dual of canSeq_keep_keep_trans (left cancel of
    remaining-index equality). Joins canSeq_keep_keep_eq_true
    with Eq.symm and Eq.trans. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_cancel.
  - canSeq keep remaining k then keep remaining n is true if
    keep k sequences with keep m and keep n sequences with
    keep m. Dual of canSeq_keep_keep_cancel (right cancel of
    remaining-index equality). Joins canSeq_keep_keep_cancel
    with canSeq_keep_keep_true_symm. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_rcancel.
  - canSeq keep remaining m then keep remaining n is false if
    keep k does not sequence with keep m and keep k sequences
    with keep n. Dual of canSeq_keep_keep_cancel (false side).
    Dual of canSeq_keep_keep_rcancel_false (left cancel). Joins
    canSeq_keep_keep_rcancel_false with canSeq_keep_keep_false_symm
    and canSeq_keep_keep_true_symm. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_cancel_false.
  - canSeq keep remaining k then keep remaining n is false if
    keep k does not sequence with keep m and keep m sequences
    with keep n. Dual of canSeq_keep_keep_trans (false side).
    Dual of canSeq_keep_keep_cancel_false (transitivity). Joins
    canSeq_keep_keep_rcancel_false with canSeq_keep_keep_true_symm.
    Matching remaining stays canSeq_keep_keep_true. Consume then
    keep is not symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_trans_false.
  - canSeq keep remaining k then keep remaining n is false if
    keep k sequences with keep m and keep m does not sequence
    with keep n. Dual of canSeq_keep_keep_trans_false (right
    false). Dual of canSeq_keep_keep_trans (false side, second
    hypothesis). Joins canSeq_keep_keep_trans_false with
    canSeq_keep_keep_false_symm and canSeq_keep_keep_true_symm.
    Matching remaining stays canSeq_keep_keep_true. Consume then
    keep is not symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_rtrans_false.
  - canSeq keep remaining k then keep remaining n equals canSeq
    keep remaining m then keep remaining n if keep k sequences
    with keep m (Bool). Dual of canSeq_keep_keep_rtrans_false
    (congruence). Joins canSeq_keep_keep_cancel and
    canSeq_keep_keep_trans. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_congr.
  - canSeq keep remaining k then keep remaining m equals canSeq
    keep remaining k then keep remaining n if keep m sequences
    with keep n (Bool). Dual of canSeq_keep_keep_congr
    (right argument). Joins canSeq_keep_keep_trans and
    canSeq_keep_keep_rcancel. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_rcongr.
  - canSeq keep remaining k then keep remaining m equals canSeq
    keep remaining k' then keep remaining m' if keep k sequences
    with keep k' and keep m sequences with keep m' (Bool). Dual
    of canSeq_keep_keep_congr and canSeq_keep_keep_rcongr (both
    arguments). Joins both. Matching remaining stays
    canSeq_keep_keep_true. Consume then keep is not
    symmetric with keep then consume. Not a sequencing
    combinator. Not map. Theorem canSeq_keep_keep_congr2.
  - Legal: onceUse / runOnce mint then consume.run once; also
    (bind consume keep).run (mint n).
  - Intended fail-to-check: a second consume is ill-typed when the remaining
    index is threaded (consume.run : OnceRes 1 -> Prod Nat (OnceRes 0)), and
    two consume steps do not bind.
  - OnceRes is an ordinary Lean structure (unrestricted). Lean still allows
    (consume.run r, consume.run r) on the same OnceRes 1 term because that
    copies the value. That is not kernel linearity. Residual stays done
    partial. Not all CompCert-class guarantees. Not PROVABLY.
  - Illegal (Idris-style commented non-example; do not uncomment):
      def consumeTwice (r : OnceRes 1) := (consume r, consume r)
      def consumeTwiceBind := bind consume consume
    First does not typecheck: consume is LinearStep 1 0, not a function of
    OnceRes 1. Second does not typecheck: bind needs LinearStep 0 post,
    but consume is LinearStep 1 0.
  - A later Name that wants kernel-style reject of the same term twice needs
    a stronger encoding than Nat-indexed LinearStep.
  - This is NOT all-types use-check. NOT affine drop. NOT Linear.Token axioms.
  - This is NOT UseCheck checkConsumeToken_doubleSpend (that classifies a log).

  Theorems (same namespace SystemsLean.LinearUseFail):
  - Bind / onceUse / illegalSeq / canSeq_consume_consume_false /
    illegalLinearUseFailReady_true: SystemsLean.LinearUseFailTheorems
  - canSeq iff: SystemsLean.LinearUseFail.CanSeq
  - keep/keep algebra: SystemsLean.LinearUseFail.Keep
  - consume/keep duals: SystemsLean.LinearUseFail.Consume
  - consume/consume decide: SystemsLean.LinearUseFail.Decide

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Linear.Token axioms remain in Linear.lean.
  - Not occupancy name 50. Not a mill lean_exe. Inventory stays 69 of 69.

  Greppable: SYSTEMS_LEAN_HOST, LINEAR-USE-FAIL, ILLEGAL-LINEAR-USE-FAIL,
  OnceRes, consume, canSeq, CanSeq, IllegalSeq, bind, keep, BindLeftUnit,
  BindRightUnit, BindAssoc, ConsumeThenKeepEq, KeepThenConsumeEq,
  ConsumeKeepCommute, BindCongr, CanSeqIff, CanSeqFalseIff,
  CanSeqKeepKeepTrueIff, CanSeqKeepKeepFalseIff, CanSeqConsumeKeepTrueIff,
  CanSeqKeepConsumeTrueIff, CanSeqKeepConsumeFalseIff,
  CanSeqConsumeKeepFalseIff, onceUse, runOnce,
  illegalLinearUseFailReady,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearUseFail
  Red/green: just systems-host (nix/systems-host-presence/).
  Named lake prove of LinearUseFailTheorems is Status
  wontfix-this-slice because SSH to nixbuilder@surmount-1 is down.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.Mult

namespace SystemsLean.LinearUseFail

/-- Indexed MULT-1 resource. remaining 1 = live, 0 = spent. LINEAR-USE-FAIL. -/
structure OnceRes (remaining : Nat) where
  payload : Nat
  /-- Quantitative Type Theory (QTT) grade tag: MULT-1 linear. -/
  grade : SystemsLean.Mult.Mult := SystemsLean.Mult.Mult.mult1
  deriving Repr, DecidableEq

/-- Mint a live linear resource (remaining 1). Grade tag is Mult.mult1. -/
def mint (n : Nat) : OnceRes 1 where
  payload := n

/-- Monadic linear step: remaining pre to remaining post. -/
structure LinearStep (pre post : Nat) where
  run : OnceRes pre -> Prod Nat (OnceRes post)

/-- Spend OnceRes 1. Does not return OnceRes 1. ILLEGAL-LINEAR-USE-FAIL. -/
def consume : LinearStep 1 0 where
  run r := (r.payload, { payload := r.payload })

/-- True when first step post remaining equals second step pre remaining. -/
def canSeq {pre mid mid' post : Nat} :
    LinearStep pre mid -> LinearStep mid' post -> Bool :=
  fun _ _ => decide (mid = mid')

/-- Prop: first step post remaining equals second step pre remaining. -/
def CanSeq {pre mid mid' post : Nat} :
    LinearStep pre mid -> LinearStep mid' post -> Prop :=
  fun _ _ => mid = mid'

/-- Type of a proof that consume binds with consume. Uninhabited (0 = 1). -/
def IllegalSeq : Prop := CanSeq consume consume

/-- No-op LinearStep: remaining k stays k. Legal bind after consume. -/
def keep {k : Nat} : LinearStep k k where
  run r := (r.payload, r)

/-- Indexed bind: remaining after first is remaining before second.
    bind consume consume does not typecheck (post 0 != pre 1). -/
def bind {pre mid post : Nat}
    (s1 : LinearStep pre mid)
    (s2 : LinearStep mid post) : LinearStep pre post where
  run r := s2.run (s1.run r).snd

/-- Left unit for indexed bind.
    Contract: keep is a left identity for bind. Running bind keep s
    on a resource is the same as running s on that resource.
    keep : LinearStep pre pre, so bind keep s : LinearStep pre post.
    Legal consume stays inhabited (bind keep consume). Illegal
    bind consume consume still does not typecheck. -/
def BindLeftUnit {pre post : Nat} (s : LinearStep pre post) : Prop :=
  forall (r : OnceRes pre), (bind keep s).run r = s.run r

/-- Right unit for indexed bind on remaining.
    Contract: keep is a right identity for bind on the remaining
    OnceRes. Running bind s keep leaves (s.run r).snd unchanged.
    Full Prod equality is not claimed: bind threads remaining
    (snd) and discards the first Nat payload. consume still
    matches payload (bind_consume_keep_ok). keep : LinearStep
    post post, so bind s keep : LinearStep pre post. Illegal
    bind consume consume still does not typecheck. -/
def BindRightUnit {pre post : Nat} (s : LinearStep pre post) : Prop :=
  forall (r : OnceRes pre), ((bind s keep).run r).snd = (s.run r).snd

/-- Associativity for indexed bind.
    Contract: bind (bind s1 s2) s3 has the same run as
    bind s1 (bind s2 s3). Full Prod equality is honest here:
    both associations thread remaining through s1 then s2 and
    return s3.run of that remaining. BindRightUnit stays
    snd-only. Not a full Kleisli monad. Illegal
    bind consume consume still does not typecheck. -/
def BindAssoc {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid)
    (s2 : LinearStep mid mid')
    (s3 : LinearStep mid' post) : Prop :=
  forall (r : OnceRes pre),
    (bind (bind s1 s2) s3).run r = (bind s1 (bind s2 s3)).run r

/-- consume then keep is consume.
    Contract: bind consume keep has the same run as consume.
    Full Prod equality is honest here: consume copies payload
    into the spent remaining, so keep.run of that remaining
    matches consume.run on both fst and snd. BindRightUnit
    stays snd-only for a general step. bind_consume_keep_ok
    stays the payload (fst) smoke. Keep-keep identity is
    already BindLeftUnit keep. Illegal bind consume consume
    still does not typecheck. -/
def ConsumeThenKeepEq : Prop :=
  forall (r : OnceRes 1), (bind consume keep).run r = consume.run r

/-- keep then consume is consume.
    Contract: bind keep consume has the same run as consume.
    Full Prod equality is honest here: keep is a left identity
    for any step (BindLeftUnit), and this names the consume
    dual of ConsumeThenKeepEq. Do not duplicate BindLeftUnit
    keep. Illegal bind consume consume still does not typecheck. -/
def KeepThenConsumeEq : Prop :=
  forall (r : OnceRes 1), (bind keep consume).run r = consume.run r

/-- consume then keep has the same run as keep then consume.
    Contract: bind consume keep and bind keep consume agree on
    run. Full Prod equality is honest here: both equal
    consume.run (ConsumeThenKeepEq and KeepThenConsumeEq).
    Keep-keep is BindLeftUnit keep. General-step run
    congruence is BindCongr. Illegal bind consume consume
    still does not typecheck. -/
def ConsumeKeepCommute : Prop :=
  forall (r : OnceRes 1),
    (bind consume keep).run r = (bind keep consume).run r

/-- Run-equal steps bind to run-equal steps.
    Contract: if s1.run equals s1'.run and s2.run equals
    s2'.run, then bind s1 s2 has the same run as bind s1' s2'.
    Full Prod on the composite. Bind threads remaining (snd)
    and applies the second step to that remaining; pointwise
    run equality is enough (no LinearStep funext). BindRightUnit
    stays snd-only for a general step. ConsumeKeepCommute stays
    consume/keep only. Not a full Kleisli monad. Illegal
    bind consume consume still does not typecheck. Bool/Prop
    remaining-index agreement is CanSeqIff. -/
def BindCongr {pre mid post : Nat}
    (s1 s1' : LinearStep pre mid)
    (s2 s2' : LinearStep mid post) : Prop :=
  (forall (r : OnceRes pre), s1.run r = s1'.run r) ->
  (forall (r : OnceRes mid), s2.run r = s2'.run r) ->
  (forall (r : OnceRes pre), (bind s1 s2).run r = (bind s1' s2').run r)

/-- Bool canSeq agrees with Prop CanSeq.
    Contract: canSeq s1 s2 is true if and only if CanSeq s1 s2.
    canSeq is decide of remaining-index equality; CanSeq is
    that equality. consume/consume stays false
    (canSeq_consume_consume_false and illegalSeq_uninh).
    Not a sequencing combinator. Not map. Illegal bind
    consume consume still does not typecheck. -/
def CanSeqIff {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) : Prop :=
  canSeq s1 s2 = true <-> CanSeq s1 s2

/-- Bool canSeq is false iff not Prop CanSeq.
    Contract: canSeq s1 s2 is false if and only if CanSeq s1 s2
    does not hold. Dual of CanSeqIff (true iff). consume/consume
    stays false (canSeq_consume_consume_false and
    illegalSeq_uninh). Not a sequencing combinator. Not map.
    Illegal bind consume consume still does not typecheck. -/
def CanSeqFalseIff {pre mid mid' post : Nat}
    (s1 : LinearStep pre mid) (s2 : LinearStep mid' post) : Prop :=
  canSeq s1 s2 = false <-> Not (CanSeq s1 s2)

/-- Bool canSeq keep keep is true iff remaining indices match.
    Contract: canSeq keep remaining k then keep remaining m is
    true if and only if k = m. Joins canSeq_keep_keep_true and
    canSeq_keep_keep_neq_false. CanSeq keep keep is k = m by
    unfolding. Not a sequencing combinator. Not map. Illegal
    bind consume consume still does not typecheck. -/
def CanSeqKeepKeepTrueIff (k m : Nat) : Prop :=
  canSeq (keep : LinearStep k k) (keep : LinearStep m m) = true <-> k = m

/-- Bool canSeq keep keep is false iff remaining indices mismatch.
    Contract: canSeq keep remaining k then keep remaining m is
    false if and only if Not (k = m). Dual of
    CanSeqKeepKeepTrueIff (false side). Joins
    canSeq_keep_keep_neq_false. Matching remaining stays
    canSeq_keep_keep_true. CanSeq keep keep is k = m by
    unfolding. Not a sequencing combinator. Not map. Illegal
    bind consume consume still does not typecheck. -/
def CanSeqKeepKeepFalseIff (k m : Nat) : Prop :=
  canSeq (keep : LinearStep k k) (keep : LinearStep m m) = false <-> Not (k = m)

/-- Bool canSeq consume keep is true iff remaining k is spent.
    Contract: canSeq consume then keep remaining k is true if and
    only if k = 0. Joins canSeq_consume_keep_true and
    canSeq_consume_keep_one_false for general k. CanSeq consume
    keep is 0 = k by unfolding; k = 0 is Eq.comm of that.
    Not a sequencing combinator. Not map. Illegal bind
    consume consume still does not typecheck. -/
def CanSeqConsumeKeepTrueIff (k : Nat) : Prop :=
  canSeq consume (keep : LinearStep k k) = true <-> k = 0

/-- Bool canSeq keep consume is true iff remaining k is live.
    Contract: canSeq keep remaining k then consume is true if and
    only if k = 1. Joins canSeq_keep_consume_true and
    canSeq_keep_zero_consume_false for general k. CanSeq keep
    consume is k = 1 by unfolding. Dual of
    CanSeqConsumeKeepTrueIff (swap order). Not a sequencing
    combinator. Not map. Illegal bind consume consume still
    does not typecheck. -/
def CanSeqKeepConsumeTrueIff (k : Nat) : Prop :=
  canSeq (keep : LinearStep k k) consume = true <-> k = 1

/-- Bool canSeq keep consume is false iff remaining k is not live.
    Contract: canSeq keep remaining k then consume is false if and
    only if Not (k = 1). Dual of CanSeqKeepConsumeTrueIff (false
    side). Joins canSeq_keep_zero_consume_false for general k.
    CanSeq keep consume is k = 1 by unfolding. Not a sequencing
    combinator. Not map. Illegal bind consume consume still
    does not typecheck. -/
def CanSeqKeepConsumeFalseIff (k : Nat) : Prop :=
  canSeq (keep : LinearStep k k) consume = false <-> Not (k = 1)

/-- Bool canSeq consume keep is false iff remaining k is not spent.
    Contract: canSeq consume then keep remaining k is false if and
    only if Not (k = 0). Dual of CanSeqConsumeKeepTrueIff (false
    side). Dual of CanSeqKeepConsumeFalseIff (swap order). Joins
    canSeq_consume_keep_one_false for general k. CanSeq consume
    keep is 0 = k by unfolding; Not (k = 0) is Not of Eq.comm of
    that. Not a sequencing combinator. Not map. Illegal bind
    consume consume still does not typecheck. -/
def CanSeqConsumeKeepFalseIff (k : Nat) : Prop :=
  canSeq consume (keep : LinearStep k k) = false <-> Not (k = 0)

/-- Legal mint then consume once. Returns payload and spent OnceRes 0. -/
def onceUse (n : Nat) : Prod Nat (OnceRes 0) :=
  consume.run (mint n)

/-- Legal payload after one consume. -/
def runOnce (n : Nat) : Nat :=
  (onceUse n).fst

/-- Ready pin: illegal seq is false; legal onceUse and bind consume keep. -/
def illegalLinearUseFailReady : Bool :=
  decide (canSeq consume consume = false)
    && decide ((onceUse 7).fst = 7)
    && decide (((bind consume keep).run (mint 7)).fst = 7)

end SystemsLean.LinearUseFail
