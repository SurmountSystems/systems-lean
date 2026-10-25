/-
  One binder type, as ofNat?_some_implies_isValidTag writes it.
  The site is `(h : ofNat? n = some m)`.
  The left side is the name ofNat? applied to one name.
  The right side is the word some applied to one name.
  `=` stays syntax. The word some is the right head, not a string.
  The binder form rejects a string. `some "MULT-0"` is not EqSome.
  parseSomeString is that quoted literal after `some`, unquoted.
  Not a host atom. Not `2 < n`. Not a tactic language.
  Does not call Lean.Elab.processCommands.
  Does not claim MultTheorems.lean parses.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.EqSomeBinder
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

namespace SystemsLean.EqSomeBinder

/-- One name applied to one name. The head is the function.
    The argument is not a string literal. -/
structure AppliedName where
  head : String
  arg : String

/-- `ofNat? <name> = some <name>`.
    lhs.head is ofNat?. rhs.head is some.
    rhs.arg is a name. A string in rhs.arg is not this value. -/
structure EqSome where
  lhs : AppliedName
  rhs : AppliedName

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

/-- Nat and Mult are host atoms at the MultTheorems binders.
    String and Bool are the same closed atoms. -/
def isHostAtom (s : String) : Bool :=
  s == "Nat" || s == "Mult" || s == "String" || s == "Bool"

/-- `some` is a right-hand head in this module, not an argument.
    `by` and `theorem` and `rfl` are not names here. -/
def isReservedTok (s : String) : Bool :=
  s == "by" || s == "some" || s == "theorem" || s == "rfl"

/-- A letter-start name. `_` is not a name. A host atom is not.
    `some` is not an argument. A string literal is not. -/
def isLetterStart (s : String) : Bool :=
  match s.toList with
  | c :: cs =>
    isLetter c && cs.all isIdentChar && !isHostAtom s && !isReservedTok s
  | [] => false

/-- A quoted literal. `some` of this is not EqSome. -/
def isStringTok (s : String) : Bool :=
  match s.toList with
  | '"' :: _ => true
  | _ => false

/-- Same escapes as a host string token. Backslash keeps one char. -/
def unescapeLit : List Char -> List Char
  | [] => []
  | '\\' :: '\\' :: rest => '\\' :: unescapeLit rest
  | '\\' :: '"' :: rest => '"' :: unescapeLit rest
  | '\\' :: c :: rest => c :: unescapeLit rest
  | c :: rest => c :: unescapeLit rest

/-- Strip one pair of quotes. The site literal is `"MULT-0"`. -/
def unquoteLit (s : String) : Option String :=
  match s.toList with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: bodyRev =>
      some (String.mk (unescapeLit bodyRev.reverse))
    | _ => none
  | _ => none

/-- Tokens after the word `some`. The site is `some "MULT-0"`.
    The value is the unquoted literal `some` is applied to.
    A name is not this. Rest starts after the literal.
    Does not call Lean.Elab.processCommands. -/
def parseSomeString (ts : List String) :
    Option (Prod String (List String)) :=
  match ts with
  | lit :: rest =>
    match unquoteLit lit with
    | some s => some (s, rest)
    | none => none
  | [] => none

/-- The site heads are ofNat? and some. Arguments are letter-start
    names. rhs.arg is not a string. -/
def eqSomeOk (v : EqSome) : Bool :=
  v.lhs.head == "ofNat?" && isLetterStart v.lhs.arg
    && v.rhs.head == "some" && isLetterStart v.rhs.arg
    && !isStringTok v.rhs.arg

/-- `ofNat? <name> = some <name>`.
    Rest starts after the argument `some` is applied to.
    A string after `some` is none. A host atom is none.
    `2 < n` is none. This does not parse a later theorem. -/
def parseEqSome (ts : List String) :
    Option (Prod EqSome (List String)) :=
  match ts with
  | "ofNat?" :: funArg :: "=" :: "some" :: arg :: rest =>
    if isStringTok arg then
      none
    else
      let v : EqSome :=
        { lhs := { head := "ofNat?", arg := funArg }
        , rhs := { head := "some", arg := arg } }
      if eqSomeOk v then some (v, rest) else none
  | _ => none

end SystemsLean.EqSomeBinder
