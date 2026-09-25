/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostPackageRootsMain.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostPackageRootsMain.lean. It is not HostPackageRoots.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  This live file has one dotted import and one IO main. The main body is
  not kernel-checkable, so the kept command is the import.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN,
  SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_ROOTS_MAIN_V0,
  PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN, liveRel,
  kernelCheckLiveHostPackageRootsMainSource,
  hostFrontLiveHostPackageRootsMainReady.
  Module: SystemsLean.HostFrontLiveHostPackageRootsMain
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostPackageRootsMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostPackageRootsMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_ROOTS_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN"

/-- Live file basename. -/
def liveRel : String := "HostPackageRootsMain.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostPackageRootsMainRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostPackageRootsMainFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostPackageRootsMainFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostPackageRootsMainResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostPackageRootsMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostPackageRootsMainParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveHostPackageRootsMainSkipFuel : Nat := 8192

/-- Kept commands: the one dotted import.
    The IO main is skip-folded. From HostPackageRootsMain.lean. -/
def liveHostPackageRootsMainKeptCmds : Nat := 1

/-- theorem keyword count. HostPackageRootsMain.lean has no theorem. -/
def liveHostPackageRootsMainTheoremCount : Nat := 0

/-- example keyword count. HostPackageRootsMain.lean has no example. -/
def liveHostPackageRootsMainExampleCount : Nat := 0

/-- set_option keyword count. HostPackageRootsMain.lean has no set_option. -/
def liveHostPackageRootsMainSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . HostPackageRoots`. -/
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
def cmdAddsHostPackageRootsMain (c : Cmd) : List String :=
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
def cmdBodyKnownHostPackageRootsMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostPackageRootsMainParseFuel body
        && termNoAppN liveHostPackageRootsMainParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostPackageRootsMainParseFuel body
        && termNoAppN liveHostPackageRootsMainParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdHostPackageRootsMain (fuel : Nat) (toks : List String) :
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
def parseCmdsHostPackageRootsMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostPackageRootsMain liveHostPackageRootsMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostPackageRootsMainSkipFuel rest
      if cmdBodyKnownHostPackageRootsMain kn c then
        parseCmdsHostPackageRootsMain n rest2
          (kn ++ cmdAddsHostPackageRootsMain c) (acc ++ [c])
      else
        parseCmdsHostPackageRootsMain n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostPackageRootsMainSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostPackageRootsMain n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostPackageRootsMain.lean text.
    Greppable: parseLiveHostPackageRootsMainSource,
    PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN. -/
def parseLiveHostPackageRootsMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostPackageRootsMain liveHostPackageRootsMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostPackageRootsMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostPackageRootsMain parse. Not a fixture.
    Greppable: kernelCheckLiveHostPackageRootsMainSource,
    PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN. -/
def kernelCheckLiveHostPackageRootsMainSource (src : String) : Bool :=
  match parseLiveHostPackageRootsMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostPackageRootsMainParsed? : Option Module :=
  match parseLiveHostPackageRootsMainSource liveHostPackageRootsMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. The dotted import is kept.
    The IO main is not kernel-checkable and is not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveHostPackageRootsMainParsed? with
  | some m => m.commands.length == liveHostPackageRootsMainKeptCmds
  | none => false

/-- The IO main is skip-folded. It is not a kept def. -/
def liveParseSkipsIoMain : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Stripped tokens still contain one def. The main was seen, then skipped. -/
def liveParseSawDefMain : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostPackageRootsMainSource)
    toksCountKw liveHostPackageRootsMainSkipFuel toks "def" 0 == 1

/-- Wrap module lastSeg is HostPackageRootsMain (no module line in the live file). -/
def liveParseHasHostPackageRootsMainModule : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostPackageRootsMain"
      && lastSeg m.name.raw == "HostPackageRootsMain"

/-- This thin main has no namespace command. -/
def liveParseHasNoNamespace : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.namespace _ => true
      | _ => false)

/-- This thin main has no end command. -/
def liveParseHasNoEnd : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.endNamespace _ => true
      | _ => false)

/-- Live parse imports SystemsLean.HostPackageRoots. -/
def liveParseHasHostPackageRootsImport : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.HostPackageRoots"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveHostPackageRootsMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostPackageRootsMainSource)
    let fuel := liveHostPackageRootsMainSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveHostPackageRootsMainTheoremCount
      && toksCountKw fuel toks "example" 0 == liveHostPackageRootsMainExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveHostPackageRootsMainSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportHostPackageRoots : String := "import SystemsLean.HostPackageRoots\n"

/-- main decl needle with a trailing newline. -/
def needleMainDecl : String :=
  "def main (args : List String) : IO UInt32 :=\n"

/-- Forwarding body needle with a trailing newline. -/
def needleMainBody : String :=
  "  SystemsLean.HostPackageRoots.main args\n"

/-- Module cite needle with a trailing newline. -/
def needleModuleCite : String :=
  "  Module: SystemsLean.HostPackageRootsMain\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.HostPackageRootsMain.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveHostPackageRootsMainSource
  (src.splitOn needleImportHostPackageRoots).length > 1
    && (src.splitOn needleMainDecl).length > 1
    && (src.splitOn needleMainBody).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostPackageRootsMainReady,
    PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN,
    HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostPackageRootsMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_ROOTS_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN")
    && (parseId == "PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN")
    && (liveRel == "HostPackageRootsMain.lean")
    && (liveHostPackageRootsMainRel
      == "src/systems/SystemsLean/HostPackageRootsMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostPackageRootsMainFullHost
    && !hostFrontLiveHostPackageRootsMainFullBackend
    && !hostFrontLiveHostPackageRootsMainResidualFreeClaimed
    && !hostFrontLiveHostPackageRootsMainProvablyUnlocked
    && kernelCheckLiveHostPackageRootsMainSource liveHostPackageRootsMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseSkipsIoMain
    && liveParseSawDefMain
    && liveParseHasHostPackageRootsMainModule
    && liveParseHasNoNamespace
    && liveParseHasNoEnd
    && liveParseHasHostPackageRootsImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostPackageRootsMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostPackageRootsMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN =="
  IO.println s!"  host={hostId} file={liveHostPackageRootsMainRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostPackageRootsMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostPackageRootsMainRel}"
    throw (IO.userError s!"missing {liveHostPackageRootsMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostPackageRootsMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostPackageRootsMain.lean != liveHostPackageRootsMainSource"
    throw (IO.userError "dual-pin mismatch live HostPackageRootsMain.lean")
  let r := parseLiveHostPackageRootsMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-PACKAGE-ROOTS-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostPackageRootsMain parse false"
      throw (IO.userError "kernelCheck live HostPackageRootsMain parse false")
    unless hostFrontLiveHostPackageRootsMainReady do
      IO.eprintln "error: hostFrontLiveHostPackageRootsMainReady false"
      throw (IO.userError "hostFrontLiveHostPackageRootsMainReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostPackageRootsMain source was accepted"
      throw (IO.userError "empty HostPackageRootsMain source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostPackageRootsMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostPackageRootsMain
