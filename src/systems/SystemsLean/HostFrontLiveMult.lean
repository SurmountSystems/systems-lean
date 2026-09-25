/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/Mult.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMult. Not HostFront G1 dialect. Not HostTerm.multFixtureModule.

  Spec (readable):
  - parseLiveMultSource turns live Mult.lean text into HostTerm.Module.
  - Module name is SystemsLean.Mult even without a module line.
  - Strip nested /- -/ and -- comments. Skip blanks.
  - Surface of THIS file only (namespace, inductive where, equation defs, binders).
  - kernelCheckLiveMultSource is HostKernel.kernelCheck of that parse, not the fixture.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Linear.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT, SLAKE_HOST_FRONT_LIVE_MULT_V0,
  PARSE-LIVE-MULT, parseLiveMultSource, kernelCheckLiveMultSource, hostFrontLiveMultReady,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostFrontLiveMult
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveMult on surmount-1
  is still unrun. Not Lake GREEN. Not package typecheck GREEN.
  Not freestanding residual free. Not PROVABLY. Not FullHost.
  Module must stay ASCII.
-/

import SystemsLean.HostFront
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMult

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultRel : String := "src/systems/SystemsLean/Mult.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "Mult.lean"

/-- Honesty: this parser is not the HostTerm fixture. -/
def liveParseDoesNotUseFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveMultProvablyUnlocked : Bool := false

/-- Parse fuel (native_decide friendly). -/
def liveParseFuel : Nat := 128

/-- Last name segment (Mult.mult0 -> mult0). -/
def lastSeg (s : String) : String :=
  match (s.splitOn ".").reverse with
  | p :: _ => p
  | [] => s

/-- Live ident: HostFront ident plus where-ban (dotted names ok). -/
def liveIsIdent (s : String) : Bool :=
  HostFront.isIdent s && s != "where"

/-- True when a term atom can start here. -/
def atomStart : List String -> Bool
  | [] => false
  | t :: _ =>
    t == "none" || t == "true" || t == "false" || t == "some" || t == "("
      || isNatLit t || isStringLit t || liveIsIdent t

/-- Binder name in scope. -/
def isBinder (bs : List String) (s : String) : Bool :=
  bs.any (fun b => b == s)

/-- Term ident: binders are var; dotted ctor names use lastSeg const. -/
def identTerm (bs : List String) (s : String) : Term :=
  if isBinder bs s then Term.var (HostTerm.n s)
  else if (s.splitOn ".").length > 1 then Term.const (HostTerm.n (lastSeg s))
  else Term.const (HostTerm.n s)

/-! ### Comment strip (nested block + line) -/

/-- Strip nested `/- -/` and `--` comments. Keep newlines. -/
def stripCommentsN (fuel nest : Nat) (lineC : Bool) (acc : List Char) :
    List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsN n nest false ('\n' :: acc) rest
        else
          stripCommentsN n nest true acc rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsN n (nest + 1) false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsN n (nest - 1) false acc rest2
        | '\n', rest2 =>
          stripCommentsN n nest false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsN n nest false acc rest2
      else
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsN n 1 false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsN n 0 true acc rest2
        | _, rest2 =>
          stripCommentsN n 0 false (c :: acc) rest2

/-- Strip comments from source text. -/
def stripComments (src : String) : String :=
  String.ofList (stripCommentsN (src.length + 8) 0 false [] src.toList)

/-! ### Tokenizer -/

def isAlpha (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isIdentStart (c : Char) : Bool :=
  isAlpha c || c == '_'

def isIdentCont (c : Char) : Bool :=
  isIdentStart c || HostFront.isDigit c || c == '?'

/-- Take a (possibly dotted) ident. Acc is reverse chars. -/
def takeIdentN : Nat -> List Char -> List Char -> Prod (List Char) (List Char)
  | 0, acc, rest => (acc, rest)
  | Nat.succ n, acc, [] => (acc, [])
  | Nat.succ n, acc, c :: rest =>
    if isIdentCont c then
      takeIdentN n (c :: acc) rest
    else if c == '.' then
      match rest with
      | d :: rest2 =>
        if isIdentStart d then
          takeIdentN n (d :: c :: acc) rest2
        else
          (acc, c :: rest)
      | [] => (acc, [c])
    else
      (acc, c :: rest)

/-- Take a string literal including quotes. -/
def takeStringN : Nat -> List Char -> List Char -> Option (Prod (List Char) (List Char))
  | 0, _, _ => none
  | Nat.succ _, acc, [] => none
  | Nat.succ n, acc, c :: rest =>
    if c == '"' then some ('"' :: acc, rest)
    else takeStringN n (c :: acc) rest

/-- Tokenize stripped source. -/
def tokenizeN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeN n rest acc
    else if c == '"' then
      match takeStringN liveParseFuel [c] rest with
      | none => tokenizeN n rest acc
      | some (rev, rest2) =>
        tokenizeN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeN n rest2 (":=" :: acc)
      | _ => tokenizeN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeN n rest2 ("=>" :: acc)
      | _ => tokenizeN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeN n rest2 ("->" :: acc)
      | _ => tokenizeN n rest ("-" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.' then
      tokenizeN n rest (String.singleton c :: acc)
    else if isIdentStart c || HostFront.isDigit c then
      let (rev, rest2) := takeIdentN liveParseFuel [c] rest
      tokenizeN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeN n rest acc

/-- Tokenize after comment strip. -/
def tokenize (src : String) : List String :=
  tokenizeN (src.length + 8) src.toList []

/-! ### Term parse (live Lean 4 Mult surface, not HostFront G1) -/

/-- Parse one pattern. -/
def parsePatLive : List String -> Option (Prod Pat (List String))
  | [] => none
  | "_" :: rest => some (Pat.wild, rest)
  | t :: rest =>
    if isNatLit t then
      match ofNatLit? t with
      | some k => some (Pat.litNat k, rest)
      | none => none
    else if liveIsIdent t then
      some (Pat.ctor0 (HostTerm.n (lastSeg t)), rest)
    else
      none

mutual
  /-- Atom term. -/
  def parseAtomN : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomN n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermN n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t then
          some (identTerm bs t, rest)
        else
          none

  /-- App and postfix `.isSome`. -/
  def parseTermTailN : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if liveIsIdent field then
          parseTermTailN n bs (Term.app (Term.const (HostTerm.n field)) t) rest2
        else
          some (t, rest)
      | _ =>
        if atomStart rest then
          match parseAtomN n bs rest with
          | some (a, rest2) => parseTermTailN n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry. -/
  def parseTermN : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match parseAtomN n bs toks with
      | none => none
      | some (t, rest) => parseTermTailN n bs t rest
end

/-- Parse equation arms `| pat => term`. -/
def parseEqArmsN : Nat -> List String -> List String ->
    List (Prod Pat Term) -> Option (Prod (List (Prod Pat Term)) (List String))
  | 0, _, toks, acc => some (acc, toks)
  | Nat.succ n, bs, toks, acc =>
    match toks with
    | "|" :: rest =>
      match parsePatLive rest with
      | some (p, "=>" :: rest2) =>
        match parseTermN liveParseFuel bs rest2 with
        | some (body, rest3) =>
          parseEqArmsN n bs rest3 (acc ++ [(p, body)])
        | none => none
      | _ => none
    | _ => some (acc, toks)

/-- Binders `(n : Nat)*`. -/
def parseBindersN : Nat -> List String -> List (Prod String HostType) ->
    Option (Prod (List (Prod String HostType)) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "(" :: bname :: ":" :: rest =>
      if !liveIsIdent bname then none
      else
        match parseHostType rest with
        | some (ty, ")" :: rest2) =>
          parseBindersN n rest2 (acc ++ [(bname, ty)])
        | _ => none
    | _ => some (acc, toks)

/-- Arrow-prefix binder types onto the result type. -/
def addBinderArrows : List (Prod String HostType) -> HostType -> HostType
  | [], ty => ty
  | (_, d) :: rest, ty => HostType.arrow d (addBinderArrows rest ty)

/-- Split tokens at first `:=` or `|`. -/
inductive DefBodyKind where
  | assign
  | equation
  deriving Repr

def splitDefBody : List String ->
    Option (Prod DefBodyKind (Prod (List String) (List String)))
  | [] => none
  | ":=" :: rest => some (DefBodyKind.assign, ([], rest))
  | "|" :: rest => some (DefBodyKind.equation, ([], "|" :: rest))
  | t :: rest =>
    match splitDefBody rest with
    | some (k, (pre, post)) => some (k, (t :: pre, post))
    | none => none

/-- Parse deriving class list (commas allowed). -/
def parseDerivingLive : List String -> Option (Prod (List Name) (List String))
  | [] => some ([], [])
  | "," :: rest => parseDerivingLive rest
  | t :: rest =>
    if liveIsIdent t then
      match parseDerivingLive rest with
      | some (ns, rest2) => some (HostTerm.n t :: ns, rest2)
      | none => none
    else
      some ([], t :: rest)

/-- Parse `| ctor` bars until deriving or a command keyword. -/
def parseCtorBarsN : Nat -> List String -> List CtorDecl ->
    Option (Prod (List CtorDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "|" :: name :: rest =>
      if liveIsIdent name then
        parseCtorBarsN n rest (acc ++ [{ name := HostTerm.n (lastSeg name) }])
      else
        none
    | _ => some (acc, toks)

/-- Parse one command. -/
def parseOneCmdN (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "namespace" :: name :: rest =>
    if liveIsIdent name then some (Cmd.namespace (HostTerm.n name), rest)
    else none
  | "end" :: name :: rest =>
    if liveIsIdent name then some (Cmd.endNamespace (HostTerm.n name), rest)
    else none
  | "inductive" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseCtorBarsN fuel rest [] with
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
  | "def" :: name :: rest =>
    if !liveIsIdent name then none
    else
      match parseBindersN fuel rest [] with
      | none => none
      | some (bs, rest2) =>
        match rest2 with
        | ":" :: rest3 =>
          match splitDefBody rest3 with
          | none => none
          | some (kind, (tyToks, bodyToks)) =>
            match parseHostTypeAll tyToks with
            | none => none
            | some retTy =>
              let ty := addBinderArrows bs retTy
              let bnames := bs.map (fun p => p.fst)
              match kind with
              | DefBodyKind.assign =>
                match parseTermN liveParseFuel bnames bodyToks with
                | some (body, rest4) =>
                  some (Cmd.def_ (HostTerm.n name) (some ty) body, rest4)
                | none => none
              | DefBodyKind.equation =>
                match parseEqArmsN fuel bnames bodyToks [] with
                | some (arms, rest4) =>
                  if arms.isEmpty then none
                  else
                    let scrut :=
                      match bnames with
                      | x :: _ => x
                      | [] => "x"
                    let body :=
                      Term.match_ (Term.var (HostTerm.n scrut)) arms
                    some (Cmd.def_ (HostTerm.n name) (some ty) body, rest4)
                | none => none
        | _ => none
  | _ => none

/-- Fold commands. Fail closed. -/
def parseCmdsN : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdN liveParseFuel toks with
    | none => none
    | some (c, rest) => parseCmdsN n rest (acc ++ [c])

/-- Parse live Mult.lean text. Greppable: parseLiveMultSource, PARSE-LIVE-MULT. -/
def parseLiveMultSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsN liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module := { name := HostTerm.n "SystemsLean.Mult", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveMultSource, PARSE-LIVE-MULT. -/
def kernelCheckLiveMultSource (src : String) : Bool :=
  match parseLiveMultSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live Mult.lean bytes (must match on-disk file).
    Greppable: liveMultSource, PARSE-LIVE-MULT. -/
def liveMultSource : String :=
  "/-\n" ++
  "  SYSTEMS_LEAN_HOST partial -- Mult grades on Systems Lean host.\n" ++
  "  Side: classic Lean elaborator under src/systems/ (not freestanding C).\n" ++
  "  Pair map (read-only): Mult.slake, mult.md, emit slake_mult_is_valid.\n" ++
  "  Side maps (read-only): src/idris2/multiplicity-map.md, src/lean4/multiplicity-map.md.\n" ++
  "\n" ++
  "  Spec (readable, separate from any future proof):\n" ++
  "  - Mult is the freestanding product grade set only: MULT-0, MULT-1, MULT-OMEGA.\n" ++
  "  - isValid matches all three constructors and returns true (typed Mult is closed;\n" ++
  "    unknown grades cannot inhabit Mult -- not a runtime reject path).\n" ++
  "  - FAIL-CLOSED-UNKNOWN-GRADE attaches to ofNat? / isValidTag only: unknown raw\n" ++
  "    tags decode to none / false (no coerce to omega or zero).\n" ++
  "  - No multiplicity zoo.\n" ++
  "\n" ++
  "  Theorems (MULT-THEOREM / HOST-MULT-THEOREM -- partial Mult proofs only):\n" ++
  "  - Live in SystemsLean.MultTheorems (same namespace; long-file split).\n" ++
  "  - ofNat? known tags 0/1/2 succeed (ofNat?_zero / ofNat?_one / ofNat?_two).\n" ++
  "  - ofNat?_fail_closed / isValidTag_fail_closed: n > 2 rejects (FAIL-CLOSED).\n" ++
  "  - isValid_true: every typed Mult is valid (closed inductive).\n" ++
  "  - isValidTag_eq_ofNat?_isSome: isValidTag is ofNat? isSome.\n" ++
  "  - name_mult0 / name_mult1 / name_multOmega: greppable grade string honesty.\n" ++
  "  - ofNat?_some_implies_isValidTag: successful decode implies isValidTag true.\n" ++
  "  - ofNat?_name_zero / ofNat?_name_one / ofNat?_name_two / ofNat?_name_fail_closed:\n" ++
  "    ofNat? composed with name (Option.map) for known tags + unknown reject.\n" ++
  "  These Mult theorems do NOT set SpecProof.proofCompleteClaimed true.\n" ++
  "  Partial theorems on Mult != host proof complete != residual free.\n" ++
  "\n" ++
  "  Intentional non-claims:\n" ++
  "  - Not freestanding residual free. Not product C residual free.\n" ++
  "  - Not PROVABLY. Not freestanding emit residual free.\n" ++
  "  - Not proof complete (SpecProof.proofCompleteClaimed stays false).\n" ++
  "  - Classic Lean elaborator still has managed runtime residual (host != product wire).\n" ++
  "\n" ++
  "  Greppable: SYSTEMS_LEAN_HOST, MULT-0, MULT-1, MULT-OMEGA, FAIL-CLOSED-UNKNOWN-GRADE,\n" ++
  "  MULT-THEOREM, HOST-MULT-THEOREM, ofNat?_fail_closed, isValidTag_fail_closed,\n" ++
  "  ofNat?_zero, ofNat?_one, ofNat?_two, isValid_true, isValidTag_eq_ofNat?_isSome,\n" ++
  "  name_mult0, name_mult1, name_multOmega, ofNat?_some_implies_isValidTag,\n" ++
  "  ofNat?_name_zero, ofNat?_name_one, ofNat?_name_two, ofNat?_name_fail_closed,\n" ++
  "  MultTheorems\n" ++
  "  UNIT_SURFACE host surface. Module: SystemsLean.Mult\n" ++
  "  Long-file split: MULT-THEOREM + HOST-MULT-THEOREM in\n" ++
  "  SystemsLean.MultTheorems (same namespace). Core Mult dialect stays here.\n" ++
  "  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.\n" ++
  "  Module must stay ASCII.\n" ++
  "-/\n" ++
  "\n" ++
  "namespace SystemsLean.Mult\n" ++
  "\n" ++
  "/-- Quantitative Type Theory (QTT) grades for freestanding Slake.\n" ++
  "    MULT-0 erased; MULT-1 use-once / linear; MULT-OMEGA unrestricted. -/\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "  deriving DecidableEq, Repr\n" ++
  "\n" ++
  "/-- Human-facing grade ids (greppable contract surface). -/\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "  | Mult.mult1 => \"MULT-1\"\n" ++
  "  | Mult.multOmega => \"MULT-OMEGA\"\n" ++
  "\n" ++
  "/-- isValid m -- true for each Mult constructor (closed inductive).\n" ++
  "    Explicit match so a future grade must update this table.\n" ++
  "    Unknown grades cannot inhabit Mult; raw-tag reject is isValidTag only. -/\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "\n" ++
  "/-- Raw tag decode aligned with freestanding C enum slake_mult\n" ++
  "    (0 = MULT-0, 1 = MULT-1, 2 = MULT-OMEGA).\n" ++
  "    FAIL-CLOSED-UNKNOWN-GRADE: unknown tags return none. -/\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | 1 => some Mult.mult1\n" ++
  "  | 2 => some Mult.multOmega\n" ++
  "  | _ => none\n" ++
  "\n" ++
  "/-- FAIL-CLOSED-UNKNOWN-GRADE on raw tags: true only for known 0/1/2. -/\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "\n" ++
  "/-- Map name for emit honesty notes (multIsValid / slake_mult_is_valid). -/\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "\n" ++
  "/- Theorems live in SystemsLean.MultTheorems\n" ++
  "   (same namespace SystemsLean.Mult; long-file split). Parent keeps\n" ++
  "   Mult dialect only -- do not import MultTheorems here (import cycle). -/\n" ++
  "\n" ++
  "end SystemsLean.Mult\n"

/-- Accepted live module when parse succeeds. -/
def liveMultParsed? : Option Module :=
  match parseLiveMultSource liveMultSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command (fixture has one). -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is 8 (namespace, inductive, five defs, end). -/
def liveParseCmdCountOk : Bool :=
  match liveMultParsed? with
  | some m => m.commands.length == 8
  | none => false

/-- Live parse has Mult inductive with three grade ctors. -/
def liveParseHasMultInductive : Bool :=
  match liveMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "Mult" && ctors.length == 3
          && ctors.any (fun d => d.name.raw == "mult0")
          && ctors.any (fun d => d.name.raw == "mult1")
          && ctors.any (fun d => d.name.raw == "multOmega")
      | _ => false

/-- Live parse has core Mult defs. -/
def liveParseHasCoreDefs : Bool :=
  match liveMultParsed? with
  | none => false
  | some m =>
    let has (n : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == n
        | _ => false
    has "name" && has "isValid" && has "ofNat?" && has "isValidTag"
      && has "multIsValid"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultReady, PARSE-LIVE-MULT, HOST-FRONT-LIVE-MULT. -/
def hostFrontLiveMultReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT")
    && (parseId == "PARSE-LIVE-MULT")
    && (liveMultRel == "src/systems/SystemsLean/Mult.lean")
    && liveParseDoesNotUseFixture
    && !hostFrontLiveMultFullHost
    && !hostFrontLiveMultResidualFreeClaimed
    && !hostFrontLiveMultProvablyUnlocked
    && kernelCheckLiveMultSource liveMultSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultInductive
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveMult (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT =="
  IO.println s!"  host={hostId} file={liveMultRel}"
  let path := root / liveMultRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultRel}"
    throw (IO.userError s!"missing {liveMultRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultSource then
    IO.eprintln "error: dual-pin mismatch: on-disk Mult.lean != liveMultSource"
    throw (IO.userError "dual-pin mismatch live Mult.lean")
  let r := parseLiveMultSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live Mult parse false"
      throw (IO.userError "kernelCheck live Mult parse false")
    unless hostFrontLiveMultReady do
      IO.eprintln "error: hostFrontLiveMultReady false"
      throw (IO.userError "hostFrontLiveMultReady false")
    IO.println s!"GREEN {stageId}: live Mult.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMult root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMult
