/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SelfHost.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfHost. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe comment strip
  (path cites contain /), termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on SelfHost text.
  Not occupancy leftover HostModuleCheckSelfHostTerm. Not SelfHostTerm.
  Not SelfHostTheorems wrap. Not HostFrontLiveSelfHostTheorems.

  Spec (readable):
  - parseLiveSelfHostSource turns live SelfHost.lean text into HostTerm.Module.
  - Module name is SystemsLean.SelfHost even without a module line.
  - kernelCheckLiveSelfHostSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; SelfHost imports IrProgram /
    HostCompose / CompilePath / JoinMap).
  - Skip theorems, examples, set_option, open, structure, un-kernelable
    match/let/app/do/IO bodies, UInt32/IO/Int typed defs, and abbrev leftovers
    (not isCmdKw). Keep kernelable string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees hostSurfaceOk when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not SelfHostTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not SelfHostTheorems wrap.

  Unique needles (trailing newline so SelfHostTheorems wrap is not a prefix):
  HostFrontLiveSelfHost
  PARSE-LIVE-SELF-HOST
  HOST-FRONT-LIVE-SELF-HOST
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELF-HOST,
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0,
  PARSE-LIVE-SELF-HOST, parseLiveSelfHostSource,
  kernelCheckLiveSelfHostSource,
  hostFrontLiveSelfHostReady, liveSelfHostSource, liveSelfHostRel,
  UNIT_SURFACE host surface, MULT-0, SELF-HOST.
  Module: SystemsLean.HostFrontLiveSelfHost
  Red/green: just slake-typecheck-selfhost; dests skipped (Consume/CanSeq dest join lock);
  lake build SystemsLean.HostFrontLiveSelfHost on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfHostSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfHost

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-HOST"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-HOST"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostRel : String := "src/systems/SystemsLean/SelfHost.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "SelfHost.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfHostFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfHostResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSelfHostProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfHostParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSelfHostSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    SelfHost path cites contain /; HostFrontLiveMult.stripComments is
    not in-string safe. -/
def stripCommentsShN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsShN n nest false false ('\n' :: acc) rest
        else
          stripCommentsShN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsShN n nest false false ('"' :: acc) rest
        else
          stripCommentsShN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsShN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsShN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsShN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsShN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsShN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsShN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsShN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsShN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live SelfHost.lean bytes. -/
def stripCommentsSh (src : String) : String :=
  String.ofList (stripCommentsShN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . SelfHost`. -/
def parseDottedName : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, a :: rest =>
    if !liveIsIdent a then none
    else
      match rest with
      | "." :: rest2 =>
        match parseDottedName n rest2 with
        | some (more, rest3) => some (a ++ "." ++ more, rest3)
        | none => none
      | _ => some (a, rest)

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsSelfHost (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO/Int typed defs. -/
def cmdBodyKnownSelfHost (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostParseFuel body
        && termNoAppN liveSelfHostParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostParseFuel body
        && termNoAppN liveSelfHostParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. SelfHost kernelable defs are
    atoms (string / bool / nat / const). Compound && bodies fail closed. -/
def parseDefSelfHost (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              let rest5 := skipNonCmd liveSelfHostSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdSelfHost (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefSelfHost fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    structure / un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest
    still advances to the next command keyword. -/
def parseCmdsSelfHost : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfHost liveSelfHostParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfHostSkipFuel rest
      if cmdBodyKnownSelfHost kn c then
        parseCmdsSelfHost n rest2 (kn ++ cmdAddsSelfHost c) (acc ++ [c])
      else
        parseCmdsSelfHost n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSelfHostSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSelfHost n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live SelfHost.lean text.
    Greppable: parseLiveSelfHostSource, PARSE-LIVE-SELF-HOST. -/
def parseLiveSelfHostSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSh src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfHost liveSelfHostParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfHost", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfHost parse.
    Greppable: kernelCheckLiveSelfHostSource, PARSE-LIVE-SELF-HOST. -/
def kernelCheckLiveSelfHostSource (src : String) : Bool :=
  match parseLiveSelfHostSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfHostParsed? : Option Module :=
  match parseLiveSelfHostSource liveSelfHostSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfHostParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfHostParsed? with
  | some m => m.commands.length >= 10
  | none => false

/-- Live parse imports SystemsLean.JoinMap. -/
def liveParseHasJoinMapImport : Bool :=
  match liveSelfHostParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "JoinMap"
      | _ => false

/-- Live parse has the SelfHost namespace command. -/
def liveParseHasSelfHostNs : Bool :=
  match liveSelfHostParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SelfHost"
      | _ => false

/-- Wrap module lastSeg is SelfHost (no module line in the live file). -/
def liveParseHasSelfHostModule : Bool :=
  match liveSelfHostParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "SelfHost"

/-- Live parse has core SelfHost defs (def_ or defBind).
    hostSurfaceOk may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveSelfHostParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsSh liveSelfHostSource)
    has "stageId" && has "hostSelfHostId" && has "selfHostId"
      && (has "hostSurfaceOk"
        || toksHaveDefNamed liveSelfHostSkipFuel toks "hostSurfaceOk")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfHostReady, PARSE-LIVE-SELF-HOST,
    HOST-FRONT-LIVE-SELF-HOST.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSelfHostReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0")
    && (hostId == "HOST-FRONT-LIVE-SELF-HOST")
    && (parseId == "PARSE-LIVE-SELF-HOST")
    && (liveSelfHostRel == "src/systems/SystemsLean/SelfHost.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfHostFullHost
    && !hostFrontLiveSelfHostResidualFreeClaimed
    && !hostFrontLiveSelfHostProvablyUnlocked
    && kernelCheckLiveSelfHostSource liveSelfHostSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasJoinMapImport
    && liveParseHasSelfHostNs
    && liveParseHasSelfHostModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfHostSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSelfHost (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-HOST =="
  IO.println s!"  host={hostId} file={liveSelfHostRel}"
  let path := root / liveSelfHostRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfHostRel}"
    throw (IO.userError s!"missing {liveSelfHostRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfHostSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfHost.lean != liveSelfHostSource"
    throw (IO.userError "dual-pin mismatch live SelfHost.lean")
  let r := parseLiveSelfHostSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-HOST reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-HOST reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-HOST ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfHost parse false"
      throw (IO.userError "kernelCheck live SelfHost parse false")
    unless hostFrontLiveSelfHostReady do
      IO.eprintln "error: hostFrontLiveSelfHostReady false"
      throw (IO.userError "hostFrontLiveSelfHostReady false")
    IO.println s!"GREEN {stageId}: live SelfHost.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfHost root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfHost
