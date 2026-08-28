||| Algorithm id: AffineOwn
||| Side: Idris 2 (EDGE-AFFINE product ownership deepen)
||| Pair: Lean dual sketch at src/lean4/examples/AffineOwn.lean
|||
||| Focus: product ownership deepen beyond Wave 1 B AffineDrop.
||| AffineDrop names single-resource at-most-once (drop or use once).
||| AffineOwn names multi-resource product ownership shapes freestanding
||| Systems Lean would care about later: two affine resources, use one and
||| drop the other, drop both unused, reject double-use. Not freestanding C.
|||
||| EDGE-AFFINE: product talk includes affine (at most once). Idris public
||| grades are 0 / exact-once 1 / unrestricted -- no first-class affine.
||| Greppable: EDGE-AFFINE, AFFINE-NOT-FIRST-CLASS, AffineOwn, PRODUCT-OWN.
|||
||| Related duals:
|||   AffineDrop     -- single affine inventory (drop / use once)
|||   LinearPairSwap -- two MULT-1 resources (exact once; no free drop)
|||   UnrestrictedShare -- MULT-OMEGA free multi-use
|||
||| Trusted computing base honesty (not freestanding product):
|||   Typechecking under stock Idris 2 still leaves a managed backend runtime
|||   in the trust base. This file is a correspondence seed, not Slake emit.
|||
||| Prefer: idris2 --check examples/AffineOwn.idr  (when idris2 is on PATH)
module AffineOwn

%default total

------------------------------------------------------------------------
-- Honesty pins (EDGE-AFFINE / product ownership)
------------------------------------------------------------------------

||| Greppable edge id: Systems product affine vs Idris public grades.
public export
edgeAffineId : String
edgeAffineId = "EDGE-AFFINE"

||| Greppable pin: Idris has no first-class affine quantity on public grades.
public export
affineNotFirstClassId : String
affineNotFirstClassId = "AFFINE-NOT-FIRST-CLASS"

||| Greppable product ownership story id (dual honesty, not freestanding ABI).
public export
productOwnId : String
productOwnId = "PRODUCT-OWN"

||| True when honesty pins spell the expected tokens.
public export
demoHonestyPins : Bool
demoHonestyPins =
  (edgeAffineId == "EDGE-AFFINE")
    && (affineNotFirstClassId == "AFFINE-NOT-FIRST-CLASS")
    && (productOwnId == "PRODUCT-OWN")

------------------------------------------------------------------------
-- Behavioral affine resource (same inventory shape as AffineDrop)
------------------------------------------------------------------------

||| Affine resource states for product-ownership demos only.
||| Not a fourth Idris public grade and not freestanding product affine ABI.
public export
data AffineRes : Type where
  Live : Nat -> AffineRes
  Consumed : AffineRes
  Dropped : AffineRes

public export
Eq AffineRes where
  (Live a) == (Live b) = a == b
  Consumed == Consumed = True
  Dropped == Dropped = True
  _ == _ = False

public export
mkAffine : Nat -> AffineRes
mkAffine n = Live n

||| Use once: Live -> payload + Consumed. Fail closed if not Live.
public export
useOnce : AffineRes -> Maybe (Nat, AffineRes)
useOnce (Live n) = Just (n, Consumed)
useOnce Consumed = Nothing
useOnce Dropped = Nothing

||| Drop without use: Live -> Dropped. Consumed cannot drop (already used).
public export
dropAffine : AffineRes -> Maybe AffineRes
dropAffine (Live _) = Just Dropped
dropAffine Dropped = Just Dropped
dropAffine Consumed = Nothing

------------------------------------------------------------------------
-- Multi-resource product ownership (two affine resources)
------------------------------------------------------------------------

||| Pair of affine resources (product ownership surface; sketch only).
public export
data AffPair : Type where
  MkAffPair : AffineRes -> AffineRes -> AffPair

public export
mkAffPair : Nat -> Nat -> AffPair
mkAffPair x y = MkAffPair (mkAffine x) (mkAffine y)

||| Use left, drop right (product ownership choice: keep left payload).
||| Greppable: useLeftDropRight, AffineOwn, PRODUCT-OWN.
public export
useLeftDropRight : AffPair -> Maybe (Nat, AffPair)
useLeftDropRight (MkAffPair l r) =
  case useOnce l of
    Nothing => Nothing
    Just (n, l1) =>
      case dropAffine r of
        Nothing => Nothing
        Just r1 => Just (n, MkAffPair l1 r1)

||| Use right, drop left (symmetric ownership choice).
public export
useRightDropLeft : AffPair -> Maybe (Nat, AffPair)
useRightDropLeft (MkAffPair l r) =
  case dropAffine l of
    Nothing => Nothing
    Just l1 =>
      case useOnce r of
        Nothing => Nothing
        Just (n, r1) => Just (n, MkAffPair l1 r1)

||| Drop both unused (affine allows discard of both; linear pair would not).
public export
dropBoth : AffPair -> Maybe AffPair
dropBoth (MkAffPair l r) =
  case dropAffine l of
    Nothing => Nothing
    Just l1 =>
      case dropAffine r of
        Nothing => Nothing
        Just r1 => Just (MkAffPair l1 r1)

------------------------------------------------------------------------
-- Composed demos (product ownership)
------------------------------------------------------------------------

||| Use left drop right yields left payload; right is Dropped.
public export
demoUseLeftDropRight : Bool
demoUseLeftDropRight =
  case useLeftDropRight (mkAffPair 3 9) of
    Just (3, MkAffPair Consumed Dropped) => True
    _ => False

||| Use right drop left yields right payload; left is Dropped.
public export
demoUseRightDropLeft : Bool
demoUseRightDropLeft =
  case useRightDropLeft (mkAffPair 3 9) of
    Just (9, MkAffPair Dropped Consumed) => True
    _ => False

||| Drop both unused succeeds (affine product ownership allows discard).
public export
demoDropBoth : Bool
demoDropBoth =
  case dropBoth (mkAffPair 1 2) of
    Just (MkAffPair Dropped Dropped) => True
    _ => False

||| After use left, a second use of left is rejected (at most once).
public export
demoNoDoubleUseLeft : Bool
demoNoDoubleUseLeft =
  case useLeftDropRight (mkAffPair 4 5) of
    Just (_, MkAffPair l1 _) =>
      case useOnce l1 of
        Nothing => True
        Just _ => False
    Nothing => False

||| After drop both, use of either side fails (already Dropped).
public export
demoNoUseAfterDropBoth : Bool
demoNoUseAfterDropBoth =
  case dropBoth (mkAffPair 6 7) of
    Just (MkAffPair l1 r1) =>
      case useOnce l1 of
        Just _ => False
        Nothing =>
          case useOnce r1 of
            Nothing => True
            Just _ => False
    Nothing => False

||| Bundle: pins + multi-resource product ownership demos.
public export
demoAffineOwnBundle : Bool
demoAffineOwnBundle =
  demoHonestyPins
    && demoUseLeftDropRight
    && demoUseRightDropLeft
    && demoDropBoth
    && demoNoDoubleUseLeft
    && demoNoUseAfterDropBoth

------------------------------------------------------------------------
-- Intentional non-examples and product non-claims
------------------------------------------------------------------------

-- MULT-1 LinearPairSwap cannot drop a linear token without use (LinearCheck).
-- AffineOwn product ownership allows dropBoth / use-one-drop-other sketches.
-- That gap is EDGE-AFFINE: product affine would allow discard; Idris MULT-1 does not.
--
-- This module does not invent a real Idris affine binder (AFFINE-NOT-FIRST-CLASS).
-- Not freestanding product affine ABI. Not host JOIN-ALG-USE. Not HostModuleCheck.
-- Not freestanding C under out/freestanding-c. PRODUCT-OWN is dual honesty only.
