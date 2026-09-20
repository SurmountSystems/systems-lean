/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ErasureTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveErasureTheoremsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-ERASURE-THEOREMS, liveErasureTheoremsSource,
  HOST-FRONT-LIVE-ERASURE-THEOREMS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveErasureTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveErasureTheorems

/-- Dual-pinned live ErasureTheorems.lean bytes (must match on-disk file).
    Greppable: liveErasureTheoremsSource, PARSE-LIVE-ERASURE-THEOREMS. -/
def liveErasureTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Erasure ERASURE-THEOREM + HOST-ERASURE-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.Erasure: theorems live here; Erased, mark,
  isRuntimeAbsent / isErasureGrade / markForGrade? / checkFailClosed stay in
  Erasure. Same namespace SystemsLean.Erasure so theorem names stay unqualified
  under that namespace.

  Spec (readable):
  - ERASURE-THEOREM / HOST-ERASURE-THEOREM: isRuntimeAbsent_unmarked_false /
    isRuntimeAbsent_mark_true / isRuntimeAbsent_eq_marked /
    erasureIsRuntimeAbsent_eq / mark_idempotent /
    isErasureGrade_mult0 / isErasureGrade_mult1_false / isErasureGrade_omega_false /
    markForGrade?_mult0_some / markForGrade?_mult1_none / markForGrade?_omega_none /
    markForGrade?_some_implies_isErasureGrade / markForGrade?_some_is_mark /
    markForGrade?_mult0_isRuntimeAbsent /
    checkFailClosed_eq / checkFailClosed_unmarked_false /
    checkFailClosed_marked_mult0_true / checkFailClosed_mult1_false /
    checkFailClosed_omega_false.
  - Partial Erasure only: not SpecProof complete.

  These Erasure theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Erasure != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete. Not a full erasure pass.
  - Classic Lean Prop erasure is not freestanding product erasure.

  Greppable: SYSTEMS_LEAN_HOST, ERASURE-THEOREM, HOST-ERASURE-THEOREM,
  ERASE-RULE-MULT-0, ERASE-NO-RUNTIME,
  isRuntimeAbsent_unmarked_false, markForGrade?_mult1_none,
  checkFailClosed_unmarked_false, checkFailClosed_eq,
  markForGrade?_some_implies_isErasureGrade, isRuntimeAbsent_eq_marked,
  markForGrade?_some_is_mark, markForGrade?_mult0_isRuntimeAbsent,
  ErasureTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.ErasureTheorems
  Red/green: just systems-host; lake build SystemsLean.ErasureTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Erasure

namespace SystemsLean.Erasure

open SystemsLean.Mult (Mult)

/-! ### ERASURE-THEOREM / HOST-ERASURE-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is ERASE-NO-RUNTIME
  mark fail-closed and ERASE-RULE-MULT-0 grade gate only. Does not complete
  SpecProof; does not claim residual free / freestanding product self-host
  complete / PROVABLY.
-/

/-- Unmarked handle is not runtime-absent (fail closed).
    Greppable: isRuntimeAbsent_unmarked_false, ERASE-NO-RUNTIME, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem isRuntimeAbsent_unmarked_false :
    isRuntimeAbsent unmarked = false := rfl

/-- mark flips handle to runtime-absent (ERASE-NO-RUNTIME).
    Greppable: isRuntimeAbsent_mark_true, ERASE-NO-RUNTIME, ERASURE-THEOREM. -/
theorem isRuntimeAbsent_mark_true (e : Erased) :
    isRuntimeAbsent (mark e) = true := rfl

/-- erasureIsRuntimeAbsent tracks isRuntimeAbsent.
    Greppable: erasureIsRuntimeAbsent_eq, ERASURE-THEOREM. -/
theorem erasureIsRuntimeAbsent_eq (e : Erased) :
    erasureIsRuntimeAbsent e = isRuntimeAbsent e := rfl

/-- mark is idempotent on already-marked handles.
    Greppable: mark_idempotent, ERASURE-THEOREM. -/
theorem mark_idempotent (e : Erased) : mark (mark e) = mark e := rfl

/-- MULT-0 is the only erasure grade (ERASE-RULE-MULT-0).
    Greppable: isErasureGrade_mult0, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem isErasureGrade_mult0 : isErasureGrade Mult.mult0 = true := rfl

/-- MULT-1 is not an erasure grade.
    Greppable: isErasureGrade_mult1_false, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem isErasureGrade_mult1_false : isErasureGrade Mult.mult1 = false := rfl

/-- MULT-OMEGA is not an erasure grade.
    Greppable: isErasureGrade_omega_false, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem isErasureGrade_omega_false : isErasureGrade Mult.multOmega = false := rfl

/-- markForGrade? succeeds only on MULT-0 (returns marked handle).
    Greppable: markForGrade?_mult0_some, ERASE-RULE-MULT-0, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem markForGrade?_mult0_some (e : Erased) :
    markForGrade? Mult.mult0 e = some (mark e) := rfl

/-- markForGrade? fails closed on MULT-1.
    Greppable: markForGrade?_mult1_none, ERASE-RULE-MULT-0, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem markForGrade?_mult1_none (e : Erased) :
    markForGrade? Mult.mult1 e = none := rfl

/-- markForGrade? fails closed on MULT-OMEGA.
    Greppable: markForGrade?_omega_none, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem markForGrade?_omega_none (e : Erased) :
    markForGrade? Mult.multOmega e = none := rfl

/-- MULT-0 unmarked fails closed (need mark for ERASE-NO-RUNTIME).
    Greppable: checkFailClosed_unmarked_false, ERASE-NO-RUNTIME, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem checkFailClosed_unmarked_false :
    checkFailClosed Mult.mult0 unmarked = false := rfl

/-- MULT-0 marked passes fail-closed erasure check.
    Greppable: checkFailClosed_marked_mult0_true, ERASE-NO-RUNTIME, ERASURE-THEOREM. -/
theorem checkFailClosed_marked_mult0_true (e : Erased) :
    checkFailClosed Mult.mult0 (mark e) = true := rfl

/-- MULT-1 cannot claim ERASE-NO-RUNTIME even if handle marked.
    Greppable: checkFailClosed_mult1_false, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem checkFailClosed_mult1_false (e : Erased) :
    checkFailClosed Mult.mult1 e = false := rfl

/-- MULT-OMEGA cannot claim ERASE-NO-RUNTIME even if handle marked.
    Greppable: checkFailClosed_omega_false, ERASE-RULE-MULT-0, ERASURE-THEOREM. -/
theorem checkFailClosed_omega_false (e : Erased) :
    checkFailClosed Mult.multOmega e = false := rfl

/-- isRuntimeAbsent is definitionally the marked flag.
    Greppable: isRuntimeAbsent_eq_marked, ERASE-NO-RUNTIME, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem isRuntimeAbsent_eq_marked (e : Erased) :
    isRuntimeAbsent e = e.marked := rfl

/-- checkFailClosed is definitionally grade gate && runtime-absent.
    Greppable: checkFailClosed_eq, ERASE-RULE-MULT-0, ERASE-NO-RUNTIME,
    ERASURE-THEOREM, HOST-ERASURE-THEOREM. -/
theorem checkFailClosed_eq (m : Mult) (e : Erased) :
    checkFailClosed m e = (isErasureGrade m && isRuntimeAbsent e) := rfl

/-- Successful markForGrade? implies erasure grade (MULT-0 only path).
    Greppable: markForGrade?_some_implies_isErasureGrade, ERASE-RULE-MULT-0,
    ERASURE-THEOREM, HOST-ERASURE-THEOREM. -/
theorem markForGrade?_some_implies_isErasureGrade (m : Mult) (e e' : Erased)
    (h : markForGrade? m e = some e') : isErasureGrade m = true := by
  cases m with
  | mult0 => rfl
  | mult1 =>
    simp [markForGrade?, isErasureGrade] at h
  | multOmega =>
    simp [markForGrade?, isErasureGrade] at h

/-- Successful markForGrade? returns mark e (payload-free ERASE-NO-RUNTIME handle).
    Greppable: markForGrade?_some_is_mark, ERASE-NO-RUNTIME, ERASURE-THEOREM,
    HOST-ERASURE-THEOREM. -/
theorem markForGrade?_some_is_mark (m : Mult) (e e' : Erased)
    (h : markForGrade? m e = some e') : e' = mark e := by
  cases m with
  | mult0 =>
    simp [markForGrade?, isErasureGrade] at h
    exact h.symm
  | mult1 =>
    simp [markForGrade?, isErasureGrade] at h
  | multOmega =>
    simp [markForGrade?, isErasureGrade] at h

/-- markForGrade? MULT-0 yields mark e that is runtime-absent (composition honesty).
    Prefer And.intro over soft match fallthrough.
    Greppable: markForGrade?_mult0_isRuntimeAbsent, ERASE-NO-RUNTIME,
    ERASURE-THEOREM, HOST-ERASURE-THEOREM. -/
theorem markForGrade?_mult0_isRuntimeAbsent (e : Erased) :
    markForGrade? Mult.mult0 e = some (mark e) /\
      isRuntimeAbsent (mark e) = true :=
  And.intro rfl rfl

end SystemsLean.Erasure
"#

end SystemsLean.HostFrontLiveErasureTheorems
