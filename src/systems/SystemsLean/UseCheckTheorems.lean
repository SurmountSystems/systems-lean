/-
  SYSTEMS_LEAN_HOST partial -- UseCheck theorems (same namespace).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.UseCheck: erased / grade / binder /
  telescope / term / let / match / mutual theorems live here.
  ConsumeToken and UnrestrictedShare theorems stay in UseCheck (host
  presence greps those six names). checkTerm_theorem_spent stays in
  UseCheck with constructor theoremBody and theoremBodyUseCheckReady.
  checkTerm_lam_spent stays in UseCheck with constructor lam and
  lamUseCheckReady.
  Same namespace SystemsLean.UseCheck so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - checkErasedAbsent_absent / checkErasedAbsent_once /
    checkErasedAbsent_many (grade 0).
  - checkGrade_linear_drop / checkGrade_linear_ok /
    checkGrade_linear_doubleSpend / checkGrade_share_ok /
    checkGrade_erased_absent / checkGrade_erased_once.
  - checkTypedUse_linear_ok / checkTypedUse_illegal /
    checkTypedUse_mismatch.
  - checkBinders_mixed_ok / checkBinders_illegal.
  - checkTelescope_mixed_ok / checkTelescope_spent /
    checkTelescope_linear_drop.
  - checkTerm_mixed_ok / checkTerm_spent / checkTerm_linear_drop.
  - checkTerm_let_spent / checkTerm_match_spent /
    checkTerm_mutual_spent.
  - checkTerm_lam_spent lives in UseCheck with lamUseCheckReady.

  These UseCheck theorems do NOT set SpecProof.proofCompleteClaimed true.
  Named surfaces != host proof complete != residual free != all-types use-check.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Linear.Token axioms remain.
  - allTypesUseCheckDone stays false.

  Greppable: SYSTEMS_LEAN_HOST, QTT-USE-CHECK-TYPED,
  QTT-USE-CHECK-BINDERS, QTT-USE-CHECK-TELESCOPE, QTT-USE-CHECK-TERM,
  QTT-USE-CHECK-LET, QTT-USE-CHECK-MATCH, QTT-USE-CHECK-MUTUAL,
  UseCheckTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.UseCheckTheorems
  Red/green: just systems-host.
  Host-presence GREEN is not lake GREEN.
  FullHost stays false.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.UseCheck

namespace SystemsLean.UseCheck

/-- Zero runtime uses of an erased id are ok. -/
theorem checkErasedAbsent_absent :
    checkErasedAbsent 0 = Check.ok := rfl

/-- One runtime use of an erased id is drop. -/
theorem checkErasedAbsent_once :
    checkErasedAbsent 1 = Check.drop := rfl

/-- Two runtime uses of an erased id are drop. -/
theorem checkErasedAbsent_many :
    checkErasedAbsent 2 = Check.drop := rfl

/-- Unused LINEAR binder is drop. -/
theorem checkGrade_linear_drop :
    checkGrade Grade.linear 0 = Check.drop := rfl

/-- One LINEAR use is ok. -/
theorem checkGrade_linear_ok :
    checkGrade Grade.linear 1 = Check.ok := rfl

/-- Two LINEAR uses is doubleSpend (illegal linear use, fail-closed). -/
theorem checkGrade_linear_doubleSpend :
    checkGrade Grade.linear 2 = Check.doubleSpend := rfl

/-- Unrestricted share of two uses is ok. -/
theorem checkGrade_share_ok :
    checkGrade Grade.share 2 = Check.ok := rfl

/-- Zero uses of an erased binder are ok. -/
theorem checkGrade_erased_absent :
    checkGrade Grade.erased 0 = Check.ok := rfl

/-- One runtime use of an erased binder is drop. -/
theorem checkGrade_erased_once :
    checkGrade Grade.erased 1 = Check.drop := rfl

/-- One LINEAR use of id 1 is ok on a typed log. -/
theorem checkTypedUse_linear_ok :
    checkTypedUse 1 Grade.linear
      [{ id := 1, grade := Grade.linear }] = Check.ok := rfl

/-- Two LINEAR uses of one id is illegal (doubleSpend). Fail-closed. -/
theorem checkTypedUse_illegal :
    checkTypedUse 1 Grade.linear
      [{ id := 1, grade := Grade.linear },
        { id := 1, grade := Grade.linear }]
    = Check.doubleSpend := rfl

/-- Mixed grades on one id fail closed (drop, not share-ok). -/
theorem checkTypedUse_mismatch :
    checkTypedUse 1 Grade.linear
      [{ id := 1, grade := Grade.share }] = Check.drop := rfl

/-- LINEAR once + share twice + erased zero is ok. Across types, not done. -/
theorem checkBinders_mixed_ok :
    checkBinders
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share },
        { id := 3, grade := Grade.erased }]
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share },
        { id := 2, grade := Grade.share }]
    = Check.ok := rfl

/-- Illegal LINEAR double use fails closed on the binders walk. -/
theorem checkBinders_illegal :
    checkBinders
      [{ id := 1, grade := Grade.linear }]
      [{ id := 1, grade := Grade.linear },
        { id := 1, grade := Grade.linear }]
    = Check.doubleSpend := rfl

/-- LINEAR once + share twice + erased unused is ok. Sequential, not done. -/
theorem checkTelescope_mixed_ok :
    checkTelescope
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share },
        { id := 3, grade := Grade.erased }]
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share },
        { id := 2, grade := Grade.share }]
    = Check.ok := rfl

/-- Use of LINEAR after it is spent is doubleSpend. Fail-closed. -/
theorem checkTelescope_spent :
    checkTelescope
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share }]
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share },
        { id := 1, grade := Grade.linear }]
    = Check.doubleSpend := rfl

/-- Unused LINEAR leftover in a mixed-grade telescope is drop. -/
theorem checkTelescope_linear_drop :
    checkTelescope
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share }]
      [{ id := 2, grade := Grade.share }]
    = Check.drop := rfl

/-- LINEAR once + share lam twice + unused erased. Term walk, not done. -/
theorem checkTerm_mixed_ok :
    checkTerm
      [{ id := 1, grade := Grade.linear },
        { id := 3, grade := Grade.erased }]
      (UseTerm.lam 2 Grade.share
        (UseTerm.app (UseTerm.var 1)
          (UseTerm.app (UseTerm.var 2) (UseTerm.var 2))))
    = Check.ok := rfl

/-- Use of LINEAR after it is spent, share in between, is doubleSpend. -/
theorem checkTerm_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share }]
      (UseTerm.app (UseTerm.var 1)
        (UseTerm.app (UseTerm.var 2) (UseTerm.var 1)))
    = Check.doubleSpend := rfl

/-- Unused LINEAR leftover with a used share lam is drop. -/
theorem checkTerm_linear_drop :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.lam 2 Grade.share (UseTerm.var 2))
    = Check.drop := rfl

/-- LINEAR used in a let value and again in the body is doubleSpend. -/
theorem checkTerm_let_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.letBind 2 Grade.share (UseTerm.var 1)
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
    = Check.doubleSpend := rfl

/-- LINEAR used in a match discriminee and again in a branch is doubleSpend. -/
theorem checkTerm_match_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.matchCase 2 Grade.share (UseTerm.var 1)
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
    = Check.doubleSpend := rfl

/-- LINEAR used in one mutual body and again in the other is doubleSpend. -/
theorem checkTerm_mutual_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.mutualBind 2 Grade.share 3 Grade.share
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 2))
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 3)))
    = Check.doubleSpend := rfl

end SystemsLean.UseCheck
