/-
  SYSTEMS_LEAN_HOST partial -- Linear LINEAR-THEOREM / HOST-LINEAR-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.Linear: theorems live here; Token, mkToken,
  consume, roundTrip, shareNat, polyId, mult class / axiom inventory pins stay
  in Linear. Same namespace SystemsLean.Linear so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - LINEAR-THEOREM / HOST-LINEAR-THEOREM:
    shareNat_eq / shareNat_zero / shareNat_succ / shareNat_reuse (MULT-OMEGA);
    polyId_id / polyId_compose / polyId_nat (MULT-0);
    roundTrip_eq (JOIN-ALG compose shape; not elaborator MULT-1);
    mult0ClassId_eq / mult1ClassId_eq / multOmegaClassId_eq;
    linearExactOnceId_eq / linearAxiomsRemainId_eq / affineNotFirstClassId_eq;
    linearAxiomInventoryOk_true.
  - JOIN-ALG ConsumeToken dual-cite honesty remains; Token / mkToken / consume
    stay axioms in Linear (LINEAR-AXIOMS-REMAIN). Does NOT claim MULT-1 /
    LINEAR-EXACT-ONCE elaborator enforcement. Affine not first-class.

  These Linear theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Linear != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Lake example smokes are NOT full proofs (none required here).
  - Live-flag exact-once model is HostCompose (double_consume_notLive etc.), not
    elimination of Token axioms.

  Greppable: SYSTEMS_LEAN_HOST, JOIN-ALG, ConsumeToken, MULT-0, MULT-1, MULT-OMEGA,
  LINEAR-EXACT-ONCE, LINEAR-AXIOMS-REMAIN, LINEAR-THEOREM, HOST-LINEAR-THEOREM,
  shareNat_eq, shareNat_zero, shareNat_succ, shareNat_reuse, polyId_id,
  polyId_compose, polyId_nat, roundTrip_eq, mult0ClassId_eq, mult1ClassId_eq,
  multOmegaClassId_eq, linearExactOnceId_eq, linearAxiomsRemainId_eq,
  linearAxiomInventoryOk_true, affineNotFirstClassId_eq, LinearTheorems,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LinearTheorems
  Red/green: just systems-host; lake build SystemsLean.LinearTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Linear

namespace SystemsLean.Linear

/-! ### LINEAR-THEOREM / HOST-LINEAR-THEOREM (readable statements, then proofs)

  Honest limited surface theorems only. JOIN-ALG ConsumeToken dual-cite honesty
  remains; Token / mkToken / consume stay axioms (LINEAR-AXIOMS-REMAIN). Does NOT
  claim MULT-1 / LINEAR-EXACT-ONCE elaborator enforcement (classic Lean cannot).
  Does not complete SpecProof; does not claim residual free / freestanding
  product self-host complete / PROVABLY. Affine not first-class.
-/

/-- Unrestricted share sketch is n + n (MULT-OMEGA class).
    Greppable: shareNat_eq, MULT-OMEGA, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem shareNat_eq (n : Nat) : shareNat n = n + n := rfl

/-- shareNat at zero is zero (greppable base case of shareNat_eq; not deeper
    algebra than the general lemma). Future Linear depth prefers HostCompose
    live-flag contracts over more shareNat rephrases.
    Greppable: shareNat_zero, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem shareNat_zero : shareNat 0 = 0 := rfl

/-- shareNat at succ is (n+1)+(n+1) (greppable succ case of shareNat_eq).
    Greppable: shareNat_succ, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem shareNat_succ (n : Nat) : shareNat (n + 1) = (n + 1) + (n + 1) := rfl

/-- MULT-OMEGA unrestricted reuse: shareNat result may be shared again.
    Exact-once is Mult-1 only; unrestricted data may be used more than once.
    Greppable: shareNat_reuse, MULT-OMEGA, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem shareNat_reuse (n : Nat) :
    shareNat (shareNat n) = (n + n) + (n + n) := rfl

/-- Erased-parameter identity sketch is the identity (MULT-0 class).
    Greppable: polyId_id, MULT-0, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem polyId_id {a : Type} (x : a) : polyId x = x := rfl

/-- MULT-0 erased-parameter sketch composes as identity.
    Greppable: polyId_compose, MULT-0, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem polyId_compose {a : Type} (x : a) : polyId (polyId x) = x := rfl

/-- MULT-0 sketch at Nat is the identity (concrete case of polyId_id).
    Greppable: polyId_nat, MULT-0, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem polyId_nat (n : Nat) : polyId n = n := rfl

/-- roundTrip is definitionally consume (mkToken n) (JOIN-ALG compose shape).
    Not a MULT-1 enforcement theorem; axioms remain axioms (LINEAR-AXIOMS-REMAIN).
    Greppable: roundTrip_eq, JOIN-ALG, LINEAR-EXACT-ONCE, LINEAR-THEOREM,
    HOST-LINEAR-THEOREM. -/
theorem roundTrip_eq (n : Nat) :
    roundTrip n = consume (mkToken n) := rfl

/-! ### Mult grade class + axiom inventory pins (LINEAR-AXIOMS-REMAIN)

  Greppable honesty that freestanding Mult is only 0/1/omega, exact-once is
  primary, axioms remain, affine is not first-class. Not elaborator enforcement.
-/

/-- MULT-0 class id pin. Greppable: mult0ClassId_eq, MULT-0, LINEAR-THEOREM. -/
theorem mult0ClassId_eq : mult0ClassId = "MULT-0" := rfl

/-- MULT-1 class id pin (exact-once grade; Token axioms map by contract).
    Greppable: mult1ClassId_eq, MULT-1, LINEAR-EXACT-ONCE, LINEAR-THEOREM,
    HOST-LINEAR-THEOREM. -/
theorem mult1ClassId_eq : mult1ClassId = "MULT-1" := rfl

/-- MULT-OMEGA class id pin. Greppable: multOmegaClassId_eq, MULT-OMEGA,
    LINEAR-THEOREM. -/
theorem multOmegaClassId_eq : multOmegaClassId = "MULT-OMEGA" := rfl

/-- LINEAR-EXACT-ONCE contract id pin (primary freestanding story).
    Greppable: linearExactOnceId_eq, LINEAR-EXACT-ONCE, LINEAR-THEOREM,
    HOST-LINEAR-THEOREM. -/
theorem linearExactOnceId_eq : linearExactOnceId = "LINEAR-EXACT-ONCE" := rfl

/-- Token / mkToken / consume remain axioms (honest residual on classic Lean).
    Greppable: linearAxiomsRemainId_eq, LINEAR-AXIOMS-REMAIN, LINEAR-THEOREM,
    HOST-LINEAR-THEOREM. -/
theorem linearAxiomsRemainId_eq :
    linearAxiomsRemainId = "LINEAR-AXIOMS-REMAIN" := rfl

/-- Affine is not first-class on freestanding product wire.
    Greppable: affineNotFirstClassId_eq, AFFINE-NOT-FIRST-CLASS, LINEAR-THEOREM,
    HOST-LINEAR-THEOREM. -/
theorem affineNotFirstClassId_eq :
    affineNotFirstClassId = "AFFINE-NOT-FIRST-CLASS" := rfl

/-- Full Linear axiom / Mult-class inventory pin holds.
    Greppable: linearAxiomInventoryOk_true, LINEAR-AXIOMS-REMAIN, MULT-0, MULT-1,
    MULT-OMEGA, LINEAR-EXACT-ONCE, LINEAR-THEOREM, HOST-LINEAR-THEOREM. -/
theorem linearAxiomInventoryOk_true : linearAxiomInventoryOk = true := by decide

end SystemsLean.Linear
