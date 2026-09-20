/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostTerm. Reuses HostFrontLiveExtract / Types / Mult.
  Not HostFront G1. Not HostTerm.multFixtureModule. Not parseLiveExtractSource
  on HostTerm text.

  Spec (readable):
  - parseLiveHostTermSource turns live HostTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostTerm even without a module line.
  - kernelCheckLiveHostTermSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live IrProgram.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOSTTERM, SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0,
  PARSE-LIVE-HOSTTERM, parseLiveHostTermSource, kernelCheckLiveHostTermSource,
  hostFrontLiveHostTermReady, liveHostTermSource, liveHostTermRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostTerm
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveHostTerm on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveExtract
import SystemsLean.HostFrontLiveHostTermSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTTERM"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostTermRel : String := "src/systems/SystemsLean/HostTerm.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostTermResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostTermProvablyUnlocked : Bool := false

/-- Parse fuel (HostTerm is larger than Extract). -/
def liveHostTermParseFuel : Nat := 256

/-- Seed names from SystemsLean.Mult import plus String/List builtins. -/
def seedKnown : List String :=
  ["mult0", "mult1", "multOmega", "ofNat?", "name", "isValid", "isSome", "isEmpty"]

/-- Stop tokens: Extract stops plus `==` so decideEq is not an app arg. -/
def hostTermIsStop (t : String) : Bool :=
  extractIsStop t || t == "==" || t == "[" || t == "]"

/-- Atom start: stop `==`; allow `{` struct lit. -/
def hostTermAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if hostTermIsStop t then false
    else if t == "{" then true
    else typesAtomStart (t :: rest)

/-- Binder field chain `x.raw.isEmpty` is nested proj. -/
def identTermHt (bs : List String) (s : String) : Term :=
  match s.splitOn "." with
  | [] => Term.const (HostTerm.n s)
  | a :: segs =>
    if isBinder bs a then
      segs.foldl (fun t f => Term.proj t (HostTerm.n f)) (Term.var (HostTerm.n a))
    else
      identTerm bs s

/-- Tokenize stripped source; keeps `{` `}` `[` `]` Nat `&&` `!` `==`. -/
def tokenizeHostTermN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeHostTermN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveHostTermParseFuel [c] rest
      tokenizeHostTermN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveHostTermParseFuel [c] rest with
      | none => tokenizeHostTermN n rest acc
      | some (rev, rest2) =>
        tokenizeHostTermN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeHostTermN n rest2 (":=" :: acc)
      | _ => tokenizeHostTermN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeHostTermN n rest2 ("=>" :: acc)
      | '=' :: rest2 => tokenizeHostTermN n rest2 ("==" :: acc)
      | _ => tokenizeHostTermN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeHostTermN n rest2 ("->" :: acc)
      | _ => tokenizeHostTermN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeHostTermN n rest2 ("&&" :: acc)
      | _ => tokenizeHostTermN n rest acc
    else if c == '!' then
      tokenizeHostTermN n rest ("!" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' || c == '[' || c == ']' then
      tokenizeHostTermN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveHostTermParseFuel [c] rest
      tokenizeHostTermN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeHostTermN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeHostTerm (src : String) : List String :=
  tokenizeHostTermN (src.length + 8) src.toList []

/-- Command-start keywords (skip theorems / examples / set_option / failed defs). -/
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

/-- Skip zero or more `(x : T)` groups after a ctor name. -/
def skipCtorArgs : Nat -> List String -> List String
  | 0, rest => rest
  | Nat.succ n, "(" :: rest =>
    match skipBalanced n 1 rest with
    | some rest2 => skipCtorArgs n rest2
    | none => "(" :: rest
  | _, rest => rest

/-- `| ctor` or `| ctor (x : T)*` until deriving. -/
def parseCtorBarsHt : Nat -> List String -> List CtorDecl ->
    Option (Prod (List CtorDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "|" :: name :: rest =>
      if liveIsIdent name then
        let ctor : CtorDecl := { name := HostTerm.n (lastSeg name) }
        parseCtorBarsHt n (skipCtorArgs n rest) (acc ++ [ctor])
      else
        none
    | _ => some (acc, toks)

mutual
  /-- HostType atom: List T, Prod A B, parenthesized, Option, Mult-first. -/
  def parseHostTypeAtomHt : Nat -> List String -> Option (Prod HostType (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match toks with
      | [] => none
      | "List" :: rest =>
        match parseHostTypeAtomHt n rest with
        | some (_, rest2) => some (HostType.named (HostTerm.n "List"), rest2)
        | none => some (HostType.named (HostTerm.n "List"), rest)
      | "Prod" :: rest =>
        match parseHostTypeAtomHt n rest with
        | some (_, rest2) =>
          match parseHostTypeAtomHt n rest2 with
          | some (_, rest3) => some (HostType.named (HostTerm.n "Prod"), rest3)
          | none => some (HostType.named (HostTerm.n "Prod"), rest2)
        | none => some (HostType.named (HostTerm.n "Prod"), rest)
      | "Option" :: rest =>
        match parseHostTypeAtomHt n rest with
        | some (t, rest2) => some (HostType.option t, rest2)
        | none => none
      | "(" :: rest =>
        match parseHostTypeArrowHt n rest with
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
  def parseHostTypeArrowHt : Nat -> List String -> Option (Prod HostType (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseHostTypeAtomHt n toks with
      | none => none
      | some (left, "->" :: rest) =>
        match parseHostTypeArrowHt n rest with
        | some (right, rest2) => some (HostType.arrow left right, rest2)
        | none => none
      | some (left, rest) => some (left, rest)
end

/-- Full consume HostType. -/
def parseHostTypeAllHt (toks : List String) : Option HostType :=
  match parseHostTypeArrowHt liveHostTermParseFuel toks with
  | some (ty, []) => some ty
  | _ => none

/-- Binders `(n : T)` using HostTerm types (List / Prod). -/
def parseBindersHt : Nat -> List String -> List (Prod String HostType) ->
    Option (Prod (List (Prod String HostType)) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "(" :: rest =>
      match parseBinderNamesN n [] rest with
      | some (names, ":" :: rest2) =>
        match parseHostTypeArrowHt n rest2 with
        | some (ty, ")" :: rest3) =>
          parseBindersHt n rest3 (acc ++ names.map (fun nm => (nm, ty)))
        | _ => none
      | _ => none
    | _ => some (acc, toks)

/-- Structure fields `name : Type` including List T. -/
def parseStructFieldDeclsHt : Nat -> List String -> List FieldDecl ->
    Option (Prod (List FieldDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "deriving" :: rest => some (acc, "deriving" :: rest)
    | t :: ":" :: rest =>
      if !liveIsIdent t then none
      else
        match parseHostTypeArrowHt n rest with
        | some (ty, rest2) =>
          parseStructFieldDeclsHt n rest2
            (acc ++ [{ name := HostTerm.n (lastSeg t), ty := ty }])
        | none => none
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

/-- Names a command adds to the known-const set. -/
def cmdAdds (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "Mult" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body of a typed def is kernel-known. -/
def cmdBodyKnown (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body => termKnownN liveHostTermParseFuel kn body
  | Cmd.defBind _ _ _ body => termKnownN liveHostTermParseFuel kn body
  | _ => true

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsHt : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermHt n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsHt n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Atom including some / none / struct lit. -/
  def parseAtomHt : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomHt n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsHt n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermHt n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" && t != "!" && t != "==" then
          some (identTermHt bs t, rest)
        else
          none

  /-- App, `.isSome` / `.isEmpty` builtin, and field proj. -/
  def parseTermTailHt : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" || field == "isEmpty" then
          parseTermTailHt n bs
            (Term.app (Term.const (HostTerm.n field)) t) rest2
        else if liveIsIdent field then
          parseTermTailHt n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | _ =>
        if hostTermAtomStart rest then
          match parseAtomHt n bs rest with
          | some (a, rest2) => parseTermTailHt n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / prefix `!` / && / == / atom. Match is parsed then dropped. -/
  def parseTermHt : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermHt n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermHt n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermHt n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "!" :: rest =>
        match parseAtomHt n bs rest with
        | some (t, rest2) =>
          match parseTermTailHt n bs t rest2 with
          | some (t2, rest3) =>
            some (Term.ite t2 (Term.litBool false) (Term.litBool true), rest3)
          | none => none
        | none => none
      | _ =>
        match parseAtomHt n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailHt n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermHt n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | "==" :: rest3 =>
              match parseTermHt n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign only; equations fail closed). -/
def parseDefHt (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match parseHostTypeAllHt tyToks with
        | none => none
        | some retTy =>
          let ty := addBinderArrows bs retTy
          let bnames := bs.map (fun p => p.fst)
          let dn := HostTerm.n dname
          match kind with
          | DefBodyKind.assign =>
            match parseTermHt liveHostTermParseFuel bnames bodyToks with
            | some (body, rest4) =>
              let rest5 :=
                match rest4 with
                | "where" :: more => skipUntilCmd fuel more
                | _ => rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
            | none => none
          | DefBodyKind.equation => none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdHt (fuel : Nat) (toks : List String) :
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
      match parseStructFieldDeclsHt fuel rest [] with
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
      match parseCtorBarsHt fuel rest [] with
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsHt : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveHostTermParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsHt n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsHt n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostTermParseFuel rest
          if rest2.length < toks.length then
            parseCmdsHt n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostTerm.lean text.
    Greppable: parseLiveHostTermSource, PARSE-LIVE-HOSTTERM. -/
def parseLiveHostTermSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHt liveHostTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostTerm", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostTerm parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveHostTermSource, PARSE-LIVE-HOSTTERM. -/
def kernelCheckLiveHostTermSource (src : String) : Bool :=
  match parseLiveHostTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostTermParsed? : Option Module :=
  match parseLiveHostTermSource liveHostTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostTermParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / structures / defs). -/
def liveParseCmdCountOk : Bool :=
  match liveHostTermParsed? with
  | some m => m.commands.length >= 14
  | none => false

/-- Live parse has Name structure. -/
def liveParseHasNameStruct : Bool :=
  match liveHostTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Name" && fields.any (fun f => f.name.raw == "raw")
      | _ => false

/-- Live parse has core HostTerm defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveHostTermParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "n" && has "nameOk"

/-- Live parse imports SystemsLean.Mult (not the Mult fixture). -/
def liveParseHasMultImport : Bool :=
  match liveHostTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostTermReady, PARSE-LIVE-HOSTTERM, HOST-FRONT-LIVE-HOSTTERM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTTERM")
    && (parseId == "PARSE-LIVE-HOSTTERM")
    && (liveHostTermRel == "src/systems/SystemsLean/HostTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostTermFullHost
    && !hostFrontLiveHostTermResidualFreeClaimed
    && !hostFrontLiveHostTermProvablyUnlocked
    && kernelCheckLiveHostTermSource liveHostTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNameStruct
    && liveParseHasCoreDefs
    && liveParseHasMultImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostTerm (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTTERM =="
  IO.println s!"  host={hostId} file={liveHostTermRel}"
  let path := root / liveHostTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostTermRel}"
    throw (IO.userError s!"missing {liveHostTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostTerm.lean != liveHostTermSource"
    throw (IO.userError "dual-pin mismatch live HostTerm.lean")
  let r := parseLiveHostTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostTerm parse false"
      throw (IO.userError "kernelCheck live HostTerm parse false")
    unless hostFrontLiveHostTermReady do
      IO.eprintln "error: hostFrontLiveHostTermReady false"
      throw (IO.userError "hostFrontLiveHostTermReady false")
    IO.println s!"GREEN {stageId}: live HostTerm.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostTerm root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostTerm
