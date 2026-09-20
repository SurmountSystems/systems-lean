/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/Types.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypes. Reuses HostFrontLiveMult. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveMultSource on Types text.

  Spec (readable):
  - parseLiveTypesSource turns live Types.lean text into HostTerm.Module.
  - Module name is SystemsLean.Types even without a module line.
  - kernelCheckLiveTypesSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Linear.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TYPES, SLAKE_HOST_FRONT_LIVE_TYPES_V0,
  PARSE-LIVE-TYPES, parseLiveTypesSource, kernelCheckLiveTypesSource,
  hostFrontLiveTypesReady, liveTypesSource, liveTypesRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveTypes
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveTypes on
  surmount-1 EXIT 0 after parse fix. hostFrontLiveTypesReady eval true.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveMult
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTypes

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TYPES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TYPES"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesRel : String := "src/systems/SystemsLean/Types.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTypesFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTypesResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveTypesProvablyUnlocked : Bool := false

/-- Parse fuel (Types is larger than Mult). -/
def liveTypesParseFuel : Nat := 192

/-- Stop tokens so `then` / `else` / `=` / commas are not app args.
    `=` is liveIsIdent in HostFront (not a keyword); decide infix needs it. -/
def typesIsStop (t : String) : Bool :=
  t == "then" || t == "else" || t == "with" || t == "structure"
    || t == "if" || t == "|" || t == "}" || t == "," || t == ":=" || t == "=>"
    || t == "="

/-- Dotted binder projection: `k.expectedMult` / `n.kind` are proj, not lastSeg const. -/
def typesIdentTerm (bs : List String) (s : String) : Term :=
  match s.splitOn "." with
  | a :: b :: [] =>
    if isBinder bs a then
      Term.proj (Term.var (HostTerm.n a)) (HostTerm.n b)
    else
      identTerm bs s
  | _ => identTerm bs s

/-- Atom start for Types tail (no if/decide/struct as juxtaposition). -/
def typesAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if typesIsStop t then false
    else if t == "decide" || t == "{" then false
    else atomStart (t :: rest)

/-- Take a decimal Nat token. Acc is reverse digits. -/
def takeNatN : Nat -> List Char -> List Char -> Prod (List Char) (List Char)
  | 0, acc, rest => (acc, rest)
  | Nat.succ _, acc, [] => (acc, [])
  | Nat.succ n, acc, c :: rest =>
    if HostFront.isDigit c then
      takeNatN n (c :: acc) rest
    else
      (acc, c :: rest)

/-- Tokenize stripped source; keeps `{` `}` and Nat literals. -/
def tokenizeTypesN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeTypesN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveParseFuel [c] rest
      tokenizeTypesN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveParseFuel [c] rest with
      | none => tokenizeTypesN n rest acc
      | some (rev, rest2) =>
        tokenizeTypesN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeTypesN n rest2 (":=" :: acc)
      | _ => tokenizeTypesN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeTypesN n rest2 ("=>" :: acc)
      | _ => tokenizeTypesN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeTypesN n rest2 ("->" :: acc)
      | _ => tokenizeTypesN n rest ("-" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' then
      tokenizeTypesN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveParseFuel [c] rest
      tokenizeTypesN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeTypesN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeTypes (src : String) : List String :=
  tokenizeTypesN (src.length + 8) src.toList []

/-- Pattern including `some x`. -/
def parsePatTypes : List String -> Option (Prod Pat (List String))
  | [] => none
  | "_" :: rest => some (Pat.wild, rest)
  | "some" :: t :: rest =>
    if liveIsIdent t then some (Pat.someVar (HostTerm.n (lastSeg t)), rest)
    else none
  | t :: rest =>
    if isNatLit t then
      match ofNatLit? t with
      | some k => some (Pat.litNat k, rest)
      | none => none
    else if liveIsIdent t then
      some (Pat.ctor0 (HostTerm.n (lastSeg t)), rest)
    else
      none

/-- Binder names until `:`. -/
def parseBinderNamesN : Nat -> List String -> List String ->
    Option (Prod (List String) (List String))
  | 0, _, _ => none
  | Nat.succ n, acc, toks =>
    match toks with
    | [] => none
    | ":" :: rest =>
      if acc.isEmpty then none else some (acc, ":" :: rest)
    | t :: rest =>
      if liveIsIdent t then parseBinderNamesN n (acc ++ [t]) rest
      else none

/-- Binders `(n : T)` and `(a b c : Nat)`. -/
def parseBindersTypes : Nat -> List String -> List (Prod String HostType) ->
    Option (Prod (List (Prod String HostType)) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "(" :: rest =>
      match parseBinderNamesN n [] rest with
      | some (names, ":" :: rest2) =>
        match parseHostType rest2 with
        | some (ty, ")" :: rest3) =>
          parseBindersTypes n rest3 (acc ++ names.map (fun nm => (nm, ty)))
        | _ => none
      | _ => none
    | _ => some (acc, toks)

/-- Structure fields `name : Type`. -/
def parseStructFieldDeclsN : Nat -> List String -> List FieldDecl ->
    Option (Prod (List FieldDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "deriving" :: rest => some (acc, "deriving" :: rest)
    | t :: ":" :: rest =>
      if !liveIsIdent t then none
      else
        match parseHostType rest with
        | some (ty, rest2) =>
          parseStructFieldDeclsN n rest2
            (acc ++ [{ name := HostTerm.n (lastSeg t), ty := ty }])
        | none => none
    | _ => some (acc, toks)

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsN : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermTypes n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsN n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Two-scrutinee arms `| p1, p2 => body`. -/
  def parseTwoArmsN : Nat -> List String -> List String ->
      List (Prod (Prod Pat Pat) Term) ->
      Option (Prod (List (Prod (Prod Pat Pat) Term)) (List String))
    | 0, _, toks, acc => some (acc, toks)
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "|" :: rest =>
        match parsePatTypes rest with
        | some (p1, "," :: rest2) =>
          match parsePatTypes rest2 with
          | some (p2, "=>" :: rest3) =>
            match parseTermTypes n bs rest3 with
            | some (body, rest4) =>
              parseTwoArmsN n bs rest4 (acc ++ [((p1, p2), body)])
            | none => none
          | _ => none
        | _ => none
      | _ => some (acc, toks)

  /-- Atom including decide / struct lit. -/
  def parseAtomTypes : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "decide" :: "(" :: rest =>
        match parseTermTypes n bs rest with
        | some (a, "=" :: rest2) =>
          match parseTermTypes n bs rest2 with
          | some (b, ")" :: rest3) => some (Term.decideEq a b, rest3)
          | _ => none
        | _ => none
      | "some" :: rest =>
        match parseAtomTypes n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsN n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermTypes n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" then
          some (typesIdentTerm bs t, rest)
        else
          none

  /-- App, `.isSome`, and field proj. -/
  def parseTermTailTypes : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" then
          parseTermTailTypes n bs
            (Term.app (Term.const (HostTerm.n "isSome")) t) rest2
        else if liveIsIdent field then
          parseTermTailTypes n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | _ =>
        if typesAtomStart rest then
          match parseAtomTypes n bs rest with
          | some (a, rest2) => parseTermTailTypes n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / match / atom. -/
  def parseTermTypes : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermTypes n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermTypes n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermTypes n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "match" :: rest =>
        match parseTermTypes n bs rest with
        | some (s1, "," :: rest2) =>
          match parseTermTypes n bs rest2 with
          | some (s2, "with" :: rest3) =>
            match parseTwoArmsN n bs rest3 [] with
            | some ([((p1, p2), b1), ((Pat.wild, Pat.wild), b2)], rest4) =>
              some (
                Term.match_ s1 [
                  (p1, Term.match_ s2 [(p2, b1), (Pat.wild, b2)]),
                  (Pat.wild, b2)
                ], rest4)
            | _ => none
          | _ => none
        | _ => none
      | _ =>
        match parseAtomTypes n bs toks with
        | none => none
        | some (t, rest) => parseTermTailTypes n bs t rest
end

/-- Parse one command (import / open / structure / Types def, else LiveMult). -/
def parseOneCmdTypes (fuel : Nat) (toks : List String) :
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
  | "def" :: name :: rest =>
    if !liveIsIdent name then none
    else
      match parseBindersTypes fuel rest [] with
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
              let dname := HostTerm.n (lastSeg name)
              match kind with
              | DefBodyKind.assign =>
                match parseTermTypes liveTypesParseFuel bnames bodyToks with
                | some (body, rest4) =>
                  if bs.isEmpty then
                    some (Cmd.def_ dname (some ty) body, rest4)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dname nbs retTy body, rest4)
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
                    some (Cmd.def_ dname (some ty) body, rest4)
                | none => none
        | _ => none
  | _ => parseOneCmdN liveParseFuel toks

/-- Fold commands. Fail closed. -/
def parseCmdsTypes : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdTypes liveTypesParseFuel toks with
    | none => none
    | some (c, rest) => parseCmdsTypes n rest (acc ++ [c])

/-- Parse live Types.lean text. Greppable: parseLiveTypesSource, PARSE-LIVE-TYPES. -/
def parseLiveTypesSource (src : String) : FrontResult :=
  let toks := tokenizeTypes (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTypes liveTypesParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module := { name := HostTerm.n "SystemsLean.Types", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live Types parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveTypesSource, PARSE-LIVE-TYPES. -/
def kernelCheckLiveTypesSource (src : String) : Bool :=
  match parseLiveTypesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live Types.lean bytes (must match on-disk file).
    Greppable: liveTypesSource, PARSE-LIVE-TYPES. -/
def liveTypesSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Types and typed IR nodes on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Types.slake, types.md, emit slake_type_tag / slake_ir_node_*.
  Shared core map: doc/shared-ir-sketch.md (Types row).

  Spec (readable, separate from any future proof):
  - Types are the COMMON-UNIVERSE for Slake shared core.
  - HOST-RESIDUAL (Idris side / Lean side elaborator differences) is not
    PRODUCT-WIRE-RESIDUAL (freestanding emit residual).
  - TypeTag is a thin tag (emit: slake_type_tag).
  - NodeKind is closed: VALUE, LINEAR, ERASED (emit: enum slake_ir_kind).
  - Kind/mult pairing (fail closed):
      VALUE  <-> MULT-OMEGA
      LINEAR <-> MULT-1
      ERASED <-> MULT-0
  - Typed IrNode is well-typed when kind matches mult (closed inductives).
  - FAIL-CLOSED-UNKNOWN-KIND attaches to ofKindTag? / isValidKindTag only:
    unknown raw kind tags decode to none / false.
  - mkNode? / mkNodeFromTags? fail closed on kind/mult mismatch or unknown tags.

  Theorems (TYPES-THEOREM / HOST-TYPES-THEOREM -- partial Types proofs only):
  - Live in SystemsLean.TypesTheorems (same namespace; long-file split).
  - ofKindTag? known tags 0/1/2 succeed (ofKindTag?_zero / ofKindTag?_one / ofKindTag?_two).
  - ofKindTag?_fail_closed / isValidKindTag_fail_closed: n > 2 rejects (FAIL-CLOSED).
  - isValidKindTag_eq_ofKindTag?_isSome: isValidKindTag is ofKindTag? isSome.
  - kindMultOk known pairings (VALUE/omega, LINEAR/1, ERASED/0).
  - kindMultOk mismatch family: wrong kind/mult pairings are false
    (kindMultOk_value_not_one / value_not_zero / linear_not_omega /
    linear_not_zero / erased_not_omega / erased_not_one).
  - mkNode?_mismatch_none: mkNode? fails closed on kind/mult mismatch.
  - expectedMult_value / expectedMult_linear / expectedMult_erased table honesty.
  - IrNode.isWellTyped_eq_kindMultOk: well-typed is kindMultOk.
  - mkNode?_ok: success path when kindMultOk (fields match).
  - mkNodeFromTags?_unknown_mult / unknown_kind fail closed.
  - mkNodeFromTags?_value_omega_some / linear_one_some / erased_zero_some.
  - Multi-node mixed-kind ordered IR program well-typed / fold (VALUE+LINEAR+ERASED)
    lives in SystemsLean.IrProgramTheorems (isWellTyped_mixed_kinds /
    foldWellTyped_mixed_kinds_some / isWellTyped_mixed_bad_false); cite Types
    kind/mult pairing; not re-proved as single-node mkNode? alone.
  These Types theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Types != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not a full elaborator. Not a control-flow graph.

  Greppable: SYSTEMS_LEAN_HOST, COMMON-UNIVERSE, HOST-RESIDUAL, PRODUCT-WIRE-RESIDUAL,
  TYPED_IR_V0, FAIL-CLOSED-UNKNOWN-KIND, MULT-0, MULT-1, MULT-OMEGA,
  TYPES-THEOREM, HOST-TYPES-THEOREM, ofKindTag?_fail_closed, isValidKindTag_fail_closed,
  ofKindTag?_zero, ofKindTag?_one, ofKindTag?_two, isValidKindTag_eq_ofKindTag?_isSome,
  isValidKindTag_zero, isValidKindTag_one, isValidKindTag_two,
  kindMultOk_value_omega, kindMultOk_linear_one, kindMultOk_erased_zero,
  kindMultOk_value_not_one, kindMultOk_value_not_zero, kindMultOk_linear_not_omega,
  kindMultOk_linear_not_zero, kindMultOk_erased_not_omega, kindMultOk_erased_not_one,
  mkNode?_mismatch_none, expectedMult_value, expectedMult_linear, expectedMult_erased,
  isWellTyped_eq_kindMultOk, mkNode?_ok, mkNodeFromTags?_unknown_mult,
  mkNodeFromTags?_unknown_kind, mkNodeFromTags?_value_omega_some,
  mkNodeFromTags?_linear_one_some, mkNodeFromTags?_erased_zero_some,
  TypesTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.Types
  Long-file split: TYPES-THEOREM + HOST-TYPES-THEOREM in
  SystemsLean.TypesTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult

namespace SystemsLean.Types

open SystemsLean.Mult (Mult)

/-- Thin COMMON-UNIVERSE type tag (emit map: slake_type_tag / slake_type_tag_init).
    Host residual and product wire residual stay separate. -/
structure TypeTag where
  tag : Nat
  deriving DecidableEq, Repr

/-- typeTagInit tag -- construct a thin type tag (always succeeds on Nat).
    Emit null fail-closed is a product-wire concern, not a host Nat concern. -/
def typeTagInit (tag : Nat) : TypeTag := { tag := tag }

/-- IR node kind (emit: enum slake_ir_kind). Closed inductive. -/
inductive NodeKind where
  | value
  | linear
  | erased
  deriving DecidableEq, Repr

/-- Human-facing kind ids (greppable contract surface). -/
def NodeKind.name : NodeKind -> String
  | NodeKind.value => "VALUE"
  | NodeKind.linear => "LINEAR"
  | NodeKind.erased => "ERASED"

/-- Expected Mult for each kind (kind/mult pairing table).
    Explicit match so a future kind must update this table. -/
def NodeKind.expectedMult : NodeKind -> Mult
  | NodeKind.value => Mult.multOmega
  | NodeKind.linear => Mult.mult1
  | NodeKind.erased => Mult.mult0

/-- kindMultOk k m -- true when kind pairs with mult (fail-closed pairing). -/
def kindMultOk (k : NodeKind) (m : Mult) : Bool :=
  decide (k.expectedMult = m)

/-- Raw kind tag decode aligned with freestanding C enum slake_ir_kind
    (0 = VALUE, 1 = LINEAR, 2 = ERASED).
    FAIL-CLOSED-UNKNOWN-KIND: unknown tags return none. -/
def ofKindTag? : Nat -> Option NodeKind
  | 0 => some NodeKind.value
  | 1 => some NodeKind.linear
  | 2 => some NodeKind.erased
  | _ => none

/-- FAIL-CLOSED-UNKNOWN-KIND on raw tags: true only for known 0/1/2. -/
def isValidKindTag (n : Nat) : Bool := (ofKindTag? n).isSome

/-- Typed IR node (emit map: slake_ir_node; TYPED_IR_V0 honesty).
    type tag + mult + kind. Well-typed when kind matches mult. -/
structure IrNode where
  ty : TypeTag
  mult : Mult
  kind : NodeKind
  deriving DecidableEq, Repr

/-- isWellTyped n -- true when kind/mult pairing holds (closed inductives).
    Unknown grades/kinds cannot inhabit Mult / NodeKind; raw-tag reject is
    Mult.ofNat? / ofKindTag? only. -/
def IrNode.isWellTyped (n : IrNode) : Bool := kindMultOk n.kind n.mult

/-- Fail-closed node construction from typed Mult + NodeKind.
    none when kind/mult mismatch. -/
def mkNode? (tag : Nat) (m : Mult) (k : NodeKind) : Option IrNode :=
  if kindMultOk k m then
    some { ty := typeTagInit tag, mult := m, kind := k }
  else
    none

/-- Raw tag path: fail closed on unknown mult or kind tags, or kind/mult mismatch.
    Map name honesty: slake_ir_node_init leave-invalid path. -/
def mkNodeFromTags? (typeTag multTag kindTag : Nat) : Option IrNode :=
  match Mult.ofNat? multTag, ofKindTag? kindTag with
  | some m, some k => mkNode? typeTag m k
  | _, _ => none

/- Theorems live in SystemsLean.TypesTheorems
   (same namespace SystemsLean.Types; long-file split). Parent keeps
   dialect only -- do not import TypesTheorems here (import cycle). -/

end SystemsLean.Types
"#

/-- Accepted live module when parse succeeds. -/
def liveTypesParsed? : Option Module :=
  match parseLiveTypesSource liveTypesSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTypesParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is 16. -/
def liveParseCmdCountOk : Bool :=
  match liveTypesParsed? with
  | some m => m.commands.length == 16
  | none => false

/-- Live parse has TypeTag structure. -/
def liveParseHasTypeTag : Bool :=
  match liveTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "TypeTag" && fields.length == 1
          && fields.any (fun f => f.name.raw == "tag")
      | _ => false

/-- Live parse has NodeKind inductive with three ctors. -/
def liveParseHasNodeKind : Bool :=
  match liveTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "NodeKind" && ctors.length == 3
          && ctors.any (fun d => d.name.raw == "value")
          && ctors.any (fun d => d.name.raw == "linear")
          && ctors.any (fun d => d.name.raw == "erased")
      | _ => false

/-- Live parse has core Types defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveTypesParsed? with
  | none => false
  | some m =>
    let has (n : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == n
        | Cmd.defBind x _ _ _ => x.raw == n
        | _ => false
    has "typeTagInit" && has "name" && has "expectedMult" && has "kindMultOk"
      && has "ofKindTag?" && has "isValidKindTag" && has "isWellTyped"
      && has "mkNode?" && has "mkNodeFromTags?"

/-- Live parse imports SystemsLean.Mult (not the Mult fixture). -/
def liveParseHasMultImport : Bool :=
  match liveTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTypesReady, PARSE-LIVE-TYPES, HOST-FRONT-LIVE-TYPES. -/
def hostFrontLiveTypesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_TYPES_V0")
    && (hostId == "HOST-FRONT-LIVE-TYPES")
    && (parseId == "PARSE-LIVE-TYPES")
    && (liveTypesRel == "src/systems/SystemsLean/Types.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTypesFullHost
    && !hostFrontLiveTypesResidualFreeClaimed
    && !hostFrontLiveTypesProvablyUnlocked
    && kernelCheckLiveTypesSource liveTypesSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasTypeTag
    && liveParseHasNodeKind
    && liveParseHasCoreDefs
    && liveParseHasMultImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTypesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveTypes (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TYPES =="
  IO.println s!"  host={hostId} file={liveTypesRel}"
  let path := root / liveTypesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTypesRel}"
    throw (IO.userError s!"missing {liveTypesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTypesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk Types.lean != liveTypesSource"
    throw (IO.userError "dual-pin mismatch live Types.lean")
  let r := parseLiveTypesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TYPES reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TYPES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TYPES ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live Types parse false"
      throw (IO.userError "kernelCheck live Types parse false")
    unless hostFrontLiveTypesReady do
      IO.eprintln "error: hostFrontLiveTypesReady false"
      throw (IO.userError "hostFrontLiveTypesReady false")
    IO.println s!"GREEN {stageId}: live Types.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTypes root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTypes
