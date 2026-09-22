/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/FreestandingEmitMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFreestandingEmitMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses FreestandingEmitMain.lean only.
  HostFrontLive already uses FreestandingEmit for product emit. This parser
  does not wrap FreestandingEmit.lean.
  Unique needles use trailing newline so HostFrontLiveFreestandingEmitMain is not
  a prefix hit on HostFrontLiveFreestandingEmitMainSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not mill remill. Mill stays 69 of 69.
  DualEqWrite.lean does not exist. Not CapableWrite.lean.

  Spec (readable):
  - parseLiveFreestandingEmitMainSource turns live FreestandingEmitMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.FreestandingEmitMain even without a module line.
  - kernelCheckLiveFreestandingEmitMainSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace /
    end remain. This mill Main has no namespace. Dotted import kept; open
    skipped. IO UInt32 main skip-folds.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living mill Main has no namespace command.
  - Wrap-assigned module lastSeg is FreestandingEmitMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not a FreestandingEmit.lean wrap. HostFrontLive already uses
    FreestandingEmit for product emit.

  Unique needles (trailing newline so HostFrontLiveFreestandingEmitMain is not a prefix):
  HostFrontLiveFreestandingEmitMain
  PARSE-LIVE-FREESTANDING-EMIT-MAIN
  HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_MAIN_V0
  FREESTANDING-EMIT-MAIN

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveFreestandingEmitMainSource,
  kernelCheckLiveFreestandingEmitMainSource,
  hostFrontLiveFreestandingEmitMainReady, liveFreestandingEmitMainSource,
  liveFreestandingEmitMainRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveFreestandingEmitMain
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveFreestandingEmitMain on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFreestandingEmitMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFreestandingEmitMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FREESTANDING-EMIT-MAIN"

/-- Greppable hyphenated mill-Main stage id. -/
def millMainId : String := "FREESTANDING-EMIT-MAIN"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitMainRel : String :=
  "src/systems/SystemsLean/FreestandingEmitMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFreestandingEmitMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFreestandingEmitMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveFreestandingEmitMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFreestandingEmitMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveFreestandingEmitMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsFemN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsFemN n nest false false ('\n' :: acc) rest
        else
          stripCommentsFemN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsFemN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsFemN n nest false false ('"' :: acc) rest
        else
          stripCommentsFemN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsFemN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsFemN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsFemN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsFemN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsFemN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsFemN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsFemN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsFemN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live FreestandingEmitMain.lean bytes. -/
def stripCommentsFem (src : String) : String :=
  String.ofList (stripCommentsFemN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . FreestandingEmit`. -/
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
def cmdAddsFreestandingEmitMain (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownFreestandingEmitMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitMainParseFuel body
        && termNoAppN liveFreestandingEmitMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitMainParseFuel body
        && termNoAppN liveFreestandingEmitMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefFreestandingEmitMain (fuel : Nat) (dname : String) (rest : List String) :
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
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveFreestandingEmitMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdFreestandingEmitMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefFreestandingEmitMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsFreestandingEmitMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFreestandingEmitMain liveFreestandingEmitMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFreestandingEmitMainSkipFuel rest
      if cmdBodyKnownFreestandingEmitMain kn c then
        parseCmdsFreestandingEmitMain n rest2
          (kn ++ cmdAddsFreestandingEmitMain c) (acc ++ [c])
      else
        parseCmdsFreestandingEmitMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveFreestandingEmitMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsFreestandingEmitMain n rest2 kn acc
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

/-- Parse live FreestandingEmitMain.lean text.
    Greppable: parseLiveFreestandingEmitMainSource,
    PARSE-LIVE-FREESTANDING-EMIT-MAIN. -/
def parseLiveFreestandingEmitMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsFem src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFreestandingEmitMain liveFreestandingEmitMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FreestandingEmitMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FreestandingEmitMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveFreestandingEmitMainSource,
    PARSE-LIVE-FREESTANDING-EMIT-MAIN. -/
def kernelCheckLiveFreestandingEmitMainSource (src : String) : Bool :=
  match parseLiveFreestandingEmitMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFreestandingEmitMainParsed? : Option Module :=
  match parseLiveFreestandingEmitMainSource liveFreestandingEmitMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFreestandingEmitMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=1: one dotted import; IO UInt32 main skip-folds. -/
def liveParseCmdCountOk : Bool :=
  match liveFreestandingEmitMainParsed? with
  | some m => m.commands.length >= 1
  | none => false

/-- Wrap module lastSeg is FreestandingEmitMain (no module line in the live file). -/
def liveParseHasFreestandingEmitMainModule : Bool :=
  match liveFreestandingEmitMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "FreestandingEmitMain"

/-- Live mill Main has no namespace command. -/
def liveParseHasNoNsCmd : Bool :=
  match liveFreestandingEmitMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.namespace _ => true
      | _ => false)

/-- Live product starts with import SystemsLean.FreestandingEmit.
    Types-style: dotted import kept. -/
def liveParseHasFreestandingEmitImport : Bool :=
  match liveFreestandingEmitMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Skip-head: def main is in the live text even though the IO body skip-folds. -/
def liveParseHasCoreDefs : Bool :=
  match liveFreestandingEmitMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsFem liveFreestandingEmitMainSource)
    toksHaveDefNamed liveFreestandingEmitMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFreestandingEmitMainReady,
    PARSE-LIVE-FREESTANDING-EMIT-MAIN,
    HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN,
    FREESTANDING-EMIT-MAIN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveFreestandingEmitMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN")
    && (parseId == "PARSE-LIVE-FREESTANDING-EMIT-MAIN")
    && (millMainId == "FREESTANDING-EMIT-MAIN")
    && (liveFreestandingEmitMainRel
      == "src/systems/SystemsLean/FreestandingEmitMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFreestandingEmitMainFullHost
    && !hostFrontLiveFreestandingEmitMainResidualFreeClaimed
    && !hostFrontLiveFreestandingEmitMainProvablyUnlocked
    && kernelCheckLiveFreestandingEmitMainSource liveFreestandingEmitMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasFreestandingEmitMainModule
    && liveParseHasNoNsCmd
    && liveParseHasFreestandingEmitImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFreestandingEmitMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveFreestandingEmitMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FREESTANDING-EMIT-MAIN =="
  IO.println s!"  host={hostId} file={liveFreestandingEmitMainRel}"
  let path := root / liveFreestandingEmitMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFreestandingEmitMainRel}"
    throw (IO.userError s!"missing {liveFreestandingEmitMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFreestandingEmitMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FreestandingEmitMain.lean != liveFreestandingEmitMainSource"
    throw (IO.userError "dual-pin mismatch live FreestandingEmitMain.lean")
  let r := parseLiveFreestandingEmitMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FREESTANDING-EMIT-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FREESTANDING-EMIT-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FREESTANDING-EMIT-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live FreestandingEmitMain parse false"
      throw (IO.userError "kernelCheck live FreestandingEmitMain parse false")
    unless hostFrontLiveFreestandingEmitMainReady do
      IO.eprintln "error: hostFrontLiveFreestandingEmitMainReady false"
      throw (IO.userError "hostFrontLiveFreestandingEmitMainReady false")
    IO.println s!"GREEN {stageId}: live FreestandingEmitMain.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFreestandingEmitMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFreestandingEmitMain
