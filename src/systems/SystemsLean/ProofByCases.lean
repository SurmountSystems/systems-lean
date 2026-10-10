/-
  One proof form: `by` then `cases <scrut> with | <ctor> =>`,
  then the first `exact` and a name or a juxtaposition application.
  The site is ofNat?_fail_closed. The scrut is n. The first arm is zero.
  That arm has no arguments. The exact argument at the site is the
  name absurd applied to the name h, then one parenthesis
  `(by decide : Not (2 < 0))`. Those two words are identifier atoms.
  They are not the absurd tactic. The parenthesis is nested `by decide`
  and the ascription Not of one less-than. It is not a general type.
  The next arm is `| succ n1 =>`. Its first tactic is `cases n1 with`.
  The binder and that scrutinee are the same name. The nested arm
  is `| zero =>`. Its first tactic is
  `exact absurd h (by decide : Not (2 < 1))`.
  The next nested arm is `| succ n2 =>`. Its first tactic is
  `cases n2 with`. The binder and that scrutinee are the same name.
  The arm after that `with` is `| zero =>`. Its first tactic is
  `exact absurd h (by decide : Not (2 < 2))`.
  The next arm is `| succ _ =>`. The binder is `_`.
  `_` is not a letter-start name. The arm body is the tactic `rfl`.
  Still open here: `some` of a string. `cases` then `<;>` is not this module.
  This is not a tactic language.
  Does not call Lean.Elab.processCommands.
  Does not claim MultTheorems.lean parses.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.ProofByCases
  Module must stay ASCII.
-/

import SystemsLean.LessThan

namespace SystemsLean.ProofByCases

open SystemsLean.LessThan (lessTok)

/-- `(by decide : Not (2 < 0))`.
    Nested `by`, then the tactic word. The ascription is Not of one
    parenthesized less-than. The two sides are nat tokens.
    Not a general type. Not a later arm. -/
structure ParenBy where
  tactic : String
  head : String
  lhs : String
  rhs : String

/-- A letter-start name, a left-nested juxtaposition, or one
    ParenBy argument. Any other parenthesis is not entered.
    `by` is not a name. -/
inductive NameApp where
  | name (atom : String)
  | app (fn : NameApp) (arg : NameApp)
  | paren (inner : ParenBy)

/-- `| zero =>` then one `exact`.
    The constructor is nullary. The first tactic is `exact` of one
    name application. Under `cases n1 with` that application is
    absurd, then h, then `(by decide : Not (2 < 1))`.
    Under `cases n2 with` it is the same names and
    `(by decide : Not (2 < 2))`. Not the outer `| zero =>` of
    `cases n`. `| succ _ =>` is not this value. Not `<;>`.
    Not unfold. Not rw. Not `rfl`. Not `some` of a string. -/
structure NestedZero where
  ctor : String
  exactArg : NameApp

/-- `| succ _ =>` then the tactic `rfl`.
    The constructor is one name. The binder is the wildcard `_`.
    `_` is not a letter-start name. The arm body is that tactic
    word, not `cases`. Not `<;>`. Not unfold. Not rw.
    Not `some` of a string. Not a letter-start binder. -/
structure WildSucc where
  ctor : String
  binder : String
  tactic : String

/-- `| succ n2 =>` then `cases n2 with`, and when written the
    following `| zero =>` exact, then `| succ _ =>` when that
    arm is written.
    The constructor takes one name. The first tactic is `cases`,
    the scrutinee, and `with`. The file writes the binder and the
    scrutinee as the same name. `nestedZero`, when set, is
    `| zero =>` and its exact. `wildSucc`, when set, is
    `| succ _ =>` and the tactic `rfl`. That binder is `_`.
    Not the outer `| succ n1 =>`. Not `<;>`. Not unfold. Not rw.
    Not `some` of a string. -/
structure NestedSucc where
  ctor : String
  binder : String
  scrut : String
  nestedZero : Option NestedZero
  wildSucc : Option WildSucc

/-- `| succ n1 =>` then `cases n1 with`, and when written the
    nested `| zero =>` exact, then `| succ n2 => cases n2 with`
    when that header is written, and the `| zero =>` exact under
    that `with` when it is written.
    The constructor takes one name. The first tactic is `cases`,
    the scrutinee, and `with`. The file writes the binder and the
    scrutinee as the same name. `nestedZero`, when set, is the
    `| zero =>` under `cases n1 with` and its exact.
    `nestedSucc`, when set, is `| succ n2 =>`, `cases n2 with`,
    the `| zero =>` exact under that `with` when written, and
    `| succ _ =>` with tactic `rfl` when that arm is written.
    The token after that `rfl` is not this value. Not `<;>`.
    Not unfold. Not rw. Not `some` of a string. -/
structure SuccArm where
  ctor : String
  binder : String
  scrut : String
  nestedZero : Option NestedZero
  nestedSucc : Option NestedSucc

/-- `cases scrut with | ctor =>`, then one `exact` name application.
    `succArm`, when set, is the next arm, that cases header, the
    nested zero exact when the file writes it, the nested succ
    header when the file writes it, the zero exact under that
    header when the file writes it, and `| succ _ =>` with
    tactic `rfl` when that arm is written. -/
structure ByCases where
  scrut : String
  ctor : String
  exactArg : NameApp
  succArm : Option SuccArm

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

/-- Letter start. The site names are n and zero. `_` is not this form. -/
def isName (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs => isLetter c && cs.all isIdentChar

def isHostAtom (s : String) : Bool :=
  s == "Nat" || s == "Mult" || s == "String" || s == "Bool"

/-- Later tactics are not scrutinees and not constructors.
    `absurd` stays reserved here so it is not a scrutinee.
    An exact argument may still use that word as a name atom. -/
def isReserved (s : String) : Bool :=
  s == "by" || s == "cases" || s == "with" || s == "exact"
    || s == "absurd" || s == "decide" || s == "unfold"
    || s == "rw" || s == "rfl" || s == "some" || s == "theorem"

/-- Proof-structure words are not exact-argument atoms.
    `absurd` is not in this list. At the site it is a name atom. -/
def isProofKw (s : String) : Bool :=
  s == "by" || s == "cases" || s == "with" || s == "exact"
    || s == "theorem"

def atomOk (s : String) : Bool :=
  isName s && !isHostAtom s && !isReserved s

def nameAppAtomOk (s : String) : Bool :=
  isName s && !isHostAtom s && !isProofKw s

/-- The ascription site uses 2 and 0. Empty is not a nat token. -/
def isNatTok (s : String) : Bool :=
  match s.toList with
  | [] => false
  | cs => cs.all isDigit

/-- This one argument only: decide, Not, and two nat tokens. -/
def parenByOk (p : ParenBy) : Bool :=
  p.tactic == "decide" && p.head == "Not"
    && isNatTok p.lhs && isNatTok p.rhs

def nameAppOk : NameApp -> Bool
  | NameApp.name s => nameAppAtomOk s
  | NameApp.app f a => nameAppOk f && nameAppOk a
  | NameApp.paren inner => parenByOk inner

/-- The written nested arm: one nullary ctor, then one exact. -/
def nestedZeroOk (a : NestedZero) : Bool :=
  atomOk a.ctor && nameAppOk a.exactArg

def nestedZeroOptOk : Option NestedZero -> Bool
  | none => true
  | some a => nestedZeroOk a

/-- `| succ _ =>` then one tactic word. The binder is `_`.
    `_` is not a letter-start name. The tactic at the site is `rfl`.
    A letter-start binder does not match. `<;>`, unfold, rw, and
    `some` of a string do not match. -/
def wildSuccOk (a : WildSucc) : Bool :=
  atomOk a.ctor && a.binder == "_" && !(isName a.binder)
    && a.tactic == "rfl"

/-- A wild arm is accepted only after the nested zero arm.
    Absent is ok. A wild arm with no zero arm is not this form. -/
def wildAfterZero (z : Option NestedZero) (w : Option WildSucc) : Bool :=
  match z, w with
  | _, none => true
  | some _, some a => wildSuccOk a
  | none, some _ => false

/-- The written nested succ header: one ctor, one binder, same scrutinee.
    The zero arm after `with`, when set, is one nullary exact.
    `| succ _ =>`, when set, follows that zero arm. Its binder is
    `_`. Its tactic is `rfl`. -/
def nestedSuccOk (a : NestedSucc) : Bool :=
  atomOk a.ctor && atomOk a.binder && atomOk a.scrut
    && a.binder == a.scrut && nestedZeroOptOk a.nestedZero
    && wildAfterZero a.nestedZero a.wildSucc

def nestedSuccOptOk : Option NestedSucc -> Bool
  | none => true
  | some a => nestedSuccOk a

/-- The written arm: one ctor, one binder, and `cases` on that binder.
    The nested zero arm, when set, is one nullary exact.
    The nested succ, when set, is that header, the zero exact
    after its `with` when written, and `| succ _ =>` with
    tactic `rfl` when that arm is written. -/
def succArmOk (a : SuccArm) : Bool :=
  atomOk a.ctor && atomOk a.binder && atomOk a.scrut
    && a.binder == a.scrut && nestedZeroOptOk a.nestedZero
    && nestedSuccOptOk a.nestedSucc

def succOptOk : Option SuccArm -> Bool
  | none => true
  | some a => succArmOk a

def byCasesOk (p : ByCases) : Bool :=
  atomOk p.scrut && atomOk p.ctor && nameAppOk p.exactArg
    && succOptOk p.succArm

/-- Stop after this many juxtaposed names. The site uses two names,
    then one parenthesis. Further tokens stay in the rest. -/
def nameAppFuel : Nat := 8

/-- `(by decide : Not (2 < 0))`.
    `by` is the nested proof word. decide is the tactic word.
    The colon is the ascription. Not is the head.
    The inner parenthesis is one less-than of two nat tokens.
    `<;>` does not match. A later arm is not read.
    Any other parenthesis is none. -/
def parseParenBy (ts : List String) :
    Option (Prod NameApp (List String)) :=
  match ts with
  | "(" :: "by" :: tac :: ":" :: head :: "(" :: lhs :: op :: rhs :: ")" :: ")" :: rest =>
    let inner : ParenBy :=
      { tactic := tac, head := head, lhs := lhs, rhs := rhs }
    if op == lessTok && parenByOk inner then
      some (NameApp.paren inner, rest)
    else
      none
  | _ => none

/-- A name, then further names as left-nested applications.
    One `(by decide : Not (nat < nat))` may follow those names.
    That parenthesis is consumed. Any other parenthesis, a proof
    keyword, or any other token stops the walk and stays in the rest.
    `by` outside this parenthesis is not a name. -/
def parseNameApp (ts : List String) : Option (Prod NameApp (List String)) :=
  match ts with
  | atom :: rest =>
    if nameAppAtomOk atom then
      go nameAppFuel (NameApp.name atom) rest
    else
      none
  | [] => none
where
  go (fuel : Nat) (acc : NameApp) (ts : List String) :
      Option (Prod NameApp (List String)) :=
    match fuel with
    | 0 => some (acc, ts)
    | Nat.succ k =>
      match ts with
      | "(" :: _ =>
        match parseParenBy ts with
        | some (arg, rest2) =>
          some (NameApp.app acc arg, rest2)
        | none => some (acc, ts)
      | atom :: rest =>
        if nameAppAtomOk atom then
          go k (NameApp.app acc (NameApp.name atom)) rest
        else
          some (acc, ts)
      | [] => some (acc, [])

/-- `exact` then one name application. The site argument is absurd
    applied to h, then `(by decide : Not (2 < 0))`. That parenthesis
    is consumed. A later arm stays in the rest. -/
def parseExact (ts : List String) : Option (Prod NameApp (List String)) :=
  match ts with
  | "exact" :: rest => parseNameApp rest
  | _ => none

/-- `| zero => exact ...` after `cases n1 with` or `cases n2 with`.
    The constructor is one name, then `=>`, with no binder.
    The first tactic is `exact` and one name application.
    Rest starts at the next token. After `cases n1 with` that
    token is `|` of `| succ n2`. After `cases n2 with` that
    token is `|` of `| succ _ =>`. This function does not store
    that arm. A binder before `=>`, `<;>`, unfold, rw, `rfl`,
    and `some` of a string do not match. They stay in the rest. -/
def parseNestedZero (ts : List String) :
    Option (Prod NestedZero (List String)) :=
  match ts with
  | "|" :: ctor :: "=>" :: rest =>
    match parseExact rest with
    | none => none
    | some (arg, rest2) =>
      let a : NestedZero := { ctor := ctor, exactArg := arg }
      if nestedZeroOk a then some (a, rest2) else none
  | _ => none

/-- `| succ _ =>` then the tactic `rfl`.
    The constructor is one name. The binder is `_`, not a
    letter-start name. The arm body is that one tactic word.
    Rest starts at the next token. At the site that token is
    `theorem` of the next declaration. A letter-start binder,
    `cases`, `<;>`, unfold, rw, and `some` of a string do not
    match. They stay in the rest. -/
def parseWildSucc (ts : List String) :
    Option (Prod WildSucc (List String)) :=
  match ts with
  | "|" :: ctor :: binder :: "=>" :: tactic :: rest =>
    let a : WildSucc :=
      { ctor := ctor, binder := binder, tactic := tactic }
    if wildSuccOk a then some (a, rest) else none
  | _ => none

/-- `| succ n2 => cases n2 with`, then `| zero => exact ...`
    when that arm is written, then `| succ _ =>` and `rfl`
    when that arm is written.
    The constructor is one name, then one binder, then `=>`.
    The first tactic is `cases`, that same name, and `with`.
    When the zero arm matches, it is consumed. When
    `| succ _ =>` then matches, it is consumed and rest starts
    after `rfl`. When that wild arm does not match, rest starts
    at the token after the zero exact. When the zero arm does
    not match, rest starts at the token after `with`, and the
    wild arm is not read.
    `<;>`, unfold, rw, and `some` of a string do not match.
    They stay in the rest. -/
def parseNestedSucc (ts : List String) :
    Option (Prod NestedSucc (List String)) :=
  match ts with
  | "|" :: ctor :: binder :: "=>" :: "cases" :: scrut :: "with" :: rest =>
    match parseNestedZero rest with
    | some (z, rest2) =>
      match parseWildSucc rest2 with
      | some (w, rest3) =>
        let a : NestedSucc :=
          { ctor := ctor, binder := binder, scrut := scrut
            , nestedZero := some z, wildSucc := some w }
        if nestedSuccOk a then some (a, rest3) else none
      | none =>
        let a : NestedSucc :=
          { ctor := ctor, binder := binder, scrut := scrut
            , nestedZero := some z, wildSucc := none }
        if nestedSuccOk a then some (a, rest2) else none
    | none =>
      let a : NestedSucc :=
        { ctor := ctor, binder := binder, scrut := scrut
          , nestedZero := none, wildSucc := none }
      if nestedSuccOk a then some (a, rest) else none
  | _ => none

/-- `| succ n1 => cases n1 with`, then `| zero => exact ...`
    when that arm is written, then `| succ n2 => cases n2 with`
    when that header is written, then the `| zero =>` exact
    under that `with` when it is written.
    The constructor is one name, then one binder, then `=>`.
    The first tactic is `cases`, that same name, and `with`.
    When the nested zero arm matches, it is consumed. When the
    nested succ header then matches, it is consumed. When the
    zero arm under that header matches, it is consumed. When
    `| succ _ =>` and `rfl` then match, they are consumed and
    rest starts after `rfl`. When that wild arm does not match,
    rest stays after the zero exact. When that zero arm does
    not match, rest stays after `with`. When the nested succ
    header does not match, rest stays after the nested exact.
    When the nested zero arm does not match, rest starts at the
    token after `with`, and the nested succ header is not read.
    `<;>`, unfold, rw, and `some` of a string do not match.
    They stay in the rest. -/
def parseSuccArm (ts : List String) :
    Option (Prod SuccArm (List String)) :=
  match ts with
  | "|" :: ctor :: binder :: "=>" :: "cases" :: scrut :: "with" :: rest =>
    match parseNestedZero rest with
    | some (z, rest2) =>
      match parseNestedSucc rest2 with
      | some (s, rest3) =>
        let a : SuccArm :=
          { ctor := ctor, binder := binder, scrut := scrut
            , nestedZero := some z, nestedSucc := some s }
        if succArmOk a then some (a, rest3) else none
      | none =>
        let a : SuccArm :=
          { ctor := ctor, binder := binder, scrut := scrut
            , nestedZero := some z, nestedSucc := none }
        if succArmOk a then some (a, rest2) else none
    | none =>
      let a : SuccArm :=
        { ctor := ctor, binder := binder, scrut := scrut
          , nestedZero := none, nestedSucc := none }
      if succArmOk a then some (a, rest) else none
  | _ => none

/-- `cases n with | zero => exact absurd h (by decide : Not (2 < 0))`.
    When the next arm is `| succ n1 => cases n1 with`, that arm is
    consumed. When `| zero =>` and its exact follow, they are
    consumed too. When `| succ n2 => cases n2 with` follows that
    exact, that header is consumed. When `| zero =>` and
    `exact absurd h (by decide : Not (2 < 2))` follow that `with`,
    they are consumed. When `| succ _ =>` and `rfl` follow, they
    are consumed and rest starts after `rfl`.
    A different next arm stays in the rest.
    `cases` then `<;>` is not this form.
    unfold, rw, and `some` of a string are not consumed. -/
def parseCases (ts : List String) : Option (Prod ByCases (List String)) :=
  match ts with
  | "cases" :: scrut :: "with" :: "|" :: ctor :: "=>" :: rest =>
    match parseExact rest with
    | none => none
    | some (arg, rest2) =>
      match parseSuccArm rest2 with
      | some (arm, rest3) =>
        let p : ByCases :=
          { scrut := scrut, ctor := ctor, exactArg := arg
            , succArm := some arm }
        if byCasesOk p then some (p, rest3) else none
      | none =>
        let p : ByCases :=
          { scrut := scrut, ctor := ctor, exactArg := arg
            , succArm := none }
        if byCasesOk p then some (p, rest2) else none
  | _ => none

end SystemsLean.ProofByCases
