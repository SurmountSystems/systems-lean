/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialPathAlternateMain.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is OfficialPathAlternateMain.lean. It is not OfficialPathAlternate.lean.
  Not a package typecheck.
  This parser is HostFrontLiveOfficialPathAlternateMainParse.lean.
  HostFrontLiveOfficialPathAlternateMain.lean only forwards to the neighbor
  and is not this parser.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  This live file has one dotted import and one IO main. The main body is
  not kernel-checkable, so the kept command is the import.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN,
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_MAIN_V0,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN, liveRel,
  kernelCheckLiveOfficialPathAlternateMainSource,
  hostFrontLiveOfficialPathAlternateMainReady.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateMainParse
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialPathAlternateMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialPathAlternateMainParse

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN"

/-- Live file basename. -/
def liveRel : String := "OfficialPathAlternateMain.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateMainRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialPathAlternateMainFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveOfficialPathAlternateMainFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialPathAlternateMainResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveOfficialPathAlternateMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialPathAlternateMainParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveOfficialPathAlternateMainSkipFuel : Nat := 8192

/-- Kept commands: the one dotted import.
    The IO main is skip-folded. From OfficialPathAlternateMain.lean. -/
def liveOfficialPathAlternateMainKeptCmds : Nat := 1

/-- theorem keyword count. OfficialPathAlternateMain.lean has no theorem. -/
def liveOfficialPathAlternateMainTheoremCount : Nat := 0

/-- example keyword count. OfficialPathAlternateMain.lean has no example. -/
def liveOfficialPathAlternateMainExampleCount : Nat := 0

/-- set_option keyword count. OfficialPathAlternateMain.lean has no set_option. -/
def liveOfficialPathAlternateMainSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . OfficialPathAlternate`. -/
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
def cmdAddsOfficialPathAlternateMain (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownOfficialPathAlternateMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateMainParseFuel body
        && termNoAppN liveOfficialPathAlternateMainParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateMainParseFuel body
        && termNoAppN liveOfficialPathAlternateMainParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdOfficialPathAlternateMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsOfficialPathAlternateMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialPathAlternateMain liveOfficialPathAlternateMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialPathAlternateMainSkipFuel rest
      if cmdBodyKnownOfficialPathAlternateMain kn c then
        parseCmdsOfficialPathAlternateMain n rest2
          (kn ++ cmdAddsOfficialPathAlternateMain c) (acc ++ [c])
      else
        parseCmdsOfficialPathAlternateMain n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveOfficialPathAlternateMainSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOfficialPathAlternateMain n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live OfficialPathAlternateMain.lean text.
    Greppable: parseLiveOfficialPathAlternateMainSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN. -/
def parseLiveOfficialPathAlternateMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialPathAlternateMain liveOfficialPathAlternateMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialPathAlternateMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialPathAlternateMain parse. Not a fixture.
    Greppable: kernelCheckLiveOfficialPathAlternateMainSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN. -/
def kernelCheckLiveOfficialPathAlternateMainSource (src : String) : Bool :=
  match parseLiveOfficialPathAlternateMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialPathAlternateMainParsed? : Option Module :=
  match parseLiveOfficialPathAlternateMainSource liveOfficialPathAlternateMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. The dotted import is kept.
    The IO main is not kernel-checkable and is not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | some m => m.commands.length == liveOfficialPathAlternateMainKeptCmds
  | none => false

/-- The IO main is skip-folded. It is not a kept def. -/
def liveParseSkipsIoMain : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Stripped tokens still contain one def. The main was seen, then skipped. -/
def liveParseSawDefMain : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveOfficialPathAlternateMainSource)
    toksCountKw liveOfficialPathAlternateMainSkipFuel toks "def" 0 == 1

/-- Wrap module lastSeg is OfficialPathAlternateMain (no module line in the live file). -/
def liveParseHasOfficialPathAlternateMainModule : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.OfficialPathAlternateMain"
      && lastSeg m.name.raw == "OfficialPathAlternateMain"

/-- This thin main has no namespace command. -/
def liveParseHasNoNamespace : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.namespace _ => true
      | _ => false)

/-- This thin main has no end command. -/
def liveParseHasNoEnd : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.endNamespace _ => true
      | _ => false)

/-- Live parse imports SystemsLean.OfficialPathAlternate. -/
def liveParseHasOfficialPathAlternateImport : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveOfficialPathAlternateMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveOfficialPathAlternateMainSource)
    let fuel := liveOfficialPathAlternateMainSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveOfficialPathAlternateMainTheoremCount
      && toksCountKw fuel toks "example" 0 == liveOfficialPathAlternateMainExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveOfficialPathAlternateMainSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportOfficialPathAlternate : String := "import SystemsLean.OfficialPathAlternate\n"

/-- main decl needle with a trailing newline. -/
def needleMainDecl : String :=
  "def main (args : List String) : IO UInt32 :=\n"

/-- Forwarding body needle with a trailing newline. -/
def needleMainBody : String :=
  "  SystemsLean.OfficialPathAlternate.main args\n"

/-- Entry cite needle with a trailing newline.
    OfficialPathAlternateMain.lean has no Module: line.
    This wrap is not a package typecheck. -/
def needleModuleCite : String :=
  "  OfficialPathAlternateMain,\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.OfficialPathAlternateMain.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveOfficialPathAlternateMainSource
  (src.splitOn needleImportOfficialPathAlternate).length > 1
    && (src.splitOn needleMainDecl).length > 1
    && (src.splitOn needleMainBody).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialPathAlternateMainReady,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN,
    HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveOfficialPathAlternateMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN")
    && (parseId == "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN")
    && (liveRel == "OfficialPathAlternateMain.lean")
    && (liveOfficialPathAlternateMainRel
      == "src/systems/SystemsLean/OfficialPathAlternateMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialPathAlternateMainFullHost
    && !hostFrontLiveOfficialPathAlternateMainFullBackend
    && !hostFrontLiveOfficialPathAlternateMainResidualFreeClaimed
    && !hostFrontLiveOfficialPathAlternateMainProvablyUnlocked
    && kernelCheckLiveOfficialPathAlternateMainSource liveOfficialPathAlternateMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseSkipsIoMain
    && liveParseSawDefMain
    && liveParseHasOfficialPathAlternateMainModule
    && liveParseHasNoNamespace
    && liveParseHasNoEnd
    && liveParseHasOfficialPathAlternateImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialPathAlternateMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveOfficialPathAlternateMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN =="
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateMainRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveOfficialPathAlternateMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialPathAlternateMainRel}"
    throw (IO.userError s!"missing {liveOfficialPathAlternateMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialPathAlternateMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialPathAlternateMain.lean != liveOfficialPathAlternateMainSource"
    throw (IO.userError "dual-pin mismatch live OfficialPathAlternateMain.lean")
  let r := parseLiveOfficialPathAlternateMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialPathAlternateMain parse false"
      throw (IO.userError "kernelCheck live OfficialPathAlternateMain parse false")
    unless hostFrontLiveOfficialPathAlternateMainReady do
      IO.eprintln "error: hostFrontLiveOfficialPathAlternateMainReady false"
      throw (IO.userError "hostFrontLiveOfficialPathAlternateMainReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty OfficialPathAlternateMain source was accepted"
      throw (IO.userError "empty OfficialPathAlternateMain source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialPathAlternateMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialPathAlternateMainParse
