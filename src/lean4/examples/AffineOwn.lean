/-
  Algorithm id: AffineOwn
  Side: Lean 4 (classic) dual -- behavioral sketch + contracts
  Pair: Idris native AffineOwn at src/idris2/examples/AffineOwn.idr
  Trust: examples/TRUST.md -- classic ahead-of-time still has managed runtime residual.
  Not freestanding. Not product C emit. Not PROVABLY. Not full product affine ABI.

  Spec (readable, separate from any future proof):
  - Product ownership deepen beyond Wave 1 B AffineDrop (single drop / use once).
  - AffPair: two affine resources; useLeftDropRight / useRightDropLeft / dropBoth.
  - EDGE-AFFINE + AFFINE-NOT-FIRST-CLASS + PRODUCT-OWN honesty pins.
  - Classic Lean does not enforce at-most-once; this is a behavioral sketch only.
  - Contrast LinearPairSwap (exact once; no free drop) and UnrestrictedShare (free multi-use).
  - Not host JOIN-ALG-USE. Not HostModuleCheck. Not freestanding product affine ABI.

  Red/green: just lean-side presence gate; Lake when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.LeanBridge.AffineOwn

/-- Greppable edge id: Systems product affine vs Idris public grades. -/
def edgeAffineId : String := "EDGE-AFFINE"

/-- Greppable pin: Idris has no first-class affine quantity on public grades. -/
def affineNotFirstClassId : String := "AFFINE-NOT-FIRST-CLASS"

/-- Greppable product ownership story id (dual honesty, not freestanding ABI). -/
def productOwnId : String := "PRODUCT-OWN"

/-- True when honesty pins spell the expected tokens. -/
def demoHonestyPins : Bool :=
  (edgeAffineId == "EDGE-AFFINE")
    && (affineNotFirstClassId == "AFFINE-NOT-FIRST-CLASS")
    && (productOwnId == "PRODUCT-OWN")

/--
  Affine resource states for product-ownership demos only.
  Live holds payload; Consumed means used once; Dropped means discarded without use.
  Not freestanding product affine ABI.
-/
inductive AffineRes where
  | live (n : Nat)
  | consumed
  | dropped
  deriving DecidableEq, Repr

/-- Mint a live affine resource from unrestricted data (sketch only). -/
def mkAffine (n : Nat) : AffineRes := AffineRes.live n

/-- Use once: live -> payload + consumed. Fail closed if not live. -/
def useOnce : AffineRes -> Option (Prod Nat AffineRes)
  | AffineRes.live n => some (n, AffineRes.consumed)
  | AffineRes.consumed => none
  | AffineRes.dropped => none

/-- Drop without use: live -> dropped. Consumed cannot drop. Fail closed. -/
def dropAffine : AffineRes -> Option AffineRes
  | AffineRes.live _ => some AffineRes.dropped
  | AffineRes.dropped => some AffineRes.dropped
  | AffineRes.consumed => none

/-- Pair of affine resources (product ownership surface; sketch only). -/
structure AffPair where
  left : AffineRes
  right : AffineRes
  deriving DecidableEq, Repr

/-- Build a pair of live affine resources. -/
def mkAffPair (x y : Nat) : AffPair :=
  { left := mkAffine x, right := mkAffine y }

/--
  Use left, drop right (product ownership choice: keep left payload).
  Greppable: useLeftDropRight, AffineOwn, PRODUCT-OWN.
-/
def useLeftDropRight (p : AffPair) : Option (Prod Nat AffPair) :=
  match useOnce p.left with
  | none => none
  | some (n, l1) =>
    match dropAffine p.right with
    | none => none
    | some r1 => some (n, { left := l1, right := r1 })

/-- Use right, drop left (symmetric ownership choice). -/
def useRightDropLeft (p : AffPair) : Option (Prod Nat AffPair) :=
  match dropAffine p.left with
  | none => none
  | some l1 =>
    match useOnce p.right with
    | none => none
    | some (n, r1) => some (n, { left := l1, right := r1 })

/-- Drop both unused (affine allows discard of both; linear pair would not). -/
def dropBoth (p : AffPair) : Option AffPair :=
  match dropAffine p.left with
  | none => none
  | some l1 =>
    match dropAffine p.right with
    | none => none
    | some r1 => some { left := l1, right := r1 }

/-- Demo: use left drop right yields left payload; right is dropped. -/
def demoUseLeftDropRight : Bool :=
  match useLeftDropRight (mkAffPair 3 9) with
  | some (3, p) => (p.left == AffineRes.consumed) && (p.right == AffineRes.dropped)
  | _ => false

/-- Demo: use right drop left yields right payload; left is dropped. -/
def demoUseRightDropLeft : Bool :=
  match useRightDropLeft (mkAffPair 3 9) with
  | some (9, p) => (p.left == AffineRes.dropped) && (p.right == AffineRes.consumed)
  | _ => false

/-- Demo: drop both unused succeeds. -/
def demoDropBoth : Bool :=
  match dropBoth (mkAffPair 1 2) with
  | some p => (p.left == AffineRes.dropped) && (p.right == AffineRes.dropped)
  | none => false

/-- Demo: after use left, second use of left is rejected. -/
def demoNoDoubleUseLeft : Bool :=
  match useLeftDropRight (mkAffPair 4 5) with
  | some (_, p) =>
    match useOnce p.left with
    | none => true
    | some _ => false
  | none => false

/-- Demo: after drop both, use of either side fails. -/
def demoNoUseAfterDropBoth : Bool :=
  match dropBoth (mkAffPair 6 7) with
  | some p =>
    match useOnce p.left with
    | some _ => false
    | none =>
      match useOnce p.right with
      | none => true
      | some _ => false
  | none => false

/-- Bundle: pins + multi-resource product ownership demos. -/
def demoAffineOwnBundle : Bool :=
  demoHonestyPins
    && demoUseLeftDropRight
    && demoUseRightDropLeft
    && demoDropBoth
    && demoNoDoubleUseLeft
    && demoNoUseAfterDropBoth

end SystemsLean.LeanBridge.AffineOwn
