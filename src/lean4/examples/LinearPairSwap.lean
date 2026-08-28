/-
  Algorithm id: LinearPairSwap
  Side: Lean 4 (classic) dual -- behavioral sketch + contracts
  Pair: Idris native LinearPairSwap at src/idris2/examples/LinearPairSwap.idr
  Trust: examples/TRUST.md -- classic ahead-of-time still has managed runtime residual.
  Not freestanding. Not product C emit. Not PROVABLY.

  Spec (readable, separate from any future proof):
  - Focus: two MULT-1 resources (pair of exact-once Tokens) swap end-to-end.
  - LinPair holds two Tokens; swapLin exchanges components.
  - swapThenConsume: swap then consume both (payload order flips).
  - Classic Lean cannot enforce MULT-1; this is a behavioral sketch only.
  - Host map: PARTIAL -- HostCompose is single live-token; multi-token host use
    is not product wire yet. Dual-cite + honest partial host pin in JoinMap.
  - Related: ConsumeToken is single-token mint/consume.

  Red/green: just lean-side presence gate; Lake when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.LeanBridge.LinearPairSwap

/-- Abstract once-use resource (behavioral sketch; not elaborator MULT-1). -/
structure Token where
  payload : Nat
  deriving DecidableEq, Repr

/-- Mint a token from unrestricted data. -/
def mkToken (n : Nat) : Token := { payload := n }

/-- Consume the token (sketch of exact-once use). -/
def consume (t : Token) : Nat := t.payload

/-- Linear pair of two tokens (both intended MULT-1). -/
structure LinPair where
  left : Token
  right : Token
  deriving DecidableEq, Repr

/-- Linear pair swap: exchange both components. Greppable: swapLin, LinearPairSwap. -/
def swapLin (p : LinPair) : LinPair :=
  { left := p.right, right := p.left }

/-- Build a linear pair from two unrestricted payloads. -/
def mkPair (x y : Nat) : LinPair :=
  { left := mkToken x, right := mkToken y }

/-- Swap then consume both: left becomes former right payload. -/
def swapThenConsume (x y : Nat) : Prod Nat Nat :=
  let p := swapLin (mkPair x y)
  (consume p.left, consume p.right)

/-- Demo: after swap, first consume yields original second payload. -/
def demoSwapLeft : Bool :=
  match swapThenConsume 3 7 with
  | (l, r) => (l == 7) && (r == 3)

/-- Demo: swap twice restores original order of payloads. -/
def demoSwapRoundTrip : Bool :=
  let p1 := swapLin (mkPair 1 2)
  let p2 := swapLin p1
  (consume p2.left == 1) && (consume p2.right == 2)

/-- Bundle demo: swap left + round-trip. -/
def demoLinearPairSwap : Bool := demoSwapLeft && demoSwapRoundTrip

end SystemsLean.LeanBridge.LinearPairSwap
