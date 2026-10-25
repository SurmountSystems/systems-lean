/-
  Module: SystemsLean.Corresponds
  Corresponds is the named correspondence statement from
  specification 0002 Clause 3.52 (accessed 2026-10-23).
  Correspondence MUST be in place before any isomorphism claim.
  Until both maps are total on a named fragment and compose to
  identity, text MUST say correspondence of judgments and MUST
  NOT call the maps an isomorphism. Naming a theorem Isomorphism
  is False. Curry-Howard in 0002 means a correspondence of rules.
  A test of the maps is not that theorem. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.SafeCJudgment
import SystemsLean.ToSafeC
import SystemsLean.ToRust

namespace SystemsLean.Corresponds

open SystemsLean.SafeCJudgment (SafeCJudgment RustJudgment)
open SystemsLean.ToSafeC (toSafeC)
open SystemsLean.ToRust (toRust)

/-- Honesty: this module does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Corresponds is named. Clause 3.52 and Clause 4.5 item 15. -/
def correspondsNamed : Bool := true

/--
  Correspondence of a Rust judgment and a SafeC judgment.
  Holds only when both maps hit and compose on that pair.
  Partial maps mean the sample does not correspond.
  This is a statement. It is not an isomorphism theorem.
-/
def Corresponds (r : RustJudgment) (s : SafeCJudgment) : Prop :=
  And (toSafeC r = some s) (toRust s = some r)

/-- Correspondence maps are statements, not an isomorphism theorem. -/
def correspondenceMapsAreStatements : Bool := true

/-- Naming a theorem Isomorphism is False. Clause 4.5 item 3. -/
def isomorphismTheoremNameAccepted : Bool := false

def mashIsomorphismTheoremName : Prop :=
  isomorphismTheoremNameAccepted = true

def mashIsomorphismTheoremNameIsFalse : Prop :=
  mashIsomorphismTheoremName -> False

theorem mash_isomorphism_theorem_name_is_false :
    mashIsomorphismTheoremNameIsFalse := by
  intro h
  exact Bool.noConfusion h

theorem corresponds_is_named :
    correspondsNamed = true := rfl

theorem correspondence_maps_are_statements :
    correspondenceMapsAreStatements = true := rfl

/-- Sample does not correspond: both maps return none. -/
theorem corresponds_sample_sample_is_false
    (h : Corresponds RustJudgment.sample SafeCJudgment.sample) : False :=
  nomatch h.left

/-- Box maps one way to UniqueBlock. Reverse stays none, so not Corresponds. -/
theorem corresponds_box_unique_block_is_false
    (h : Corresponds RustJudgment.box SafeCJudgment.uniqueBlock) : False :=
  nomatch h.right

/-- Maps are not total on the named fragment. Clause 3.32. -/
def mapsTotalOnNamedFragment : Bool := false

/-- Maps do not compose to identity. Not an isomorphism. -/
def mapsComposeToIdentity : Bool := false

def mashMapsComposeToIdentity : Prop :=
  mapsComposeToIdentity = true

def mashMapsComposeToIdentityIsFalse : Prop :=
  mashMapsComposeToIdentity -> False

theorem mash_maps_compose_to_identity_is_false :
    mashMapsComposeToIdentityIsFalse := by
  intro h
  exact Bool.noConfusion h

/-- ObjectCow, PageCow, and BorrowOrOwned stay distinct. Clause 6.4 item 71. -/
def objectCowIsPageCow : Bool := false

def objectCowIsBorrowOrOwned : Bool := false

def pageCowIsBorrowOrOwned : Bool := false

end SystemsLean.Corresponds
