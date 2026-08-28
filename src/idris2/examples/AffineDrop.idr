||| Algorithm id: AffineDrop
||| Side: Idris 2 (native Quantitative Type Theory grades + edge honesty)
||| Pair: Lean dual sketch at src/lean4/examples/AffineDrop.lean
|||
||| Focus: EDGE-AFFINE -- affine ownership (at most once) vs Idris public grades.
|||
||| Product talk (Systems Lean): affine = at most once. A resource may be
||| dropped without use, or used once. Double-use is rejected. That is between
||| MULT-1 (exact once; drop fails LinearCheck) and MULT-OMEGA (free copy/drop).
|||
||| Idris public grades are 0 / exact-once 1 / unrestricted only -- no
||| first-class affine quantity. Greppable: AFFINE-NOT-FIRST-CLASS, EDGE-AFFINE.
||| This dual documents the edge with a behavioral inventory sketch. It is not
||| a freestanding product affine ABI and not freestanding C emit.
|||
||| Related duals:
|||   MULT-1     -- ConsumeToken / LinearPairSwap (exact once; no drop)
|||   MULT-OMEGA -- UnrestrictedShare (free drop and multi-use)
|||
||| Trusted computing base honesty (not freestanding product):
|||   Typechecking under stock Idris 2 still leaves a managed backend runtime
|||   in the trust base. This file is a correspondence seed, not Slake emit.
|||
||| Prefer: idris2 --check examples/AffineDrop.idr  (when idris2 is on PATH)
module AffineDrop

%default total

------------------------------------------------------------------------
-- Honesty pins (EDGE-AFFINE / AFFINE-NOT-FIRST-CLASS)
------------------------------------------------------------------------

||| Greppable edge id: Systems product affine vs Idris public grades.
public export
edgeAffineId : String
edgeAffineId = "EDGE-AFFINE"

||| Greppable pin: Idris has no first-class affine quantity on public grades.
public export
affineNotFirstClassId : String
affineNotFirstClassId = "AFFINE-NOT-FIRST-CLASS"

||| True when honesty pins spell the expected tokens.
public export
demoHonestyPins : Bool
demoHonestyPins =
  (edgeAffineId == "EDGE-AFFINE")
    && (affineNotFirstClassId == "AFFINE-NOT-FIRST-CLASS")

------------------------------------------------------------------------
-- MULT-OMEGA contrast -- unrestricted free drop (real Idris grade)
------------------------------------------------------------------------

||| Unrestricted Nat may be dropped (first argument unused). MULT-OMEGA class.
public export
unrestrictedDropLeft : Nat -> Nat -> Nat
unrestrictedDropLeft _ y = y

||| Demo: unrestricted drop is allowed (not affine enforcement).
public export
demoUnrestrictedDrop : Bool
demoUnrestrictedDrop = unrestrictedDropLeft 99 7 == 7

------------------------------------------------------------------------
-- Behavioral affine inventory (NOT an Idris grade -- EDGE-AFFINE sketch)
------------------------------------------------------------------------

||| Affine resource states for honesty demos only.
||| Live holds payload; Consumed means used once; Dropped means discarded
||| without use. Not a fourth Idris public grade.
public export
data AffineRes : Type where
  Live : Nat -> AffineRes
  Consumed : AffineRes
  Dropped : AffineRes

||| Equality for demo comparisons under idris2 --check.
public export
Eq AffineRes where
  (Live a) == (Live b) = a == b
  Consumed == Consumed = True
  Dropped == Dropped = True
  _ == _ = False

||| Mint a live affine resource from unrestricted data (sketch only).
public export
mkAffine : Nat -> AffineRes
mkAffine n = Live n

||| Use once: Live -> payload + Consumed. Fail closed if not Live.
public export
useOnce : AffineRes -> Maybe (Nat, AffineRes)
useOnce (Live n) = Just (n, Consumed)
useOnce Consumed = Nothing
useOnce Dropped = Nothing

||| Drop without use: Live -> Dropped. Already Dropped stays Dropped.
||| Consumed cannot be dropped (already used once). Fail closed.
public export
dropAffine : AffineRes -> Maybe AffineRes
dropAffine (Live _) = Just Dropped
dropAffine Dropped = Just Dropped
dropAffine Consumed = Nothing

||| Double-use of the same live resource is rejected (second use fails).
public export
doubleUseReject : AffineRes -> Bool
doubleUseReject r =
  case useOnce r of
    Nothing => True
    Just (_, r1) =>
      case useOnce r1 of
        Nothing => True
        Just _ => False

------------------------------------------------------------------------
-- Composed demos (affine at-most-once sketch)
------------------------------------------------------------------------

||| Drop without use succeeds (affine allows discard; linear would not).
public export
demoAffineDrop : Bool
demoAffineDrop =
  case dropAffine (mkAffine 3) of
    Just Dropped => True
    _ => False

||| Use once succeeds; resource becomes Consumed.
public export
demoAffineUseOnce : Bool
demoAffineUseOnce =
  case useOnce (mkAffine 5) of
    Just (5, Consumed) => True
    _ => False

||| After use once, a second use is rejected (at most once).
public export
demoAffineNoDoubleUse : Bool
demoAffineNoDoubleUse = doubleUseReject (mkAffine 1)

||| After use once, drop is rejected (resource already consumed).
public export
demoNoDropAfterUse : Bool
demoNoDropAfterUse =
  case useOnce (mkAffine 2) of
    Just (_, r1) =>
      case dropAffine r1 of
        Nothing => True
        Just _ => False
    Nothing => False

||| Bundle: pins + unrestricted contrast + affine at-most-once demos.
public export
demoAffineDropBundle : Bool
demoAffineDropBundle =
  demoHonestyPins
    && demoUnrestrictedDrop
    && demoAffineDrop
    && demoAffineUseOnce
    && demoAffineNoDoubleUse
    && demoNoDropAfterUse

------------------------------------------------------------------------
-- Intentional non-examples (do not uncomment -- LinearCheck must fail)
------------------------------------------------------------------------

-- MULT-1 exact-once cannot drop a linear token without use:
--   dropLinearToken : (1 t : Token) -> Nat
--   dropLinearToken t = Z
-- would fail LinearCheck. See ConsumeToken intentional non-examples.
-- That gap is EDGE-AFFINE: product affine would allow drop; Idris MULT-1 does not.
--
-- This module does not invent a real Idris affine binder. AFFINE-NOT-FIRST-CLASS.
