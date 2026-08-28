||| Algorithm id: LinearPairSwap
||| Side: Idris 2 (native Quantitative Type Theory grades)
||| Pair: Lean dual sketch at src/lean4/examples/LinearPairSwap.lean
|||
||| Focus: two MULT-1 resources (pair of exact-once Tokens) swap end-to-end.
||| Related: ConsumeToken is single-token mint/consume; this dual names the
||| multi-resource exact-once shape (edges / mint pairs on freestanding product).
|||
||| Host honesty: Systems HostCompose is still single live-token today.
||| Multi-token host use is PARTIAL; this file is a dual seed, not multi-token C.
|||
||| Trusted computing base honesty (not freestanding product):
|||   Typechecking under stock Idris 2 still leaves a managed backend runtime
|||   in the trust base. This file is a correspondence seed, not Slake emit.
|||
||| Prefer: idris2 --check examples/LinearPairSwap.idr  (when idris2 is on PATH)
module LinearPairSwap

%default total

------------------------------------------------------------------------
-- MULT-1 -- once-use resource (pair swap surface)
------------------------------------------------------------------------

||| Abstract once-use resource (same shape as ConsumeToken Token).
public export
data Token : Type where
  MkToken : Nat -> Token

||| Mint a token from unrestricted data.
public export
mkToken : Nat -> Token
mkToken n = MkToken n

||| Consume the token exactly once (MULT-1). Returns the payload.
public export
consume : (1 t : Token) -> Nat
consume (MkToken n) = n

||| Linear pair of two MULT-1 tokens (both components multiplicity 1).
public export
data LinPair : Type where
  MkLinPair : (1 a : Token) -> (1 b : Token) -> LinPair

||| Linear pair swap: both components multiplicity 1 end-to-end.
||| Greppable: swapLin, LinearPairSwap, MULT-1.
public export
swapLin : (1 p : LinPair) -> LinPair
swapLin (MkLinPair a b) = MkLinPair b a

||| Build a linear pair from two unrestricted payloads (mint both).
public export
mkPair : Nat -> Nat -> LinPair
mkPair x y = MkLinPair (mkToken x) (mkToken y)

||| Swap then consume both: left payload becomes former right, and vice versa.
public export
swapThenConsume : Nat -> Nat -> (Nat, Nat)
swapThenConsume x y =
  case swapLin (mkPair x y) of
    MkLinPair a b => (consume a, consume b)

------------------------------------------------------------------------
-- Composed demos (swap preserves both exact-once uses)
------------------------------------------------------------------------

||| After swap, first consume yields original second payload.
public export
demoSwapLeft : Bool
demoSwapLeft =
  case swapThenConsume 3 7 of
    (l, r) => (l == 7) && (r == 3)

||| Round-trip: swap twice restores original order of payloads.
public export
demoSwapRoundTrip : Bool
demoSwapRoundTrip =
  case swapLin (mkPair 1 2) of
    p1 =>
      case swapLin p1 of
        MkLinPair a b => (consume a == 1) && (consume b == 2)

||| Bundle demo: swap left + round-trip.
public export
demoLinearPairSwap : Bool
demoLinearPairSwap = demoSwapLeft && demoSwapRoundTrip
