||| Algorithm id: FailClosedGrade
||| Side: Idris 2 (native Quantitative Type Theory grades)
||| Pair: Lean dual sketch at src/lean4/examples/FailClosedGrade.lean
|||
||| Focus: FAIL-CLOSED-UNKNOWN-GRADE -- raw Mult tags accept only 0 / 1 / 2
||| (MULT-0 / MULT-1 / MULT-OMEGA). Unknown tags reject; no coerce to omega.
|||
||| Related grades (use patterns live in other duals):
|||   MULT-0     -- erased (see ErasedIndex)
|||   MULT-1     -- linear exact-once (see ConsumeToken)
|||   MULT-OMEGA -- unrestricted (see UnrestrictedShare)
|||
||| Trusted computing base honesty (not freestanding product):
|||   Typechecking under stock Idris 2 still leaves a managed backend runtime
|||   in the trust base. This file is a correspondence seed, not Slake emit.
|||
||| Prefer: idris2 --check examples/FailClosedGrade.idr  (when idris2 is on PATH)
module FailClosedGrade

%default total

------------------------------------------------------------------------
-- Closed Mult grade set (product freestanding 0 / 1 / omega only)
------------------------------------------------------------------------

||| Product freestanding grades only. Unknown raw tags never inhabit this type
||| via ofTag; decode fail-closed lives on ofTag / isValidTag.
public export
data Mult : Type where
  Mult0 : Mult
  Mult1 : Mult
  MultOmega : Mult

||| Equality for demo comparisons (Maybe Mult needs Eq Mult under idris2 --check).
public export
Eq Mult where
  Mult0 == Mult0 = True
  Mult1 == Mult1 = True
  MultOmega == MultOmega = True
  _ == _ = False

||| Greppable grade names (contract surface; matches host Mult.name shape).
public export
name : Mult -> String
name Mult0 = "MULT-0"
name Mult1 = "MULT-1"
name MultOmega = "MULT-OMEGA"

------------------------------------------------------------------------
-- FAIL-CLOSED-UNKNOWN-GRADE -- raw tag decode
------------------------------------------------------------------------

||| Decode freestanding C-aligned tags: 0 = MULT-0, 1 = MULT-1, 2 = MULT-OMEGA.
||| Unknown tags return Nothing (fail closed; no coerce to MultOmega or Mult0).
public export
ofTag : Nat -> Maybe Mult
ofTag 0 = Just Mult0
ofTag 1 = Just Mult1
ofTag 2 = Just MultOmega
ofTag _ = Nothing

||| True only for known raw tags 0 / 1 / 2.
public export
isValidTag : Nat -> Bool
isValidTag n = case ofTag n of
  Just _ => True
  Nothing => False

||| Typed Mult is always valid (closed inductive). Unknown grades cannot inhabit Mult.
public export
isValid : Mult -> Bool
isValid Mult0 = True
isValid Mult1 = True
isValid MultOmega = True

------------------------------------------------------------------------
-- Composed demos (known accept + unknown reject)
------------------------------------------------------------------------

||| Known tags decode to expected names.
public export
demoKnownNames : Bool
demoKnownNames =
  (map name (ofTag 0) == Just "MULT-0")
    && (map name (ofTag 1) == Just "MULT-1")
    && (map name (ofTag 2) == Just "MULT-OMEGA")

||| Unknown tags reject (fail closed).
public export
demoUnknownReject : Bool
demoUnknownReject =
  (ofTag 3 == Nothing)
    && (ofTag 99 == Nothing)
    && (isValidTag 3 == False)
    && (isValidTag 0 == True)

||| Bundle demo: known names + unknown reject.
public export
demoFailClosed : Bool
demoFailClosed = demoKnownNames && demoUnknownReject
