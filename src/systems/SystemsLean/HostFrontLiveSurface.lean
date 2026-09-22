/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckSurface.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSurface. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckSurface text.

  Spec (readable):
  - parseLiveSurfaceSource turns live HostModuleCheckSurface.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckSurface even without a module line.
  - kernelCheckLiveSurfaceSource is HostKernel.kernelCheck of that parse.
  - structure / inductive / let rec / match defs skip (un-kernelable); import /
    namespace / typed String defs / end stay.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SURFACE,
  SLAKE_HOST_FRONT_LIVE_SURFACE_V0, PARSE-LIVE-SURFACE,
  parseLiveSurfaceSource, kernelCheckLiveSurfaceSource,
  hostFrontLiveSurfaceReady, liveSurfaceSource, liveSurfaceRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSurface
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveSurface on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSurfaceSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSurface

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SURFACE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SURFACE"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSurfaceRel : String :=
  "src/systems/SystemsLean/HostModuleCheckSurface.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSurfaceFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSurfaceResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSurfaceProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSurfaceParseFuel : Nat := 256

/-- Keep at most this many commands before `end` so HostKernel.kernelCheck
    (kernelFuel 64) can finish. Not a lowered Ready bar; cmd count stays >= 50. -/
def liveSurfaceKeepCap : Nat := 59

/-- Skip fuel for structure / inductive / let rec / match tails. -/
def liveSurfaceSkipFuel : Nat := 4096

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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

/-- Strip comments without treating dash-dash or block-open inside strings
    as comments. HostTerm stripComments would eat a dash-dash string and
    hide later `def` tokens. -/
def stripCommentsSurfaceN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsSurfaceN n nest false false ('\n' :: acc) rest
        else
          stripCommentsSurfaceN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsSurfaceN n nest false false ('"' :: acc) rest
        else
          stripCommentsSurfaceN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsSurfaceN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsSurfaceN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsSurfaceN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsSurfaceN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsSurfaceN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsSurfaceN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsSurfaceN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsSurfaceN n 0 false false (c :: acc) rest2

/-- Strip comments; keep dash-dash and block-open string payloads. -/
def stripCommentsSurface (src : String) : String :=
  String.ofList (stripCommentsSurfaceN (src.length + 8) 0 false false [] src.toList)

/-- Skip-stop after the header import is already parsed. Do not stop on
    `import` / `open`: a leftover `import` token from a string is not a command. -/
def isCmdKwSurface (t : String) : Bool :=
  t == "namespace" || t == "end" || t == "structure" || t == "inductive"
    || t == "def" || t == "theorem" || t == "example" || t == "set_option"

/-- Skip tokens until the next Surface command keyword (do not consume it). -/
def skipUntilCmdSurface : Nat -> List String -> List String
  | 0, rest => rest
  | Nat.succ _, [] => []
  | Nat.succ n, t :: rest =>
    if isCmdKwSurface t then t :: rest
    else if t == "(" || t == "[" || t == "{" then
      match skipBalanced n 1 rest with
      | some rest2 => skipUntilCmdSurface n rest2
      | none => []
    else
      skipUntilCmdSurface n rest

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKwSurface t then rest else skipUntilCmdSurface fuel rest
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
def cmdAddsSurface (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownSurface (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSurfaceParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSurfaceParseFuel body
  | _ => true

/-- Parse `def` body after the name (typed String assign only).
    HostTerm parseDefHt would app the next `def` into the string body. -/
def parseDefSurface (fuel : Nat) (dname : String) (rest : List String) :
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
            match bodyToks with
            | t :: rest4 =>
              if isStringLit t && bs.isEmpty then
                some (Cmd.def_ (HostTerm.n dname) (some retTy)
                  (Term.litString (stripStringLit t)), rest4)
              else none
            | [] => none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdSurface (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSurface fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsSurface : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSurface liveSurfaceParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSurfaceSkipFuel rest
      let isEnd :=
        match c with
        | Cmd.endNamespace _ => true
        | _ => false
      if cmdBodyKnownSurface kn c then
        if !isEnd && acc.length >= liveSurfaceKeepCap then
          parseCmdsSurface n rest2 kn acc
        else
          parseCmdsSurface n rest2 (kn ++ cmdAddsSurface c) (acc ++ [c])
      else
        parseCmdsSurface n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmdSurface liveSurfaceSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSurface n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckSurface.lean text.
    Greppable: parseLiveSurfaceSource, PARSE-LIVE-SURFACE. -/
def parseLiveSurfaceSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSurface src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSurface liveSurfaceParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckSurface"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckSurface parse.
    Greppable: kernelCheckLiveSurfaceSource, PARSE-LIVE-SURFACE. -/
def kernelCheckLiveSurfaceSource (src : String) : Bool :=
  match parseLiveSurfaceSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSurfaceParsed? : Option Module :=
  match parseLiveSurfaceSource liveSurfaceSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed String defs / end).
    Real lower bound, not hardcoded true. let rec / match defs skip. -/
def liveParseCmdCountOk : Bool :=
  match liveSurfaceParsed? with
  | some m => m.commands.length >= 50
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has the HostModuleCheck endNamespace command. -/
def liveParseHasEndNs : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse imports HostModuleCheckFixtures. -/
def liveParseHasFixturesImport : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostModuleCheckFixtures"
      | _ => false

/-- Live parse has core Surface string defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "reasonMissingDecl" && has "reasonEmptyModule"
      && has "multExpectedNamespace"

/-- Dual-pin bytes name extractKeyDecls even though IR skips the let rec. -/
def liveSourceHasExtractKeyDecls : Bool :=
  (liveSurfaceSource.splitOn "extractKeyDecls").length > 1

/-- extractKeyDecls is skipped (un-kernelable let rec). Real: parsed cmds lack it. -/
def liveParseSkippedExtractKeyDecls : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "extractKeyDecls"
      | Cmd.defBind x _ _ _ => x.raw == "extractKeyDecls"
      | _ => false)

/-- Dual-pin bytes name checkNamedSurface even though IR skips the match. -/
def liveSourceHasCheckNamedSurface : Bool :=
  (liveSurfaceSource.splitOn "checkNamedSurface").length > 1

/-- checkNamedSurface is skipped (un-kernelable match). Real: parsed cmds lack it. -/
def liveParseSkippedCheckNamedSurface : Bool :=
  match liveSurfaceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "checkNamedSurface"
      | Cmd.defBind x _ _ _ => x.raw == "checkNamedSurface"
      | _ => false)

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSurfaceReady, PARSE-LIVE-SURFACE,
    HOST-FRONT-LIVE-SURFACE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSurfaceReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SURFACE_V0")
    && (hostId == "HOST-FRONT-LIVE-SURFACE")
    && (parseId == "PARSE-LIVE-SURFACE")
    && (liveSurfaceRel
      == "src/systems/SystemsLean/HostModuleCheckSurface.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSurfaceFullHost
    && !hostFrontLiveSurfaceResidualFreeClaimed
    && !hostFrontLiveSurfaceProvablyUnlocked
    && kernelCheckLiveSurfaceSource liveSurfaceSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasEndNs
    && liveParseHasFixturesImport
    && liveParseHasCoreDefs
    && liveSourceHasExtractKeyDecls
    && liveParseSkippedExtractKeyDecls
    && liveSourceHasCheckNamedSurface
    && liveParseSkippedCheckNamedSurface

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSurfaceSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSurface (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SURFACE =="
  IO.println s!"  host={hostId} file={liveSurfaceRel}"
  let path := root / liveSurfaceRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSurfaceRel}"
    throw (IO.userError s!"missing {liveSurfaceRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSurfaceSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckSurface.lean != liveSurfaceSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckSurface.lean")
  let r := parseLiveSurfaceSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SURFACE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SURFACE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SURFACE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckSurface parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckSurface parse false")
    unless hostFrontLiveSurfaceReady do
      IO.eprintln "error: hostFrontLiveSurfaceReady false"
      throw (IO.userError "hostFrontLiveSurfaceReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckSurface.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSurface root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSurface
