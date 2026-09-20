/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ExtractTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveExtractTheoremsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-EXTRACT-THEOREMS, liveExtractTheoremsSource,
  HOST-FRONT-LIVE-EXTRACT-THEOREMS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveExtractTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveExtractTheorems

/-- Dual-pinned live ExtractTheorems.lean bytes (must match on-disk file).
    Greppable: liveExtractTheoremsSource, PARSE-LIVE-EXTRACT-THEOREMS. -/
def liveExtractTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Extract EXTRACT-THEOREM + HOST-EXTRACT-THEOREM.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.Extract: theorems live here; RuntimeClaim,
  ofRuntimeTag?, checkFailClosed / extractOk / extractOkFromTags? stay in
  Extract. Same namespace SystemsLean.Extract so theorem names stay unqualified
  under that namespace.

  Spec (readable):
  - EXTRACT-THEOREM / HOST-EXTRACT-THEOREM: isFreestandingGoal_runtimeFs /
    isFreestandingGoal_classic_false / isFreestandingGoal_edge_false /
    extractOk_eq_checkFailClosed / extractOk_classic_reject /
    extractOk_edge_reject / extractOk_mult1_fs_false / extractOk_omega_fs_true /
    extractOk_mult0_unmarked_false / extractOk_mult0_marked_fs_true /
    ofRuntimeTag?_zero/one/two / ofRuntimeTag?_fail_closed /
    isValidRuntimeTag_eq_ofRuntimeTag?_isSome / isValidRuntimeTag_fail_closed /
    isValidRuntimeTag_zero/one/two / RuntimeClaim.name_* /
    ofRuntimeTag?_some_implies_isValidRuntimeTag /
    extractOkFromTags? known-tag success/fail + unknown none.
  - Partial Extract only: MULT-1 unminted reject; not SpecProof complete.

  These Extract theorems do NOT flip SpecProof.proofCompleteClaimed.
  The living SpecProof pin is already true. Extract theorems do not
  set that pin.
  Partial theorems on Extract != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Extract theorems do not flip SpecProof.proofCompleteClaimed
    (the living pin is already true). Not HOST_COMPOSE_V0 reimplementation.
  - Not full FAIL_CLOSED_CHECKER_V1 / slake_extract_with_checks parity
    (thin path has no live token; minted MULT-1 is HostCompose).

  Greppable: SYSTEMS_LEAN_HOST, EXTRACT-THEOREM, HOST-EXTRACT-THEOREM,
  isFreestandingGoal_runtimeFs, extractOk_classic_reject,
  ofRuntimeTag?_fail_closed, ofRuntimeTag?_some_implies_isValidRuntimeTag,
  extractOkFromTags?_mult1_fs_false, extractOkFromTags?_mult0_marked_fs_true,
  isValidRuntimeTag_zero, ExtractTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, EDGE-RUNTIME, RUNTIME-CLASSIC, EMIT-BOUNDARY, FAIL-CLOSED,
  FAIL_CLOSED_CHECKER_V1, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ExtractTheorems
  Red/green: just systems-host; lake build SystemsLean.ExtractTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Erasure
import SystemsLean.Extract

namespace SystemsLean.Extract

open SystemsLean.Mult (Mult)
open SystemsLean.Erasure (Erased)

/-! ### EXTRACT-THEOREM / HOST-EXTRACT-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is RUNTIME-FS-only
  extract / FAIL-CLOSED-UNKNOWN-RUNTIME and MULT-1 unminted reject honesty
  only. Does not complete SpecProof; does not claim residual free / freestanding
  product self-host complete / PROVABLY. Minted MULT-1 live path is HostCompose.
-/

/-- RUNTIME-FS is the freestanding product goal.
    Greppable: isFreestandingGoal_runtimeFs, RUNTIME-FS, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem isFreestandingGoal_runtimeFs :
    isFreestandingGoal RuntimeClaim.runtimeFs = true := rfl

/-- RUNTIME-CLASSIC is not freestanding product goal.
    Greppable: isFreestandingGoal_classic_false, RUNTIME-CLASSIC, EXTRACT-THEOREM. -/
theorem isFreestandingGoal_classic_false :
    isFreestandingGoal RuntimeClaim.runtimeClassic = false := rfl

/-- EDGE-RUNTIME is not freestanding product goal.
    Greppable: isFreestandingGoal_edge_false, EDGE-RUNTIME, EXTRACT-THEOREM. -/
theorem isFreestandingGoal_edge_false :
    isFreestandingGoal RuntimeClaim.edgeRuntime = false := rfl

/-- extractOk is definitionally checkFailClosed.
    Greppable: extractOk_eq_checkFailClosed, EXTRACT-THEOREM. -/
theorem extractOk_eq_checkFailClosed (m : Mult) (e : Erased) (c : RuntimeClaim) :
    extractOk m e c = checkFailClosed m e c := rfl

/-- RUNTIME-CLASSIC rejects product extract for any mult/erasure (EMIT-BOUNDARY).
    Greppable: extractOk_classic_reject, RUNTIME-CLASSIC, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem extractOk_classic_reject (m : Mult) (e : Erased) :
    extractOk m e RuntimeClaim.runtimeClassic = false := by
  unfold extractOk checkFailClosed isFreestandingGoal
  simp

/-- EDGE-RUNTIME rejects product extract for any mult/erasure (EMIT-BOUNDARY).
    Greppable: extractOk_edge_reject, EDGE-RUNTIME, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem extractOk_edge_reject (m : Mult) (e : Erased) :
    extractOk m e RuntimeClaim.edgeRuntime = false := by
  unfold extractOk checkFailClosed isFreestandingGoal
  simp

/-- MULT-1 under RUNTIME-FS rejects on thin Extract (no live-token evidence).
    Greppable: extractOk_mult1_fs_false, MULT-1, EXTRACT-THEOREM. -/
theorem extractOk_mult1_fs_false (e : Erased) :
    extractOk Mult.mult1 e RuntimeClaim.runtimeFs = false := rfl

/-- MULT-OMEGA under RUNTIME-FS always passes on thin Extract path.
    Greppable: extractOk_omega_fs_true, MULT-OMEGA, EXTRACT-THEOREM. -/
theorem extractOk_omega_fs_true (e : Erased) :
    extractOk Mult.multOmega e RuntimeClaim.runtimeFs = true := rfl

/-- MULT-0 unmarked fails closed under RUNTIME-FS (ERASE-NO-RUNTIME).
    Greppable: extractOk_mult0_unmarked_false, MULT-0, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem extractOk_mult0_unmarked_false :
    extractOk Mult.mult0 Erasure.unmarked RuntimeClaim.runtimeFs = false := rfl

/-- MULT-0 marked under RUNTIME-FS extracts OK.
    Greppable: extractOk_mult0_marked_fs_true, MULT-0, EXTRACT-THEOREM. -/
theorem extractOk_mult0_marked_fs_true :
    extractOk Mult.mult0 (Erasure.mark Erasure.unmarked) RuntimeClaim.runtimeFs =
      true := rfl

/-- Known raw tag 0 decodes to RUNTIME-FS.
    Greppable: ofRuntimeTag?_zero, EXTRACT-THEOREM. -/
theorem ofRuntimeTag?_zero :
    ofRuntimeTag? 0 = some RuntimeClaim.runtimeFs := rfl

/-- Known raw tag 1 decodes to RUNTIME-CLASSIC.
    Greppable: ofRuntimeTag?_one, EXTRACT-THEOREM. -/
theorem ofRuntimeTag?_one :
    ofRuntimeTag? 1 = some RuntimeClaim.runtimeClassic := rfl

/-- Known raw tag 2 decodes to EDGE-RUNTIME.
    Greppable: ofRuntimeTag?_two, EXTRACT-THEOREM. -/
theorem ofRuntimeTag?_two :
    ofRuntimeTag? 2 = some RuntimeClaim.edgeRuntime := rfl

/-- FAIL-CLOSED-UNKNOWN-RUNTIME: raw tags with n > 2 reject to none.
    Greppable: ofRuntimeTag?_fail_closed, FAIL-CLOSED-UNKNOWN-RUNTIME,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem ofRuntimeTag?_fail_closed (n : Nat) (h : 2 < n) : ofRuntimeTag? n = none := by
  cases n with
  | zero =>
    exact absurd h (by decide : Not (2 < 0))
  | succ n1 =>
    cases n1 with
    | zero =>
      exact absurd h (by decide : Not (2 < 1))
    | succ n2 =>
      cases n2 with
      | zero =>
        exact absurd h (by decide : Not (2 < 2))
      | succ _ =>
        rfl

/-- isValidRuntimeTag is definitionally ofRuntimeTag? isSome.
    Greppable: isValidRuntimeTag_eq_ofRuntimeTag?_isSome, EXTRACT-THEOREM. -/
theorem isValidRuntimeTag_eq_ofRuntimeTag?_isSome (n : Nat) :
    isValidRuntimeTag n = (ofRuntimeTag? n).isSome := rfl

/-- FAIL-CLOSED-UNKNOWN-RUNTIME on isValidRuntimeTag: n > 2 is false.
    Greppable: isValidRuntimeTag_fail_closed, FAIL-CLOSED-UNKNOWN-RUNTIME,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem isValidRuntimeTag_fail_closed (n : Nat) (h : 2 < n) :
    isValidRuntimeTag n = false := by
  unfold isValidRuntimeTag
  rw [ofRuntimeTag?_fail_closed n h]
  rfl

/-- RuntimeClaim.name honesty for freestanding product goal.
    Greppable: RuntimeClaim.name_runtimeFs, RUNTIME-FS, EXTRACT-THEOREM. -/
theorem RuntimeClaim.name_runtimeFs :
    RuntimeClaim.name RuntimeClaim.runtimeFs = "RUNTIME-FS" := rfl

/-- RuntimeClaim.name honesty for classic managed residual.
    Greppable: RuntimeClaim.name_runtimeClassic, RUNTIME-CLASSIC, EXTRACT-THEOREM. -/
theorem RuntimeClaim.name_runtimeClassic :
    RuntimeClaim.name RuntimeClaim.runtimeClassic = "RUNTIME-CLASSIC" := rfl

/-- RuntimeClaim.name honesty for edge managed residual.
    Greppable: RuntimeClaim.name_edgeRuntime, EDGE-RUNTIME, EXTRACT-THEOREM. -/
theorem RuntimeClaim.name_edgeRuntime :
    RuntimeClaim.name RuntimeClaim.edgeRuntime = "EDGE-RUNTIME" := rfl

/-- Unknown mult tag fails closed on raw-tag extract path.
    Greppable: extractOkFromTags?_unknown_mult_none, EXTRACT-THEOREM. -/
theorem extractOkFromTags?_unknown_mult_none :
    extractOkFromTags? 3 false 0 = none := rfl

/-- Unknown runtime tag fails closed on raw-tag extract path.
    Greppable: extractOkFromTags?_unknown_runtime_none, EXTRACT-THEOREM. -/
theorem extractOkFromTags?_unknown_runtime_none :
    extractOkFromTags? 1 false 3 = none := rfl

/-- Known raw tags 0/1/2 are valid runtime tags.
    Greppable: isValidRuntimeTag_zero, isValidRuntimeTag_one, isValidRuntimeTag_two,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem isValidRuntimeTag_zero : isValidRuntimeTag 0 = true := rfl
theorem isValidRuntimeTag_one : isValidRuntimeTag 1 = true := rfl
theorem isValidRuntimeTag_two : isValidRuntimeTag 2 = true := rfl

/-- Successful ofRuntimeTag? decode implies isValidRuntimeTag true
    (no soft unknown pass; mirrors Mult.ofNat?_some_implies_isValidTag).
    Greppable: ofRuntimeTag?_some_implies_isValidRuntimeTag,
    FAIL-CLOSED-UNKNOWN-RUNTIME, EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem ofRuntimeTag?_some_implies_isValidRuntimeTag (n : Nat) (c : RuntimeClaim)
    (h : ofRuntimeTag? n = some c) : isValidRuntimeTag n = true := by
  unfold isValidRuntimeTag
  rw [h]
  rfl

/-- Known tags MULT-1 + RUNTIME-FS reject (no live-token evidence).
    Greppable: extractOkFromTags?_mult1_fs_false, MULT-1, RUNTIME-FS,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_mult1_fs_false (erasedMarked : Bool) :
    extractOkFromTags? 1 erasedMarked 0 = some false := by
  cases erasedMarked <;> rfl

/-- Known tags MULT-OMEGA + RUNTIME-FS extract OK.
    Greppable: extractOkFromTags?_omega_fs_true, MULT-OMEGA, RUNTIME-FS,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_omega_fs_true (erasedMarked : Bool) :
    extractOkFromTags? 2 erasedMarked 0 = some true := by
  cases erasedMarked <;> rfl

/-- Known tags MULT-0 unmarked + RUNTIME-FS fails closed (some false).
    Greppable: extractOkFromTags?_mult0_unmarked_fs_false, MULT-0, ERASE-NO-RUNTIME,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_mult0_unmarked_fs_false :
    extractOkFromTags? 0 false 0 = some false := rfl

/-- Known tags MULT-0 marked + RUNTIME-FS extract OK.
    Greppable: extractOkFromTags?_mult0_marked_fs_true, MULT-0, RUNTIME-FS,
    EXTRACT-THEOREM, HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_mult0_marked_fs_true :
    extractOkFromTags? 0 true 0 = some true := rfl

/-- MULT-1 + RUNTIME-CLASSIC rejects product extract (some false; EMIT-BOUNDARY).
    Greppable: extractOkFromTags?_classic_reject, RUNTIME-CLASSIC, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_classic_reject :
    extractOkFromTags? 1 false 1 = some false := rfl

/-- MULT-1 + EDGE-RUNTIME rejects product extract (some false; EMIT-BOUNDARY).
    Greppable: extractOkFromTags?_edge_reject, EDGE-RUNTIME, EXTRACT-THEOREM,
    HOST-EXTRACT-THEOREM. -/
theorem extractOkFromTags?_edge_reject :
    extractOkFromTags? 1 false 2 = some false := rfl

/-- Both unknown mult and runtime tags fail closed (none).
    Greppable: extractOkFromTags?_both_unknown_none, EXTRACT-THEOREM. -/
theorem extractOkFromTags?_both_unknown_none :
    extractOkFromTags? 3 false 3 = none := rfl

end SystemsLean.Extract
"#

end SystemsLean.HostFrontLiveExtractTheorems
