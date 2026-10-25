/-
  Theorem binders before the colon.
  (n : Nat) (h : 2 < n) is a host binder then a less binder.
  (m : Mult) is a host binder. The less operator is LessThan.lessTok.
  `theorem <name> ... := by` then `cases` is parseByTheorem.
  That path does not require `:= rfl`.
  The first `exact` is consumed with its name application.
  One parenthesis `(by decide : Not (2 < 0))` is consumed there.
  The next arm `| succ n1 => cases n1 with` is consumed there.
  The nested arm `| zero =>` and its exact are consumed there.
  That parenthesis is `(by decide : Not (2 < 1))`.
  The next nested arm `| succ n2 => cases n2 with` is consumed there.
  The arm after that `with` is `| zero =>`. Its exact is consumed
  there. That parenthesis is `(by decide : Not (2 < 2))`.
  `| succ _ =>` is consumed there. The binder is `_`. The tactic
  is `rfl`. `some` of a string is EqSomeBinder.parseSomeString.
  A non-empty binder list and `:= rfl` is rflWithBinders.
  The site is isValidTag_eq_ofNat?_isSome (n : Nat).
  The statement is isValidTag n = (ofNat? n).isSome.
  `by` then `unfold` and one name is parseUnfoldTheorem.
  The site is isValidTag_fail_closed. The name is isValidTag.
  Then `rw` and the bracket list ofNat?_fail_closed n h.
  The brackets are syntax. The next token is `rfl`, and it is consumed.
  `cases <name>` then `<` `;` `>` then `rfl` is casesRfl.
  The site is `cases m` in isValid_true. Those three tokens are syntax.
  That `rfl` is consumed. `(h : ofNat? n = some m)` is EqSomeBinder.
  `some` is applied to the name m. A string after `some` is not this.
  A quoted literal after `some` is parseSomeString in the term walk.
  BinderTy is not HostType. byTheoremCmd is the file-walk carrier.
  Does not call Lean.Elab.processCommands.
  Does not claim MultTheorems.lean parses.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.TheoremBinder
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.EqSomeBinder
import SystemsLean.HostTerm
import SystemsLean.LessThan
import SystemsLean.ProofByCases

namespace SystemsLean.TheoremBinder

open SystemsLean.HostTerm
open SystemsLean.LessThan
open SystemsLean.ProofByCases (ByCases NameApp ParenBy SuccArm NestedSucc)
open SystemsLean.ProofByCases (WildSucc parseCases atomOk nameAppAtomOk parenByOk)
open SystemsLean.EqSomeBinder (EqSome parseEqSome eqSomeOk)

/-- Host atom, lhs < rhs, or ofNat? applied to a name, equal to
    `some` applied to a name. `<;>` is not this type.
    A string after `some` is not this type. -/
inductive BinderTy where
  | host (atom : String)
  | less (lhs : String) (rhs : String)
  | eqSome (v : EqSome)

/-- One parenthesized binder. The colon stays outside this value. -/
structure ThmBinder where
  binderName : String
  ty : BinderTy

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def isNatTok (s : String) : Bool :=
  match s.toList with
  | [] => false
  | cs => cs.all isDigit

def isIdentTok (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs =>
    (isLetter c || c == '_' || c == '?') && cs.all isIdentChar

/-- Nat and Mult are the MultTheorems sites. String and Bool are the
    same closed atoms, not a new type language. -/
def isHostAtom (s : String) : Bool :=
  s == "Nat" || s == "Mult" || s == "String" || s == "Bool"

/-- Proof and statement tokens are not binder names and not less atoms.
    `by` is consumeBy, not a binder name. `some` of a name is
    EqSomeBinder, not a binder name. A quoted literal is parseSomeString. -/
def isReservedTok (s : String) : Bool :=
  s == "by" || s == "some" || s == "theorem" || s == "rfl"

def isLessAtom (s : String) : Bool :=
  (isNatTok s || (isIdentTok s && !isHostAtom s)) && !isReservedTok s

/-- Binder names are idents. Host atoms and reserved tokens are not names. -/
def isBinderName (s : String) : Bool :=
  isIdentTok s && !isHostAtom s && !isReservedTok s

def binderNameOk (s : String) : Bool :=
  isBinderName s

def tyOk : BinderTy -> Bool
  | BinderTy.host atom => isHostAtom atom
  | BinderTy.less lhs rhs => isLessAtom lhs && isLessAtom rhs
  | BinderTy.eqSome v => eqSomeOk v

def binderOk (b : ThmBinder) : Bool :=
  binderNameOk b.binderName && tyOk b.ty

/-- Empty is ok: a binder-free theorem has no binder before the colon. -/
def groupOk (bs : List ThmBinder) : Bool :=
  bs.all binderOk

/-- Fail closed past this many binders. The named sites use one or two. -/
def binderFuel : Nat := 8

/-- `ofNat? <name> = some <name>` when the token list is that binder
    type. Host atoms and `2 < n` are not this. A string is none. -/
def parseEqSomeTy (ts : List String) :
    Option (Prod BinderTy (List String)) :=
  match parseEqSome ts with
  | some (v, rest) => some (BinderTy.eqSome v, rest)
  | none => none

def parseBinderTy (ts : List String) :
    Option (Prod BinderTy (List String)) :=
  match ts with
  | atom :: rest =>
    if isHostAtom atom then
      some (BinderTy.host atom, rest)
    else
      match rest with
      | op :: rhs :: rest2 =>
        if op == lessTok && isLessAtom atom && isLessAtom rhs then
          some (BinderTy.less atom rhs, rest2)
        else
          parseEqSomeTy ts
      | _ => parseEqSomeTy ts
  | [] => none

def parseOne (ts : List String) :
    Option (Prod ThmBinder (List String)) :=
  match ts with
  | "(" :: name :: ":" :: rest =>
    if isBinderName name then
      match parseBinderTy rest with
      | some (ty, rest2) =>
        match rest2 with
        | ")" :: rest3 =>
          some ({ binderName := name, ty := ty }, rest3)
        | _ => none
      | none => none
    else
      none
  | _ => none

/-- Binders before the colon. No opening paren yields an empty list
    and leaves the colon for the caller. `by` is not consumed here. -/
def bindersBeforeColon (ts : List String) :
    Option (Prod (List ThmBinder) (List String)) :=
  go binderFuel ts
where
  go (fuel : Nat) (ts : List String) :
      Option (Prod (List ThmBinder) (List String)) :=
    match fuel with
    | 0 => none
    | Nat.succ k =>
      match ts with
      | "(" :: _ =>
        match parseOne ts with
        | none => none
        | some (b, rest) =>
          match rest with
          | "(" :: _ =>
            match go k rest with
            | some (bs, rest2) => some (b :: bs, rest2)
            | none => none
          | _ => some ([b], rest)
      | _ => some ([], ts)

/-- Fail closed past this many statement tokens. The named site is short. -/
def stmtFuel : Nat := 32

/-- After the colon, skip statement tokens up to `:=`.
    Not a proposition parser. `by` before `:=` is none. -/
def tokensBeforeAssign (ts : List String) : Option (List String) :=
  go stmtFuel ts
where
  go (fuel : Nat) (ts : List String) : Option (List String) :=
    match fuel with
    | 0 => none
    | Nat.succ k =>
      match ts with
      | ":=" :: rest => some rest
      | "by" :: _ => none
      | [] => none
      | _ :: rest => go k rest

/-- Consume `by` and hand the body to parseCases. One cases form. -/
def consumeBy (ts : List String) : Option (Prod ByCases (List String)) :=
  match ts with
  | "by" :: rest => parseCases rest
  | _ => none

/-- Binders, the colon, the unparsed statement, then one `by cases`.
    The proof after `:=` is `by`, not `rfl`. Not a command. -/
def byCasesAfterBinders (ts : List String) :
    Option (Prod (List ThmBinder) (Prod ByCases (List String))) :=
  match bindersBeforeColon ts with
  | none => none
  | some (bs, rest) =>
    if !groupOk bs then
      none
    else
      match rest with
      | ":" :: rest1 =>
        match tokensBeforeAssign rest1 with
        | none => none
        | some rest2 =>
          match consumeBy rest2 with
          | none => none
          | some step => some (bs, step)
      | _ => none

/-- Theorem names are idents. Host atoms and reserved tokens are not names.
    The site name is ofNat?_fail_closed. -/
def isTheoremName (s : String) : Bool :=
  isIdentTok s && !isHostAtom s && !isReservedTok s

/-- `theorem <name>` then binders, a colon, an unparsed statement,
    and `:= by` cases. Not a command. Not `by unfold`. -/
def parseByTheorem (ts : List String) :
    Option (Prod String (Prod (List ThmBinder) (Prod ByCases (List String)))) :=
  match ts with
  | "theorem" :: name :: rest =>
    if isTheoremName name then
      match byCasesAfterBinders rest with
      | none => none
      | some (bs, step) => some (name, (bs, step))
    else
      none
  | _ => none

/-- Image of one ParenBy in the closed term IR.
    `by` and the colon stay syntax. decide and Not are constants.
    The less-than token is the constant named by lessTok.
    Not a general type. Not `<;>`. -/
def parenTerm (p : ParenBy) : Option Term :=
  match p.lhs.toNat?, p.rhs.toNat? with
  | some a, some b =>
    if parenByOk p then
      some
        (Term.app (Term.const (n p.tactic))
          (Term.app (Term.const (n p.head))
            (Term.app
              (Term.app (Term.const (n lessTok)) (Term.litNat a))
              (Term.litNat b))))
    else
      none
  | _, _ => none

def nameAppTerm : NameApp -> Option Term
  | NameApp.name s =>
    if nameAppAtomOk s then some (Term.var (n s)) else none
  | NameApp.app f a =>
    match nameAppTerm f, nameAppTerm a with
    | some fnT, some argT => some (Term.app fnT argT)
    | _, _ => none
  | NameApp.paren inner => parenTerm inner

def arm (ctor : String) (body : Term) : Prod Pat Term :=
  (Pat.ctor0 (n ctor), body)

def onVar (scrut : String) (arms : List (Prod Pat Term)) : Term :=
  Term.match_ (Term.var (n scrut)) arms

/-- `| succ n2 =>` match. No zero arm stores the binder variable.
    No wild arm stores only the zero exact. The wild body is the
    tactic constant. `rfl` is that constant at the site. -/
def encodeNested (a : NestedSucc) : Option Term :=
  match a.nestedZero with
  | none => some (Term.var (n a.binder))
  | some z =>
    match nameAppTerm z.exactArg with
    | none => none
    | some zb =>
      match a.wildSucc with
      | none => some (onVar a.scrut [arm z.ctor zb])
      | some w =>
        some (onVar a.scrut [arm z.ctor zb, arm w.ctor (Term.const (n w.tactic))])

/-- `| succ n1 =>` match. Same missing-arm shapes as encodeNested.
    The nested succ body is that inner match. -/
def encodeSucc (a : SuccArm) : Option Term :=
  match a.nestedZero with
  | none => some (Term.var (n a.binder))
  | some z =>
    match nameAppTerm z.exactArg with
    | none => none
    | some zb =>
      match a.nestedSucc with
      | none => some (onVar a.scrut [arm z.ctor zb])
      | some s =>
        match encodeNested s with
        | none => none
        | some sb => some (onVar a.scrut [arm z.ctor zb, arm s.ctor sb])

/-- Stored cases tree from the parsed ByCases value.
    Not a second parser. The outer arm is zero. A parsed succ arm
    is the second arm. A missing arm stays missing in the term.
    Pat has no constructor binder. The succ body is the next match,
    or a variable when that match was not written. The last tactic
    is a constant. -/
def byCasesTerm (p : ByCases) : Option Term :=
  match nameAppTerm p.exactArg with
  | none => none
  | some body =>
    if !(atomOk p.scrut && atomOk p.ctor) then
      none
    else
      match p.succArm with
      | none => some (onVar p.scrut [arm p.ctor body])
      | some a =>
        match encodeSucc a with
        | none => none
        | some sb => some (onVar p.scrut [arm p.ctor body, arm a.ctor sb])

/-- `unfold` and one name, as the file writes them.
    follower is set only for a form already in this checker:
    the token `rfl`, the token `exact`, the token `cases`,
    or the two tokens `by decide`.
    Arguments of exact and cases stay in the rest.
    At isValidTag_fail_closed the next token is `rw`.
    `rw` is not one of those forms, so follower is none
    and `rw` stays in this rest. parseRwTac reads that `rw`. -/
structure UnfoldTac where
  target : String
  follower : Option String

/-- The unfold name at the site is isValidTag.
    Tactic words are not that name. `rw` is not that name. -/
def isUnfoldTarget (s : String) : Bool :=
  isIdentTok s && !isHostAtom s && !isReservedTok s
    && s != "unfold" && s != "rw" && s != "cases"
    && s != "exact" && s != "with" && s != "decide"
    && s != "absurd"

def knownAfterUnfold (s : String) : Bool :=
  s == "rfl" || s == "exact" || s == "cases" || s == "by decide"

/-- The first token after the unfold name.
    Consume it only when it is `rfl`, `exact`, `cases`,
    or `by` then `decide`. Any other token, including `rw`,
    stays. This does not parse `rw` or a string `some`. -/
def takeKnownAfterUnfold (ts : List String) :
    Prod (Option String) (List String) :=
  match ts with
  | "rfl" :: rest => (some "rfl", rest)
  | "exact" :: rest => (some "exact", rest)
  | "cases" :: rest => (some "cases", rest)
  | "by" :: "decide" :: rest => (some "by decide", rest)
  | _ => (none, ts)

def unfoldTacOk (u : UnfoldTac) : Bool :=
  if !isUnfoldTarget u.target then
    false
  else
    match u.follower with
    | none => true
    | some w => knownAfterUnfold w

/-- `unfold <name>` then an optional known follower.
    The site is `unfold isValidTag`. This rest starts at `rw`.
    parseRwTac reads that `rw`. This function does not. -/
def parseUnfoldTac (ts : List String) :
    Option (Prod UnfoldTac (List String)) :=
  match ts with
  | "unfold" :: target :: rest =>
    match takeKnownAfterUnfold rest with
    | (fol, rest2) =>
      let u : UnfoldTac := { target := target, follower := fol }
      if unfoldTacOk u then some (u, rest2) else none
  | _ => none

/-- `by` then parseUnfoldTac. `cases` is not this function. -/
def consumeByUnfold (ts : List String) :
    Option (Prod UnfoldTac (List String)) :=
  match ts with
  | "by" :: rest => parseUnfoldTac rest
  | _ => none

/-- Binders, the colon, the unparsed statement, then `by unfold`.
    The proof word is `by`, not `rfl`. The first tactic is `unfold`.
    Rest starts at the first token that is not a known follower.
    Not a command. Does not accept the rest of MultTheorems.lean. -/
def unfoldAfterBinders (ts : List String) :
    Option (Prod (List ThmBinder) (Prod UnfoldTac (List String))) :=
  match bindersBeforeColon ts with
  | none => none
  | some (bs, rest) =>
    if !groupOk bs then
      none
    else
      match rest with
      | ":" :: rest1 =>
        match tokensBeforeAssign rest1 with
        | none => none
        | some rest2 =>
          match consumeByUnfold rest2 with
          | none => none
          | some step => some (bs, step)
      | _ => none

/-- `theorem <name>` then unfoldAfterBinders.
    The site name is isValidTag_fail_closed.
    Not a command. The value is not Cmd.def_. -/
def parseUnfoldTheorem (ts : List String) :
    Option (Prod String (Prod (List ThmBinder) (Prod UnfoldTac (List String)))) :=
  match ts with
  | "theorem" :: name :: rest =>
    if isTheoremName name then
      match unfoldAfterBinders rest with
      | none => none
      | some (bs, step) => some (name, (bs, step))
    else
      none
  | _ => none

/-- Image of one unfold in the closed term IR.
    `unfold` and the name are constants. `by` stays syntax.
    A known follower, when set, is one more constant.
    This function does not apply `rw`. Not a tactic elaborator. -/
def unfoldTerm (u : UnfoldTac) : Option Term :=
  if unfoldTacOk u then
    let base :=
      Term.app (Term.const (n "unfold")) (Term.const (n u.target))
    match u.follower with
    | none => some base
    | some word =>
      some (Term.app base (Term.const (n word)))
  else
    none

/-- `rw` and the idents written inside one pair of brackets.
    follower is set only for a form already in this checker,
    after the closing bracket: `rfl`, `exact`, `cases`,
    or `by decide`. The site list is ofNat?_fail_closed n h.
    The site follower is `rfl`. Brackets stay syntax.
    A comma is not an ident, so it is not an argument. -/
structure RwTac where
  args : List String
  follower : Option String

/-- Fail closed past this many bracket arguments.
    The named site uses three. `rw [h]` uses one. -/
def rwArgFuel : Nat := 8

/-- An argument inside `rw [` ... `]`.
    The site arguments are ofNat?_fail_closed, n, and h.
    Tactic words and host atoms are not arguments. -/
def isRwArg (s : String) : Bool :=
  isIdentTok s && !isHostAtom s && !isReservedTok s
    && s != "unfold" && s != "rw" && s != "cases"
    && s != "exact" && s != "with" && s != "decide"
    && s != "absurd"

def rwTacOk (r : RwTac) : Bool :=
  match r.args with
  | [] => false
  | args =>
    if !args.all isRwArg then
      false
    else
      match r.follower with
      | none => true
      | some w => knownAfterUnfold w

/-- Idents after the opening bracket, through the closing bracket.
    Empty brackets are none. Fuel counts arguments, not the closer.
    The closer is required. A comma stops this list. -/
def parseRwArgs (fuel : Nat) (ts : List String) (acc : List String) :
    Option (Prod (List String) (List String)) :=
  match ts with
  | "]" :: rest =>
    match acc with
    | [] => none
    | _ => some (acc.reverse, rest)
  | a :: rest =>
    match fuel with
    | 0 => none
    | Nat.succ k =>
      if isRwArg a then parseRwArgs k rest (a :: acc) else none
  | [] => none

/-- `rw [` idents `]` then an optional known follower.
    The site is `rw [ofNat?_fail_closed n h]` then `rfl`.
    `rfl` is consumed. `<;>` is not consumed. -/
def parseRwTac (ts : List String) :
    Option (Prod RwTac (List String)) :=
  match ts with
  | "rw" :: "[" :: rest =>
    match parseRwArgs rwArgFuel rest [] with
    | none => none
    | some (args, rest2) =>
      match takeKnownAfterUnfold rest2 with
      | (fol, rest3) =>
        let r : RwTac := { args := args, follower := fol }
        if rwTacOk r then some (r, rest3) else none
  | _ => none

/-- Left-nested application of const `rw` to each argument.
    The follower is not applied here. -/
def rwApps (fuel : Nat) (head : Term) (args : List String) : Option Term :=
  match fuel, args with
  | _, [] => some head
  | 0, _ :: _ => none
  | Nat.succ k, a :: rest =>
    rwApps k (Term.app head (Term.const (n a))) rest

/-- Image of one `rw` in the closed term IR.
    Arguments are constants, in the order written.
    A known follower, when set, is one more constant.
    Brackets stay syntax. Not a tactic elaborator. -/
def rwTerm (r : RwTac) : Option Term :=
  if !rwTacOk r then
    none
  else
    match rwApps rwArgFuel (Term.const (n "rw")) r.args with
    | none => none
    | some base =>
      match r.follower with
      | none => some base
      | some word =>
        if knownAfterUnfold word then
          some (Term.app base (Term.const (n word)))
        else
          none

/-- When rest starts at `rw`, apply that tactic to `base`.
    Otherwise leave `base` and rest unchanged.
    A `rw` that is not the bracket form is none. -/
def applyParsedRw (base : Term) (ts : List String) :
    Option (Prod Term (List String)) :=
  match ts with
  | "rw" :: _ =>
    match parseRwTac ts with
    | none => none
    | some (r, rest) =>
      match rwTerm r with
      | none => none
      | some rt => some (Term.app base rt, rest)
  | _ => some (base, ts)

/-- File-walk carrier for `theorem <name> ... := by unfold <name>`.
    Calls parseUnfoldTheorem. Does not require `:= rfl`.
    The closed IR has no theorem constructor, so this is Cmd.def_.
    The type is named Prop. Binders are parsed and not stored.
    The body is unfold applied to the name the file writes.
    At isValidTag_fail_closed that name is isValidTag.
    When the next tactic is `rw`, the body also applies that
    `rw` to the idents inside the brackets. A known follower
    after the closing bracket is consumed. At this site that
    follower is `rfl`. Rest starts after that `rfl`.
    Not parseMultText.
    Does not call Lean.Elab.processCommands.
    Does not claim MultTheorems.lean parses. -/
def unfoldTheoremCmd (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match parseUnfoldTheorem ts with
  | none => none
  | some (name, (_, (step, rest))) =>
    match unfoldTerm step with
    | none => none
    | some body =>
      match applyParsedRw body rest with
      | none => none
      | some (body2, rest2) =>
        if isTheoremName name then
          let cmd :=
            Cmd.def_ (n name) (some (HostType.named (n "Prop"))) body2
          some (cmd, rest2)
        else
          none

/-- `cases <name>` then lessTok, semiTok, gtTok, then `rfl`.
    The site scrut is m. The three tokens are syntax, not a
    tactic name. `rfl` is required and consumed. `with` is not
    this form. Not a tactic combinator. -/
structure CasesRfl where
  scrut : String

/-- The site scrut is m. A letter-start ident.
    Tactic words and host atoms are not scruts. `_` is not. -/
def isCasesScrut (s : String) : Bool :=
  match s.toList with
  | c :: cs =>
    isLetter c && cs.all isIdentChar && !isHostAtom s
      && !isReservedTok s && s != "unfold" && s != "rw"
      && s != "cases" && s != "exact" && s != "with"
      && s != "decide" && s != "absurd"
  | [] => false

def casesRflOk (c : CasesRfl) : Bool :=
  isCasesScrut c.scrut

/-- `cases m` then `<` `;` `>` then `rfl`.
    Rest starts after `rfl`. A missing `rfl` is none.
    `cases` then `with` is not this form. -/
def parseCasesRfl (ts : List String) :
    Option (Prod CasesRfl (List String)) :=
  match ts with
  | "cases" :: scrut :: a :: b :: c :: "rfl" :: rest =>
    if a == lessTok && b == semiTok && c == gtTok then
      let step : CasesRfl := { scrut := scrut }
      if casesRflOk step then some (step, rest) else none
    else
      none
  | _ => none

/-- `by` then parseCasesRfl. `unfold` is not this function. -/
def consumeByCasesRfl (ts : List String) :
    Option (Prod CasesRfl (List String)) :=
  match ts with
  | "by" :: rest => parseCasesRfl rest
  | _ => none

/-- Binders, the colon, the unparsed statement, then
    `by` `cases <name>` `<` `;` `>` `rfl`.
    The proof word is `by`, not `rfl` before `cases`.
    The statement is not re-parsed. Rest starts after `rfl`.
    Not a command. -/
def casesRflAfterBinders (ts : List String) :
    Option (Prod (List ThmBinder) (Prod CasesRfl (List String))) :=
  match bindersBeforeColon ts with
  | none => none
  | some (bs, rest) =>
    if !groupOk bs then
      none
    else
      match rest with
      | ":" :: rest1 =>
        match tokensBeforeAssign rest1 with
        | none => none
        | some rest2 =>
          match consumeByCasesRfl rest2 with
          | none => none
          | some step => some (bs, step)
      | _ => none

/-- `theorem <name>` then casesRflAfterBinders.
    The site name is isValid_true. Not a command.
    The value is not Cmd.def_. -/
def parseCasesRflTheorem (ts : List String) :
    Option (Prod String (Prod (List ThmBinder) (Prod CasesRfl (List String)))) :=
  match ts with
  | "theorem" :: name :: rest =>
    if isTheoremName name then
      match casesRflAfterBinders rest with
      | none => none
      | some (bs, step) => some (name, (bs, step))
    else
      none
  | _ => none

/-- Image of `cases <name>` then the three tokens then `rfl`.
    `cases` applied to the scrut name, then const `rfl`.
    The scrut is a constant, as `rw` arguments are.
    The three tokens stay syntax. Not Term.match_.
    Not a tactic elaborator. -/
def casesRflTerm (c : CasesRfl) : Option Term :=
  if casesRflOk c then
    some
      (Term.app
        (Term.app (Term.const (n "cases")) (Term.const (n c.scrut)))
        (Term.const (n "rfl")))
  else
    none

/-- File-walk carrier for `cases <name> <;> rfl`.
    Calls parseCasesRflTheorem. Does not require `:= rfl`.
    The closed IR has no theorem constructor, so this is Cmd.def_.
    The type is named Prop. Binders are parsed and not stored.
    The site is isValid_true. The scrut is m. Rest starts after
    `rfl`. Not parseMultText.
    Does not call Lean.Elab.processCommands.
    Does not claim MultTheorems.lean parses. -/
def casesRflTheoremCmd (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match parseCasesRflTheorem ts with
  | none => none
  | some (name, (_, (step, rest))) =>
    match casesRflTerm step with
    | none => none
    | some body =>
      if isTheoremName name then
        let cmd :=
          Cmd.def_ (n name) (some (HostType.named (n "Prop"))) body
        some (cmd, rest)
      else
        none

/-- File-walk carrier for `theorem <name> ... := by`.
    Calls parseByTheorem first. Does not require `:= rfl`.
    When that is none, calls casesRflTheoremCmd, then
    unfoldTheoremCmd.
    The closed IR has no theorem constructor, so this is Cmd.def_.
    The type is named Prop. Binders are parsed and not stored.
    On the cases path the body is byCasesTerm, including each
    parsed succ arm. A missing arm stays missing.
    On the unfold path the body is unfold applied to one name.
    Rest starts after that name, or after one known follower
    (`rfl`, `exact`, `cases`, or `by decide`) when that follower
    is the next token. When the next tactic is `rw [` idents `]`,
    that tactic and one known follower after `]` are consumed.
    At isValidTag_fail_closed the follower is `rfl`.
    Rest starts after that `rfl`.
    When the proof is `cases <name>` then `<` `;` `>` then `rfl`,
    that sequence is consumed and rest starts after `rfl`.
    The site is isValid_true. `some` of a string is not this carrier.
    Not parseMultText.
    Does not call Lean.Elab.processCommands.
    Does not claim MultTheorems.lean parses. -/
def byTheoremCmd (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match parseByTheorem ts with
  | some (name, (_, (step, rest))) =>
    match byCasesTerm step with
    | none => none
    | some body =>
      if isTheoremName name then
        let cmd :=
          Cmd.def_ (n name) (some (HostType.named (n "Prop"))) body
        some (cmd, rest)
      else
        none
  | none =>
    match casesRflTheoremCmd ts with
    | some cmd => some cmd
    | none => unfoldTheoremCmd ts

/-- `:= rfl` when the binder list before the colon is not empty.
    The site is theorem isValidTag_eq_ofNat?_isSome (n : Nat).
    The statement is already a term. This consumes the proof word rfl.
    Binders are not stored on Cmd.def_. The body is rfl applied to Eq.
    The type is named Prop. An empty binder list is none here.
    This does not parse the next theorem. unfold, rw, and some of a
    string are not this form.
    Does not call Lean.Elab.processCommands.
    Does not claim MultTheorems.lean parses. -/
def rflWithBinders (bs : List ThmBinder) (name : String)
    (lhs rhs : Term) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match bs with
  | [] => none
  | _ =>
    if groupOk bs && isTheoremName name then
      let eqt :=
        Term.app (Term.app (Term.const (n "Eq")) lhs) rhs
      let body := Term.app (Term.const (n "rfl")) eqt
      let cmd :=
        Cmd.def_ (n name) (some (HostType.named (n "Prop"))) body
      some (cmd, rest)
    else
      none

end SystemsLean.TheoremBinder
