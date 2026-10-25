/-
  One-line dialect line parser for the Mult-first host fragment front-end.
  Module: SystemsLean.HostFrontLine
  Role: tokens, host types, terms, and one command line.
  Fold, parseSource, pins, and the driver stay in SystemsLean.HostFront.
  Does not call Lean.Elab.processCommands.
  Not elaborator parity. Not freestanding residual free. Not PROVABLY.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostFrontLine

/-- Copies so the line parser does not import HostFront. Not re-exported. -/
def reasonLineShape : String := "LINE-SHAPE"
def reasonUnknownCmd : String := "UNKNOWN-CMD"
def reasonParseFail : String := "PARSE-FAIL"
def reasonZeroCtor : String := "ZERO-CTOR-INDUCTIVE"

end SystemsLean.HostFrontLine

namespace SystemsLean.HostFront

open SystemsLean.HostTerm
open SystemsLean.HostFrontLine (reasonLineShape reasonUnknownCmd reasonParseFail reasonZeroCtor)

/-! ### Line parse helpers (List-based; decide-friendly) -/

/-- True when char is horizontal whitespace. -/
def isWs (c : Char) : Bool := c == ' ' || c == '\t' || c == '\r'

/-- Single-pass token collector. -/
def lineTokensGo (cur : List Char) (acc : List String) :
    List Char -> List String
  | [] =>
    let acc' :=
      if cur.isEmpty then acc else String.ofList cur.reverse :: acc
    acc'.reverse
  | c :: rest =>
    if isWs c then
      if cur.isEmpty then
        lineTokensGo [] acc rest
      else
        lineTokensGo [] (String.ofList cur.reverse :: acc) rest
    else
      lineTokensGo (c :: cur) acc rest

/-- Split line into non-empty whitespace-separated tokens. -/
def lineTokens (line : String) : List String :=
  lineTokensGo [] [] line.toList

/-- True when line is blank or a # comment (after leading spaces). -/
def isIgnorableLine (line : String) : Bool :=
  let toks := lineTokens line
  match toks with
  | [] => true
  | t :: _ =>
    match t.toList with
    | '#' :: _ => true
    | _ => false

/-- Digit char. -/
def isDigit (c : Char) : Bool := '0' <= c && c <= '9'

/-- True when token is a non-empty decimal Nat literal. -/
def isNatLit (s : String) : Bool :=
  let cs := s.toList
  !cs.isEmpty && cs.all isDigit

/-- Parse Nat from digit string (fail closed). -/
def ofNatLit? (s : String) : Option Nat :=
  if !isNatLit s then none
  else
    let rec go (acc : Nat) : List Char -> Nat
      | [] => acc
      | c :: rest => go (acc * 10 + (c.toNat - '0'.toNat)) rest
    some (go 0 s.toList)

/-- True when token is a double-quoted string literal. -/
def isStringLit (s : String) : Bool :=
  let cs := s.toList
  match cs with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: _ => true
    | _ => false
  | _ => false

/-- Strip surrounding quotes from a string literal token. -/
def stripStringLit (s : String) : String :=
  let cs := s.toList
  match cs with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: mid => String.ofList mid.reverse
    | _ => s
  | _ => s

/-- Reserved syntax keywords (not bare identifiers).
    Type names Mult/Nat/String/Bool/Option are NOT keywords so `inductive Mult`
    works; parseHostType still prefers Mult/Nat/... base types first. -/
def isKeyword (s : String) : Bool :=
  s == "module" || s == "import" || s == "namespace" || s == "end"
    || s == "open" || s == "inductive" || s == "deriving" || s == "def"
    || s == "check" || s == "match" || s == "some" || s == "none"
    || s == "true" || s == "false" || s == "var" || s == "const"
    || s == "app" || s == ":=" || s == ":" || s == "->" || s == "|"
    || s == "=>" || s == "(" || s == ")" || s == "_"

/-- Bare identifier: non-empty, not keyword, not nat, not string lit. -/
def isIdent (s : String) : Bool :=
  !s.isEmpty && !isKeyword s && !isNatLit s && !isStringLit s

/-- Fuel for recursive type/term parse. -/
def parseFuel : Nat := 64

/-! ### HostType parse -/

/-- Parse one HostType; returns (type, remaining tokens). -/
def parseHostTypeN : Nat -> List String -> Option (Prod HostType (List String))
  | 0, _ => none
  | Nat.succ n, toks =>
    match toks with
    | [] => none
    | "Mult" :: rest => some (HostType.mult, rest)
    | "Nat" :: rest => some (HostType.nat, rest)
    | "String" :: rest => some (HostType.string, rest)
    | "Bool" :: rest => some (HostType.bool, rest)
    | "Option" :: rest =>
      match parseHostTypeN n rest with
      | some (t, rest2) => some (HostType.option t, rest2)
      | none => none
    | t :: rest =>
      if isIdent t then
        some (HostType.named (HostTerm.n t), rest)
      else
        none

/-- Parse HostType with optional trailing arrow chain (right-assoc).
    Mult -> String, Nat -> Option Mult. -/
def parseHostTypeArrowN : Nat -> List String -> Option (Prod HostType (List String))
  | 0, _ => none
  | Nat.succ n, toks =>
    match parseHostTypeN n toks with
    | none => none
    | some (left, rest) =>
      match rest with
      | "->" :: rest2 =>
        match parseHostTypeArrowN n rest2 with
        | some (right, rest3) => some (HostType.arrow left right, rest3)
        | none => none
      | _ => some (left, rest)

/-- Entry HostType parse. -/
def parseHostType (toks : List String) : Option (Prod HostType (List String)) :=
  parseHostTypeArrowN parseFuel toks

/-! ### Pat / Term parse -/

/-- Parse one pattern. -/
def parsePat : List String -> Option (Prod Pat (List String))
  | [] => none
  | "_" :: rest => some (Pat.wild, rest)
  | t :: rest =>
    if isNatLit t then
      match ofNatLit? t with
      | some k => some (Pat.litNat k, rest)
      | none => none
    else if isIdent t then
      some (Pat.ctor0 (HostTerm.n t), rest)
    else
      none

/-- Atom term: no match (used for match arm bodies and nested apps).
    Mult-first v0 arm bodies are atoms only (no nested match). -/
def parseAtomTermN : Nat -> List String -> Option (Prod Term (List String))
  | 0, _ => none
  | Nat.succ n, toks =>
    match toks with
    | [] => none
    | "none" :: rest => some (Term.none_, rest)
    | "true" :: rest => some (Term.litBool true, rest)
    | "false" :: rest => some (Term.litBool false, rest)
    | "some" :: rest =>
      match parseAtomTermN n rest with
      | some (t, rest2) => some (Term.some_ t, rest2)
      | none => none
    | "var" :: name :: rest =>
      if isIdent name then some (Term.var (HostTerm.n name), rest) else none
    | "const" :: name :: rest =>
      if isIdent name then some (Term.const (HostTerm.n name), rest) else none
    | "app" :: rest =>
      match parseAtomTermN n rest with
      | some (f, rest1) =>
        match parseAtomTermN n rest1 with
        | some (a, rest2) => some (Term.app f a, rest2)
        | none => none
      | none => none
    | "(" :: rest =>
      match parseAtomTermN n rest with
      | some (t, ")" :: rest2) => some (t, rest2)
      | _ => none
    | t :: rest =>
      if isNatLit t then
        match ofNatLit? t with
        | some k => some (Term.litNat k, rest)
        | none => none
      else if isStringLit t then
        some (Term.litString (stripStringLit t), rest)
      else if isIdent t then
        some (Term.const (HostTerm.n t), rest)
      else
        none

/-- Parse match arms: `| Pat => AtomTerm` repeated. -/
def parseMatchArmsN :
    Nat -> Nat -> List (Prod Pat Term) -> List String ->
      Option (Prod (List (Prod Pat Term)) (List String))
  | _, 0, _, _ => none
  | termFuel, Nat.succ f, acc, ts =>
    match ts with
    | "|" :: restA =>
      match parsePat restA with
      | none => none
      | some (p, "=>" :: restB) =>
        match parseAtomTermN termFuel restB with
        | none => none
        | some (body, restC) =>
          parseMatchArmsN termFuel f (acc ++ [(p, body)]) restC
      | some _ => none
    | _ => some (acc, ts)

/-- Parse term with fuel (match uses atom bodies only; no mutual recursion). -/
def parseTermN : Nat -> List String -> Option (Prod Term (List String))
  | 0, _ => none
  | Nat.succ n, toks =>
    match toks with
    | [] => none
    | "match" :: rest =>
      match parseAtomTermN n rest with
      | none => none
      | some (scrut, rest1) =>
        match parseMatchArmsN n n [] rest1 with
        | some (armList, rest2) =>
          if armList.isEmpty then none
          else some (Term.match_ scrut armList, rest2)
        | none => none
    | _ => parseAtomTermN (Nat.succ n) toks

/-- Entry Term parse. -/
def parseTerm (toks : List String) : Option (Prod Term (List String)) :=
  parseTermN parseFuel toks

/-- Require full consume. -/
def parseTermAll (toks : List String) : Option Term :=
  match parseTerm toks with
  | some (t, []) => some t
  | _ => none

/-- Require full type consume. -/
def parseHostTypeAll (toks : List String) : Option HostType :=
  match parseHostType toks with
  | some (ty, []) => some ty
  | _ => none

/-! ### Command parse -/

/-- Split tokens at first ":=" into (before, after). -/
def splitAtAssign : List String -> Option (Prod (List String) (List String))
  | [] => none
  | ":=" :: rest => some ([], rest)
  | t :: rest =>
    match splitAtAssign rest with
    | some (pre, post) => some (t :: pre, post)
    | none => none

/-- Split tokens at first ":" into (before, after). Not ":=". -/
def splitAtColon : List String -> Option (Prod (List String) (List String))
  | [] => none
  | ":" :: rest => some ([], rest)
  | t :: rest =>
    match splitAtColon rest with
    | some (pre, post) => some (t :: pre, post)
    | none => none

/-- Parse inductive ctor list until deriving or end. -/
def parseCtors : List String -> Option (Prod (List CtorDecl) (List String))
  | [] => some ([], [])
  | "deriving" :: rest => some ([], "deriving" :: rest)
  | t :: rest =>
    if isIdent t then
      match parseCtors rest with
      | some (cs, rest2) => some ({ name := HostTerm.n t } :: cs, rest2)
      | none => none
    else
      none

/-- Parse deriving class list (all remaining idents). -/
def parseDeriving : List String -> Option (List Name)
  | [] => some []
  | t :: rest =>
    if isIdent t then
      match parseDeriving rest with
      | some ns => some (HostTerm.n t :: ns)
      | none => none
    else
      none

/-- Parse one non-ignorable line into a command or module-name event. -/
inductive LineParse where
  | moduleName (name : Name)
  | cmd (c : Cmd)
  | err (reason : String)
  deriving Repr

/-- Parse command line tokens. -/
def parseLineTokens (toks : List String) : LineParse :=
  match toks with
  | [] => LineParse.err reasonLineShape
  | "module" :: name :: [] =>
    if isIdent name then LineParse.moduleName (HostTerm.n name)
    else LineParse.err reasonLineShape
  | "module" :: _ => LineParse.err reasonLineShape
  | "import" :: name :: [] =>
    if isIdent name then LineParse.cmd (Cmd.importModule (HostTerm.n name))
    else LineParse.err reasonLineShape
  | "import" :: _ => LineParse.err reasonLineShape
  | "namespace" :: name :: [] =>
    if isIdent name then LineParse.cmd (Cmd.namespace (HostTerm.n name))
    else LineParse.err reasonLineShape
  | "namespace" :: _ => LineParse.err reasonLineShape
  | "end" :: name :: [] =>
    if isIdent name then LineParse.cmd (Cmd.endNamespace (HostTerm.n name))
    else LineParse.err reasonLineShape
  | "end" :: _ => LineParse.err reasonLineShape
  | "open" :: rest =>
    if rest.isEmpty then LineParse.err reasonLineShape
    else if rest.all isIdent then
      LineParse.cmd (Cmd.openNs (rest.map HostTerm.n))
    else
      LineParse.err reasonLineShape
  | "inductive" :: name :: rest =>
    if !isIdent name then LineParse.err reasonLineShape
    else
      match parseCtors rest with
      | none => LineParse.err reasonParseFail
      | some (ctors, rest2) =>
        if ctors.isEmpty then LineParse.err reasonZeroCtor
        else
          match rest2 with
          | [] =>
            LineParse.cmd (Cmd.inductive_ (HostTerm.n name) ctors [])
          | "deriving" :: derRest =>
            match parseDeriving derRest with
            | some der =>
              LineParse.cmd (Cmd.inductive_ (HostTerm.n name) ctors der)
            | none => LineParse.err reasonParseFail
          | _ => LineParse.err reasonLineShape
  | "def" :: name :: rest =>
    if !isIdent name then LineParse.err reasonLineShape
    else
      match splitAtAssign rest with
      | none => LineParse.err reasonLineShape
      | some (pre, bodyToks) =>
        let tyOpt : Option (Option HostType) :=
          match pre with
          | [] => some none
          | ":" :: tyToks =>
            match parseHostTypeAll tyToks with
            | some ty => some (some ty)
            | none => none
          | _ => none
        match tyOpt with
        | none => LineParse.err reasonParseFail
        | some ty =>
          match parseTermAll bodyToks with
          | some body => LineParse.cmd (Cmd.def_ (HostTerm.n name) ty body)
          | none => LineParse.err reasonParseFail
  | "check" :: rest =>
    match splitAtColon rest with
    | none => LineParse.err reasonLineShape
    | some (tmToks, tyToks) =>
      match parseTermAll tmToks, parseHostTypeAll tyToks with
      | some tm, some ty => LineParse.cmd (Cmd.check tm ty)
      | _, _ => LineParse.err reasonParseFail
  | head :: _ =>
    if isKeyword head then LineParse.err reasonLineShape
    else LineParse.err reasonUnknownCmd

end SystemsLean.HostFront
