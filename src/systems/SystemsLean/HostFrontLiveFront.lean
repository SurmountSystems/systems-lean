/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostFront.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFront. Reuses HostFrontLiveExtract / Types / Mult.
  Not HostFront G1. Not HostTerm.multFixtureModule. Not parseLiveExtractSource
  on HostFront text. Not HostFrontLiveHostTerm (wrong target).

  Spec (readable):
  - parseLiveFrontSource turns live HostFront.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostFront even without a module line.
  - kernelCheckLiveFrontSource is HostKernel.kernelCheck of that parse.

  Parser sugar (not HostTerm IR growth): payload ctor args skipped; List/Prod/IO
  type apps named; || / != / && / == as ite/decideEq; char lits fail closed so
  Char compare defs skip; un-kernelable match / do / fun / let rec / equation
  defs skip until the next command. Dual-pin is full HostFront.lean bytes.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FRONT, SLAKE_HOST_FRONT_LIVE_FRONT_V0,
  PARSE-LIVE-FRONT, parseLiveFrontSource, kernelCheckLiveFrontSource,
  hostFrontLiveFrontReady, liveFrontSource, liveFrontRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveFront
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveFront on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveExtract
import SystemsLean.HostFrontLiveFrontSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFront

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FRONT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FRONT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FRONT"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontRel : String := "src/systems/SystemsLean/HostFront.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFrontFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFrontResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveFrontProvablyUnlocked : Bool := false

/-- Parse fuel (HostFront is larger than Extract). -/
def liveFrontParseFuel : Nat := 256

/-- Skip fuel: HostFront match/do bodies are longer than one parse step. -/
def liveFrontSkipFuel : Nat := 4096

/-- Seed names from SystemsLean.Mult import plus String builtins. -/
def seedKnown : List String :=
  ["mult0", "mult1", "multOmega", "ofNat?", "name", "isValid", "isSome", "isEmpty"]

/-- Stop tokens: Extract stops plus compare / or. -/
def frontIsStop (t : String) : Bool :=
  extractIsStop t || t == "==" || t == "!=" || t == "||" || t == "[" || t == "]"

/-- Atom start: stop infix; allow `{` struct lit. -/
def frontAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if frontIsStop t then false
    else if t == "{" then true
    else typesAtomStart (t :: rest)

/-- Binder field chain `s.isEmpty` is nested proj. -/
def identTermFront (bs : List String) (s : String) : Term :=
  match s.splitOn "." with
  | [] => Term.const (HostTerm.n s)
  | a :: segs =>
    if isBinder bs a then
      segs.foldl (fun t f => Term.proj t (HostTerm.n f)) (Term.var (HostTerm.n a))
    else
      identTerm bs s

/-- True when token is a char literal `'x'` or `'\\n'`. Not a HostTerm atom. -/
def isCharLit (s : String) : Bool :=
  match s.toList with
  | '\'' :: _ => true
  | _ => false

/-- Tokenize stripped source; keeps `{` `}` `[` `]` Nat `&&` `!` `==` `||` `!=`. -/
def tokenizeFrontN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeFrontN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveFrontParseFuel [c] rest
      tokenizeFrontN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveFrontParseFuel [c] rest with
      | none => tokenizeFrontN n rest acc
      | some (rev, rest2) =>
        tokenizeFrontN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '\'' then
      match rest with
      | '\\' :: d :: '\'' :: rest2 =>
        tokenizeFrontN n rest2
          (String.ofList ['\'', '\\', d, '\''] :: acc)
      | d :: '\'' :: rest2 =>
        tokenizeFrontN n rest2 (String.ofList ['\'', d, '\''] :: acc)
      | _ => tokenizeFrontN n rest acc
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeFrontN n rest2 (":=" :: acc)
      | _ => tokenizeFrontN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeFrontN n rest2 ("=>" :: acc)
      | '=' :: rest2 => tokenizeFrontN n rest2 ("==" :: acc)
      | _ => tokenizeFrontN n rest ("=" :: acc)
    else if c == '!' then
      match rest with
      | '=' :: rest2 => tokenizeFrontN n rest2 ("!=" :: acc)
      | _ => tokenizeFrontN n rest ("!" :: acc)
    else if c == '|' then
      match rest with
      | '|' :: rest2 => tokenizeFrontN n rest2 ("||" :: acc)
      | _ => tokenizeFrontN n rest ("|" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeFrontN n rest2 ("->" :: acc)
      | _ => tokenizeFrontN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeFrontN n rest2 ("&&" :: acc)
      | _ => tokenizeFrontN n rest acc
    else if c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' || c == '[' || c == ']' then
      tokenizeFrontN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveFrontParseFuel [c] rest
      tokenizeFrontN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeFrontN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeFront (src : String) : List String :=
  tokenizeFrontN (src.length + 8) src.toList []

/-- Command-start keywords (skip theorem / example / set_option / failed defs). -/
def isCmdKw (t : String) : Bool :=
  t == "import" || t == "open" || t == "namespace" || t == "end"
    || t == "structure" || t == "inductive" || t == "def"
    || t == "theorem" || t == "example" || t == "set_option"

/-- Skip a balanced paren/bracket/brace group (depth already 1). -/
def skipBalanced : Nat -> Nat -> List String -> Option (List String)
  | 0, _, _ => none
  | Nat.succ _, 0, rest => some rest
  | Nat.succ n, d, t :: rest =>
    if t == "(" || t == "[" || t == "{" then skipBalanced n (d + 1) rest
    else if t == ")" || t == "]" || t == "}" then
      match d with
      | 0 => none
      | Nat.succ d2 => skipBalanced n d2 rest
    else
      skipBalanced n d rest
  | Nat.succ _, _, [] => none

/-- Skip tokens until the next command keyword (do not consume it). -/
def skipUntilCmd : Nat -> List String -> List String
  | 0, rest => rest
  | Nat.succ _, [] => []
  | Nat.succ n, t :: rest =>
    if isCmdKw t then t :: rest
    else if t == "(" || t == "[" || t == "{" then
      match skipBalanced n 1 rest with
      | some rest2 => skipUntilCmd n rest2
      | none => []
    else
      skipUntilCmd n rest

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Skip zero or more `(x : T)` groups after a ctor name. -/
def skipCtorArgs : Nat -> List String -> List String
  | 0, rest => rest
  | Nat.succ n, "(" :: rest =>
    match skipBalanced n 1 rest with
    | some rest2 => skipCtorArgs n rest2
    | none => "(" :: rest
  | _, rest => rest

/-- `| ctor` or `| ctor (x : T)*` until deriving. -/
def parseCtorBarsFront : Nat -> List String -> List CtorDecl ->
    Option (Prod (List CtorDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "|" :: name :: rest =>
      if liveIsIdent name then
        let ctor : CtorDecl := { name := HostTerm.n (lastSeg name) }
        parseCtorBarsFront n (skipCtorArgs n rest) (acc ++ [ctor])
      else
        none
    | _ => some (acc, toks)

mutual
  /-- HostType atom: List T, Prod A B, IO T, parenthesized, Option, Mult-first. -/
  def parseHostTypeAtomFront : Nat -> List String ->
      Option (Prod HostType (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match toks with
      | [] => none
      | "List" :: rest =>
        match parseHostTypeAtomFront n rest with
        | some (_, rest2) => some (HostType.named (HostTerm.n "List"), rest2)
        | none => some (HostType.named (HostTerm.n "List"), rest)
      | "Prod" :: rest =>
        match parseHostTypeAtomFront n rest with
        | some (_, rest2) =>
          match parseHostTypeAtomFront n rest2 with
          | some (_, rest3) => some (HostType.named (HostTerm.n "Prod"), rest3)
          | none => some (HostType.named (HostTerm.n "Prod"), rest2)
        | none => some (HostType.named (HostTerm.n "Prod"), rest)
      | "IO" :: rest =>
        match parseHostTypeAtomFront n rest with
        | some (_, rest2) => some (HostType.named (HostTerm.n "IO"), rest2)
        | none => some (HostType.named (HostTerm.n "IO"), rest)
      | "Option" :: rest =>
        match parseHostTypeAtomFront n rest with
        | some (t, rest2) => some (HostType.option t, rest2)
        | none => none
      | "(" :: rest =>
        match parseHostTypeArrowFront n rest with
        | some (ty, ")" :: rest2) => some (ty, rest2)
        | _ => none
      | "Mult" :: rest => some (HostType.mult, rest)
      | "Nat" :: rest => some (HostType.nat, rest)
      | "String" :: rest => some (HostType.string, rest)
      | "Bool" :: rest => some (HostType.bool, rest)
      | t :: rest =>
        if liveIsIdent t then some (HostType.named (HostTerm.n (lastSeg t)), rest)
        else none

  /-- HostType with right-assoc arrows. -/
  def parseHostTypeArrowFront : Nat -> List String ->
      Option (Prod HostType (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseHostTypeAtomFront n toks with
      | none => none
      | some (left, "->" :: rest) =>
        match parseHostTypeArrowFront n rest with
        | some (right, rest2) => some (HostType.arrow left right, rest2)
        | none => none
      | some (left, rest) => some (left, rest)
end

/-- Full consume HostType. -/
def parseHostTypeAllFront (toks : List String) : Option HostType :=
  match parseHostTypeArrowFront liveFrontParseFuel toks with
  | some (ty, []) => some ty
  | _ => none

/-- Binders `(n : T)` using Front types (List / Prod / IO). -/
def parseBindersFront : Nat -> List String -> List (Prod String HostType) ->
    Option (Prod (List (Prod String HostType)) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "(" :: rest =>
      match parseBinderNamesN n [] rest with
      | some (names, ":" :: rest2) =>
        match parseHostTypeArrowFront n rest2 with
        | some (ty, ")" :: rest3) =>
          parseBindersFront n rest3 (acc ++ names.map (fun nm => (nm, ty)))
        | _ => none
      | _ => none
    | _ => some (acc, toks)

/-- Term is kernel-checkable against already-seen names (no match / unknown const). -/
def termKnownN : Nat -> List String -> Term -> Bool
  | 0, _, _ => false
  | Nat.succ _, _, Term.var _ => true
  | Nat.succ _, _, Term.litNat _ => true
  | Nat.succ _, _, Term.litString _ => true
  | Nat.succ _, _, Term.litBool _ => true
  | Nat.succ _, _, Term.none_ => true
  | Nat.succ n, kn, Term.const x => kn.any (fun s => s == x.raw)
  | Nat.succ n, kn, Term.app f a => termKnownN n kn f && termKnownN n kn a
  | Nat.succ n, kn, Term.some_ t => termKnownN n kn t
  | Nat.succ n, kn, Term.ite c t e =>
      termKnownN n kn c && termKnownN n kn t && termKnownN n kn e
  | Nat.succ n, kn, Term.decideEq a b =>
      termKnownN n kn a && termKnownN n kn b
  | Nat.succ n, kn, Term.proj o _ => termKnownN n kn o
  | Nat.succ n, kn, Term.structLit fs =>
      fs.all (fun p => termKnownN n kn p.snd)
  | Nat.succ _, _, Term.match_ _ _ => false

/-- Bool-shaped body (kernel Bool / arrow-to-Bool). -/
def boolish : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.ite c t e =>
      boolish n c && boolish n t && boolish n e
  | Nat.succ _, Term.decideEq _ _ => true
  | Nat.succ n, Term.app f a => boolish n f && boolish n a
  | Nat.succ n, Term.proj o _ => boolish n o
  | Nat.succ _, _ => false

/-- String-shaped body. -/
def stringish : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.ite c t e =>
      boolish n c && stringish n t && stringish n e
  | Nat.succ n, Term.app f a => stringish n f && stringish n a
  | Nat.succ _, _ => false

/-- Nat-shaped body. -/
def natish : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.ite c t e =>
      boolish n c && natish n t && natish n e
  | Nat.succ _, _ => false

/-- Return type is a kernel-keep shape. -/
def retKeep : HostType -> Term -> Bool
  | HostType.bool, body => boolish liveFrontParseFuel body
  | HostType.string, body => stringish liveFrontParseFuel body
  | HostType.nat, body => natish liveFrontParseFuel body
  | HostType.option _, body =>
      match body with
      | Term.none_ => true
      | Term.some_ _ => true
      | Term.const _ => true
      | Term.var _ => true
      | _ => false
  | _, _ => false

/-- Names a command adds to the known-const set. -/
def cmdAdds (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "Mult" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body of a typed def is kernel-known and return-shaped. -/
def cmdBodyKnown (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ (some ty) body =>
      termKnownN liveFrontParseFuel kn body && retKeep ty body
  | Cmd.defBind _ _ ret body =>
      termKnownN liveFrontParseFuel kn body && retKeep ret body
  | Cmd.def_ _ none _ => false
  | _ => true

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsFront : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermFront n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsFront n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Atom including some / none / struct lit. Char lits fail closed. -/
  def parseAtomFront : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomFront n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsFront n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermFront n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isCharLit t then none
        else if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" && t != "!"
            && t != "==" && t != "!=" && t != "||" then
          some (identTermFront bs t, rest)
        else
          none

  /-- App, `.isSome` / `.isEmpty` builtin, and field proj. -/
  def parseTermTailFront : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" || field == "isEmpty" then
          parseTermTailFront n bs
            (Term.app (Term.const (HostTerm.n field)) t) rest2
        else if liveIsIdent field then
          parseTermTailFront n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | _ =>
        if frontAtomStart rest then
          match parseAtomFront n bs rest with
          | some (a, rest2) => parseTermTailFront n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / prefix `!` / && / || / == / != / atom. -/
  def parseTermFront : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermFront n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermFront n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermFront n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "!" :: rest =>
        match parseAtomFront n bs rest with
        | some (t, rest2) =>
          match parseTermTailFront n bs t rest2 with
          | some (t2, rest3) =>
            some (Term.ite t2 (Term.litBool false) (Term.litBool true), rest3)
          | none => none
        | none => none
      | _ =>
        match parseAtomFront n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailFront n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermFront n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | "||" :: rest3 =>
              match parseTermFront n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 (Term.litBool true) t3, rest4)
              | none => none
            | "==" :: rest3 =>
              match parseTermFront n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | "!=" :: rest3 =>
              match parseTermFront n bs rest3 with
              | some (t3, rest4) =>
                some (
                  Term.ite (Term.decideEq t2 t3)
                    (Term.litBool false) (Term.litBool true), rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign only; equations fail closed). -/
def parseDefFront (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersFront fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match parseHostTypeAllFront tyToks with
        | none => none
        | some retTy =>
          let ty := addBinderArrows bs retTy
          let bnames := bs.map (fun p => p.fst)
          let dn := HostTerm.n dname
          match kind with
          | DefBodyKind.assign =>
            match parseTermFront liveFrontParseFuel bnames bodyToks with
            | some (body, rest4) =>
              let rest5 :=
                match rest4 with
                | "where" :: more => skipUntilCmd liveFrontSkipFuel more
                | _ => skipNonCmd liveFrontSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
            | none => none
          | DefBodyKind.equation => none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdFront (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: name :: rest =>
    if liveIsIdent name then some (Cmd.importModule (HostTerm.n name), rest)
    else none
  | "open" :: name :: rest =>
    if !liveIsIdent name then none
    else
      match rest with
      | "(" :: inner :: ")" :: rest2 =>
        if liveIsIdent inner then some (Cmd.openNs [HostTerm.n inner], rest2)
        else none
      | _ => some (Cmd.openNs [HostTerm.n name], rest)
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsN fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingLive rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "inductive" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseCtorBarsFront fuel rest [] with
      | none => none
      | some (ctors, rest2) =>
        if ctors.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingLive rest3 with
            | some (der, rest4) =>
              some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors der, rest4)
            | none => none
          | _ =>
            some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors [], rest2)
  | "namespace" :: name :: rest =>
    if liveIsIdent name then some (Cmd.namespace (HostTerm.n name), rest)
    else none
  | "end" :: name :: rest =>
    if liveIsIdent name then some (Cmd.endNamespace (HostTerm.n name), rest)
    else none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefFront fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / un-kernelable defs. -/
def parseCmdsFront : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFront liveFrontParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFrontSkipFuel rest
      if cmdBodyKnown kn c then
        parseCmdsFront n rest2 (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsFront n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFrontSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFront n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostFront.lean text.
    Greppable: parseLiveFrontSource, PARSE-LIVE-FRONT. -/
def parseLiveFrontSource (src : String) : FrontResult :=
  let toks := tokenizeFront (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFront liveFrontParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostFront", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostFront parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveFrontSource, PARSE-LIVE-FRONT. -/
def kernelCheckLiveFrontSource (src : String) : Bool :=
  match parseLiveFrontSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFrontParsed? : Option Module :=
  match parseLiveFrontSource liveFrontSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFrontParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / inductives / defs). -/
def liveParseCmdCountOk : Bool :=
  match liveFrontParsed? with
  | some m => m.commands.length >= 14
  | none => false

/-- Live parse has FrontResult inductive with accept / reject. -/
def liveParseHasFrontResult : Bool :=
  match liveFrontParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "FrontResult" && ctors.length == 2
          && ctors.any (fun x => x.name.raw == "accept")
          && ctors.any (fun x => x.name.raw == "reject")
      | _ => false

/-- Live parse has core HostFront defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveFrontParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId" && has "reasonEmptyModule"

/-- Live parse imports SystemsLean.HostTerm (not the Mult fixture). -/
def liveParseHasHostTermImport : Bool :=
  match liveFrontParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostTerm"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFrontReady, PARSE-LIVE-FRONT, HOST-FRONT-LIVE-FRONT.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveFrontReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FRONT_V0")
    && (hostId == "HOST-FRONT-LIVE-FRONT")
    && (parseId == "PARSE-LIVE-FRONT")
    && (liveFrontRel == "src/systems/SystemsLean/HostFront.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFrontFullHost
    && !hostFrontLiveFrontResidualFreeClaimed
    && !hostFrontLiveFrontProvablyUnlocked
    && kernelCheckLiveFrontSource liveFrontSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasFrontResult
    && liveParseHasCoreDefs
    && liveParseHasHostTermImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFrontSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveFront (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FRONT =="
  IO.println s!"  host={hostId} file={liveFrontRel}"
  let path := root / liveFrontRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFrontRel}"
    throw (IO.userError s!"missing {liveFrontRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFrontSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostFront.lean != liveFrontSource"
    throw (IO.userError "dual-pin mismatch live HostFront.lean")
  let r := parseLiveFrontSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FRONT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FRONT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FRONT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostFront parse false"
      throw (IO.userError "kernelCheck live HostFront parse false")
    unless hostFrontLiveFrontReady do
      IO.eprintln "error: hostFrontLiveFrontReady false"
      throw (IO.userError "hostFrontLiveFrontReady false")
    IO.println s!"GREEN {stageId}: live HostFront.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFront root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFront
