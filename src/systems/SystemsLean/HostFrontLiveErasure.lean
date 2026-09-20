/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/Erasure.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveErasure. Reuses HostFrontLiveTypes. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveTypesSource on Erasure text.

  Spec (readable):
  - parseLiveErasureSource turns live Erasure.lean text into HostTerm.Module.
  - Module name is SystemsLean.Erasure even without a module line.
  - kernelCheckLiveErasureSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Extract.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-ERASURE, SLAKE_HOST_FRONT_LIVE_ERASURE_V0,
  PARSE-LIVE-ERASURE, parseLiveErasureSource, kernelCheckLiveErasureSource,
  hostFrontLiveErasureReady, liveErasureSource, liveErasureRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveErasure
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveErasure on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveTypes
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveErasure

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_ERASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-ERASURE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-ERASURE"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureRel : String := "src/systems/SystemsLean/Erasure.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveErasureFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveErasureResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveErasureProvablyUnlocked : Bool := false

/-- Parse fuel (Erasure is smaller than Types). -/
def liveErasureParseFuel : Nat := 192

/-- Stop tokens: Types stops plus `&&` so Bool.and is not an app arg. -/
def erasureIsStop (t : String) : Bool :=
  typesIsStop t || t == "&&"

/-- Atom start: stop `&&` from juxtaposition. -/
def erasureAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if erasureIsStop t then false
    else typesAtomStart (t :: rest)

/-- Tokenize stripped source; keeps `{` `}` Nat and `&&`. -/
def tokenizeErasureN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeErasureN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveErasureParseFuel [c] rest
      tokenizeErasureN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveErasureParseFuel [c] rest with
      | none => tokenizeErasureN n rest acc
      | some (rev, rest2) =>
        tokenizeErasureN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeErasureN n rest2 (":=" :: acc)
      | _ => tokenizeErasureN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeErasureN n rest2 ("=>" :: acc)
      | _ => tokenizeErasureN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeErasureN n rest2 ("->" :: acc)
      | _ => tokenizeErasureN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeErasureN n rest2 ("&&" :: acc)
      | _ => tokenizeErasureN n rest acc
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' then
      tokenizeErasureN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveErasureParseFuel [c] rest
      tokenizeErasureN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeErasureN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeErasure (src : String) : List String :=
  tokenizeErasureN (src.length + 8) src.toList []

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsErasure : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermErasure n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsErasure n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Single-scrutinee arms `| p => body`. -/
  def parseOneArmsErasure : Nat -> List String -> List String ->
      List (Prod Pat Term) ->
      Option (Prod (List (Prod Pat Term)) (List String))
    | 0, _, toks, acc => some (acc, toks)
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "|" :: rest =>
        match parsePatTypes rest with
        | some (p, "=>" :: rest2) =>
          match parseTermErasure n bs rest2 with
          | some (body, rest3) =>
            parseOneArmsErasure n bs rest3 (acc ++ [(p, body)])
          | none => none
        | _ => none
      | _ => some (acc, toks)

  /-- Atom including some / none / struct lit. -/
  def parseAtomErasure : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomErasure n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsErasure n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermErasure n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" then
          some (typesIdentTerm bs t, rest)
        else
          none

  /-- App and field proj. -/
  def parseTermTailErasure : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if liveIsIdent field then
          parseTermTailErasure n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | _ =>
        if erasureAtomStart rest then
          match parseAtomErasure n bs rest with
          | some (a, rest2) => parseTermTailErasure n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / match / && / atom. `&&` is ite (short-circuit Bool.and). -/
  def parseTermErasure : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermErasure n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermErasure n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermErasure n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "match" :: rest =>
        match parseTermErasure n bs rest with
        | some (s1, "with" :: rest2) =>
          match parseOneArmsErasure n bs rest2 [] with
          | some (arms, rest3) =>
            if arms.isEmpty then none
            else some (Term.match_ s1 arms, rest3)
          | none => none
        | _ => none
      | _ =>
        match parseAtomErasure n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailErasure n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermErasure n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse one command (import / open / structure / Erasure def, else LiveMult). -/
def parseOneCmdErasure (fuel : Nat) (toks : List String) :
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
                match parseTermErasure liveErasureParseFuel bnames bodyToks with
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
def parseCmdsErasure : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdErasure liveErasureParseFuel toks with
    | none => none
    | some (c, rest) => parseCmdsErasure n rest (acc ++ [c])

/-- Parse live Erasure.lean text. Greppable: parseLiveErasureSource, PARSE-LIVE-ERASURE. -/
def parseLiveErasureSource (src : String) : FrontResult :=
  let toks := tokenizeErasure (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsErasure liveErasureParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module := { name := HostTerm.n "SystemsLean.Erasure", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live Erasure parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveErasureSource, PARSE-LIVE-ERASURE. -/
def kernelCheckLiveErasureSource (src : String) : Bool :=
  match parseLiveErasureSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live Erasure.lean bytes (must match on-disk file).
    Greppable: liveErasureSource, PARSE-LIVE-ERASURE. -/
def liveErasureSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Erasure (MULT-0 compile-time-only) on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Erasure.slake, erasure.md,
    emit slake_erased / slake_erasure_is_runtime_absent (frozen wire honesty only).

  Spec (readable, separate from any future proof):
  - ERASE-RULE-MULT-0: MULT-0 values are compile-time-only when checks succeed.
  - ERASE-NO-RUNTIME: marked erasure claims no product runtime presence.
  - Erased is a zero-payload marker handle (emit: slake_erased with marked flag).
  - unmarked: handle present but not yet marked erased (fail closed for runtime-absent).
  - mark flips marked to true (host model of slake_erased_mark).
  - isRuntimeAbsent / erasureIsRuntimeAbsent: true only when marked
    (emit: slake_erasure_is_runtime_absent returns 1 only for non-null marked;
    host has no null pointer -- unmarked fails closed).
  - EDGE-PROP / ERASE-PROP: Lean Prop erasure is not Idris quantity 0 -- working map
    with exceptions, not isomorphism of erasure mechanisms.
  - isErasureGrade: true only for Mult.mult0 (pairs with Types ERASED <-> MULT-0).
  - markForGrade?: mark only when grade is MULT-0; else none (fail closed).

  Theorems (ERASURE-THEOREM / HOST-ERASURE-THEOREM -- partial Erasure only):
  - Live in SystemsLean.ErasureTheorems (same namespace; long-file split).
  - isRuntimeAbsent_unmarked_false / isRuntimeAbsent_mark_true (fail-closed mark)
  - isRuntimeAbsent_eq_marked (definitional mark flag)
  - isErasureGrade_mult0 / isErasureGrade_mult1_false / isErasureGrade_omega_false
  - markForGrade?_mult0_some / markForGrade?_mult1_none / markForGrade?_omega_none
  - markForGrade?_some_implies_isErasureGrade / markForGrade?_some_is_mark
  - checkFailClosed_eq / checkFailClosed_unmarked_false /
    checkFailClosed_marked_mult0_true / checkFailClosed_mult1_false
  - erasureIsRuntimeAbsent_eq / mark_idempotent / markForGrade?_mult0_isRuntimeAbsent
  These Erasure theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on Erasure != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Classic Lean Prop erasure is not freestanding product erasure.
  - Not a full erasure pass. Not residual free.

  Greppable: SYSTEMS_LEAN_HOST, ERASE-RULE-MULT-0, ERASE-NO-RUNTIME, EDGE-PROP, ERASE-PROP,
  ERASURE-THEOREM, HOST-ERASURE-THEOREM, isRuntimeAbsent_unmarked_false,
  markForGrade?_mult1_none, checkFailClosed_unmarked_false, checkFailClosed_eq,
  markForGrade?_some_implies_isErasureGrade, isRuntimeAbsent_eq_marked,
  markForGrade?_some_is_mark, markForGrade?_mult0_isRuntimeAbsent, ErasureTheorems,
  theorem isRuntimeAbsent_unmarked_false
  UNIT_SURFACE host surface. Module: SystemsLean.Erasure
  Long-file split: ERASURE-THEOREM / HOST-ERASURE-THEOREM in
  SystemsLean.ErasureTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult

namespace SystemsLean.Erasure

open SystemsLean.Mult (Mult)

/-- Zero-payload erased marker (emit map: slake_erased).
    marked true means ERASE-NO-RUNTIME claim is live for this handle. -/
structure Erased where
  marked : Bool
  deriving DecidableEq, Repr

/-- Unmarked handle (not runtime-absent yet; fail closed until mark). -/
def unmarked : Erased := { marked := false }

/-- mark e -- mark erased for product runtime-absent claim.
    Emit map honesty: slake_erased_mark. Idempotent on already-marked handles. -/
def mark (_e : Erased) : Erased := { marked := true }

/-- isRuntimeAbsent e -- true only when marked (ERASE-NO-RUNTIME).
    Fail closed: unmarked is not runtime-absent.
    Emit map: slake_erasure_is_runtime_absent (1 only when non-null and marked). -/
def isRuntimeAbsent (e : Erased) : Bool := e.marked

/-- Map name honesty: erasureIsRuntimeAbsent / slake_erasure_is_runtime_absent. -/
def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e

/-- isErasureGrade m -- true only for MULT-0 (ERASE-RULE-MULT-0).
    Types pairs ERASED kind with MULT-0; host Mult is closed.
    Explicit match so a future grade must update this table. -/
def isErasureGrade (m : Mult) : Bool :=
  match m with
  | Mult.mult0 => true
  | Mult.mult1 => false
  | Mult.multOmega => false

/-- markForGrade? m e -- mark only when m is MULT-0 (ERASE-RULE-MULT-0).
    Fail closed: MULT-1 / MULT-OMEGA cannot claim erasure mark; returns none.
    Success path returns marked Erased (payload-free ERASE-NO-RUNTIME handle). -/
def markForGrade? (m : Mult) (e : Erased) : Option Erased :=
  if isErasureGrade m then
    some (mark e)
  else
    none

/-- Fail-closed erasure check: MULT-0 grade and marked erased handle.
    Unmarked MULT-0 fails closed (matches FAIL_CLOSED_CHECKER_V1 mult-0 path honesty).
    Non-MULT-0 fails closed (cannot claim ERASE-NO-RUNTIME without erasure grade). -/
def checkFailClosed (m : Mult) (e : Erased) : Bool :=
  isErasureGrade m && isRuntimeAbsent e

/- Theorems live in SystemsLean.ErasureTheorems
   (same namespace SystemsLean.Erasure; long-file split). Parent keeps
   dialect only -- do not import ErasureTheorems here (import cycle). -/

end SystemsLean.Erasure
"#

/-- Accepted live module when parse succeeds. -/
def liveErasureParsed? : Option Module :=
  match parseLiveErasureSource liveErasureSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveErasureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is 12. -/
def liveParseCmdCountOk : Bool :=
  match liveErasureParsed? with
  | some m => m.commands.length == 12
  | none => false

/-- Live parse has Erased structure. -/
def liveParseHasErased : Bool :=
  match liveErasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Erased" && fields.length == 1
          && fields.any (fun f => f.name.raw == "marked")
      | _ => false

/-- Live parse has core Erasure defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveErasureParsed? with
  | none => false
  | some m =>
    let has (n : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == n
        | Cmd.defBind x _ _ _ => x.raw == n
        | _ => false
    has "unmarked" && has "mark" && has "isRuntimeAbsent"
      && has "erasureIsRuntimeAbsent" && has "isErasureGrade"
      && has "markForGrade?" && has "checkFailClosed"

/-- Live parse imports SystemsLean.Mult (not the Mult fixture). -/
def liveParseHasMultImport : Bool :=
  match liveErasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveErasureReady, PARSE-LIVE-ERASURE, HOST-FRONT-LIVE-ERASURE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveErasureReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_ERASURE_V0")
    && (hostId == "HOST-FRONT-LIVE-ERASURE")
    && (parseId == "PARSE-LIVE-ERASURE")
    && (liveErasureRel == "src/systems/SystemsLean/Erasure.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveErasureFullHost
    && !hostFrontLiveErasureResidualFreeClaimed
    && !hostFrontLiveErasureProvablyUnlocked
    && kernelCheckLiveErasureSource liveErasureSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasErased
    && liveParseHasCoreDefs
    && liveParseHasMultImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveErasureSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveErasure (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-ERASURE =="
  IO.println s!"  host={hostId} file={liveErasureRel}"
  let path := root / liveErasureRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveErasureRel}"
    throw (IO.userError s!"missing {liveErasureRel}")
  let disk <- IO.FS.readFile path
  if disk != liveErasureSource then
    IO.eprintln "error: dual-pin mismatch: on-disk Erasure.lean != liveErasureSource"
    throw (IO.userError "dual-pin mismatch live Erasure.lean")
  let r := parseLiveErasureSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-ERASURE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-ERASURE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-ERASURE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live Erasure parse false"
      throw (IO.userError "kernelCheck live Erasure parse false")
    unless hostFrontLiveErasureReady do
      IO.eprintln "error: hostFrontLiveErasureReady false"
      throw (IO.userError "hostFrontLiveErasureReady false")
    IO.println s!"GREEN {stageId}: live Erasure.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveErasure root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveErasure
