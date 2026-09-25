/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostFront.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-FRONT, liveHostFrontSource0,
  HOST-FRONT-LIVE-HOST-FRONT, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostFrontSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostFront

/-- Dual-pinned live HostFront.lean bytes, first half.
    Concatenate liveHostFrontSource0 then liveHostFrontSource1 before parse.
    Greppable: liveHostFrontSource0, PARSE-LIVE-HOST-FRONT. -/
def liveHostFrontSource0 : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveHostFront
