/-
  SYSTEMS_LEAN_HOST partial -- QTT use-check surfaces:
  ConsumeToken exact-once (MULT-1) then UnrestrictedShare (MULT-OMEGA).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Greppable: QTT-USE-CHECK-CONSUME-TOKEN, QTT-USE-CHECK-UNRESTRICTED-SHARE

  Spec (readable, separate from any future proof):
  - Tiny usage log of consume events for ONE named MULT-1 token id.
  - 0 consumes of that id = drop fail.
  - 1 consume = ok.
  - 2 or more = double-spend fail.
  - Other ids in the log are ignored for that check.
  - Tiny usage log of use events for ONE named MULT-OMEGA id (UnrestrictedShare).
  - 0 uses = drop ok; 1 use = ok; 2 or more = share ok.
  - This is NOT all-types use-check. NOT HostCompose live-flag. NOT Idris
    LinearCheck as Slake. NOT elaborator MULT-1 on Linear.Token axioms.
  - JoinMap unrestrictedShareHostUseOk is Mult omega + shareNat, not this log.

  Theorems (named surfaces only):
  - checkConsumeToken_drop / checkConsumeToken_ok / checkConsumeToken_doubleSpend
  - consumeTokenUseCheckReady (Bool AND of the three cases)
  - checkUnrestrictedShare_drop / checkUnrestrictedShare_once /
    checkUnrestrictedShare_share
  - unrestrictedShareUseCheckReady (omega ok plus MULT-1 contrast)

  These UseCheck theorems do NOT set SpecProof.proofCompleteClaimed true.
  Named surfaces != host proof complete != residual free != all-types use-check.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
  - Affine not first-class. Linear.Token axioms remain.
  - Inventory: doc/dev/research/qtt-use-check-inventory-2026-09-17.md

  Greppable: SYSTEMS_LEAN_HOST, QTT-USE-CHECK-CONSUME-TOKEN,
  QTT-USE-CHECK-UNRESTRICTED-SHARE, ConsumeToken, UnrestrictedShare,
  MULT-1, MULT-OMEGA, checkConsumeToken, checkUnrestrictedShare,
  checkConsumeToken_drop, checkConsumeToken_ok, checkConsumeToken_doubleSpend,
  checkUnrestrictedShare_drop, checkUnrestrictedShare_once,
  checkUnrestrictedShare_share, consumeTokenUseCheckReady,
  unrestrictedShareUseCheckReady, UNIT_SURFACE
  host surface. Module: SystemsLean.UseCheck
  Red/green: just systems-host (nix/systems-host-presence/).
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

namespace SystemsLean.UseCheck

/-- Named MULT-1 token id in a tiny usage log. -/
abbrev TokenId := Nat

/-- One consume event of a named token id. QTT-USE-CHECK-CONSUME-TOKEN. -/
structure ConsumeEvent where
  id : TokenId
  deriving Repr, DecidableEq

/-- First-surface result: ok | drop | doubleSpend. -/
inductive Check where
  | ok
  | drop
  | doubleSpend
  deriving Repr, DecidableEq, Inhabited

/-- Count consumes of `tokenId` in `log`. Other ids do not count. -/
def consumeCount (tokenId : TokenId) (log : List ConsumeEvent) : Nat :=
  (log.filter (fun e => e.id == tokenId)).length

/-- QTT grade-1 exact-once on one named id: 0 drop, 1 ok, 2+ doubleSpend. -/
def checkConsumeToken (tokenId : TokenId) (log : List ConsumeEvent) : Check :=
  match consumeCount tokenId log with
  | 0 => Check.drop
  | 1 => Check.ok
  | _ => Check.doubleSpend

/-- Bool form of exact-once ok (not drop, not doubleSpend). -/
def checkConsumeTokenOk (tokenId : TokenId) (log : List ConsumeEvent) : Bool :=
  decide (checkConsumeToken tokenId log = Check.ok)

/-- Empty log is drop (unused grade-1 binder). -/
theorem checkConsumeToken_drop :
    checkConsumeToken 1 [] = Check.drop := rfl

/-- One consume of id 1 is ok. -/
theorem checkConsumeToken_ok :
    checkConsumeToken 1 [{ id := 1 }] = Check.ok := rfl

/-- Two consumes of id 1 is doubleSpend. -/
theorem checkConsumeToken_doubleSpend :
    checkConsumeToken 1 [{ id := 1 }, { id := 1 }] = Check.doubleSpend := rfl

/-- First-surface ready pin: drop / ok / doubleSpend plus ignored other id. -/
def consumeTokenUseCheckReady : Bool :=
  decide (checkConsumeToken 1 [] = Check.drop)
    && decide (checkConsumeToken 1 [{ id := 1 }] = Check.ok)
    && decide (checkConsumeToken 1 [{ id := 1 }, { id := 1 }] = Check.doubleSpend)
    && decide (checkConsumeToken 1 [{ id := 2 }] = Check.drop)

/-- One use event of a named MULT-OMEGA id. QTT-USE-CHECK-UNRESTRICTED-SHARE. -/
structure UseEvent where
  id : TokenId
  deriving Repr, DecidableEq

/-- Count uses of `tokenId` in `log`. Other ids do not count. -/
def useCount (tokenId : TokenId) (log : List UseEvent) : Nat :=
  (log.filter (fun e => e.id == tokenId)).length

/-- QTT grade-omega on one named id: 0 drop ok, 1 ok, 2+ share ok. -/
def checkUnrestrictedShare (tokenId : TokenId) (log : List UseEvent) : Check :=
  match useCount tokenId log with
  | 0 => Check.ok
  | 1 => Check.ok
  | _ => Check.ok

/-- Bool form of unrestricted ok (always true on this surface). -/
def checkUnrestrictedShareOk (tokenId : TokenId) (log : List UseEvent) : Bool :=
  decide (checkUnrestrictedShare tokenId log = Check.ok)

/-- Empty log is drop ok (unrestricted may discard). UnrestrictedShare. -/
theorem checkUnrestrictedShare_drop :
    checkUnrestrictedShare 1 ([] : List UseEvent) = Check.ok := rfl

/-- One use of id 1 is ok. MULT-OMEGA. -/
theorem checkUnrestrictedShare_once :
    checkUnrestrictedShare 1 [{ id := 1 }] = Check.ok := rfl

/-- Two uses of id 1 is share ok (not doubleSpend). -/
theorem checkUnrestrictedShare_share :
    checkUnrestrictedShare 1 [{ id := 1 }, { id := 1 }] = Check.ok := rfl

/-- Second-surface ready pin: omega drop/once/share plus MULT-1 contrast. -/
def unrestrictedShareUseCheckReady : Bool :=
  decide (checkUnrestrictedShare 1 ([] : List UseEvent) = Check.ok)
    && decide (checkUnrestrictedShare 1 [{ id := 1 }] = Check.ok)
    && decide (checkUnrestrictedShare 1 [{ id := 1 }, { id := 1 }] = Check.ok)
    && decide (checkConsumeToken 1 [] = Check.drop)
    && decide (checkConsumeToken 1 [{ id := 1 }, { id := 1 }] = Check.doubleSpend)

end SystemsLean.UseCheck
