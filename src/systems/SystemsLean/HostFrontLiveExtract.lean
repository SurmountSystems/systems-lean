/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/Extract.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveExtract. Reuses HostFrontLiveErasure / Types / Mult.
  Not HostFront G1. Not HostTerm.multFixtureModule. Not parseLiveErasureSource
  on Extract text.

  Spec (readable):
  - parseLiveExtractSource turns live Extract.lean text into HostTerm.Module.
  - Module name is SystemsLean.Extract even without a module line.
  - kernelCheckLiveExtractSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live IrProgram.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EXTRACT, SLAKE_HOST_FRONT_LIVE_EXTRACT_V0,
  PARSE-LIVE-EXTRACT, parseLiveExtractSource, kernelCheckLiveExtractSource,
  hostFrontLiveExtractReady, liveExtractSource, liveExtractRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveExtract
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveExtract on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveTypes
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveExtract

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EXTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EXTRACT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EXTRACT"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractRel : String := "src/systems/SystemsLean/Extract.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveExtractFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveExtractResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveExtractProvablyUnlocked : Bool := false

/-- Parse fuel (Extract is similar in size to Erasure). -/
def liveExtractParseFuel : Nat := 192

/-- Stop tokens: Erasure stops plus `!` so prefix not is not an app arg. -/
def extractIsStop (t : String) : Bool :=
  typesIsStop t || t == "&&" || t == "!"

/-- Atom start: stop `&&` / `!` from juxtaposition. Allow `{` so
    `extractOk m { marked := erasedMarked }` is app of a struct lit. -/
def extractAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if extractIsStop t then false
    else if t == "{" then true
    else typesAtomStart (t :: rest)

/-- Tokenize stripped source; keeps `{` `}` Nat `&&` and `!`. -/
def tokenizeExtractN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeExtractN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveExtractParseFuel [c] rest
      tokenizeExtractN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveExtractParseFuel [c] rest with
      | none => tokenizeExtractN n rest acc
      | some (rev, rest2) =>
        tokenizeExtractN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeExtractN n rest2 (":=" :: acc)
      | _ => tokenizeExtractN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeExtractN n rest2 ("=>" :: acc)
      | _ => tokenizeExtractN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeExtractN n rest2 ("->" :: acc)
      | _ => tokenizeExtractN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeExtractN n rest2 ("&&" :: acc)
      | _ => tokenizeExtractN n rest acc
    else if c == '!' then
      tokenizeExtractN n rest ("!" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' then
      tokenizeExtractN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveExtractParseFuel [c] rest
      tokenizeExtractN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeExtractN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeExtract (src : String) : List String :=
  tokenizeExtractN (src.length + 8) src.toList []

/-- Pattern: dotted `Ident . Ident` as ctor0 lastSeg; else parsePatTypes (`_` / some / nat). -/
def parsePatExtract : List String -> Option (Prod Pat (List String))
  | t :: "." :: u :: rest =>
    if liveIsIdent t && liveIsIdent u then
      some (Pat.ctor0 (HostTerm.n (lastSeg u)), rest)
    else
      parsePatTypes (t :: "." :: u :: rest)
  | toks => parsePatTypes toks

/-- Def name: `Ident . Ident` lastSeg, or one ident lastSeg (`RuntimeClaim.name`). -/
def parseDefHead : List String -> Option (Prod String (List String))
  | a :: "." :: b :: rest =>
    if liveIsIdent a && liveIsIdent b then some (lastSeg b, rest)
    else none
  | a :: rest =>
    if liveIsIdent a then some (lastSeg a, rest)
    else none
  | _ => none

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsExtract : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermExtract n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsExtract n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Single-scrutinee arms `| p => body`. -/
  def parseOneArmsExtract : Nat -> List String -> List String ->
      List (Prod Pat Term) ->
      Option (Prod (List (Prod Pat Term)) (List String))
    | 0, _, toks, acc => some (acc, toks)
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "|" :: rest =>
        match parsePatExtract rest with
        | some (p, "=>" :: rest2) =>
          match parseTermExtract n bs rest2 with
          | some (body, rest3) =>
            parseOneArmsExtract n bs rest3 (acc ++ [(p, body)])
          | none => none
        | _ => none
      | _ => some (acc, toks)

  /-- Two-scrutinee arms `| p1, p2 => body`. -/
  def parseTwoArmsExtract : Nat -> List String -> List String ->
      List (Prod (Prod Pat Pat) Term) ->
      Option (Prod (List (Prod (Prod Pat Pat) Term)) (List String))
    | 0, _, toks, acc => some (acc, toks)
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "|" :: rest =>
        match parsePatExtract rest with
        | some (p1, "," :: rest2) =>
          match parsePatExtract rest2 with
          | some (p2, "=>" :: rest3) =>
            match parseTermExtract n bs rest3 with
            | some (body, rest4) =>
              parseTwoArmsExtract n bs rest4 (acc ++ [((p1, p2), body)])
            | none => none
          | _ => none
        | _ => none
      | _ => some (acc, toks)

  /-- Atom including some / none / struct lit. -/
  def parseAtomExtract : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomExtract n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsExtract n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermExtract n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" && t != "!" then
          some (typesIdentTerm bs t, rest)
        else
          none

  /-- App, `.isSome` builtin, and field proj. -/
  def parseTermTailExtract : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" then
          parseTermTailExtract n bs
            (Term.app (Term.const (HostTerm.n "isSome")) t) rest2
        else if liveIsIdent field then
          parseTermTailExtract n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | _ =>
        if extractAtomStart rest then
          match parseAtomExtract n bs rest with
          | some (a, rest2) => parseTermTailExtract n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / match (one or two scrutinees) / prefix `!` / && / atom. -/
  def parseTermExtract : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermExtract n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermExtract n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermExtract n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "match" :: rest =>
        match parseTermExtract n bs rest with
        | some (s1, "," :: rest2) =>
          match parseTermExtract n bs rest2 with
          | some (s2, "with" :: rest3) =>
            match parseTwoArmsExtract n bs rest3 [] with
            | some ([((p1, p2), b1), ((Pat.wild, Pat.wild), b2)], rest4) =>
              some (
                Term.match_ s1 [
                  (p1, Term.match_ s2 [(p2, b1), (Pat.wild, b2)]),
                  (Pat.wild, b2)
                ], rest4)
            | _ => none
          | _ => none
        | some (s1, "with" :: rest2) =>
          match parseOneArmsExtract n bs rest2 [] with
          | some (arms, rest3) =>
            if arms.isEmpty then none
            else some (Term.match_ s1 arms, rest3)
          | none => none
        | _ => none
      | "!" :: rest =>
        match parseAtomExtract n bs rest with
        | some (t, rest2) =>
          match parseTermTailExtract n bs t rest2 with
          | some (t2, rest3) =>
            some (Term.ite t2 (Term.litBool false) (Term.litBool true), rest3)
          | none => none
        | none => none
      | _ =>
        match parseAtomExtract n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailExtract n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermExtract n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign or equation). -/
def parseDefExtract (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
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
          let dn := HostTerm.n dname
          match kind with
          | DefBodyKind.assign =>
            match parseTermExtract liveExtractParseFuel bnames bodyToks with
            | some (body, rest4) =>
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest4)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest4)
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
                some (Cmd.def_ dn (some ty) body, rest4)
            | none => none
    | _ => none

/-- Parse one command (import / open / structure / Extract def, else LiveMult). -/
def parseOneCmdExtract (fuel : Nat) (toks : List String) :
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
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefExtract fuel dname rest2
    | none => none
  | _ => parseOneCmdN liveParseFuel toks

/-- Fold commands. Fail closed. -/
def parseCmdsExtract : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdExtract liveExtractParseFuel toks with
    | none => none
    | some (c, rest) => parseCmdsExtract n rest (acc ++ [c])

/-- Parse live Extract.lean text. Greppable: parseLiveExtractSource, PARSE-LIVE-EXTRACT. -/
def parseLiveExtractSource (src : String) : FrontResult :=
  let toks := tokenizeExtract (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsExtract liveExtractParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module := { name := HostTerm.n "SystemsLean.Extract", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live Extract parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveExtractSource, PARSE-LIVE-EXTRACT. -/
def kernelCheckLiveExtractSource (src : String) : Bool :=
  match parseLiveExtractSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live Extract.lean bytes (must match on-disk file).
    Greppable: liveExtractSource, PARSE-LIVE-EXTRACT. -/
def liveExtractSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Extract / emit boundary on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Extract.slake, extract.md,
    emit FAIL_CLOSED_CHECKER_V1 / slake_extract_with_checks (frozen wire honesty only).

  Spec (readable, separate from any future proof):
  - EMIT-BOUNDARY: host elaborator / proofs vs product extract stay distinct.
  - Three runtime stories: Idris RefC; classic Lean AOT (RUNTIME-CLASSIC /
    EDGE-RUNTIME managed residual); freestanding product goal (RUNTIME-FS).
  - RuntimeClaim is closed: runtimeFs | runtimeClassic | edgeRuntime.
  - Product extract accepts only RUNTIME-FS (runtimeClassic / edgeRuntime reject).
  - extractOk / checkFailClosed are PARTIAL FAIL_CLOSED_CHECKER_V1 host honesty
    (not full C checker parity; not full host compose).
  - Rules enforced here (fail closed, not residual free):
      MULT-0 needs marked erased; claimed runtime must be freestanding (RUNTIME-FS);
      unknown mult/runtime tags fail on raw-tag path.
  - MULT-1 under RUNTIME-FS: thin path rejects (no live-token evidence on this
    API). Matches HostCompose / frozen C unminted MULT-1 reject. Minted MULT-1
    extract stays on SystemsLean.HostCompose (linear.live).
  - MULT-OMEGA under RUNTIME-FS: host passes grade alone.

  Theorems (EXTRACT-THEOREM / HOST-EXTRACT-THEOREM -- partial Extract only):
  - Live in SystemsLean.ExtractTheorems (same namespace; long-file split).
  - isFreestandingGoal_runtimeFs / isFreestandingGoal_classic_false /
    isFreestandingGoal_edge_false (RUNTIME-FS only is freestanding goal)
  - extractOk_classic_reject / extractOk_edge_reject (EMIT-BOUNDARY reject)
  - extractOk_mult1_fs_false / extractOk_omega_fs_true (MULT-1 unminted reject)
  - extractOk_mult0_unmarked_false / extractOk_mult0_marked_fs_true
  - ofRuntimeTag?_zero/one/two / ofRuntimeTag?_fail_closed /
    isValidRuntimeTag_fail_closed / isValidRuntimeTag_zero/one/two
    (FAIL-CLOSED-UNKNOWN-RUNTIME)
  - ofRuntimeTag?_some_implies_isValidRuntimeTag (success implies valid tag)
  - extractOkFromTags? known-tag success/fail paths + unknown none
  - extractOk_eq_checkFailClosed / RuntimeClaim.name_* honesty
  These Extract theorems do NOT flip SpecProof.proofCompleteClaimed.
  The living SpecProof pin is already true. Extract theorems do not
  set that pin.
  Partial theorems on Extract != host proof complete != residual free.
  Thin MULT-1 unminted reject is closed; minted MULT-1 stays HostCompose.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Extract theorems do not flip SpecProof.proofCompleteClaimed
    (the living pin is already true).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not a full compiler body. Not HOST_COMPOSE_V0 reimplementation.
  - Not full FAIL_CLOSED_CHECKER_V1 / slake_extract_with_checks parity
    (thin path has no live token; minted MULT-1 is HostCompose).
  - Not residual free.
  - Frozen C enum collapses CLASSIC / EDGE-RUNTIME into one wire tag; host keeps
    three claims for honesty (raw tag 1 classic, 2 edge; both fail product extract).

  Greppable: SYSTEMS_LEAN_HOST, EMIT-BOUNDARY, RUNTIME-FS, EDGE-RUNTIME, RUNTIME-CLASSIC,
  FAIL-CLOSED, FAIL_CLOSED_CHECKER_V1, EXTRACT-THEOREM, HOST-EXTRACT-THEOREM,
  isFreestandingGoal_runtimeFs, extractOk_classic_reject, ofRuntimeTag?_fail_closed,
  ofRuntimeTag?_some_implies_isValidRuntimeTag, extractOkFromTags?_mult1_fs_false,
  extractOkFromTags?_mult0_marked_fs_true, isValidRuntimeTag_zero,
  extractOkFromTags?_omega_fs_true, extractOkFromTags?_mult0_unmarked_fs_false,
  extractOkFromTags?_classic_reject, extractOkFromTags?_edge_reject,
  extractOkFromTags?_both_unknown_none, ExtractTheorems,
  theorem isFreestandingGoal_runtimeFs
  UNIT_SURFACE host surface. Module: SystemsLean.Extract
  Long-file split: EXTRACT-THEOREM / HOST-EXTRACT-THEOREM in
  SystemsLean.ExtractTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Erasure

namespace SystemsLean.Extract

open SystemsLean.Mult (Mult)
open SystemsLean.Erasure (Erased)

/-- Runtime claim for extract / emit boundary honesty (EMIT-BOUNDARY).
    runtimeFs = RUNTIME-FS freestanding product goal (no Lean managed runtime).
    runtimeClassic = RUNTIME-CLASSIC stock-host managed residual.
    edgeRuntime = EDGE-RUNTIME stock-host / bridge managed residual.
    Product extract accepts only runtimeFs. -/
inductive RuntimeClaim where
  | runtimeFs
  | runtimeClassic
  | edgeRuntime
  deriving DecidableEq, Repr

/-- Human-facing runtime claim ids (greppable contract surface). -/
def RuntimeClaim.name : RuntimeClaim -> String
  | RuntimeClaim.runtimeFs => "RUNTIME-FS"
  | RuntimeClaim.runtimeClassic => "RUNTIME-CLASSIC"
  | RuntimeClaim.edgeRuntime => "EDGE-RUNTIME"

/-- True when claim is the freestanding product goal (RUNTIME-FS).
    EDGE-RUNTIME / RUNTIME-CLASSIC are not accepted on product extract. -/
def isFreestandingGoal (c : RuntimeClaim) : Bool :=
  match c with
  | RuntimeClaim.runtimeFs => true
  | RuntimeClaim.runtimeClassic => false
  | RuntimeClaim.edgeRuntime => false

/-- Raw tag decode for host RuntimeClaim.
    0 = RUNTIME-FS; 1 = RUNTIME-CLASSIC; 2 = EDGE-RUNTIME.
    Frozen C slake_runtime_class only exposes FS=0 and CLASSIC=1 (edge collapsed
    into classic on the wire); host keeps three claims for honesty.
    FAIL-CLOSED-UNKNOWN-RUNTIME: unknown tags return none. -/
def ofRuntimeTag? : Nat -> Option RuntimeClaim
  | 0 => some RuntimeClaim.runtimeFs
  | 1 => some RuntimeClaim.runtimeClassic
  | 2 => some RuntimeClaim.edgeRuntime
  | _ => none

/-- FAIL-CLOSED-UNKNOWN-RUNTIME on raw tags: true only for known 0/1/2. -/
def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome

/-- checkFailClosed m e claim -- PARTIAL FAIL_CLOSED_CHECKER_V1 host honesty
    (not full C checker; not residual free).
    Fail closed when:
      - MULT-0 without marked erased (ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME)
      - claimed runtime is not RUNTIME-FS (EDGE-RUNTIME / RUNTIME-CLASSIC reject)
    MULT-1 under RUNTIME-FS: false (no live-token evidence on this path).
    MULT-OMEGA under RUNTIME-FS: true (erasure handle ignored).
    Matches frozen C / HostCompose unminted MULT-1 reject. Minted path:
    HostCompose.checkFailClosed (multPreScan requires hc.linear.live).
    EMIT-BOUNDARY honesty only. -/
def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=
  if !isFreestandingGoal claim then
    false
  else
    match m with
    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e
    | Mult.mult1 => false
    | Mult.multOmega => true

/-- extractOk -- same bar as checkFailClosed (PARTIAL host extract path honesty).
    MULT-1 under RUNTIME-FS rejects (no live-token evidence). Fuller host:
    HostCompose.extractOk requires RuntimeClaim.runtimeFs and
    HostCompose.checkFailClosed, which runs multPreScan: any MULT-1 graph node
    needs a live LinearHost (hc.linear.live); any MULT-0 needs marked erased;
    empty compose / MULT-OMEGA-only may extract without mint.
    Frozen C slake_extract_with_checks also needs a live token for MULT-1.
    On OK product wire sets out_rt to RUNTIME-FS (not modeled as mutation here). -/
def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=
  checkFailClosed m e claim

/-- Raw-tag extract path: fail closed on unknown mult or runtime tags.
    Erased marked flag is host Bool (no null pointer on host).
    none = unknown tag (cannot decide); some false = known inputs that fail closed;
    some true = partial host extract OK under RUNTIME-FS (MULT-0 marked or
    MULT-OMEGA). MULT-1 is some false (no live-token evidence). -/
def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=
  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with
  | some m, some claim =>
    some (extractOk m { marked := erasedMarked } claim)
  | _, _ => none

/- Theorems live in SystemsLean.ExtractTheorems
   (same namespace SystemsLean.Extract; long-file split). Parent keeps
   dialect only -- do not import ExtractTheorems here (import cycle). -/

end SystemsLean.Extract
"#


/-- Accepted live module when parse succeeds. -/
def liveExtractParsed? : Option Module :=
  match parseLiveExtractSource liveExtractSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveExtractParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (14: two import, namespace, two open, inductive, six def, end). -/
def liveParseCmdCountOk : Bool :=
  match liveExtractParsed? with
  | some m => m.commands.length == 14
  | none => false

/-- Live parse has RuntimeClaim inductive with three ctors. -/
def liveParseHasRuntimeClaim : Bool :=
  match liveExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "RuntimeClaim" && ctors.length == 3
          && ctors.any (fun x => x.name.raw == "runtimeFs")
          && ctors.any (fun x => x.name.raw == "runtimeClassic")
          && ctors.any (fun x => x.name.raw == "edgeRuntime")
      | _ => false

/-- Live parse has core Extract defs (def_ or defBind), including lastSeg name. -/
def liveParseHasCoreDefs : Bool :=
  match liveExtractParsed? with
  | none => false
  | some m =>
    let has (n : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == n
        | Cmd.defBind x _ _ _ => x.raw == n
        | _ => false
    has "name" && has "isFreestandingGoal" && has "ofRuntimeTag?"
      && has "isValidRuntimeTag" && has "checkFailClosed"
      && has "extractOk" && has "extractOkFromTags?"

/-- Live parse imports SystemsLean.Mult (not the Mult fixture). -/
def liveParseHasMultImport : Bool :=
  match liveExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- Live parse imports SystemsLean.Erasure. -/
def liveParseHasErasureImport : Bool :=
  match liveExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Erasure"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveExtractReady, PARSE-LIVE-EXTRACT, HOST-FRONT-LIVE-EXTRACT.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveExtractReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EXTRACT_V0")
    && (hostId == "HOST-FRONT-LIVE-EXTRACT")
    && (parseId == "PARSE-LIVE-EXTRACT")
    && (liveExtractRel == "src/systems/SystemsLean/Extract.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveExtractFullHost
    && !hostFrontLiveExtractResidualFreeClaimed
    && !hostFrontLiveExtractProvablyUnlocked
    && kernelCheckLiveExtractSource liveExtractSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasRuntimeClaim
    && liveParseHasCoreDefs
    && liveParseHasMultImport
    && liveParseHasErasureImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveExtractSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveExtract (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EXTRACT =="
  IO.println s!"  host={hostId} file={liveExtractRel}"
  let path := root / liveExtractRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveExtractRel}"
    throw (IO.userError s!"missing {liveExtractRel}")
  let disk <- IO.FS.readFile path
  if disk != liveExtractSource then
    IO.eprintln "error: dual-pin mismatch: on-disk Extract.lean != liveExtractSource"
    throw (IO.userError "dual-pin mismatch live Extract.lean")
  let r := parseLiveExtractSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EXTRACT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EXTRACT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EXTRACT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live Extract parse false"
      throw (IO.userError "kernelCheck live Extract parse false")
    unless hostFrontLiveExtractReady do
      IO.eprintln "error: hostFrontLiveExtractReady false"
      throw (IO.userError "hostFrontLiveExtractReady false")
    IO.println s!"GREEN {stageId}: live Extract.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveExtract root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveExtract
