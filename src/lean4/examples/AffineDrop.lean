/-
  Algorithm id: AffineDrop
  Side: Lean 4 (classic) dual -- behavioral sketch + contracts
  Pair: Idris native AffineDrop at src/idris2/examples/AffineDrop.idr
  Trust: examples/TRUST.md -- classic ahead-of-time still has managed runtime residual.
  Not freestanding. Not product C emit. Not PROVABLY. Not full product affine ABI.

  Spec (readable, separate from any future proof):
  - Focus EDGE-AFFINE: Systems Lean product talk includes affine (at most once).
  - Affine = drop without use OR use once; double-use rejected.
  - Idris public grades are 0 / exact-once 1 / unrestricted -- no first-class affine.
  - Greppable pins: EDGE-AFFINE, AFFINE-NOT-FIRST-CLASS, AffineDrop.
  - Behavioral AffineRes inventory is a dual honesty sketch, not elaborator affine.
  - Contrast MULT-1 (ConsumeToken): classic Lean does not enforce drop ban either;
    Systems freestanding host will. Contrast MULT-OMEGA free drop (UnrestrictedShare).
  - Host product Linear still documents AFFINE-NOT-FIRST-CLASS; this dual does not
    open freestanding affine ABI or JOIN-ALG-USE host pins for AffineDrop.

  Red/green: just lean-side presence gate; Lake when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.LeanBridge.AffineDrop

/-- Greppable edge id: Systems product affine vs Idris public grades. -/
def edgeAffineId : String := "EDGE-AFFINE"

/-- Greppable pin: Idris has no first-class affine quantity on public grades. -/
def affineNotFirstClassId : String := "AFFINE-NOT-FIRST-CLASS"

/-- True when honesty pins spell the expected tokens. -/
def demoHonestyPins : Bool :=
  (edgeAffineId == "EDGE-AFFINE")
    && (affineNotFirstClassId == "AFFINE-NOT-FIRST-CLASS")

/-- Unrestricted Nat may be dropped (first argument unused). MULT-OMEGA class. -/
def unrestrictedDropLeft (_x : Nat) (y : Nat) : Nat := y

/-- Demo: unrestricted drop is allowed (not affine enforcement). -/
def demoUnrestrictedDrop : Bool := unrestrictedDropLeft 99 7 == 7

/--
  Affine resource states for honesty demos only.
  Live holds payload; Consumed means used once; Dropped means discarded without use.
  Not a fourth public Idris grade and not freestanding product affine ABI.
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

/--
  Drop without use: live -> dropped. Already dropped stays dropped.
  Consumed cannot be dropped (already used once). Fail closed.
  Greppable: dropAffine, AffineDrop.
-/
def dropAffine : AffineRes -> Option AffineRes
  | AffineRes.live _ => some AffineRes.dropped
  | AffineRes.dropped => some AffineRes.dropped
  | AffineRes.consumed => none

/-- Double-use of the same live resource is rejected (second use fails). -/
def doubleUseReject (r : AffineRes) : Bool :=
  match useOnce r with
  | none => true
  | some (_, r1) =>
    match useOnce r1 with
    | none => true
    | some _ => false

/-- Drop without use succeeds (affine allows discard; linear would not). -/
def demoAffineDrop : Bool :=
  match dropAffine (mkAffine 3) with
  | some AffineRes.dropped => true
  | _ => false

/-- Use once succeeds; resource becomes consumed. -/
def demoAffineUseOnce : Bool :=
  match useOnce (mkAffine 5) with
  | some (5, AffineRes.consumed) => true
  | _ => false

/-- After use once, a second use is rejected (at most once). -/
def demoAffineNoDoubleUse : Bool := doubleUseReject (mkAffine 1)

/-- After use once, drop is rejected (resource already consumed). -/
def demoNoDropAfterUse : Bool :=
  match useOnce (mkAffine 2) with
  | some (_, r1) =>
    match dropAffine r1 with
    | none => true
    | some _ => false
  | none => false

/-- Bundle: pins + unrestricted contrast + affine at-most-once demos. -/
def demoAffineDropBundle : Bool :=
  demoHonestyPins
    && demoUnrestrictedDrop
    && demoAffineDrop
    && demoAffineUseOnce
    && demoAffineNoDoubleUse
    && demoNoDropAfterUse

end SystemsLean.LeanBridge.AffineDrop
