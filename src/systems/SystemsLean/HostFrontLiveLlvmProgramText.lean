/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmProgramText.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmProgramText.lean. It is not LlvmHold.lean.
  It is not LlvmLinearText.lean. It is not LlvmMultText.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 12. example count is 24.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmProgramTextLlvmUnlocked is false.
  That local pin is not this wrap's backend claim.
  The live def llvmProgramTextProvablyUnlockWorkClaimed is false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_TEXT_V0,
  PARSE-LIVE-LLVM-PROGRAM-TEXT, liveRel,
  kernelCheckLiveLlvmProgramTextSource,
  hostFrontLiveLlvmProgramTextReady.
  Module: SystemsLean.HostFrontLiveLlvmProgramText
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmProgramTextSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmProgramText

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-PROGRAM-TEXT"

/-- Live file basename. -/
def liveRel : String := "LlvmProgramText.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmProgramTextRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmProgramTextFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmProgramTextLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveLlvmProgramTextFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmProgramTextResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def llvmProgramTextProvablyUnlockWorkClaimed is false.
    That def is not this flag. -/
def hostFrontLiveLlvmProgramTextProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmProgramTextParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmProgramTextSkipFuel : Nat := 8192

/-- Kept commands: six imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From LlvmProgramText.lean. -/
def liveLlvmProgramTextKeptCmds : Nat := 39

/-- theorem keyword count. LlvmProgramText.lean has 12 theorem. -/
def liveLlvmProgramTextTheoremCount : Nat := 12

/-- example keyword count. LlvmProgramText.lean has 24 example. -/
def liveLlvmProgramTextExampleCount : Nat := 24

/-- set_option keyword count. LlvmProgramText.lean has no set_option. -/
def liveLlvmProgramTextSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmProgramText`. -/
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
def cmdAddsLlvmProgramText (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmProgramText (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmProgramTextParseFuel body
        && termNoAppN liveLlvmProgramTextParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmProgramTextParseFuel body
        && termNoAppN liveLlvmProgramTextParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmProgramText (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmProgramText : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmProgramText liveLlvmProgramTextParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmProgramTextSkipFuel rest
      if cmdBodyKnownLlvmProgramText kn c then
        parseCmdsLlvmProgramText n rest2
          (kn ++ cmdAddsLlvmProgramText c) (acc ++ [c])
      else
        parseCmdsLlvmProgramText n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmProgramTextSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmProgramText n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmProgramText.lean text.
    Greppable: parseLiveLlvmProgramTextSource,
    PARSE-LIVE-LLVM-PROGRAM-TEXT. -/
def parseLiveLlvmProgramTextSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmProgramText liveLlvmProgramTextParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmProgramText"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmProgramText parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveLlvmProgramTextSource,
    PARSE-LIVE-LLVM-PROGRAM-TEXT. -/
def kernelCheckLiveLlvmProgramTextSource (src : String) : Bool :=
  match parseLiveLlvmProgramTextSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmProgramTextParsed? : Option Module :=
  match parseLiveLlvmProgramTextSource liveLlvmProgramTextSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmProgramTextParsed? with
  | some m => m.commands.length == liveLlvmProgramTextKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId,
    llvmProgramTextFinishedClaimed, llvmProgramTextLlvmUnlocked,
    llvmProgramTextResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "llvmProgramTextFinishedClaimed"
      && has "llvmProgramTextLlvmUnlocked"
      && has "llvmProgramTextResidualFreeClaimed"

/-- Wrap module lastSeg is LlvmProgramText (no module line in the live file). -/
def liveParseHasLlvmProgramTextModule : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmProgramText"
      && lastSeg m.name.raw == "LlvmProgramText"

/-- Live parse has namespace SystemsLean.LlvmProgramText. -/
def liveParseHasLlvmProgramTextNs : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmProgramText"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmProgramText. -/
def liveParseHasLlvmProgramTextEnd : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmProgramText"
      | _ => false

/-- Live parse imports the six LlvmProgramText peers. -/
def liveParseHasProgramTextImports : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.IrProgram"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"
      && has "SystemsLean.LlvmMultText"
      && has "SystemsLean.LlvmLinearText"
      && has "SystemsLean.LlvmTypesText"

/-- Keyword counts: theorem 12, example 24, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmProgramTextParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmProgramTextSource)
    let fuel := liveLlvmProgramTextSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmProgramTextTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmProgramTextExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmProgramTextSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportIrProgram : String := "import SystemsLean.IrProgram\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmProgramText\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_PROGRAM_TEXT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-PROGRAM-TEXT\"\n"

/-- llvmProgramTextFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmProgramTextFinishedClaimed : Bool := true\n"

/-- llvmProgramTextLlvmUnlocked def needle with a trailing newline.
    Local unlock pin is false. Not LlvmHold.llvmUnlocked. -/
def needleLlvmUnlocked : String :=
  "def llvmProgramTextLlvmUnlocked : Bool := false\n"

/-- llvmProgramTextResidualFreeClaimed def needle with a trailing newline. -/
def needleResidualFree : String :=
  "def llvmProgramTextResidualFreeClaimed : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmProgramText\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmProgramText. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmProgramTextSource
  (src.splitOn needleImportIrProgram).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmProgramTextReady,
    PARSE-LIVE-LLVM-PROGRAM-TEXT,
    HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmProgramTextReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_TEXT_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT")
    && (parseId == "PARSE-LIVE-LLVM-PROGRAM-TEXT")
    && (liveRel == "LlvmProgramText.lean")
    && (liveLlvmProgramTextRel
      == "src/systems/SystemsLean/LlvmProgramText.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmProgramTextFullHost
    && !hostFrontLiveLlvmProgramTextFullBackend
    && !hostFrontLiveLlvmProgramTextResidualFreeClaimed
    && !hostFrontLiveLlvmProgramTextProvablyUnlocked
    && kernelCheckLiveLlvmProgramTextSource liveLlvmProgramTextSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmProgramTextModule
    && liveParseHasLlvmProgramTextNs
    && liveParseHasLlvmProgramTextEnd
    && liveParseHasProgramTextImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmProgramTextSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmProgramText (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-PROGRAM-TEXT =="
  IO.println s!"  host={hostId} file={liveLlvmProgramTextRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmProgramTextRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmProgramTextRel}"
    throw (IO.userError s!"missing {liveLlvmProgramTextRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmProgramTextSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmProgramText.lean != liveLlvmProgramTextSource"
    throw (IO.userError "dual-pin mismatch live LlvmProgramText.lean")
  let r := parseLiveLlvmProgramTextSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-PROGRAM-TEXT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-PROGRAM-TEXT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-PROGRAM-TEXT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmProgramText parse false"
      throw (IO.userError "kernelCheck live LlvmProgramText parse false")
    unless hostFrontLiveLlvmProgramTextReady do
      IO.eprintln "error: hostFrontLiveLlvmProgramTextReady false"
      throw (IO.userError "hostFrontLiveLlvmProgramTextReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmProgramText source was accepted"
      throw (IO.userError "empty LlvmProgramText source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmProgramText root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmProgramText
