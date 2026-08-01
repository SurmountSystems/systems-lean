/-
  SYSTEMS_LEAN_HOST partial -- Linear / ConsumeToken-class host contracts.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Dual cite (read-only; do not reimplement duals here):
    src/idris2/examples/ConsumeToken.idr
    src/lean4/examples/ConsumeToken.lean
  Emit map (read-only honesty): Linear.slake, CONSUME_TOKEN_HOST_V0 C host.

  Spec (readable, separate from any future proof):
  - Token is an abstract once-use resource (MULT-1 intent; LINEAR-EXACT-ONCE).
  - mkToken mints a token from unrestricted data (MULT-OMEGA in, Token out).
  - consume uses the token once and returns the payload (Nat).
  - roundTrip composes mint then consume (unrestricted in/out).
  - JOIN-ALG ConsumeToken is the dual algorithm on Idris side / Lean side.
  - Classic Lean cannot enforce multiplicity 1; names and module docs are the
    contract until freestanding checks and product wire enforce exact-once.
  - Freestanding Mult grades only: MULT-0 (erased / polyId), MULT-1 (exact-once
    Token contract + HostCompose live-flag), MULT-OMEGA (shareNat unrestricted).
  - Affine (at most once / discard without use) is NOT first-class here.

  Linear axioms (LINEAR-AXIOMS-REMAIN -- honest limits):
  - Token : Type -- abstract once-use resource; no concrete model.
  - mkToken : Nat -> Token -- mint; no runtime code for axioms.
  - consume : Token -> Nat -- use once by contract; elaborator will not reject
    double application of consume to the same proof-relevant Token value.
  Why axioms (not opaque): opaque constants over abstract Token need a Nonempty
  instance that would force a fake model. Axioms keep contracts abstract.
  What IS proven elsewhere (not by eliminating these axioms):
  - LinearTheorems: shareNat_* (MULT-OMEGA), polyId_* (MULT-0), roundTrip_eq
    (JOIN-ALG compose shape), mult-class honesty pins, axiom inventory pins.
  - HostCompose: live-flag mint/consume fail-closed (double consume, double mint,
    mint id 0 reject, spent scrub) -- LINEAR-EXACT-ONCE model, not elaborator.
  - KernelLinear / CompilePath Linear / EmitLinear / JoinMap host-use pins.
  What is NOT proven:
  - Elaborator MULT-1 / LINEAR-EXACT-ONCE on Token (Idris LinearCheck class).
  - Affine as product ABI. residual free. SpecProof complete. PROVABLY. llvm.

  Theorems (LINEAR-THEOREM / HOST-LINEAR-THEOREM -- honest limited only):
  - Live in SystemsLean.LinearTheorems (same namespace; long-file split).
  - shareNat_eq / shareNat_zero / shareNat_succ / shareNat_reuse (MULT-OMEGA).
  - polyId_id / polyId_compose / polyId_nat (MULT-0 erased-parameter sketch).
  - roundTrip_eq (JOIN-ALG mint+consume composition shape).
  - mult0ClassId_eq / mult1ClassId_eq / multOmegaClassId_eq / linearExactOnceId_eq.
  - linearAxiomsRemainId_eq / linearAxiomInventoryOk_true / affineNotFirstClassId_eq.
  JOIN-ALG ConsumeToken remains dual-cite honesty; Token/mkToken/consume axioms
  stay axioms. These do NOT claim MULT-1 / LINEAR-EXACT-ONCE elaborator enforcement.
  These Linear theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Linear != host proof complete != residual free.

  Intentional non-examples (do not add as theorems claiming LinearCheck):
  - double application of consume to the same resource
  - dropping a linear Token without use
  Idris LinearCheck rejects those; classic Lean will not.

  Classic Lean elaborator note:
  - Token, mkToken, and consume are `axiom`s (not `opaque`) because opaque
    constants over an abstract Token require a Nonempty instance that would
    force a fake model. Axioms keep those contracts abstract.
  - roundTrip is a noncomputable `def` composition of consume (mkToken n);
    still no MULT-1 enforcement.
  - Not freestanding residual free. Not product C. Not PROVABLY.
  - Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, JOIN-ALG, ConsumeToken, MULT-0, MULT-1, MULT-OMEGA,
  LINEAR-EXACT-ONCE, LINEAR-AXIOMS-REMAIN, LINEAR-THEOREM, HOST-LINEAR-THEOREM,
  shareNat_eq, shareNat_zero, shareNat_succ, shareNat_reuse, polyId_id,
  polyId_compose, polyId_nat, roundTrip_eq, mult0ClassId_eq, mult1ClassId_eq,
  multOmegaClassId_eq, linearExactOnceId_eq, linearAxiomsRemainId_eq,
  linearAxiomInventoryOk_true, affineNotFirstClassId_eq, LinearTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.Linear
  Long-file split: LINEAR-THEOREM + HOST-LINEAR-THEOREM in
  SystemsLean.LinearTheorems (same namespace). Core Linear dialect stays here.
  linear resource contract; exact-once fail closed by contract only here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.Linear

/-- Unrestricted ordinary data (MULT-OMEGA class). May be used more than once. -/
def shareNat (n : Nat) : Nat := n + n

/-- Abstract once-use resource. Freestanding map: MULT-1 / LINEAR-EXACT-ONCE.
    Classic Lean does not enforce exact-once use.
    LINEAR-AXIOMS-REMAIN: stays axiom (no Nonempty Token model). -/
axiom Token : Type

/-- Mint a token from unrestricted data (MULT-OMEGA in, Token out).
    JOIN-ALG ConsumeToken mkToken shape.
    LINEAR-AXIOMS-REMAIN: stays axiom. -/
axiom mkToken : Nat -> Token

/--
  consume t -- use the token once (contract); return payload.
  Classic Lean does not reject double application of consume to the same
  proof-relevant value the way Idris LinearCheck would; freestanding product
  wire and later host checks will. HostCompose live-flag models fail-closed
  double consume for the concrete host handle (not this abstract Token).
  JOIN-ALG ConsumeToken consume shape.
  LINEAR-AXIOMS-REMAIN: stays axiom.
-/
axiom consume : Token -> Nat

/--
  Unrestricted in, linear middle (by contract), unrestricted out.
  Elaborator-checked composition of the axiom contracts; not a linearity proof.
  noncomputable: mkToken/consume are axioms (no code generator support).
-/
noncomputable def roundTrip (n : Nat) : Nat := consume (mkToken n)

/-- Erased-parameter sketch (MULT-0 class): type parameter present for typing.
    Not identical to Idris `{0 a : Type}` (see ERASE-PROP / EDGE-PROP). -/
def polyId {a : Type} (x : a) : a := x

/-! ### Mult grade class + honesty pins (freestanding 0/1/omega; not affine)

  String pins map Linear sketches to Mult grades. Mult inductive lives in
  Mult.lean; these are greppable contract surface ids only.
-/

/-- MULT-0 erased / runtime-absent class id (polyId sketch). -/
def mult0ClassId : String := "MULT-0"

/-- MULT-1 use-once / linear class id (Token / mkToken / consume contract). -/
def mult1ClassId : String := "MULT-1"

/-- MULT-OMEGA unrestricted class id (shareNat sketch). -/
def multOmegaClassId : String := "MULT-OMEGA"

/-- LINEAR-EXACT-ONCE contract id (primary freestanding memory-safety story). -/
def linearExactOnceId : String := "LINEAR-EXACT-ONCE"

/-- Honest residual: Token / mkToken / consume remain axioms on classic Lean. -/
def linearAxiomsRemainId : String := "LINEAR-AXIOMS-REMAIN"

/-- Affine is not first-class on freestanding product wire (exact-once primary). -/
def affineNotFirstClassId : String := "AFFINE-NOT-FIRST-CLASS"

/-- Inventory pin: Mult 0/1/omega ids + exact-once + axioms remain + affine not
    first-class. Greppable: linearAxiomInventoryOk, LINEAR-AXIOMS-REMAIN. -/
def linearAxiomInventoryOk : Bool :=
  (mult0ClassId == "MULT-0")
    && (mult1ClassId == "MULT-1")
    && (multOmegaClassId == "MULT-OMEGA")
    && (linearExactOnceId == "LINEAR-EXACT-ONCE")
    && (linearAxiomsRemainId == "LINEAR-AXIOMS-REMAIN")
    && (affineNotFirstClassId == "AFFINE-NOT-FIRST-CLASS")

/- Theorems live in SystemsLean.LinearTheorems
   (same namespace SystemsLean.Linear; long-file split). Parent keeps
   Linear dialect only -- do not import LinearTheorems here (import cycle). -/

end SystemsLean.Linear
