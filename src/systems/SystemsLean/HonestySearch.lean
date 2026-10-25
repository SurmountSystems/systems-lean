/-
  Module: SystemsLean.HonestySearch
  The accept check for the stored let rec search.
  The body is HonestyLetRec.ssotBody. It is not some of a bare newline.
  The search is stored. It is not run.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyLetRec

namespace SystemsLean.HonestySearch

open SystemsLean.HostTerm

def patEq : Pat -> Pat -> Bool
  | Pat.wild, Pat.wild => true
  | Pat.litNat a, Pat.litNat b => a == b
  | Pat.var a, Pat.var b => a == b
  | Pat.ctor0 a, Pat.ctor0 b => a == b
  | Pat.someVar a, Pat.someVar b => a == b
  | _, _ => false

mutual

def fieldsEq : List (Prod Name Term) -> List (Prod Name Term) -> Bool
  | [], [] => true
  | (a, x) :: xs, (b, y) :: ys =>
    a == b && termEq x y && fieldsEq xs ys
  | _, _ => false

def armsEq : List (Prod Pat Term) -> List (Prod Pat Term) -> Bool
  | [], [] => true
  | (p, x) :: xs, (q, y) :: ys =>
    patEq p q && termEq x y && armsEq xs ys
  | _, _ => false

def termEq : Term -> Term -> Bool
  | Term.var a, Term.var b => a == b
  | Term.litNat a, Term.litNat b => a == b
  | Term.litString a, Term.litString b => a == b
  | Term.litBool a, Term.litBool b => a == b
  | Term.const a, Term.const b => a == b
  | Term.app f a, Term.app g b => termEq f g && termEq a b
  | Term.some_ a, Term.some_ b => termEq a b
  | Term.none_, Term.none_ => true
  | Term.match_ s xs, Term.match_ t ys =>
    termEq s t && armsEq xs ys
  | Term.ite a b c, Term.ite d e f =>
    termEq a d && termEq b e && termEq c f
  | Term.structLit xs, Term.structLit ys => fieldsEq xs ys
  | Term.decideEq a b, Term.decideEq c d =>
    termEq a c && termEq b d
  | Term.proj a f, Term.proj b g => termEq a b && f == g
  | _, _ => false

end

/-- Agree with the stored search. A bare newline some does not. -/
def searchStored (body : Term) (content name : String) : Bool :=
  termEq body (SystemsLean.HonestyLetRec.ssotBody content name)

end SystemsLean.HonestySearch
