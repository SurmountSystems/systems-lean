/-
  SYSTEMS_LEAN_HOST partial -- QTT use-check surfaces:
  ConsumeToken exact-once (MULT-1) then UnrestrictedShare (MULT-OMEGA)
  then checkErasedAbsent (grade 0) then typed Grade binders (linear / share /
  erased) on one log then a tiny UseTerm walk. QTT-USE-CHECK-TYPED,
  QTT-USE-CHECK-BINDERS, QTT-USE-CHECK-TELESCOPE, QTT-USE-CHECK-TERM,
  QTT-USE-CHECK-LET, QTT-USE-CHECK-MATCH, QTT-USE-CHECK-MUTUAL,
  QTT-USE-CHECK-THEOREM, QTT-USE-CHECK-LAM, QTT-USE-CHECK-APP.
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
  - checkErasedAbsent (grade 0): 0 runtime uses = ok; 1 or more = drop.
  - Grade is a local closed inductive (erased / linear / share). No Mult import.
  - TypedUse is one use of a named id at a Grade. TypedBinder is expected grade.
  - checkGrade: LINEAR 0 drop, 1 ok, 2+ doubleSpend; share always ok;
    erased 0 ok else drop.
  - checkTypedUse: fail-closed when the log mixes grades on that id.
  - checkBinders: walk expected binders against a typed log. Other ids ignored.
  - Illegal linear use (two LINEAR uses of one id) is doubleSpend, fail-closed.
  - Mixed LINEAR + share + erased binders is growth across types, NOT done.
  - Remain is spent / once / many. remainOfGrade maps erased/linear/share.
  - stepRemain: LINEAR once->spent ok, spent->doubleSpend; share many stays
    ok; erased spent use is drop. Other pairs drop.
  - checkTelescope: sequential remaining walk on mixed-grade binders.
    Other ids ignored. Unused LINEAR leftover is drop.
  - Use of a spent LINEAR binder is doubleSpend, fail-closed (share in
    between still fails). QTT-USE-CHECK-TELESCOPE.
  - Mixed-grade telescope is growth across types, NOT done.
  - UseTerm is var / lam / app / letBind / matchCase / mutualBind /
    theoremBody. checkTerm collects uses, then checkTelescope.
  - Lam binders join the mixed-grade telescope. Other ids ignored.
  - Lam body that uses LINEAR twice is doubleSpend, fail-closed.
    QTT-USE-CHECK-LAM.
  - App that uses LINEAR after it is spent is doubleSpend, fail-closed.
    QTT-USE-CHECK-APP.
  - Let binds after the value uses. LINEAR in the value and the body is
    doubleSpend, fail-closed. QTT-USE-CHECK-LET.
  - Match binds after the discriminee uses. LINEAR in the discriminee and
    a branch is doubleSpend, fail-closed. QTT-USE-CHECK-MATCH.
  - Mutual binds two names, both in scope for both bodies. LINEAR in one
    body and again in the other is doubleSpend, fail-closed.
    QTT-USE-CHECK-MUTUAL.
  - Theorem binds after the type uses. LINEAR in the theorem type and
    the proof body is doubleSpend, fail-closed. QTT-USE-CHECK-THEOREM.
  - Mixed-grade term is growth across types, NOT done. QTT-USE-CHECK-TERM.
  - This is NOT all-types use-check done. NOT HostCompose live-flag. NOT Idris
    LinearCheck as Slake. NOT elaborator MULT-1 on Linear.Token axioms.
  - JoinMap unrestrictedShareHostUseOk is Mult omega + shareNat, not this log.
  - allTypesUseCheckDone stays false. Not elaborator-parity done.

  Long-file split: erased / grade / binder / telescope / term / let /
  match / mutual theorems live in SystemsLean.UseCheckTheorems (same
  namespace). ConsumeToken and UnrestrictedShare theorems stay here.
  checkTerm_theorem_spent stays here with theoremBody.
  checkTerm_lam_spent stays here with constructor lam.
  checkTerm_app_spent stays here with constructor app.

  Theorems (named surfaces only):
  - checkConsumeToken_drop / checkConsumeToken_ok / checkConsumeToken_doubleSpend
  - consumeTokenUseCheckReady (Bool AND of the three cases)
  - checkUnrestrictedShare_drop / checkUnrestrictedShare_once /
    checkUnrestrictedShare_share
  - unrestrictedShareUseCheckReady (omega ok plus MULT-1 contrast)
  - erasedAbsentUseCheckReady (absent ok, once drop, many drop)
  - typedUseCheckReady (typed grade walk plus illegal fail-closed)
  - telescopeUseCheckReady (sequential remaining plus spent fail-closed)
  - termUseCheckReady (term walk plus spent fail-closed)
  - letUseCheckReady (let-bind spent fail-closed)
  - matchUseCheckReady (match-case spent fail-closed)
  - mutualUseCheckReady (mutual-bind spent fail-closed)
  - checkTerm_theorem_spent
  - theoremBodyUseCheckReady (theorem-body spent fail-closed)
  - checkTerm_lam_spent
  - lamUseCheckReady (lam spent fail-closed)
  - checkTerm_app_spent
  - appUseCheckReady (app spent fail-closed)
  - allTypesUseCheckDone (false)
  - UseCheckTheorems holds the moved named theorems.

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
  QTT-USE-CHECK-UNRESTRICTED-SHARE, QTT-USE-CHECK-TYPED,
  QTT-USE-CHECK-BINDERS, QTT-USE-CHECK-TELESCOPE,
  QTT-USE-CHECK-TERM, QTT-USE-CHECK-LET, QTT-USE-CHECK-MATCH,
  QTT-USE-CHECK-MUTUAL, QTT-USE-CHECK-THEOREM, QTT-USE-CHECK-LAM,
  QTT-USE-CHECK-APP,
  ConsumeToken,
  UnrestrictedShare,
  MULT-1, MULT-OMEGA, checkConsumeToken, checkUnrestrictedShare,
  checkConsumeToken_drop, checkConsumeToken_ok, checkConsumeToken_doubleSpend,
  checkUnrestrictedShare_drop, checkUnrestrictedShare_once,
  checkUnrestrictedShare_share, consumeTokenUseCheckReady,
  unrestrictedShareUseCheckReady, checkErasedAbsent,
  erasedAbsentUseCheckReady, checkGrade, UseCheckTheorems,
  checkTypedUse, checkTypedUseOk, checkBinders, checkBindersOk,
  checkTelescope, checkTelescopeOk, typedUseCheckReady,
  telescopeUseCheckReady, checkTerm, checkTermOk, termUseCheckReady,
  checkTerm_let_spent, letUseCheckReady, checkTerm_match_spent,
  matchUseCheckReady, checkTerm_mutual_spent, mutualUseCheckReady,
  checkTerm_theorem_spent, theoremBodyUseCheckReady,
  checkTerm_lam_spent, lamUseCheckReady,
  checkTerm_app_spent, appUseCheckReady,
  allTypesUseCheckDone, UNIT_SURFACE
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

/-- QTT grade 0 on one count: zero runtime uses are ok.
    One or more is drop. Not all-types use-check. -/
def checkErasedAbsent (n : Nat) : Check :=
  match n with
  | 0 => Check.ok
  | _ => Check.drop

/-- Grade-0 ready pin: absent ok, once drop, many drop. -/
def erasedAbsentUseCheckReady : Bool :=
  decide (checkErasedAbsent 0 = Check.ok)
    && decide (checkErasedAbsent 1 = Check.drop)
    && decide (checkErasedAbsent 2 = Check.drop)

/-- Local closed QTT grade. No Mult import. QTT-USE-CHECK-TYPED. -/
inductive Grade where
  | erased
  | linear
  | share
  deriving Repr, DecidableEq

/-- Human-facing grade ids (MULT-0 / MULT-1 / MULT-OMEGA). -/
def Grade.name : Grade -> String
  | Grade.erased => "MULT-0"
  | Grade.linear => "MULT-1"
  | Grade.share => "MULT-OMEGA"

/-- One typed use of a named id at a Grade. QTT-USE-CHECK-TYPED. -/
structure TypedUse where
  id : TokenId
  grade : Grade
  deriving Repr, DecidableEq

/-- Expected binder grade for a named id. QTT-USE-CHECK-BINDERS. -/
structure TypedBinder where
  id : TokenId
  grade : Grade
  deriving Repr, DecidableEq

/-- Count uses of `tokenId` in a typed log. Other ids do not count. -/
def typedCount (tokenId : TokenId) (log : List TypedUse) : Nat :=
  (log.filter (fun e => e.id == tokenId)).length

/-- True when every use of `tokenId` carries grade `g`. Empty is true. -/
def typedGradeUniform (tokenId : TokenId) (g : Grade)
    (log : List TypedUse) : Bool :=
  (log.filter (fun e => e.id == tokenId)).all (fun e => e.grade == g)

/-- Dispatch by grade on a count. Fail-closed: Grade is closed. -/
def checkGrade (g : Grade) (n : Nat) : Check :=
  match g with
  | Grade.linear =>
    match n with
    | 0 => Check.drop
    | 1 => Check.ok
    | _ => Check.doubleSpend
  | Grade.share => Check.ok
  | Grade.erased =>
    match n with
    | 0 => Check.ok
    | _ => Check.drop

/-- One named binder: expected grade, mixed-grade log is drop. -/
def checkTypedUse (tokenId : TokenId) (expected : Grade)
    (log : List TypedUse) : Check :=
  if typedGradeUniform tokenId expected log then
    checkGrade expected (typedCount tokenId log)
  else
    Check.drop

/-- Bool form of typed-use ok (not drop, not doubleSpend). -/
def checkTypedUseOk (tokenId : TokenId) (expected : Grade)
    (log : List TypedUse) : Bool :=
  decide (checkTypedUse tokenId expected log = Check.ok)

/-- Walk expected binders against a typed log. Other ids ignored. -/
def checkBinders (binders : List TypedBinder) (log : List TypedUse) : Check :=
  match binders with
  | [] => Check.ok
  | b :: rest =>
    match checkTypedUse b.id b.grade log with
    | Check.ok => checkBinders rest log
    | bad => bad

/-- Bool form of binders-walk ok. QTT-USE-CHECK-BINDERS. -/
def checkBindersOk (binders : List TypedBinder) (log : List TypedUse) : Bool :=
  decide (checkBinders binders log = Check.ok)

/-- Remaining uses of a named binder. QTT-USE-CHECK-TELESCOPE. -/
inductive Remain where
  | spent
  | once
  | many
  deriving Repr, DecidableEq

/-- Starting remaining from a binder grade. -/
def remainOfGrade : Grade -> Remain
  | Grade.erased => Remain.spent
  | Grade.linear => Remain.once
  | Grade.share => Remain.many

/-- One use against remaining at expected grade. Fail-closed. -/
def stepRemain (g : Grade) (r : Remain) : Prod Check Remain :=
  match g with
  | Grade.linear =>
    match r with
    | Remain.once => (Check.ok, Remain.spent)
    | Remain.spent => (Check.doubleSpend, Remain.spent)
    | Remain.many => (Check.drop, r)
  | Grade.share =>
    match r with
    | Remain.many => (Check.ok, Remain.many)
    | _ => (Check.drop, r)
  | Grade.erased =>
    match r with
    | Remain.spent => (Check.drop, Remain.spent)
    | _ => (Check.drop, r)

/-- Remaining of `tokenId`. Other ids do not count. -/
def lookupRemain (tokenId : TokenId) :
    List (Prod TokenId Remain) -> Option Remain
  | [] => none
  | (id, r) :: rest =>
    if id == tokenId then some r else lookupRemain tokenId rest

/-- Replace remaining of `tokenId`. Other ids unchanged. -/
def setRemain (tokenId : TokenId) (r : Remain) :
    List (Prod TokenId Remain) -> List (Prod TokenId Remain)
  | [] => []
  | (id, r0) :: rest =>
    if id == tokenId then (id, r) :: rest
    else (id, r0) :: setRemain tokenId r rest

/-- Expected grade of `tokenId`. Other ids ignored. -/
def lookupGrade (tokenId : TokenId) : List TypedBinder -> Option Grade
  | [] => none
  | b :: rest =>
    if b.id == tokenId then some b.grade else lookupGrade tokenId rest

/-- Binders to a remaining map. -/
def remainBinders : List TypedBinder -> List (Prod TokenId Remain)
  | [] => []
  | b :: rest => (b.id, remainOfGrade b.grade) :: remainBinders rest

/-- Unused LINEAR remaining (once) is drop. Share/spent leftover is ok. -/
def leftoverRemain : List (Prod TokenId Remain) -> Check
  | [] => Check.ok
  | (_, Remain.once) :: _ => Check.drop
  | _ :: rest => leftoverRemain rest

/-- Sequential remaining walk. Other ids ignored. QTT-USE-CHECK-TELESCOPE. -/
def checkTelescopeGo (binders : List TypedBinder)
    (rs : List (Prod TokenId Remain)) (log : List TypedUse) : Check :=
  match log with
  | [] => leftoverRemain rs
  | u :: rest =>
    match lookupGrade u.id binders with
    | none => checkTelescopeGo binders rs rest
    | some g =>
      if g == u.grade then
        match lookupRemain u.id rs with
        | none => Check.drop
        | some r =>
          match stepRemain g r with
          | (Check.ok, r') =>
            checkTelescopeGo binders (setRemain u.id r' rs) rest
          | (bad, _) => bad
      else
        Check.drop

/-- Mixed-grade telescope against a typed log. Sequential remaining. -/
def checkTelescope (binders : List TypedBinder)
    (log : List TypedUse) : Check :=
  checkTelescopeGo binders (remainBinders binders) log

/-- Bool form of telescope-walk ok. QTT-USE-CHECK-TELESCOPE. -/
def checkTelescopeOk (binders : List TypedBinder)
    (log : List TypedUse) : Bool :=
  decide (checkTelescope binders log = Check.ok)

/-- Typed ready pin: grade dispatch, illegal fail-closed, mixed binders. -/
def typedUseCheckReady : Bool :=
  decide (checkGrade Grade.linear 0 = Check.drop)
    && decide (checkGrade Grade.linear 1 = Check.ok)
    && decide (checkGrade Grade.linear 2 = Check.doubleSpend)
    && decide (checkGrade Grade.share 2 = Check.ok)
    && decide (checkGrade Grade.erased 1 = Check.drop)
    && decide (checkTypedUse 1 Grade.linear
         [{ id := 1, grade := Grade.linear },
           { id := 1, grade := Grade.linear }] = Check.doubleSpend)
    && decide (checkBinders
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share },
           { id := 3, grade := Grade.erased }]
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share },
           { id := 2, grade := Grade.share }] = Check.ok)

/-- Sequential remaining pin: mixed ok, spent fail-closed, unused LINEAR. -/
def telescopeUseCheckReady : Bool :=
  decide (checkTelescope
       [{ id := 1, grade := Grade.linear },
         { id := 2, grade := Grade.share },
         { id := 3, grade := Grade.erased }]
       [{ id := 1, grade := Grade.linear },
         { id := 2, grade := Grade.share },
         { id := 2, grade := Grade.share }] = Check.ok)
    && decide (checkTelescope
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share }]
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share },
           { id := 1, grade := Grade.linear }] = Check.doubleSpend)
    && decide (checkTelescope
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share }]
         [{ id := 2, grade := Grade.share }] = Check.drop)

/-- Concat binders without `++` (HostFront tokenizer drops `++`). -/
def bindAppend : List TypedBinder -> List TypedBinder -> List TypedBinder
  | [], ys => ys
  | x :: xs, ys => x :: bindAppend xs ys

/-- Concat typed uses without `++`. -/
def useAppend : List TypedUse -> List TypedUse -> List TypedUse
  | [], ys => ys
  | x :: xs, ys => x :: useAppend xs ys

/-- Tiny term: var, lam, app, letBind, matchCase, mutualBind, theoremBody. -/
inductive UseTerm where
  | var (id : TokenId)
  | lam (id : TokenId) (grade : Grade) (body : UseTerm)
  | app (fn : UseTerm) (arg : UseTerm)
  | letBind (id : TokenId) (grade : Grade) (value : UseTerm) (body : UseTerm)
  | matchCase (id : TokenId) (grade : Grade) (disc : UseTerm) (branch : UseTerm)
  | mutualBind (idL : TokenId) (gL : Grade) (idR : TokenId) (gR : Grade)
      (left : UseTerm) (right : UseTerm)
  | theoremBody (id : TokenId) (grade : Grade) (ty : UseTerm) (proof : UseTerm)
  deriving Repr, DecidableEq

/-- Binders from lambdas, lets, matches, mutuals, and theorems. App concatenates. -/
def termBinders : UseTerm -> List TypedBinder
  | UseTerm.var _ => []
  | UseTerm.lam id g body =>
    { id := id, grade := g } :: termBinders body
  | UseTerm.app fn arg =>
    bindAppend (termBinders fn) (termBinders arg)
  | UseTerm.letBind id g value body =>
    bindAppend (termBinders value)
      ({ id := id, grade := g } :: termBinders body)
  | UseTerm.matchCase id g disc branch =>
    bindAppend (termBinders disc)
      ({ id := id, grade := g } :: termBinders branch)
  | UseTerm.mutualBind idL gL idR gR left right =>
    bindAppend
      ({ id := idL, grade := gL } :: { id := idR, grade := gR }
        :: termBinders left)
      (termBinders right)
  | UseTerm.theoremBody id g ty proof =>
    bindAppend (termBinders ty)
      ({ id := id, grade := g } :: termBinders proof)

/-- Uses of vars, left to right. Lam, let, match, mutual, and theorem extend. -/
def usesOf (binders : List TypedBinder) : UseTerm -> List TypedUse
  | UseTerm.var id =>
    match lookupGrade id binders with
    | none => []
    | some g => [{ id := id, grade := g }]
  | UseTerm.lam id g body =>
    usesOf (bindAppend binders [{ id := id, grade := g }]) body
  | UseTerm.app fn arg =>
    useAppend (usesOf binders fn) (usesOf binders arg)
  | UseTerm.letBind id g value body =>
    useAppend (usesOf binders value)
      (usesOf (bindAppend binders [{ id := id, grade := g }]) body)
  | UseTerm.matchCase id g disc branch =>
    useAppend (usesOf binders disc)
      (usesOf (bindAppend binders [{ id := id, grade := g }]) branch)
  | UseTerm.mutualBind idL gL idR gR left right =>
    useAppend
      (usesOf (bindAppend binders
        [{ id := idL, grade := gL }, { id := idR, grade := gR }]) left)
      (usesOf (bindAppend binders
        [{ id := idL, grade := gL }, { id := idR, grade := gR }]) right)
  | UseTerm.theoremBody id g ty proof =>
    useAppend (usesOf binders ty)
      (usesOf (bindAppend binders [{ id := id, grade := g }]) proof)

/-- Mixed-grade term against outer binders plus lam binders. Sequential. -/
def checkTerm (binders : List TypedBinder) (t : UseTerm) : Check :=
  checkTelescope (bindAppend binders (termBinders t)) (usesOf binders t)

/-- Bool form of term-walk ok. QTT-USE-CHECK-TERM. -/
def checkTermOk (binders : List TypedBinder) (t : UseTerm) : Bool :=
  decide (checkTerm binders t = Check.ok)

/-- Term-walk pin: mixed ok, spent fail-closed, unused LINEAR. -/
def termUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear },
         { id := 3, grade := Grade.erased }]
       (UseTerm.lam 2 Grade.share
         (UseTerm.app (UseTerm.var 1)
           (UseTerm.app (UseTerm.var 2) (UseTerm.var 2)))) = Check.ok)
    && decide (checkTerm
         [{ id := 1, grade := Grade.linear },
           { id := 2, grade := Grade.share }]
         (UseTerm.app (UseTerm.var 1)
           (UseTerm.app (UseTerm.var 2) (UseTerm.var 1)))
       = Check.doubleSpend)
    && decide (checkTerm
         [{ id := 1, grade := Grade.linear }]
         (UseTerm.lam 2 Grade.share (UseTerm.var 2)) = Check.drop)

/-- Let-bind pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def letUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear }]
       (UseTerm.letBind 2 Grade.share (UseTerm.var 1)
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
     = Check.doubleSpend)

/-- Match-case pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def matchUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear }]
       (UseTerm.matchCase 2 Grade.share (UseTerm.var 1)
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
     = Check.doubleSpend)

/-- Mutual-bind pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def mutualUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear }]
       (UseTerm.mutualBind 2 Grade.share 3 Grade.share
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 2))
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 3)))
     = Check.doubleSpend)

/-- LINEAR used in a theorem type and again in the proof body is doubleSpend. -/
theorem checkTerm_theorem_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.theoremBody 2 Grade.share (UseTerm.var 1)
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
    = Check.doubleSpend := rfl

/-- Theorem-body pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def theoremBodyUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear }]
       (UseTerm.theoremBody 2 Grade.share (UseTerm.var 1)
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 2)))
     = Check.doubleSpend)

/-- LINEAR used twice in a lam body is doubleSpend. -/
theorem checkTerm_lam_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear }]
      (UseTerm.lam 2 Grade.share
        (UseTerm.app (UseTerm.var 1) (UseTerm.var 1)))
    = Check.doubleSpend := rfl

/-- Lam pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def lamUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear }]
       (UseTerm.lam 2 Grade.share
         (UseTerm.app (UseTerm.var 1) (UseTerm.var 1)))
     = Check.doubleSpend)

/-- LINEAR used in an app fn and again in the arg is doubleSpend. -/
theorem checkTerm_app_spent :
    checkTerm
      [{ id := 1, grade := Grade.linear },
        { id := 2, grade := Grade.share }]
      (UseTerm.app (UseTerm.var 1)
        (UseTerm.app (UseTerm.var 2) (UseTerm.var 1)))
    = Check.doubleSpend := rfl

/-- App pin: spent fail-closed. Mixed-grade growth, not all-types done. -/
def appUseCheckReady : Bool :=
  decide (checkTerm
       [{ id := 1, grade := Grade.linear },
         { id := 2, grade := Grade.share }]
       (UseTerm.app (UseTerm.var 1)
         (UseTerm.app (UseTerm.var 2) (UseTerm.var 1)))
     = Check.doubleSpend)

/-- Honesty: typed grade walk is growth, not all-types done. Flag stays false. -/
def allTypesUseCheckDone : Bool := false

end SystemsLean.UseCheck
