/-
  Mult front: read the SystemsLean/Mult.lean surface, not full Lean 4.
  On this Mult surface only, postfix .isSome lowers to
  Term.app (Term.const (n "isSome")) on the receiver term.
  Other postfixes stay Term.proj.
  An import of a dotted module name, before the namespace, lowers to
  Cmd.importModule. SystemsLean/MultTheorems.lean uses that form first
  (`import SystemsLean.Mult`).
  The closed command IR has no theorem constructor. A `theorem name`
  with `lhs = rhs := rfl` lowers to Cmd.def_ of that name,
  type HostType.named Prop, body
  Term.app (Term.const rfl) (Term.app (Term.app (Term.const Eq) lhs) rhs).
  Empty binders stay here. Non-empty binders are rflWithBinders.
  Binders before the colon are TheoremBinder.bindersBeforeColon.
  A `:= by` proof is byTheoremCmd. `some` of a quoted literal is Term.some_.
  `<` is LessThan. `<;>` is that token, then `;` and `>`. Not a tactic language.
  parseMultText does not call Lean.Elab.processCommands.
  Does not claim on-disk Mult.lean or MultTheorems.lean was accepted.
  multLeanTextInDialect stays a Prop. It is not a theorem and is not sorry.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.MultFront
  Module must stay ASCII.
-/

import SystemsLean.EqSomeBinder
import SystemsLean.HostTerm
import SystemsLean.LessThan
import SystemsLean.MultFrontBinders
import SystemsLean.MultFrontType
import SystemsLean.TheoremBinder
import SystemsLean.Chain

namespace SystemsLean.MultFront

open SystemsLean.HostTerm
open SystemsLean.LessThan
open SystemsLean.TheoremBinder (bindersBeforeColon groupOk byTheoremCmd rflWithBinders)

/-! Comment strip and tokens. Strings stay literal. Block comments are not
    nested. A line comment is `--` outside a string. -/

inductive SMode where
  | code
  | line
  | blk (dash : Bool)
  | str
  | esc

def stripGo : List Char -> SMode -> List Char -> Option (List Char)
  | [], SMode.code, out => some out.reverse
  | [], SMode.line, out => some out.reverse
  | [], SMode.blk _, _ => none
  | [], SMode.str, _ => none
  | [], SMode.esc, _ => none
  | '\n' :: rest, SMode.line, out =>
    stripGo rest SMode.code ('\n' :: out)
  | _ :: rest, SMode.line, out =>
    stripGo rest SMode.line out
  | '/' :: rest, SMode.blk true, out =>
    stripGo rest SMode.code out
  | '-' :: rest, SMode.blk true, out =>
    stripGo rest (SMode.blk true) out
  | _ :: rest, SMode.blk true, out =>
    stripGo rest (SMode.blk false) out
  | '-' :: rest, SMode.blk false, out =>
    stripGo rest (SMode.blk true) out
  | _ :: rest, SMode.blk false, out =>
    stripGo rest (SMode.blk false) out
  | c :: rest, SMode.esc, out =>
    stripGo rest SMode.str (c :: '\\' :: out)
  | '\\' :: rest, SMode.str, out =>
    stripGo rest SMode.esc out
  | '"' :: rest, SMode.str, out =>
    stripGo rest SMode.code ('"' :: out)
  | c :: rest, SMode.str, out =>
    stripGo rest SMode.str (c :: out)
  | '-' :: '-' :: rest, SMode.code, out =>
    stripGo rest SMode.line out
  | '/' :: '-' :: rest, SMode.code, out =>
    stripGo rest (SMode.blk false) out
  | '"' :: rest, SMode.code, out =>
    stripGo rest SMode.str ('"' :: out)
  | c :: rest, SMode.code, out =>
    stripGo rest SMode.code (c :: out)

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\n' || c == '\t' || c == '\r'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def isSinglePunct (c : Char) : Bool :=
  c == ':' || c == '|' || c == '(' || c == ')' || c == '.'
    || c == ',' || c == '{' || c == '}' || c == '[' || c == ']'

def punctStr (c : Char) : String :=
  if c == ':' then ":"
  else if c == '|' then "|"
  else if c == '(' then "("
  else if c == ')' then ")"
  else if c == '.' then "."
  else if c == ',' then ","
  else if c == '{' then "{"
  else if c == '}' then "}"
  else if c == '[' then "["
  else "]"

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)
  | esc (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def tokGo : List Char -> TMode -> List String -> Option (List String)
  | [], TMode.norm, acc => some acc.reverse
  | [], TMode.id cur, acc => some (emitId acc cur).reverse
  | [], TMode.str _, _ => none
  | [], TMode.esc _, _ => none
  | '\\' :: rest, TMode.str cur, acc =>
    tokGo rest (TMode.esc cur) acc
  | '"' :: rest, TMode.str cur, acc =>
    let lit := String.mk ('"' :: cur.reverse ++ ['"'])
    tokGo rest TMode.norm (lit :: acc)
  | c :: rest, TMode.str cur, acc =>
    tokGo rest (TMode.str (c :: cur)) acc
  | c :: rest, TMode.esc cur, acc =>
    tokGo rest (TMode.str (c :: '\\' :: cur)) acc
  | ':' :: '=' :: rest, TMode.norm, acc =>
    tokGo rest TMode.norm (":=" :: acc)
  | '=' :: '>' :: rest, TMode.norm, acc =>
    tokGo rest TMode.norm ("=>" :: acc)
  | '=' :: rest, TMode.norm, acc =>
    tokGo rest TMode.norm ("=" :: acc)
  | '-' :: '>' :: rest, TMode.norm, acc =>
    tokGo rest TMode.norm ("->" :: acc)
  | '<' :: ';' :: '>' :: rest2, TMode.norm, acc =>
    tokGo rest2 TMode.norm (gtTok :: semiTok :: lessTok :: acc)
  | '<' :: rest, TMode.norm, acc =>
    tokGo rest TMode.norm (lessTok :: acc)
  | '"' :: rest, TMode.norm, acc =>
    tokGo rest (TMode.str []) acc
  | c :: rest, TMode.norm, acc =>
    if isWs c then tokGo rest TMode.norm acc
    else if isLetter c || c == '_' || c == '?' || isDigit c then
      tokGo rest (TMode.id [c]) acc
    else if isSinglePunct c then
      tokGo rest TMode.norm (punctStr c :: acc)
    else
      none
  | ':' :: '=' :: rest, TMode.id cur, acc =>
    tokGo rest TMode.norm (":=" :: emitId acc cur)
  | '=' :: '>' :: rest, TMode.id cur, acc =>
    tokGo rest TMode.norm ("=>" :: emitId acc cur)
  | '=' :: rest, TMode.id cur, acc =>
    tokGo rest TMode.norm ("=" :: emitId acc cur)
  | '-' :: '>' :: rest, TMode.id cur, acc =>
    tokGo rest TMode.norm ("->" :: emitId acc cur)
  | '<' :: ';' :: '>' :: rest2, TMode.id cur, acc =>
    tokGo rest2 TMode.norm (gtTok :: semiTok :: lessTok :: emitId acc cur)
  | '<' :: rest, TMode.id cur, acc =>
    tokGo rest TMode.norm (lessTok :: emitId acc cur)
  | c :: rest, TMode.id cur, acc =>
    if isIdentChar c then
      tokGo rest (TMode.id (c :: cur)) acc
    else if isWs c then
      tokGo rest TMode.norm (emitId acc cur)
    else if c == '"' then
      tokGo rest (TMode.str []) (emitId acc cur)
    else if isSinglePunct c then
      tokGo rest TMode.norm (punctStr c :: emitId acc cur)
    else
      none

def isNatTok (s : String) : Bool :=
  match s.toList with
  | [] => false
  | cs => cs.all isDigit

def isIdentTok (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs =>
    (isLetter c || c == '_' || c == '?') && cs.all isIdentChar

def isStringTok (s : String) : Bool :=
  match s.toList with
  | '"' :: _ => true
  | _ => false

/-- Tokens that end a term or are not names. `where` is included so it is
    not a name; inductive syntax consumes `where` itself. -/
def isStopTok (s : String) : Bool :=
  s == "def" || s == "inductive" || s == "namespace" || s == "end"
    || s == "deriving" || s == "where" || s == "theorem" || s == "by"
    || s == "match" || s == "do" || s == "structure" || s == "class"
    || s == "instance" || s == "universe" || s == "universes"
    || s == "import" || s == "open" || s == "module" || s == "check"
    || s == "abbrev" || s == "axiom" || s == "example" || s == "mutual"
    || s == "sorry" || s == "else" || s == "then" || s == "if"
    || s == "have" || s == "show" || s == "fun" || s == "let"
    || s == "|" || s == ":=" || s == ":" || s == ")" || s == ","
    || s == "=>" || s == "->" || s == "." || s == "{" || s == "}"
    || s == "=" || s == lessTok || s == semiTok || s == gtTok

def isLitKw (s : String) : Bool :=
  s == "true" || s == "false" || s == "none" || s == "some"

def isNameSeg (s : String) : Bool :=
  isIdentTok s && !isStopTok s && !isLitKw s

def isArgStart (s : String) : Bool :=
  isLitKw s || s == "(" || isStringTok s || isNatTok s || isNameSeg s

def unescape : List Char -> List Char
  | [] => []
  | '\\' :: '\\' :: rest => '\\' :: unescape rest
  | '\\' :: '"' :: rest => '"' :: unescape rest
  | '\\' :: c :: rest => c :: unescape rest
  | c :: rest => c :: unescape rest

def unquote (s : String) : Option String :=
  match s.toList with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: bodyRev =>
      some (String.mk (unescape bodyRev.reverse))
    | _ => none
  | _ => none

def multNs : String := "SystemsLean.Mult"

/-- This front, not the one-line dialect. A longer dotted namespace does
    not count. -/
def hasNsMarker : List String -> Bool
  | [] => false
  | "namespace" :: "SystemsLean" :: "." :: "Mult" :: "." :: rest =>
    hasNsMarker rest
  | "namespace" :: "SystemsLean" :: "." :: "Mult" :: _ =>
    true
  | _ :: rest => hasNsMarker rest

def hasIndMarker : List String -> Bool
  | [] => false
  | "inductive" :: "Mult" :: "where" :: _ => true
  | _ :: rest => hasIndMarker rest

def parseDotted (ts : List String) : Option (Prod String (List String)) :=
  match ts with
  | t :: rest =>
    if isNameSeg t then cont t rest else none
  | [] => none
where
  cont (acc : String) : List String -> Option (Prod String (List String))
    | "." :: t :: rest =>
      if isNameSeg t then cont (acc ++ "." ++ t) rest else none
    | ts => some (acc, ts)

def parseQualLast (ts : List String) :
    Option (Prod String (List String)) :=
  match ts with
  | t :: rest =>
    if isNameSeg t then cont t rest else none
  | [] => none
where
  cont (last : String) : List String -> Option (Prod String (List String))
    | "." :: t :: rest =>
      if isNameSeg t then cont t rest else none
    | ts => some (last, ts)

def parseTypeAtom (ts : List String) :
    Option (Prod HostType (List String)) :=
  match ts with
  | "Mult" :: rest => some (HostType.mult, rest)
  | "Nat" :: rest => some (HostType.nat, rest)
  | "String" :: rest => some (HostType.string, rest)
  | "Bool" :: rest => some (HostType.bool, rest)
  | "Option" :: rest =>
    match parseTypeAtom rest with
    | some (t, rest2) => some (HostType.option t, rest2)
    | none => none
  | _ => none

def parseType (ts : List String) : Option (Prod HostType (List String)) :=
  MultFrontType.parseTypeOf ts

def arrows (bs : List (Prod String HostType)) (ret : HostType) : HostType :=
  match bs with
  | [] => ret
  | (_, t) :: rest => HostType.arrow t (arrows rest ret)

def parseBinders (ts : List String) :
    Option (Prod (List (Prod String HostType)) (List String)) :=
  MultFrontBinders.parseBindersOf isNameSeg ts

def parsePat (ts : List String) : Option (Prod Pat (List String)) :=
  match ts with
  | "_" :: rest => some (Pat.wild, rest)
  | t :: rest =>
    if isNatTok t then
      match t.toNat? with
      | some k => some (Pat.litNat k, rest)
      | none => none
    else
      match parseQualLast (t :: rest) with
      | some (last, rest2) => some (Pat.ctor0 (n last), rest2)
      | none => none
  | [] => none

def parseClassList (ts : List String) :
    Option (Prod (List Name) (List String)) :=
  match ts with
  | t :: rest =>
    if isNameSeg t then
      match rest with
      | "," :: rest2 =>
        match parseClassList rest2 with
        | some (cs, rest3) => some (n t :: cs, rest3)
        | none => none
      | _ => some ([n t], rest)
    else
      none
  | [] => none

def parseDeriving (ts : List String) :
    Option (Prod (List Name) (List String)) :=
  match ts with
  | "deriving" :: rest => parseClassList rest
  | _ => some ([], ts)

/-- `| Ctor` nullary only. `| Ctor (x : T)` is none. -/
def parseCtors (ts : List String) :
    Option (Prod (List CtorDecl) (List String)) :=
  match ts with
  | "|" :: name :: rest =>
    if isNameSeg name then
      match rest with
      | "(" :: _ => none
      | "|" :: _ =>
        match parseCtors rest with
        | some (cs, rest2) =>
          some (CtorDecl.mk (n name) :: cs, rest2)
        | none => none
      | _ => some ([CtorDecl.mk (n name)], rest)
    else
      none
  | _ => none

def parseInd (ts : List String) : Option (Prod Cmd (List String)) :=
  match ts with
  | "inductive" :: name :: "where" :: rest =>
    if isNameSeg name then
      match parseCtors rest with
      | none => none
      | some (ctors, rest2) =>
        match parseDeriving rest2 with
        | none => none
        | some (der, rest3) =>
          some (Cmd.inductive_ (n name) ctors der, rest3)
    else
      none
  | _ => none

def parseFuel : Nat := 8192

mutual

def parseTermN (fuel : Nat) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parseSimpleN k ts with
    | none => none
    | some (t, rest) => parseAppsN k t rest

def parseAppsN (fuel : Nat) (acc : Term) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | t :: _ =>
      if isArgStart t then
        match parseArgN k ts with
        | none => none
        | some (a, rest) => parseAppsN k (Term.app acc a) rest
      else
        some (acc, ts)
    | [] => some (acc, [])

def parseSimpleN (fuel : Nat) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parseAtomN k ts with
    | none => none
    | some (t, rest) => addPostfixN k t rest

def addPostfixN (fuel : Nat) (t : Term) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "." :: f :: rest =>
      if isNameSeg f then
        if f == "isSome" then
          addPostfixN k (Term.app (Term.const (n "isSome")) t) rest
        else
          addPostfixN k (Term.proj t (n f)) rest
      else
        none
    | _ => some (t, ts)

def parseAtomN (fuel : Nat) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | "(" :: rest =>
      match parseTermN k rest with
      | none => none
      | some (t, rest2) =>
        match rest2 with
        | ")" :: rest3 => some (t, rest3)
        | _ => none
    | "true" :: rest => some (Term.litBool true, rest)
    | "false" :: rest => some (Term.litBool false, rest)
    | "none" :: rest => some (Term.none_, rest)
    | "some" :: rest =>
      match parseQualLast rest with
      | some (last, rest2) =>
        some (Term.some_ (Term.const (n last)), rest2)
      | none =>
        match SystemsLean.EqSomeBinder.parseSomeString rest with
        | some (s, rest2) =>
          some (Term.some_ (Term.litString s), rest2)
        | none =>
          match rest with
          | "(" :: _ =>
            match parseAtomN k rest with
            | some (t, rest2) => some (Term.some_ t, rest2)
            | none => none
          | _ => none
    | t :: rest =>
      if isNatTok t then
        match t.toNat? with
        | some k => some (Term.litNat k, rest)
        | none => none
      else if isStringTok t then
        match unquote t with
        | some s => some (Term.litString s, rest)
        | none => none
      else if isNameSeg t then
        match rest with
        | "." :: seg :: _ =>
          if isNameSeg seg then
            match parseQualLast ts with
            | some (last, rest2) =>
              some (Term.const (n last), rest2)
            | none => none
          else
            none
        | _ => some (Term.const (n t), rest)
      else
        none

/-- Argument idents are variables. A dotted name is a const of its last
    segment. Parentheses group. Postfix .isSome is an app of const isSome.
    Every other postfix field stays Term.proj. -/
def parseArgN (fuel : Nat) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "(" :: _ => parseSimpleN k ts
    | "true" :: rest => some (Term.litBool true, rest)
    | "false" :: rest => some (Term.litBool false, rest)
    | "none" :: rest => some (Term.none_, rest)
    | "some" :: rest =>
      match parseQualLast rest with
      | some (last, rest2) =>
        some (Term.some_ (Term.const (n last)), rest2)
      | none => none
    | t :: rest =>
      if isNatTok t then
        match t.toNat? with
        | some k => some (Term.litNat k, rest)
        | none => none
      else if isStringTok t then
        match unquote t with
        | some s => some (Term.litString s, rest)
        | none => none
      else if isNameSeg t then
        match rest with
        | "." :: seg :: _ =>
          if isNameSeg seg then
            match parseQualLast ts with
            | some (last, rest2) =>
              some (Term.const (n last), rest2)
            | none => none
          else
            none
        | _ => some (Term.var (n t), rest)
      else
        none
    | [] => none

def parseArmsN (fuel : Nat) (ts : List String) :
    Option (Prod (List (Prod Pat Term)) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "|" :: rest =>
      match parsePat rest with
      | none => none
      | some (p, rest2) =>
        match rest2 with
        | "=>" :: rest3 =>
          match parseTermN k rest3 with
          | none => none
          | some (tm, rest4) =>
            match rest4 with
            | "|" :: _ =>
              match parseArmsN k rest4 with
              | some (arms, rest5) =>
                some ((p, tm) :: arms, rest5)
              | none => none
            | _ => some ([(p, tm)], rest4)
        | _ => none
    | _ => none

def binderBody (k : Nat) (bs : List (Prod String HostType))
    (ret : HostType) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match rest with
  | ":=" :: "|" :: _ => none
  | ":=" :: rest5 =>
    match parseTermN k rest5 with
    | none => none
    | some (body, rest6) =>
      match rest6 with
      | "|" :: _ => none
      | _ =>
        let ty := arrows bs ret
        some (Cmd.def_ (n "pending") (some ty) body, rest6)
  | _ => none

def parseDefN (fuel : Nat) (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: name :: rest =>
      if !isNameSeg name then none
      else
        match rest with
        | "(" :: _ =>
          match parseBinders rest with
          | none => none
          | some (bs, rest2) =>
            match rest2 with
            | ":" :: rest3 =>
              match parseType rest3 with
              | none => none
              | some (ret, rest4) =>
                match binderBody k bs ret rest4 with
                | none => none
                | some (cmd, rest5) =>
                  match cmd with
                  | Cmd.def_ _ ty body =>
                    some (Cmd.def_ (n name) ty body, rest5)
                  | _ => none
            | _ => none
        | ":" :: rest2 =>
          match parseType rest2 with
          | none => none
          | some (ty, rest3) =>
            match rest3 with
            | "|" :: _ =>
              match parseArmsN k rest3 with
              | none => none
              | some (arms, rest4) =>
                if arms.isEmpty then none
                else
                  let scrut := Term.var (n "scrut")
                  let body := Term.match_ scrut arms
                  some (Cmd.def_ (n name) (some ty) body, rest4)
            | _ => none
        | _ => none
    | _ => none

/-- `theorem name : lhs = rhs := rfl`, binders optional.
    Empty binders stay here. Non-empty is rflWithBinders.
    Does not call Lean.Elab.processCommands. -/
def parseRflTheorem (fuel : Nat) (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: name :: rest0 =>
      if !isNameSeg name then none
      else
        match bindersBeforeColon rest0 with
        | none => none
        | some (bs, rest) =>
          match rest, groupOk bs with
          | ":" :: rest1, true =>
            match parseTermN k rest1 with
            | none => none
            | some (lhs, rest2) =>
              match rest2 with
              | "=" :: rest3 =>
                match parseTermN k rest3 with
                | none => none
                | some (rhs, rest4) =>
                  match rest4 with
                  | ":=" :: "rfl" :: rest5 =>
                    match bs with
                    | [] =>
                      let eqt :=
                        Term.app (Term.app (Term.const (n "Eq")) lhs) rhs
                      let body := Term.app (Term.const (n "rfl")) eqt
                      let cmd :=
                        Cmd.def_ (n name)
                          (some (HostType.named (n "Prop"))) body
                      some (cmd, rest5)
                    | _ => rflWithBinders bs name lhs rhs rest5
                  | _ => none
              | _ => none
          | _, _ => none
    | _ => none

def parseCmdsN (fuel : Nat) (sawNs sawEnd : Bool) (acc : List Cmd)
    (ts : List String) : Option (List Cmd) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] =>
      if acc.isEmpty then none else some acc.reverse
    | "import" :: rest =>
      -- Top of the file only. MultTheorems.lean starts with this form.
      -- `by` then `cases` `<;>` `rfl` is byTheoremCmd. `some` of a string is parseSomeString.
      if sawNs || sawEnd then none
      else
        match parseDotted rest with
        | some (nm, rest2) =>
          let c := Cmd.importModule (n nm)
          parseCmdsN k sawNs sawEnd (c :: acc) rest2
        | none => none
    | "namespace" :: rest =>
      if sawNs then none
      else
        match parseDotted rest with
        | some (nm, rest2) =>
          if nm == multNs then
            let c := Cmd.namespace (n nm)
            parseCmdsN k true sawEnd (c :: acc) rest2
          else
            none
        | none => none
    | "end" :: rest =>
      if !sawNs || sawEnd then none
      else
        match parseDotted rest with
        | some (nm, rest2) =>
          if nm == multNs then
            let c := Cmd.endNamespace (n nm)
            parseCmdsN k sawNs true (c :: acc) rest2
          else
            none
        | none => none
    | "inductive" :: _ =>
      match parseInd ts with
      | some (c, rest) =>
        parseCmdsN k sawNs sawEnd (c :: acc) rest
      | none => none
    | "def" :: _ =>
      match parseDefN k ts with
      | some (c, rest) =>
        parseCmdsN k sawNs sawEnd (c :: acc) rest
      | none => none
    | "theorem" :: _ =>
      -- Inside the namespace only. Empty `:= rfl` stays parseRflTheorem.
      -- Non-empty `:= rfl` is rflWithBinders. `:= by` is byTheoremCmd.
      if !sawNs || sawEnd then none
      else
        match parseRflTheorem k ts with
        | some (c, rest) =>
          parseCmdsN k sawNs sawEnd (c :: acc) rest
        | none =>
          match byTheoremCmd ts with
          | some (c, rest) =>
            parseCmdsN k sawNs sawEnd (c :: acc) rest
          | none => none
    | _ => none

end

def finishModule (cmds : List Cmd) : Option Module :=
  if cmds.isEmpty then
    none
  else
    let m : Module := { name := n multNs, commands := cmds }
    if isWellFormed m then some m else none

/-- Parse the SystemsLean/Mult.lean surface into a host module.
    A leading `import Dotted.Name` is Cmd.importModule.
    `theorem name : lhs = rhs := rfl` lowers to a Prop def_
    whose body is rfl applied to Eq lhs rhs. Binders may be present.
    `none` means not this front, or fail closed.
    `:= by` is byTheoremCmd. Binders before `:` are bindersBeforeColon.
    `<` is LessThan.lessTok. `<;>` is lessTok, then semiTok, then gtTok.
    `some` of a quoted literal is Term.some_ of Term.litString.
    Does not read the filesystem. Does not call Lean.Elab.processCommands.
    A parsed mult module is returned as itself.
    None tries SystemsLean.Chain.parseChain.
    Does not claim an on-disk file was accepted. -/
def parseMultText (src : String) : Option Module :=
  let parsed : Option Module :=
    match stripGo src.toList SMode.code [] with
    | none => none
    | some kept =>
      match tokGo kept TMode.norm [] with
      | none => none
      | some ts =>
        if hasNsMarker ts || hasIndMarker ts then
          match parseCmdsN parseFuel false false [] ts with
          | some cmds => finishModule cmds
          | none => none
        else
          none
  match parsed with
  | some m => some m
  | none => SystemsLean.Chain.parseChain src

/-- `src` is in the SystemsLean/Mult.lean dialect when parseMultText accepts it.
    The string is that file's text, not a golden and not full Lean 4.
    No on-disk file is claimed to meet this.
    Kernel acceptance is separate (slakeCheckerAccepts) and is not stated here.
    Lean.Elab.processCommands is not this path. -/
def multLeanTextInDialect (src : String) : Prop :=
  match parseMultText src with
  | some _ => True
  | none => False

end SystemsLean.MultFront
