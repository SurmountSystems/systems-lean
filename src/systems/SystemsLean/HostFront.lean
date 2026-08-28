/-
  SYSTEMS_LEAN_HOST partial -- Mult-first host fragment front-end
  (plan-peer-elaborator Host fragment front-end). Side: classic Lean elaborator
  under src/systems/ (not freestanding C).

  Spec (readable):
  - Parse documented Mult-first host dialect text into SystemsLean.HostTerm IR
    (Module / Cmd / Term), then require HostTerm.isWellFormed (fail closed).
  - Dialect is a tiny Lean-like Mult-first subset (not full Lean 4; not only
    Mult IR node lines -- that is SubsetFront).
  - Enough to express HostTerm.multFixtureModule surface (namespace, Mult
    inductive, name / isValid / ofNat? / isValidTag / multIsValid, check).
  - Good goldens accept; bad goldens reject with greppable reasons.

  Grammar v0 (line-oriented; # comments and blank lines ignored):
    module Name
    import Name
    namespace Name
    end Name
    open Name...
    inductive Name Ctor... [deriving Class...]
    def Name : Type := Term
    check Term : Type
  Type tokens: Mult | Nat | String | Bool | Option Type | Name | Type -> Type
  Term: none | true | false | Nat | "string" | some Term | var Name | const Name
        | bare Name (= const) | app Term Term | ( Term )
        | match Term | Pat => Term | ...
  Pat: _ | Nat | Name (ctor0)

  Without-Lake (A9): host-front-without-lake + develop clean-bootstrap (pins in
  HostResidualShrink). Out of scope: Mult package write; full Lean; host free; PROVABLY / llvm; product tip flips.

  Theorems (HOST-FRONT-THEOREM / HOST-FRONT-SMOKE): live in
  SystemsLean.HostFrontTheorems (same namespace; long-file peel). Ready /
  G1..G7 / B1..B4 / claims_false / ids + smoke. Do NOT set proofComplete or
  DualResidual host free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT, SLAKE_HOST_FRONT, SLAKE_HOST_FRONT_V0,
  HOST-HOST-FRONT, hostFrontReady, hostFrontGoodG1, hostFrontGoodG2,
  hostFrontGoodG3, hostFrontGoodG4, hostFrontGoodG5, hostFrontGoodG6,
  hostFrontGoodG7,
  hostFrontBadB1, hostFrontBadB2, hostFrontBadB3, hostFrontBadB4,
  hostFrontHostElaboratorResidualRemains, hostFrontDoesNotClaimPeerGreen,
  HOST-FRONT-SMOKE, HOST-FRONT-THEOREM, HostFrontTheorems, hostFrontReady_true,
  slake-host-front, just host-front, goldens/host-front, parseSource,
  EMPTY-MODULE-FAIL-CLOSED, LINE-SHAPE, UNKNOWN-CMD, NOT-WELL-FORMED,
  ZERO-CTOR-INDUCTIVE, PARSE-FAIL, multFixtureModule, goodG3Text, goodG4Text,
  goodG5Text, goodG6Text, goodG7Text, LINEAR-EXACT-ONCE, shareNat, polyId,
  TYPED_IR_V0, KIND-MULT-OK, TYPES-FIXTURE, IR_PROGRAM_V0, ORDERED-IR-PROGRAM,
  PROGRAM-FIXTURE, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE,
  HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE,
  isWellFormed, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostFront
  Long-file peel: HOST-FRONT-THEOREM + HOST-FRONT-SMOKE in
  SystemsLean.HostFrontTheorems (same namespace). Dual-pinned golden texts +
  file names in SystemsLean.HostFrontGoldens (same namespace). Core parse +
  structural pins + readiness + driver stay here.
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins on dual-pinned golden String constants
  (match on-disk goldens) + lake exe / just host-front over files.
  Red/green: lake build SystemsLean.HostFront; lake exe slake-host-front;
  just host-front. Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
-/

import SystemsLean.HostTerm
import SystemsLean.Mult
import SystemsLean.HostFrontGoldens

namespace SystemsLean.HostFront

open SystemsLean.HostTerm
open SystemsLean.Mult (Mult)

/-! ### HOST-FRONT / SLAKE_HOST_FRONT (peer elaborator Mult-first fragment front-end)

  Parse Mult-first host dialect -> HostTerm.Module; require isWellFormed.
  Driven by golden inputs (embedded dual-pinned strings + on-disk files).
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_V0"

/-- Greppable host map id. HOST-FRONT durable product token. -/
def hostId : String := "HOST-FRONT"

/-- Short surface name. -/
def surfaceId : String := "HOST-FRONT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-FRONT"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-front"

/-- just recipe name. -/
def justRecipe : String := "host-front"

/-- Goldens directory relative to repo root. -/
def goldensRel : String := "src/systems/goldens/host-front"

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostFrontHostElaboratorResidualRemains. -/
def hostFrontHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green. -/
def hostFrontDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: host develop surface still uses Lake (not product tip). -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostFrontStillUsesLake : Bool := stillUsesLake
def hostFrontDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostFrontResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostFrontProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostFrontProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostFrontLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostFrontProvablyUnlocked : Bool := false

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonEmptyModule : String := "EMPTY-MODULE-FAIL-CLOSED"
def reasonLineShape : String := "LINE-SHAPE"
def reasonUnknownCmd : String := "UNKNOWN-CMD"
def reasonParseFail : String := "PARSE-FAIL"
def reasonNotWellFormed : String := "NOT-WELL-FORMED"
def reasonZeroCtor : String := "ZERO-CTOR-INDUCTIVE"
def reasonMissingModule : String := "MISSING-MODULE"

/-- Front-end check result: accept with Module, or reject with reason. -/
inductive FrontResult where
  | accept (m : Module)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def FrontResult.isAccept : FrontResult -> Bool
  | FrontResult.accept _ => true
  | FrontResult.reject _ => false

/-- True when reject with exact reason. -/
def FrontResult.isRejectWith (r : FrontResult) (reason : String) : Bool :=
  match r with
  | FrontResult.reject r' => r' == reason
  | FrontResult.accept _ => false

/-- Accepted command count when accept; 0 on reject. -/
def FrontResult.acceptCmdCount : FrontResult -> Nat
  | FrontResult.accept m => m.commands.length
  | FrontResult.reject _ => 0

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

/-- Fold source lines into a Module. Fail closed. -/
def foldLines (lines : List String) : FrontResult :=
  let rec go (modName : Option Name) (cmds : List Cmd) :
      List String -> FrontResult
    | [] =>
      match modName with
      | none =>
        if cmds.isEmpty then FrontResult.reject reasonEmptyModule
        else FrontResult.reject reasonMissingModule
      | some name =>
        let m : Module := { name := name, commands := cmds }
        if cmds.isEmpty then
          FrontResult.reject reasonEmptyModule
        else if isWellFormed m then
          FrontResult.accept m
        else
          FrontResult.reject reasonNotWellFormed
    | line :: rest =>
      if isIgnorableLine line then
        go modName cmds rest
      else
        match parseLineTokens (lineTokens line) with
        | LineParse.err reason => FrontResult.reject reason
        | LineParse.moduleName name =>
          match modName with
          | some _ => FrontResult.reject reasonLineShape
          | none => go (some name) cmds rest
        | LineParse.cmd c => go modName (cmds ++ [c]) rest
  go none [] lines

/-- Parse full source text (newline-separated). Greppable: parseSource. -/
def parseSource (src : String) : FrontResult :=
  foldLines (src.splitOn "\n")

/-- Accept path: isWellFormed true on accepted module. -/
def acceptOk (r : FrontResult) : Bool :=
  match r with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-! ### Golden structural pins (embedded dual-pinned strings) -/

/-- True when module has a def_ with the given name.
    Greppable helper for golden structural pins. -/
def hasDefNamed (m : Module) (name : String) : Bool :=
  m.commands.any fun c =>
    match c with
    | Cmd.def_ n _ _ => n.raw == name
    | _ => false

/-- True when module has def_ name with litString body val.
    Greppable helper for golden structural pins. -/
def hasLitStringDef (m : Module) (name val : String) : Bool :=
  m.commands.any fun c =>
    match c with
    | Cmd.def_ n _ body =>
      n.raw == name
        && (match body with
            | Term.litString s => s == val
            | _ => false)
    | _ => false

/-- G1 parse accept + well-formed + Mult inductive present.
    Greppable: hostFrontGoodG1. -/
def hostFrontGoodG1 : Bool :=
  let r := parseSource goodG1Text
  acceptOk r
    && r.acceptCmdCount >= 8
    && (match r with
        | FrontResult.accept m =>
          m.commands.any fun c =>
            match c with
            | Cmd.inductive_ name ctors _ =>
              name.raw == "Mult" && ctors.length == 3
            | _ => false
        | _ => false)

/-- G2 parse accept + well-formed.
    Greppable: hostFrontGoodG2. -/
def hostFrontGoodG2 : Bool :=
  let r := parseSource goodG2Text
  acceptOk r && r.acceptCmdCount == 4

/-- G3 Linear-shaped parse accept + well-formed + shareNat / polyId / LINEAR-EXACT-ONCE.
    Greppable: hostFrontGoodG3, LINEAR-EXACT-ONCE, shareNat, polyId. -/
def hostFrontGoodG3 : Bool :=
  let r := parseSource goodG3Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasDefNamed m "shareNat"
            && hasDefNamed m "polyId"
            && hasLitStringDef m "linearExactOnceId" "LINEAR-EXACT-ONCE"
        | _ => false)

/-- G4 Types-shaped parse accept + well-formed + TYPED_IR_V0 / KIND-MULT-OK /
    TYPES-FIXTURE. Greppable: hostFrontGoodG4, TYPED_IR_V0, KIND-MULT-OK,
    TYPES-FIXTURE. -/
def hostFrontGoodG4 : Bool :=
  let r := parseSource goodG4Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "typedIrId" "TYPED_IR_V0"
            && hasLitStringDef m "kindMultOkId" "KIND-MULT-OK"
            && hasLitStringDef m "typesFixtureId" "TYPES-FIXTURE"
        | _ => false)

/-- G5 Program-shaped parse accept + well-formed + IR_PROGRAM_V0 /
    ORDERED-IR-PROGRAM / PROGRAM-FIXTURE. Greppable: hostFrontGoodG5,
    IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE. -/
def hostFrontGoodG5 : Bool :=
  let r := parseSource goodG5Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "irProgramId" "IR_PROGRAM_V0"
            && hasLitStringDef m "orderedIrProgramId" "ORDERED-IR-PROGRAM"
            && hasLitStringDef m "programFixtureId" "PROGRAM-FIXTURE"
        | _ => false)

/-- G6 Graph-shaped parse accept + well-formed + IR_GRAPH_EDGES_V0 /
    EMPTY-GRAPH-OK / GRAPH-FIXTURE. Greppable: hostFrontGoodG6,
    IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE. -/
def hostFrontGoodG6 : Bool :=
  let r := parseSource goodG6Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "irGraphEdgesId" "IR_GRAPH_EDGES_V0"
            && hasLitStringDef m "emptyGraphOkId" "EMPTY-GRAPH-OK"
            && hasLitStringDef m "graphFixtureId" "GRAPH-FIXTURE"
        | _ => false)

/-- G7 Compose-shaped parse accept + well-formed + HOST_COMPOSE_V0 /
    HOST-COMPOSE / COMPOSE-FIXTURE. Greppable: hostFrontGoodG7,
    HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE. -/
def hostFrontGoodG7 : Bool :=
  let r := parseSource goodG7Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "hostComposeId" "HOST_COMPOSE_V0"
            && hasLitStringDef m "hostComposeSurfaceId" "HOST-COMPOSE"
            && hasLitStringDef m "composeFixtureId" "COMPOSE-FIXTURE"
        | _ => false)

/-- B1 rejects empty module.
    Greppable: hostFrontBadB1, EMPTY-MODULE-FAIL-CLOSED. -/
def hostFrontBadB1 : Bool :=
  (parseSource badB1Text).isRejectWith reasonEmptyModule

/-- B2 rejects line shape.
    Greppable: hostFrontBadB2, LINE-SHAPE. -/
def hostFrontBadB2 : Bool :=
  (parseSource badB2Text).isRejectWith reasonLineShape

/-- B3 rejects unknown command.
    Greppable: hostFrontBadB3, UNKNOWN-CMD. -/
def hostFrontBadB3 : Bool :=
  (parseSource badB3Text).isRejectWith reasonUnknownCmd

/-- B4 rejects zero-ctor inductive.
    Greppable: hostFrontBadB4, ZERO-CTOR-INDUCTIVE. -/
def hostFrontBadB4 : Bool :=
  (parseSource badB4Text).isRejectWith reasonZeroCtor

/-- All minimum goldens structural ready.
    Greppable: hostFrontGoldensStructuralOk. -/
def hostFrontGoldensStructuralOk : Bool :=
  hostFrontGoodG1
    && hostFrontGoodG2
    && hostFrontGoodG3
    && hostFrontGoodG4
    && hostFrontGoodG5
    && hostFrontGoodG6
    && hostFrontGoodG7
    && hostFrontBadB1
    && hostFrontBadB2
    && hostFrontBadB3
    && hostFrontBadB4

/-- Stage / exe / recipe identity pin. -/
def hostFrontIdsOk : Bool :=
  (stageId == "SLAKE_HOST_FRONT_V0")
    && (hostId == "HOST-FRONT")
    && (surfaceId == "HOST-FRONT")
    && (surfaceAlias == "HOST-HOST-FRONT")
    && (lakeExeName == "slake-host-front")
    && (justRecipe == "host-front")
    && (goldensRel == "src/systems/goldens/host-front")

/-- Mult living Mult grade names still exist (host Mult import honesty). -/
def hostFrontMultGradesOk : Bool :=
  (Mult.name Mult.mult0 == "MULT-0")
    && (Mult.name Mult.mult1 == "MULT-1")
    && (Mult.name Mult.multOmega == "MULT-OMEGA")

/-- HostTerm mult fixture still well-formed (IR SSoT reuse). -/
def hostFrontReusesHostTerm : Bool :=
  HostTerm.hostTermGoodMult && HostTerm.hostTermReady

/-- End-to-end host fragment front-end ready.
    Greppable: hostFrontReady, HOST-FRONT, SLAKE_HOST_FRONT_V0. -/
def hostFrontReady : Bool :=
  hostFrontGoldensStructuralOk
    && hostFrontIdsOk
    && hostFrontMultGradesOk
    && hostFrontReusesHostTerm
    && stillUsesLake
    && dependsOnLake
    && hostFrontStillUsesLake
    && hostFrontDependsOnLake
    && hostFrontHostElaboratorResidualRemains
    && hostFrontDoesNotClaimPeerGreen
    && !hostFrontResidualFreeClaimed
    && !hostFrontProductSelfHostCompleteClaimed
    && !hostFrontProofCompleteClaimed
    && !hostFrontLlvmUnlocked
    && !hostFrontProvablyUnlocked

/-- Ready does not claim peer elaborator green.
    Greppable: hostFrontDoesNotClaimPeer. -/
def hostFrontDoesNotClaimPeer : Bool :=
  hostFrontReady && hostFrontDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostFrontKeepsHostResidual. -/
def hostFrontKeepsHostResidual : Bool :=
  hostFrontReady && hostFrontHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostFrontDoesNotMeanResidualFree. -/
def hostFrontDoesNotMeanResidualFree : Bool :=
  hostFrontReady && !hostFrontResidualFreeClaimed

/-! ### HOST-FRONT-THEOREM + HOST-FRONT-SMOKE peeled to HostFrontTheorems
    (same namespace). Cites: hostFrontReady_true, HostFrontTheorems.
    Core parse + goldens + readiness + driver stay here. -/

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require file exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Check one golden file: dual-pin content equality + expected accept/reject. -/
def checkGoldenFile (path : System.FilePath) (expectedText : String)
    (expectAccept : Bool) (rejectReason : Option String) (label : String) :
    IO Unit := do
  requireFile path label
  let disk <- IO.FS.readFile path
  if disk != expectedText then
    IO.eprintln s!"error: dual-pin mismatch {label}: on-disk != Lean constant"
    throw (IO.userError s!"dual-pin mismatch {label}")
  let r := parseSource disk
  if expectAccept then
    unless acceptOk r do
      IO.eprintln s!"error: {label} expected ACCEPT, got reject"
      throw (IO.userError s!"{label} accept fail")
    IO.println s!"PASS {label} ACCEPT cmds={r.acceptCmdCount}"
  else
    match rejectReason with
    | none =>
      unless !r.isAccept do
        IO.eprintln s!"error: {label} expected REJECT, got accept"
        throw (IO.userError s!"{label} reject fail")
      IO.println s!"PASS {label} REJECT"
    | some reason =>
      unless r.isRejectWith reason do
        IO.eprintln s!"error: {label} expected REJECT {reason}"
        throw (IO.userError s!"{label} reject reason fail")
      IO.println s!"PASS {label} REJECT {reason}"

/-- Run golden suite under repo root. Dual evidence: files + Lean pins.
    Greppable: runGoldenSuite, HOST-FRONT. -/
def runGoldenSuite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: Mult-first host fragment front-end =="
  IO.println s!"  surface={surfaceId} host={hostId} goldens={goldensRel}"
  IO.println s!"  structuralReady={hostFrontReady} hostResidual={hostFrontHostElaboratorResidualRemains}"
  let gdir := root / goldensRel
  requireFile gdir "goldens directory"
  checkGoldenFile (gdir / goodG1File) goodG1Text true none "G1"
  checkGoldenFile (gdir / goodG2File) goodG2Text true none "G2"
  checkGoldenFile (gdir / goodG3File) goodG3Text true none "G3"
  checkGoldenFile (gdir / goodG4File) goodG4Text true none "G4"
  checkGoldenFile (gdir / goodG5File) goodG5Text true none "G5"
  checkGoldenFile (gdir / goodG6File) goodG6Text true none "G6"
  checkGoldenFile (gdir / goodG7File) goodG7Text true none "G7"
  checkGoldenFile (gdir / badB1File) badB1Text false (some reasonEmptyModule) "B1"
  checkGoldenFile (gdir / badB2File) badB2Text false (some reasonLineShape) "B2"
  checkGoldenFile (gdir / badB3File) badB3Text false (some reasonUnknownCmd) "B3"
  checkGoldenFile (gdir / badB4File) badB4Text false (some reasonZeroCtor) "B4"
  unless hostFrontReady do
    IO.eprintln s!"error: {stageId} hostFrontReady false"
    throw (IO.userError "hostFrontReady false")
  IO.println s!"GREEN {stageId}: goldens G1/G2/G3/G4/G5/G6/G7 accept B1-B4 reject; dual-pin ok; host residual remains"

/-- CLI: run golden suite. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runGoldenSuite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFront
