/-
  Module: SystemsLean.ToSafeC
  toSafeC correspondence from specification 0002 Clause 3.52
  (accessed 2026-10-23). One direction sends a Rust judgment to a
  SafeC judgment or to no judgment. The map is a statement. It is
  not an isomorphism theorem. Both maps stay partial until a gate
  says they are total on a named fragment and compose to identity.
  Sample stays none. Send and Sync are not finished models.
  No theorem named Isomorphism. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.SafeCJudgment

namespace SystemsLean.ToSafeC

open SystemsLean.SafeCJudgment (SafeCJudgment RustJudgment)

/-- Honesty: this module does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- toSafeC is a statement. Clause 3.52 and Clause 4.5 item 15. -/
def toSafeC : RustJudgment -> Option SafeCJudgment
  | RustJudgment.sample => none
  | RustJudgment.box => some SafeCJudgment.uniqueBlock
  | RustJudgment.rc => some SafeCJudgment.sharedOwnerWithHeader
  | RustJudgment.arc => some SafeCJudgment.sharedOwnerWithHeader
  | RustJudgment.cow => some SafeCJudgment.borrowOrOwned
  | RustJudgment.vec => some SafeCJudgment.uniqueBlockBuffer
  | RustJudgment.pin => some SafeCJudgment.pinned
  | RustJudgment.send => none
  | RustJudgment.sync => none

/-- Named correspondence table. Not an isomorphism. Clause 6.4 item 71. -/
def rustBoxMapsToUniqueBlock : Bool := true

def rustRcMapsToSharedOwnerWithHeader : Bool := true

def rustArcMapsToSharedOwnerWithHeader : Bool := true

def rustCowMapsToBorrowOrOwned : Bool := true

def rustVecMapsToUniqueBlockBuffer : Bool := true

def rustPinMapsToPinned : Bool := true

/-- Send and Sync are not finished models. Clause 6.4 item 71. -/
def sendSyncAreFinishedModels : Bool := false

/-- Sample stays none. Maps remain partial. -/
theorem to_safe_c_on_sample_is_none :
    toSafeC RustJudgment.sample = none := rfl

theorem to_safe_c_box_is_unique_block :
    toSafeC RustJudgment.box = some SafeCJudgment.uniqueBlock := rfl

theorem to_safe_c_rc_is_shared_owner :
    toSafeC RustJudgment.rc = some SafeCJudgment.sharedOwnerWithHeader := rfl

theorem to_safe_c_arc_is_shared_owner :
    toSafeC RustJudgment.arc = some SafeCJudgment.sharedOwnerWithHeader := rfl

theorem to_safe_c_cow_is_borrow_or_owned :
    toSafeC RustJudgment.cow = some SafeCJudgment.borrowOrOwned := rfl

theorem to_safe_c_vec_is_unique_block_buffer :
    toSafeC RustJudgment.vec = some SafeCJudgment.uniqueBlockBuffer := rfl

theorem to_safe_c_pin_is_pinned :
    toSafeC RustJudgment.pin = some SafeCJudgment.pinned := rfl

theorem to_safe_c_send_is_none :
    toSafeC RustJudgment.send = none := rfl

theorem to_safe_c_sync_is_none :
    toSafeC RustJudgment.sync = none := rfl

/-- toSafeC is not an isomorphism. Partial on sample, send, and sync. -/
def toSafeCIsomorphism : Bool := false

def mashToSafeCIsomorphism : Prop :=
  toSafeCIsomorphism = true

def mashToSafeCIsomorphismIsFalse : Prop :=
  mashToSafeCIsomorphism -> False

theorem mash_to_safe_c_isomorphism_is_false :
    mashToSafeCIsomorphismIsFalse := by
  intro h
  exact Bool.noConfusion h

end SystemsLean.ToSafeC
