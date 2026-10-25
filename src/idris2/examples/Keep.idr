||| Algorithm id: Keep
||| Side: Idris 2 (native Quantitative Type Theory grades)
||| Dual of keep: linear identity on a MULT-1 Token
|||
||| Linear identity matches Data.Linear.Notation `id : a -@ a` (keep t = t).
||| Keep returns the same MULT-1 Token. consume spends that token
||| (MULT-1 in, unrestricted Nat out).
|||
||| Grades shown (minimum 0 / 1 / unrestricted == omega-class):
|||   MULT-0     -- erased binder (no runtime presence)
|||   MULT-1     -- linear; LinearCheck requires exact once use
|||   MULT-OMEGA -- unrestricted (default quantity; free copy/drop)
|||
||| Trusted computing base honesty (not freestanding product):
|||   Typechecking or running this under stock Idris 2 (Chez, Racket,
|||   Gambit, RefC, etc.) still leaves a managed backend runtime in the
|||   trust base. RefC is C plus reference-counting support -- not
|||   runtimeless freestanding Systems Lean product C (out/freestanding-c).
|||   This file is a correspondence seed, not Slake emit.
|||
||| Prefer: idris2 --check examples/Keep.idr  (when idris2 is on PATH)
module Keep

%default total

------------------------------------------------------------------------
-- MULT-1 -- once-use resource (algorithm Keep)
------------------------------------------------------------------------

||| Abstract once-use resource. Payload is unrestricted Nat under the
||| constructor; the *Token wrapper* is what we treat as linear at use sites.
public export
data Token : Type where
  MkToken : Nat -> Token

||| Mint a token from unrestricted data (MULT-OMEGA in, Token out).
public export
mkToken : Nat -> Token
mkToken n = MkToken n

------------------------------------------------------------------------
-- Linear identity (Data.Linear.Notation `id : a -@ a`)
------------------------------------------------------------------------

||| Linear implication. Same expansion as Data.Linear.Notation (-@).
export infixr 0 -@
public export
(-@) : Type -> Type -> Type
a -@ b = (1 _ : a) -> b

||| Linear identity on a MULT-1 Token. keep t = t.
public export
keep : Token -@ Token
keep t = t

||| Consume the token exactly once (MULT-1). Returns the unrestricted payload.
public export
consume : Token -@ Nat
consume (MkToken n) = n

------------------------------------------------------------------------
-- Composed demo (keep then consume spends the token)
------------------------------------------------------------------------

||| keep is identity: unwrap after keep matches the minted payload.
public export
demoKeep : Bool
demoKeep =
  case keep (mkToken 3) of
    MkToken n => n == 3

||| keep then consume: the linear token is spent; payload matches mint.
public export
demoKeepThenConsume : Bool
demoKeepThenConsume =
  consume (keep (mkToken 3)) == 3

------------------------------------------------------------------------
-- Intentional non-examples (do not uncomment -- LinearCheck must fail)
------------------------------------------------------------------------

-- doubleKeep : (1 t : Token) -> (Token, Token)
-- doubleKeep t = (keep t, keep t)
--
-- dropKeep : (1 t : Token) -> Nat
-- dropKeep t = Z
